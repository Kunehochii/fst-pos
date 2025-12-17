import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/stock_statistics.dart';
import '../../domain/entities/transfer.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/stock_local_datasource.dart';
import '../datasources/stock_remote_datasource.dart';
import '../models/transfer_model.dart';

/// Implementation of [StockRepository].
///
/// Follows offline-first strategy:
/// 1. For reads: Returns cached data immediately if available, then syncs
/// 2. For writes: Saves locally first, then syncs to server
class StockRepositoryImpl implements StockRepository {
  final StockRemoteDataSource _remoteDataSource;
  final StockLocalDataSource _localDataSource;
  final String _cashierId;
  final Uuid _uuid = const Uuid();

  StockRepositoryImpl({
    required StockRemoteDataSource remoteDataSource,
    required StockLocalDataSource localDataSource,
    required String cashierId,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId;

  // ============================================================================
  // STOCK STATISTICS
  // ============================================================================

  @override
  Future<(Failure?, StockStatistics?)> getStockStatistics({
    StockFilter? filter,
    bool forceRefresh = false,
  }) async {
    AppLogger.debug('StockRepository: Getting stock statistics', {
      'cashierId': _cashierId,
      'filter': filter.toString(),
    });

    try {
      final model = await _remoteDataSource.getStockStatistics(filter: filter);
      return (null, model.toEntity());
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error getting statistics', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  // ============================================================================
  // TRANSFERS - CREATE
  // ============================================================================

  @override
  Future<(Failure?, Transfer?)> createSackTransfer(
      CreateTransferSackDto dto) async {
    AppLogger.debug('StockRepository: Creating sack transfer', {
      'productId': dto.productId,
      'sackPriceId': dto.sackPriceId,
      'quantity': dto.quantity,
      'transferType': dto.transferType.toApiString(),
    });

    final localId = _uuid.v4();

    try {
      // Try to create on server first
      final model = CreateTransferSackModel.fromDto(dto);
      final result = await _remoteDataSource.createSackTransfer(model);
      final transfer = result.toEntity();

      // Cache the result
      await _localDataSource.cacheTransfer(_cashierId, transfer);

      AppLogger.debug('StockRepository: Sack transfer created successfully', {
        'id': transfer.id,
      });

      return (null, transfer);
    } on DioException catch (e) {
      // If offline, save locally for later sync
      if (_isOfflineError(e)) {
        AppLogger.debug(
            'StockRepository: Offline, saving sack transfer locally');
        return _saveTransferLocally(dto, localId);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error creating sack transfer', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, Transfer?)> createPerKiloTransfer(
      CreateTransferPerKiloDto dto) async {
    AppLogger.debug('StockRepository: Creating per kilo transfer', {
      'productId': dto.productId,
      'perKiloPriceId': dto.perKiloPriceId,
      'quantity': dto.quantity,
      'transferType': dto.transferType.toApiString(),
    });

    final localId = _uuid.v4();

    try {
      // Try to create on server first
      final model = CreateTransferPerKiloModel.fromDto(dto);
      final result = await _remoteDataSource.createPerKiloTransfer(model);
      final transfer = result.toEntity();

      // Cache the result
      await _localDataSource.cacheTransfer(_cashierId, transfer);

      AppLogger.debug(
          'StockRepository: Per kilo transfer created successfully', {
        'id': transfer.id,
      });

      return (null, transfer);
    } on DioException catch (e) {
      // If offline, save locally for later sync
      if (_isOfflineError(e)) {
        AppLogger.debug(
            'StockRepository: Offline, saving per kilo transfer locally');
        return _savePerKiloTransferLocally(dto, localId);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error creating per kilo transfer', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  Future<(Failure?, Transfer?)> _saveTransferLocally(
    CreateTransferSackDto dto,
    String localId,
  ) async {
    try {
      final now = DateTime.now();
      final transfer = Transfer(
        id: localId,
        quantity: dto.quantity,
        type: dto.transferType,
        sackType: dto.sackType,
        productId: dto.productId,
        sackPriceId: dto.sackPriceId,
        perKiloPriceId: null,
        cashierId: _cashierId,
        createdAt: now,
        updatedAt: now,
      );

      await _localDataSource.cacheTransfer(_cashierId, transfer,
          localId: localId);

      // Add to pending sync queue
      final model = CreateTransferSackModel.fromDto(dto);
      await _localDataSource.addToPendingSync(
        localTransferId: localId,
        operation: 'create',
        payload: jsonEncode(model.toJson()),
      );

      // Add local stock adjustment (negative)
      await _localDataSource.addStockAdjustment(
        productId: dto.productId,
        priceType: 'sack',
        sackPriceId: dto.sackPriceId,
        quantityChange: -dto.quantity,
        transferId: localId,
      );

      return (null, transfer);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error saving transfer locally', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  Future<(Failure?, Transfer?)> _savePerKiloTransferLocally(
    CreateTransferPerKiloDto dto,
    String localId,
  ) async {
    try {
      final now = DateTime.now();
      final transfer = Transfer(
        id: localId,
        quantity: dto.quantity,
        type: dto.transferType,
        sackType: null,
        productId: dto.productId,
        sackPriceId: null,
        perKiloPriceId: dto.perKiloPriceId,
        cashierId: _cashierId,
        createdAt: now,
        updatedAt: now,
      );

      await _localDataSource.cacheTransfer(_cashierId, transfer,
          localId: localId);

      // Add to pending sync queue
      final model = CreateTransferPerKiloModel.fromDto(dto);
      await _localDataSource.addToPendingSync(
        localTransferId: localId,
        operation: 'create',
        payload: jsonEncode(model.toJson()),
      );

      // Add local stock adjustment (negative)
      await _localDataSource.addStockAdjustment(
        productId: dto.productId,
        priceType: 'perKilo',
        perKiloPriceId: dto.perKiloPriceId,
        quantityChange: -dto.quantity,
        transferId: localId,
      );

      return (null, transfer);
    } catch (e, stackTrace) {
      AppLogger.error('StockRepository: Error saving per kilo transfer locally',
          e, stackTrace);
      return (_mapException(e), null);
    }
  }

  // ============================================================================
  // TRANSFERS - READ
  // ============================================================================

  @override
  Future<(Failure?, List<Transfer>?)> getTransfers({
    TransferFilter? filter,
    bool forceRefresh = false,
  }) async {
    AppLogger.debug('StockRepository: Getting transfers', {
      'cashierId': _cashierId,
      'forceRefresh': forceRefresh,
      'hasFilter': filter != null,
    });

    try {
      // Check if we have cached data
      final hasCached = await _localDataSource.hasCachedTransfers(_cashierId);
      final isStale = await _localDataSource.isCacheStale(_cashierId);

      // If force refresh or no cache, try to fetch from server first
      if (forceRefresh || !hasCached) {
        return _fetchAndCacheTransfers(filter: filter);
      }

      // Return cached data immediately
      final cachedTransfers = await _localDataSource.getCachedTransfers(
        _cashierId,
        filter: filter,
      );

      // If cache is stale, trigger background refresh (non-blocking)
      if (isStale) {
        _refreshInBackground(filter: filter);
      }

      AppLogger.debug(
        'StockRepository: Returning ${cachedTransfers.length} cached transfers',
      );

      return (null, cachedTransfers);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error getting transfers', e, stackTrace);

      // On error, try to return cached data as fallback
      try {
        final cachedTransfers = await _localDataSource.getCachedTransfers(
          _cashierId,
          filter: filter,
        );

        if (cachedTransfers.isNotEmpty) {
          AppLogger.debug(
            'StockRepository: Returning cached fallback (${cachedTransfers.length} transfers)',
          );
          return (null, cachedTransfers);
        }
      } catch (_) {
        // Ignore cache errors
      }

      return (_mapException(e), null);
    }
  }

  Future<(Failure?, List<Transfer>?)> _fetchAndCacheTransfers({
    TransferFilter? filter,
  }) async {
    try {
      List<TransferModel> models;

      if (filter?.startDate != null && filter?.endDate != null) {
        models = await _remoteDataSource.getTransfersByDate(
          startDate: filter!.startDate!,
          endDate: filter.endDate!,
        );
      } else {
        models = await _remoteDataSource.getTransfers();
      }

      final transfers = models.map((m) => m.toEntity()).toList();

      // Only cache if not filtering (cache complete data)
      if (filter?.startDate == null && filter?.endDate == null) {
        await _localDataSource.cacheTransfers(_cashierId, transfers);
      }

      AppLogger.debug(
          'StockRepository: Fetched ${transfers.length} transfers from server');

      return (null, transfers);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error fetching transfers', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  void _refreshInBackground({TransferFilter? filter}) {
    Future(() async {
      try {
        await _fetchAndCacheTransfers(filter: filter);
      } catch (e) {
        AppLogger.error('StockRepository: Background refresh failed', e);
      }
    });
  }

  @override
  Future<(Failure?, Transfer?)> getTransferById(String transferId) async {
    AppLogger.debug('StockRepository: Getting transfer by ID', {
      'transferId': transferId,
      'cashierId': _cashierId,
    });

    try {
      // Try cache first
      final cached = await _localDataSource.getCachedTransferById(transferId);
      if (cached != null) {
        return (null, cached);
      }

      // Fetch from server
      final model = await _remoteDataSource.getTransferById(transferId);
      final transfer = model.toEntity();

      // Cache it
      await _localDataSource.cacheTransfer(_cashierId, transfer);

      return (null, transfer);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error getting transfer by ID', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  // ============================================================================
  // TRANSFERS - UPDATE/DELETE
  // ============================================================================

  @override
  Future<(Failure?, Transfer?)> updateTransfer(
    String transferId,
    UpdateTransferDto dto,
  ) async {
    AppLogger.debug('StockRepository: Updating transfer', {
      'transferId': transferId,
      'dto': dto.toString(),
    });

    try {
      final model = await _remoteDataSource.updateTransfer(transferId, dto);
      final transfer = model.toEntity();

      // Update cache
      await _localDataSource.cacheTransfer(_cashierId, transfer);

      return (null, transfer);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error updating transfer', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, void)> deleteTransfer(String transferId) async {
    AppLogger.debug('StockRepository: Deleting transfer', {
      'transferId': transferId,
    });

    try {
      await _remoteDataSource.deleteTransfer(transferId);
      // Remove from cache will happen on next refresh
      return (null, null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'StockRepository: Error deleting transfer', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  // ============================================================================
  // SYNC OPERATIONS
  // ============================================================================

  @override
  Future<void> clearCache() async {
    await _localDataSource.clearCache(_cashierId);
  }

  @override
  Future<(Failure?, void)> syncWithServer() async {
    AppLogger.debug('StockRepository: Syncing with server');

    try {
      final pendingOps = await _localDataSource.getPendingSyncOperations();

      for (final op in pendingOps) {
        try {
          if (op.operation == 'create') {
            final payload = jsonDecode(op.payload) as Map<String, dynamic>;

            // Determine if it's sack or per kilo
            if (payload.containsKey('sackPriceId')) {
              final model = CreateTransferSackModel.fromJson(payload);
              await _remoteDataSource.createSackTransfer(model);
            } else {
              final model = CreateTransferPerKiloModel.fromJson(payload);
              await _remoteDataSource.createPerKiloTransfer(model);
            }
          }
          // Handle update/delete operations similarly

          await _localDataSource.removePendingSync(op.id);
          await _localDataSource.markStockAdjustmentsSynced(op.localTransferId);
        } catch (e) {
          await _localDataSource.updateSyncAttempt(op.id, e.toString());
          AppLogger.error('StockRepository: Sync operation failed', e);
        }
      }

      return (null, null);
    } catch (e, stackTrace) {
      AppLogger.error('StockRepository: Sync failed', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<int> getPendingSyncCount() async {
    return _localDataSource.getPendingSyncCount();
  }

  // ============================================================================
  // PRIVATE HELPERS
  // ============================================================================

  bool _isOfflineError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout;
  }

  Failure _mapException(Object e) {
    if (e is DioException) {
      return e.toAppException().toFailure();
    }
    if (e is AppException) {
      return e.toFailure();
    }
    return Failure.unknown(message: e.toString());
  }
}
