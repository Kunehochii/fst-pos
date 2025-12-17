import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/bill_count.dart';
import '../models/bill_count_model.dart';

/// Local data source for bill count caching using Drift.
class BillCountLocalDataSource {
  final AppDatabase _db;
  final _uuid = const Uuid();

  BillCountLocalDataSource(this._db);

  /// Generate a local ID for offline bill counts.
  String generateLocalId() => 'local_${_uuid.v4()}';

  /// Get the start of day in UTC for a given date.
  /// This converts the local date to the start of that day in UTC.
  DateTime _getStartOfDayUtc(DateTime date) {
    // Convert to local time to get the correct day
    final local = date.toLocal();
    // Create start of day in local time
    final startOfDayLocal = DateTime(local.year, local.month, local.day);
    // Convert to UTC
    return startOfDayLocal.toUtc();
  }

  /// Get the end of day in UTC for a given date (start + 24 hours - 1ms).
  DateTime _getEndOfDayUtc(DateTime date) {
    final start = _getStartOfDayUtc(date);
    return start
        .add(const Duration(hours: 24))
        .subtract(const Duration(milliseconds: 1));
  }

  /// Save a bill count to local cache.
  Future<void> cacheBillCount(BillCount billCount) async {
    AppLogger.debug('Caching bill count', {'billCountId': billCount.id});

    final model = BillCountModel.fromEntity(billCount);
    final now = DateTime.now();

    await _db.into(_db.cachedBillCounts).insertOnConflictUpdate(
          CachedBillCountsCompanion.insert(
            id: billCount.id,
            localId: Value(billCount.localId),
            cashierId: billCount.cashier.id,
            cashierUsername: billCount.cashier.username,
            cashierBranchName: billCount.cashier.branchName,
            beginningBalance: Value(billCount.beginningBalance),
            showBeginningBalance: Value(billCount.showBeginningBalance),
            date: billCount.date,
            data: jsonEncode(model.toJson()),
            isSynced: Value(billCount.isSynced),
            createdAt: Value(billCount.date),
            updatedAt: Value(now),
          ),
        );

    AppLogger.debug('Bill count cached successfully');
  }

  /// Get cached bill count for a specific date.
  Future<BillCount?> getCachedBillCountByDate(
    String cashierId,
    DateTime date,
  ) async {
    final startOfDay = _getStartOfDayUtc(date);
    final endOfDay = _getEndOfDayUtc(date);

    final row = await (_db.select(_db.cachedBillCounts)
          ..where((t) => t.cashierId.equals(cashierId))
          ..where((t) => t.date.isBetweenValues(startOfDay, endOfDay)))
        .getSingleOrNull();

    if (row == null) return null;

    final json = jsonDecode(row.data) as Map<String, dynamic>;
    return BillCountModel.fromJson(json).toEntity(
      isSynced: row.isSynced,
      localId: row.localId,
    );
  }

  /// Get cached bill count by ID.
  Future<BillCount?> getCachedBillCountById(String billCountId) async {
    final row = await (_db.select(_db.cachedBillCounts)
          ..where((t) => t.id.equals(billCountId)))
        .getSingleOrNull();

    if (row == null) return null;

    final json = jsonDecode(row.data) as Map<String, dynamic>;
    return BillCountModel.fromJson(json).toEntity(
      isSynced: row.isSynced,
      localId: row.localId,
    );
  }

  /// Save a bill count locally and queue for sync.
  Future<BillCount> saveBillCountLocally({
    required String cashierId,
    required String cashierUsername,
    required String cashierBranchName,
    required double beginningBalance,
    required bool showBeginningBalance,
    required List<BillItemInput> bills,
    required DateTime date,
    String? existingId,
    String? existingLocalId,
  }) async {
    final localId = existingLocalId ?? generateLocalId();
    final id = existingId ?? localId;
    final now = DateTime.now();
    final startOfDay = _getStartOfDayUtc(date);

    // Calculate bills total locally
    double billsTotal = 0;
    final Map<BillType, int> billsByType = {
      for (var type in BillType.values) type: 0,
    };

    final billItems = bills.map((b) {
      billsByType[b.type] = b.amount;
      billsTotal += b.type.value * b.amount;
      return BillItem(
        id: 'local_${_uuid.v4()}',
        type: b.type,
        amount: b.amount,
        createdAt: now,
        updatedAt: now,
      );
    }).toList();

    // Create a local bill count (calculated values will be updated on sync)
    final billCount = BillCount(
      id: id,
      localId: localId,
      date: startOfDay,
      updatedAt: now,
      cashier: BillCountCashier(
        id: cashierId,
        username: cashierUsername,
        branchName: cashierBranchName,
      ),
      beginningBalance: beginningBalance,
      showBeginningBalance: showBeginningBalance,
      totalCash: 0, // Will be calculated by server
      totalExpenses: 0, // Will be calculated by server
      netCash: 0, // Will be calculated by server
      bills: billItems,
      billsByType: billsByType,
      billsTotal: billsTotal,
      summaryStep1: billsTotal - (showBeginningBalance ? beginningBalance : 0),
      summaryFinal: billsTotal - (showBeginningBalance ? beginningBalance : 0),
      isSynced: false,
    );

    // Cache the bill count
    await cacheBillCount(billCount);

    // Queue for sync
    await _queueForSync(
      localBillCountId: localId,
      beginningBalance: beginningBalance,
      showBeginningBalance: showBeginningBalance,
      bills: bills,
      dateFilter: startOfDay.toIso8601String(),
      operation: existingId != null ? 'update' : 'create',
    );

    AppLogger.info('Bill count saved locally and queued for sync', {
      'id': id,
      'localId': localId,
    });

    return billCount;
  }

  /// Queue a bill count for sync.
  Future<void> _queueForSync({
    required String localBillCountId,
    required double beginningBalance,
    required bool showBeginningBalance,
    required List<BillItemInput> bills,
    required String dateFilter,
    required String operation,
  }) async {
    // Remove any existing pending sync for this local ID
    await (_db.delete(_db.pendingBillCountSync)
          ..where((t) => t.localBillCountId.equals(localBillCountId)))
        .go();

    final payload = jsonEncode({
      'beginningBalance': beginningBalance,
      'showBeginningBalance': showBeginningBalance,
      'bills': bills.map((b) => b.toJson()).toList(),
    });

    await _db.into(_db.pendingBillCountSync).insert(
          PendingBillCountSyncCompanion.insert(
            localBillCountId: localBillCountId,
            operation: operation,
            payload: payload,
            dateFilter: dateFilter,
          ),
        );

    AppLogger.debug('Bill count queued for sync', {
      'localBillCountId': localBillCountId,
      'operation': operation,
    });
  }

  /// Get all pending bill count syncs.
  Future<List<PendingBillCountSyncRow>> getPendingSyncs() async {
    return (_db.select(_db.pendingBillCountSync)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Check if there are pending syncs.
  Future<bool> hasPendingSyncs() async {
    final count = await (_db.select(_db.pendingBillCountSync)).get();
    return count.isNotEmpty;
  }

  /// Mark a bill count as synced with server ID.
  Future<void> markAsSynced(String localId, String serverId) async {
    // Get the cached bill count
    final row = await (_db.select(_db.cachedBillCounts)
          ..where((t) => t.localId.equals(localId)))
        .getSingleOrNull();

    if (row != null) {
      // Update with server ID and mark as synced
      await (_db.update(_db.cachedBillCounts)
            ..where((t) => t.localId.equals(localId)))
          .write(
        CachedBillCountsCompanion(
          id: Value(serverId),
          isSynced: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }

    // Remove from pending sync
    await (_db.delete(_db.pendingBillCountSync)
          ..where((t) => t.localBillCountId.equals(localId)))
        .go();

    AppLogger.debug('Bill count marked as synced', {
      'localId': localId,
      'serverId': serverId,
    });
  }

  /// Update sync attempt info.
  Future<void> updateSyncAttempt(int syncId, String? error) async {
    final current = await (_db.select(_db.pendingBillCountSync)
          ..where((t) => t.id.equals(syncId)))
        .getSingleOrNull();

    if (current != null) {
      await (_db.update(_db.pendingBillCountSync)
            ..where((t) => t.id.equals(syncId)))
          .write(
        PendingBillCountSyncCompanion(
          attempts: Value(current.attempts + 1),
          lastError: Value(error),
          lastAttemptAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// Remove a pending sync by ID.
  Future<void> removePendingSync(int syncId) async {
    await (_db.delete(_db.pendingBillCountSync)
          ..where((t) => t.id.equals(syncId)))
        .go();
  }

  /// Update cached bill count data after sync.
  Future<void> updateCachedBillCount(
      String localId, BillCount billCount) async {
    final model = BillCountModel.fromEntity(billCount);

    await (_db.update(_db.cachedBillCounts)
          ..where((t) => t.localId.equals(localId)))
        .write(
      CachedBillCountsCompanion(
        id: Value(billCount.id),
        data: Value(jsonEncode(model.toJson())),
        isSynced: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Clear all cached bill counts.
  Future<void> clearCache() async {
    await _db.delete(_db.cachedBillCounts).go();
    await _db.delete(_db.pendingBillCountSync).go();
    await _db.delete(_db.billCountCacheMeta).go();
    AppLogger.debug('Bill count cache cleared');
  }
}
