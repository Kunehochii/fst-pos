import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/transfer.dart';
import '../models/transfer_model.dart';
import 'stock_tables.dart';

/// Local data source for transfer operations using Drift.
class StockLocalDataSource {
  final AppDatabase _db;

  StockLocalDataSource(this._db);

  // ============================================================================
  // CACHE OPERATIONS
  // ============================================================================

  /// Check if there are cached transfers for a cashier.
  Future<bool> hasCachedTransfers(String cashierId) async {
    final count = await (_db.select(_db.cachedTransfers)
          ..where((t) => t.cashierId.equals(cashierId))
          ..where((t) => t.isDeleted.equals(false)))
        .get();
    return count.isNotEmpty;
  }

  /// Check if the cache is stale (older than 5 minutes).
  Future<bool> isCacheStale(String cashierId) async {
    final meta = await (_db.select(_db.transferCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .getSingleOrNull();

    if (meta == null) return true;

    final staleDuration = const Duration(minutes: 5);
    final staleTime = DateTime.now().subtract(staleDuration);
    return meta.lastSyncedAt.isBefore(staleTime);
  }

  /// Get cached transfers for a cashier.
  Future<List<Transfer>> getCachedTransfers(
    String cashierId, {
    TransferFilter? filter,
  }) async {
    AppLogger.debug('Getting cached transfers', {'cashierId': cashierId});

    var query = _db.select(_db.cachedTransfers)
      ..where((t) => t.cashierId.equals(cashierId))
      ..where((t) => t.isDeleted.equals(false))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
      ]);

    if (filter?.type != null) {
      query = query..where((t) => t.type.equals(filter!.type!.toApiString()));
    }

    final rows = await query.get();

    final transfers = rows.map((row) {
      final jsonData = jsonDecode(row.data) as Map<String, dynamic>;
      return TransferModel.fromJson(jsonData).toEntity();
    }).toList();

    // Apply date filter in memory if provided
    if (filter?.startDate != null || filter?.endDate != null) {
      return transfers.where((t) {
        if (filter?.startDate != null &&
            t.createdAt.isBefore(filter!.startDate!)) {
          return false;
        }
        if (filter?.endDate != null && t.createdAt.isAfter(filter!.endDate!)) {
          return false;
        }
        return true;
      }).toList();
    }

    AppLogger.debug('Found ${transfers.length} cached transfers');
    return transfers;
  }

  /// Cache transfers for a cashier (replaces all cached data).
  Future<void> cacheTransfers(
      String cashierId, List<Transfer> transfers) async {
    AppLogger.debug('Caching ${transfers.length} transfers', {
      'cashierId': cashierId,
    });

    await _db.transaction(() async {
      // Delete existing cache (keep unsynced)
      await (_db.delete(_db.cachedTransfers)
            ..where((t) => t.cashierId.equals(cashierId))
            ..where((t) => t.isSynced.equals(true)))
          .go();

      // Insert new data
      for (final transfer in transfers) {
        final model = TransferModel.fromEntity(transfer);
        await _db.into(_db.cachedTransfers).insert(
              CachedTransfersCompanion.insert(
                id: transfer.id,
                cashierId: cashierId,
                productId: transfer.productId,
                type: transfer.type.toApiString(),
                quantity: transfer.quantity,
                sackType: Value(transfer.sackType?.toApiString()),
                sackPriceId: Value(transfer.sackPriceId),
                perKiloPriceId: Value(transfer.perKiloPriceId),
                data: jsonEncode(model.toJson()),
                isSynced: const Value(true),
                createdAt: Value(transfer.createdAt),
                updatedAt: Value(transfer.updatedAt),
              ),
              mode: InsertMode.insertOrReplace,
            );
      }

      // Update cache metadata
      await _db.into(_db.transferCacheMeta).insert(
            TransferCacheMetaCompanion.insert(
              cashierId: cashierId,
              lastSyncedAt: DateTime.now(),
            ),
            mode: InsertMode.insertOrReplace,
          );
    });

    AppLogger.debug('Transfers cached successfully');
  }

  /// Cache a single transfer (for offline creates).
  Future<void> cacheTransfer(String cashierId, Transfer transfer,
      {String? localId}) async {
    AppLogger.debug('Caching single transfer', {
      'id': transfer.id,
      'localId': localId,
      'cashierId': cashierId,
    });

    final model = TransferModel.fromEntity(transfer);

    await _db.into(_db.cachedTransfers).insert(
          CachedTransfersCompanion.insert(
            id: localId ?? transfer.id,
            localId: Value(localId),
            cashierId: cashierId,
            productId: transfer.productId,
            type: transfer.type.toApiString(),
            quantity: transfer.quantity,
            sackType: Value(transfer.sackType?.toApiString()),
            sackPriceId: Value(transfer.sackPriceId),
            perKiloPriceId: Value(transfer.perKiloPriceId),
            data: jsonEncode(model.toJson()),
            isSynced: Value(localId == null),
            createdAt: Value(transfer.createdAt),
            updatedAt: Value(transfer.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  /// Get a cached transfer by ID.
  Future<Transfer?> getCachedTransferById(String transferId) async {
    final row = await (_db.select(_db.cachedTransfers)
          ..where((t) => t.id.equals(transferId)))
        .getSingleOrNull();

    if (row == null) return null;

    final jsonData = jsonDecode(row.data) as Map<String, dynamic>;
    return TransferModel.fromJson(jsonData).toEntity();
  }

  /// Clear all cached transfers for a cashier.
  Future<void> clearCache(String cashierId) async {
    AppLogger.debug('Clearing transfer cache', {'cashierId': cashierId});

    await (_db.delete(_db.cachedTransfers)
          ..where((t) => t.cashierId.equals(cashierId)))
        .go();

    await (_db.delete(_db.transferCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .go();
  }

  // ============================================================================
  // PENDING SYNC OPERATIONS
  // ============================================================================

  /// Add a transfer to the pending sync queue.
  Future<void> addToPendingSync({
    required String localTransferId,
    String? serverTransferId,
    required String operation,
    required String payload,
  }) async {
    await _db.into(_db.pendingTransferSync).insert(
          PendingTransferSyncCompanion.insert(
            localTransferId: localTransferId,
            serverTransferId: Value(serverTransferId),
            operation: operation,
            payload: payload,
          ),
        );
  }

  /// Get all pending sync operations.
  Future<List<PendingTransferSyncRow>> getPendingSyncOperations() async {
    return (_db.select(_db.pendingTransferSync)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Get count of pending sync operations.
  Future<int> getPendingSyncCount() async {
    final count = await (_db.select(_db.pendingTransferSync)).get();
    return count.length;
  }

  /// Remove a pending sync operation after successful sync.
  Future<void> removePendingSync(int id) async {
    await (_db.delete(_db.pendingTransferSync)..where((t) => t.id.equals(id)))
        .go();
  }

  /// Update sync attempt count and error.
  Future<void> updateSyncAttempt(int id, String? error) async {
    // First get current attempts
    final current = await (_db.select(_db.pendingTransferSync)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();

    final newAttempts = (current?.attempts ?? 0) + 1;

    await (_db.update(_db.pendingTransferSync)..where((t) => t.id.equals(id)))
        .write(
      PendingTransferSyncCompanion(
        attempts: Value(newAttempts),
        lastError: Value(error),
        lastAttemptAt: Value(DateTime.now()),
      ),
    );
  }

  // ============================================================================
  // STOCK ADJUSTMENTS
  // ============================================================================

  /// Add a stock adjustment for a transfer.
  Future<void> addStockAdjustment({
    required String productId,
    required String priceType,
    String? sackPriceId,
    String? perKiloPriceId,
    required double quantityChange,
    required String transferId,
  }) async {
    await _db.into(_db.transferStockAdjustments).insert(
          TransferStockAdjustmentsCompanion.insert(
            productId: productId,
            priceType: priceType,
            sackPriceId: Value(sackPriceId),
            perKiloPriceId: Value(perKiloPriceId),
            quantityChange: quantityChange,
            transferId: transferId,
          ),
        );
  }

  /// Get pending stock adjustments.
  Future<List<TransferStockAdjustmentRow>> getPendingStockAdjustments() async {
    return (_db.select(_db.transferStockAdjustments)
          ..where((t) => t.isSynced.equals(false)))
        .get();
  }

  /// Mark stock adjustments as synced.
  Future<void> markStockAdjustmentsSynced(String transferId) async {
    await (_db.update(_db.transferStockAdjustments)
          ..where((t) => t.transferId.equals(transferId)))
        .write(const TransferStockAdjustmentsCompanion(
      isSynced: Value(true),
    ));
  }
}
