import 'dart:convert';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/bill_count.dart';
import '../../domain/repositories/bill_count_repository.dart';
import '../datasources/bill_count_local_datasource.dart';
import '../datasources/bill_count_remote_datasource.dart';

/// Implementation of [BillCountRepository] with offline-first approach.
///
/// Bill counts are unique per cashier per date:
/// - If a bill count exists for a date, it will be updated
/// - Otherwise, a new one will be created
///
/// Offline behavior:
/// - Saves locally first, then queues for server sync
/// - When online, syncs pending bill counts to server
/// - Server response updates local cache with calculated values
class BillCountRepositoryImpl implements BillCountRepository {
  final BillCountRemoteDataSource _remoteDataSource;
  final BillCountLocalDataSource _localDataSource;
  final String _cashierId;
  final String _cashierUsername;
  final String _cashierBranchName;

  BillCountRepositoryImpl({
    required BillCountRemoteDataSource remoteDataSource,
    required BillCountLocalDataSource localDataSource,
    required String cashierId,
    required String cashierUsername,
    required String cashierBranchName,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId,
        _cashierUsername = cashierUsername,
        _cashierBranchName = cashierBranchName;

  @override
  Future<(Failure?, BillCount?)> getBillCountByDate({
    DateTime? date,
  }) async {
    final targetDate = date ?? DateTime.now();

    try {
      // First, check local cache
      final cachedBillCount = await _localDataSource.getCachedBillCountByDate(
        _cashierId,
        targetDate,
      );

      // Try to fetch from server
      try {
        final dateString = _getStartOfDayUtc(targetDate).toIso8601String();
        final remoteBillCount = await _remoteDataSource.getBillCountByDate(
          date: dateString,
        );

        if (remoteBillCount != null) {
          final billCount = remoteBillCount.toEntity(isSynced: true);

          // Update local cache with server data
          await _localDataSource.cacheBillCount(billCount);

          AppLogger.info('Fetched bill count from server', {
            'id': billCount.id,
            'date': targetDate.toIso8601String(),
          });

          return (null, billCount);
        }

        // No bill count on server
        if (cachedBillCount != null) {
          AppLogger.info('Using cached bill count (not on server)', {
            'id': cachedBillCount.id,
            'isSynced': cachedBillCount.isSynced,
          });
          return (null, cachedBillCount);
        }

        AppLogger.info('No bill count found for date', {
          'date': targetDate.toIso8601String(),
        });
        return (null, null);
      } on AppException catch (e) {
        // Server error - fall back to cache
        AppLogger.warning('Failed to fetch from server, using cache', {
          'error': e.toString(),
        });

        if (cachedBillCount != null) {
          return (null, cachedBillCount);
        }

        return (e.toFailure(), null);
      }
    } catch (e) {
      AppLogger.error('Unexpected error getting bill count', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, BillCount?)> saveBillCount({
    required double beginningBalance,
    required bool showBeginningBalance,
    required List<BillItemInput> bills,
    DateTime? date,
  }) async {
    final targetDate = date ?? DateTime.now();
    final dateString = _getStartOfDayUtc(targetDate).toIso8601String();

    try {
      // Check if there's an existing bill count for this date
      final existingBillCount = await _localDataSource.getCachedBillCountByDate(
        _cashierId,
        targetDate,
      );

      // Save locally first (offline-first approach)
      final localBillCount = await _localDataSource.saveBillCountLocally(
        cashierId: _cashierId,
        cashierUsername: _cashierUsername,
        cashierBranchName: _cashierBranchName,
        beginningBalance: beginningBalance,
        showBeginningBalance: showBeginningBalance,
        bills: bills,
        date: targetDate,
        existingId: existingBillCount?.id,
        existingLocalId: existingBillCount?.localId,
      );

      AppLogger.info('Bill count saved locally', {
        'localId': localBillCount.localId,
        'date': dateString,
      });

      // Try to sync to server immediately
      try {
        final remoteBillCount = await _remoteDataSource.createOrUpdateBillCount(
          beginningBalance: beginningBalance,
          showBeginningBalance: showBeginningBalance,
          bills: bills,
          date: dateString,
        );

        final syncedBillCount = remoteBillCount.toEntity(isSynced: true);

        // Update local cache with server data (includes calculated values)
        if (localBillCount.localId != null) {
          await _localDataSource.markAsSynced(
            localBillCount.localId!,
            syncedBillCount.id,
          );
          await _localDataSource.updateCachedBillCount(
            localBillCount.localId!,
            syncedBillCount,
          );
        }

        AppLogger.info('Bill count synced to server', {
          'id': syncedBillCount.id,
          'date': dateString,
        });

        return (null, syncedBillCount);
      } on AppException catch (e) {
        // Server error - return local bill count (will sync later)
        AppLogger.warning('Failed to sync to server, saved locally', {
          'error': e.toString(),
        });
        return (null, localBillCount);
      }
    } catch (e) {
      AppLogger.error('Unexpected error saving bill count', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, int)> syncPendingBillCounts() async {
    try {
      final pendingSyncs = await _localDataSource.getPendingSyncs();

      if (pendingSyncs.isEmpty) {
        AppLogger.debug('No pending bill counts to sync');
        return (null, 0);
      }

      int successCount = 0;

      for (final pending in pendingSyncs) {
        try {
          final payload = jsonDecode(pending.payload) as Map<String, dynamic>;

          final bills = (payload['bills'] as List<dynamic>)
              .map((b) => BillItemInput(
                    type: BillType.fromApiValue(b['type'] as String),
                    amount: b['amount'] as int,
                  ))
              .toList();

          final remoteBillCount =
              await _remoteDataSource.createOrUpdateBillCount(
            beginningBalance: (payload['beginningBalance'] as num).toDouble(),
            showBeginningBalance: payload['showBeginningBalance'] as bool,
            bills: bills,
            date: pending.dateFilter,
          );

          final syncedBillCount = remoteBillCount.toEntity(isSynced: true);

          // Update local cache
          await _localDataSource.markAsSynced(
            pending.localBillCountId,
            syncedBillCount.id,
          );
          await _localDataSource.updateCachedBillCount(
            pending.localBillCountId,
            syncedBillCount,
          );

          successCount++;

          AppLogger.debug('Synced pending bill count', {
            'localId': pending.localBillCountId,
            'serverId': syncedBillCount.id,
          });
        } catch (e) {
          // Update attempt info and continue with next
          await _localDataSource.updateSyncAttempt(pending.id, e.toString());
          AppLogger.warning('Failed to sync pending bill count', {
            'error': e.toString(),
          });
        }
      }

      AppLogger.info('Sync completed', {
        'synced': successCount,
        'total': pendingSyncs.length,
      });

      return (null, successCount);
    } catch (e) {
      AppLogger.error('Unexpected error syncing bill counts', e);
      return (Failure.unknown(message: e.toString()), 0);
    }
  }

  @override
  Future<bool> hasPendingSync() async {
    return _localDataSource.hasPendingSyncs();
  }

  /// Get the start of day in UTC for a given date.
  DateTime _getStartOfDayUtc(DateTime date) {
    final local = date.toLocal();
    final startOfDayLocal = DateTime(local.year, local.month, local.day);
    return startOfDayLocal.toUtc();
  }
}
