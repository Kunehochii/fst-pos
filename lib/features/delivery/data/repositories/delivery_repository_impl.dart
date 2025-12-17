import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/delivery.dart';
import '../../domain/repositories/delivery_repository.dart';
import '../datasources/delivery_local_datasource.dart';
import '../datasources/delivery_remote_datasource.dart';

/// Implementation of [DeliveryRepository].
///
/// Follows offline-first strategy:
/// 1. For writes (create/update/delete): Save locally first, queue for sync
/// 2. For reads: Return cached data immediately, refresh in background
///
/// Supports multi-cashier scenarios by using cashierId for cache isolation.
class DeliveryRepositoryImpl implements DeliveryRepository {
  final DeliveryRemoteDataSource _remoteDataSource;
  final DeliveryLocalDataSource _localDataSource;
  final String _cashierId;

  DeliveryRepositoryImpl({
    required DeliveryRemoteDataSource remoteDataSource,
    required DeliveryLocalDataSource localDataSource,
    required String cashierId,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId;

  @override
  Future<(Failure?, Delivery?)> createDelivery(CreateDeliveryDto dto) async {
    AppLogger.debug('DeliveryRepository: Creating delivery', {
      'cashierId': _cashierId,
      'driverName': dto.driverName,
      'itemsCount': dto.deliveryItems.length,
    });

    try {
      // Try to create on server first
      final deliveryModel = await _remoteDataSource.createDelivery(dto);
      final delivery = deliveryModel.toEntity();

      // Cache the result
      await _localDataSource.cacheDeliveries(
        _cashierId,
        [delivery, ...(await _localDataSource.getCachedDeliveries(_cashierId))],
      );

      // Record stock adjustments for local tracking
      for (final item in dto.deliveryItems) {
        if (item.sackPrice != null) {
          await _localDataSource.recordStockAdjustment(
            deliveryId: delivery.id,
            productId: item.productId,
            priceType: 'sack',
            sackPriceId: item.sackPrice!.id,
            quantityChange: item.sackPrice!.quantity,
          );
        }
        if (item.perKiloPrice != null) {
          await _localDataSource.recordStockAdjustment(
            deliveryId: delivery.id,
            productId: item.productId,
            priceType: 'perKilo',
            perKiloPriceId: item.perKiloPrice!.id,
            quantityChange: item.perKiloPrice!.quantity,
          );
        }
      }

      AppLogger.debug('DeliveryRepository: Delivery created successfully', {
        'deliveryId': delivery.id,
      });

      return (null, delivery);
    } on DioException catch (e) {
      AppLogger.error('DeliveryRepository: DioException creating delivery', e);

      // Offline - create locally
      if (_isNetworkError(e)) {
        return _createDeliveryOffline(dto);
      }

      return (_mapDioException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'DeliveryRepository: Error creating delivery', e, stackTrace);

      // On any error, try to create offline
      try {
        return _createDeliveryOffline(dto);
      } catch (_) {
        return (_mapException(e), null);
      }
    }
  }

  /// Creates delivery offline.
  Future<(Failure?, Delivery?)> _createDeliveryOffline(
      CreateDeliveryDto dto) async {
    AppLogger.debug('DeliveryRepository: Creating delivery offline');

    final localId =
        await _localDataSource.createDeliveryLocally(_cashierId, dto);

    // Record stock adjustments
    for (final item in dto.deliveryItems) {
      if (item.sackPrice != null) {
        await _localDataSource.recordStockAdjustment(
          deliveryId: localId,
          productId: item.productId,
          priceType: 'sack',
          sackPriceId: item.sackPrice!.id,
          quantityChange: item.sackPrice!.quantity,
        );
      }
      if (item.perKiloPrice != null) {
        await _localDataSource.recordStockAdjustment(
          deliveryId: localId,
          productId: item.productId,
          priceType: 'perKilo',
          perKiloPriceId: item.perKiloPrice!.id,
          quantityChange: item.perKiloPrice!.quantity,
        );
      }
    }

    // Return the locally created delivery
    final delivery = await _localDataSource.getCachedDeliveryById(localId);
    return (null, delivery);
  }

  @override
  Future<(Failure?, Delivery?)> updateDelivery(
    String deliveryId,
    UpdateDeliveryDto dto,
  ) async {
    AppLogger.debug('DeliveryRepository: Updating delivery', {
      'deliveryId': deliveryId,
      'cashierId': _cashierId,
    });

    try {
      // Try to update on server first
      final deliveryModel =
          await _remoteDataSource.updateDelivery(deliveryId, dto);
      final delivery = deliveryModel.toEntity();

      // Update cache
      await _localDataSource.markDeliverySynced(deliveryId);

      AppLogger.debug('DeliveryRepository: Delivery updated successfully');

      return (null, delivery);
    } on DioException catch (e) {
      AppLogger.error('DeliveryRepository: DioException updating delivery', e);

      // Offline - update locally
      if (_isNetworkError(e)) {
        await _localDataSource.updateDeliveryLocally(
            _cashierId, deliveryId, dto);
        final delivery =
            await _localDataSource.getCachedDeliveryById(deliveryId);
        return (null, delivery);
      }

      return (_mapDioException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'DeliveryRepository: Error updating delivery', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, bool?)> deleteDelivery(String deliveryId) async {
    AppLogger.debug('DeliveryRepository: Deleting delivery', {
      'deliveryId': deliveryId,
    });

    try {
      // Try to delete on server first
      await _remoteDataSource.deleteDelivery(deliveryId);

      // Remove from cache
      await _localDataSource.removeDelivery(deliveryId);

      AppLogger.debug('DeliveryRepository: Delivery deleted successfully');

      return (null, true);
    } on DioException catch (e) {
      AppLogger.error('DeliveryRepository: DioException deleting delivery', e);

      // Offline - mark as deleted locally
      if (_isNetworkError(e)) {
        await _localDataSource.deleteDeliveryLocally(deliveryId);
        return (null, true);
      }

      return (_mapDioException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'DeliveryRepository: Error deleting delivery', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, List<Delivery>?)> getDeliveries({
    DeliveryFilter? filter,
    bool forceRefresh = false,
  }) async {
    AppLogger.debug('DeliveryRepository: Getting deliveries', {
      'cashierId': _cashierId,
      'forceRefresh': forceRefresh,
      'hasFilter': filter != null,
    });

    try {
      // Check if we have cached data
      final hasCached = await _localDataSource.hasCachedDeliveries(_cashierId);
      final isStale = await _localDataSource.isCacheStale(_cashierId);

      // If force refresh or no cache, try to fetch from server first
      if (forceRefresh || !hasCached) {
        return _fetchAndCacheDeliveries(filter: filter);
      }

      // Return cached data immediately
      final cachedDeliveries = await _localDataSource.getCachedDeliveries(
        _cashierId,
        filter: filter,
      );

      // If cache is stale, trigger background refresh (non-blocking)
      if (isStale) {
        _refreshInBackground(filter: filter);
      }

      AppLogger.debug(
        'DeliveryRepository: Returning ${cachedDeliveries.length} cached deliveries',
      );

      return (null, cachedDeliveries);
    } catch (e, stackTrace) {
      AppLogger.error(
          'DeliveryRepository: Error getting deliveries', e, stackTrace);

      // On error, try to return cached data as fallback
      try {
        final cachedDeliveries = await _localDataSource.getCachedDeliveries(
          _cashierId,
          filter: filter,
        );

        if (cachedDeliveries.isNotEmpty) {
          AppLogger.debug(
            'DeliveryRepository: Returning cached fallback (${cachedDeliveries.length} deliveries)',
          );
          return (null, cachedDeliveries);
        }
      } catch (_) {
        // Ignore cache errors
      }

      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, Delivery?)> getDeliveryById(String deliveryId) async {
    AppLogger.debug('DeliveryRepository: Getting delivery by ID', {
      'deliveryId': deliveryId,
    });

    try {
      // Try to get from cache first
      final cachedDelivery =
          await _localDataSource.getCachedDeliveryById(deliveryId);

      if (cachedDelivery != null) {
        return (null, cachedDelivery);
      }

      // Not in cache, fetch from server
      final deliveryModel = await _remoteDataSource.getDeliveryById(deliveryId);
      final delivery = deliveryModel.toEntity();

      return (null, delivery);
    } on DioException catch (e) {
      AppLogger.error('DeliveryRepository: DioException getting delivery', e);

      // Try cache fallback
      final cachedDelivery =
          await _localDataSource.getCachedDeliveryById(deliveryId);

      if (cachedDelivery != null) {
        return (null, cachedDelivery);
      }

      return (_mapDioException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'DeliveryRepository: Error getting delivery', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<void> clearCache() async {
    AppLogger.debug(
        'DeliveryRepository: Clearing cache', {'cashierId': _cashierId});
    await _localDataSource.clearCache(_cashierId);
  }

  @override
  Future<(Failure?, void)> syncWithServer() async {
    AppLogger.debug('DeliveryRepository: Syncing with server', {
      'cashierId': _cashierId,
    });

    try {
      await _localDataSource.setSyncStatus(_cashierId, isSyncing: true);

      // Process pending sync operations
      final pendingOps = await _localDataSource.getPendingSyncOperations();

      for (final op in pendingOps) {
        try {
          switch (op.operation) {
            case 'create':
              final dto = _parseCreateDtoFromPayload(op.payload);
              final deliveryModel = await _remoteDataSource.createDelivery(dto);
              final delivery = deliveryModel.toEntity();
              await _localDataSource.updateDeliveryWithServerId(
                op.localDeliveryId,
                delivery.id,
                delivery,
              );
              await _localDataSource.removePendingSync(op.id);
              await _localDataSource
                  .markStockAdjustmentsSynced(op.localDeliveryId);
              break;

            case 'update':
              if (op.serverDeliveryId != null) {
                final dto = _parseUpdateDtoFromPayload(op.payload);
                await _remoteDataSource.updateDelivery(
                    op.serverDeliveryId!, dto);
                await _localDataSource.markDeliverySynced(op.serverDeliveryId!);
                await _localDataSource.removePendingSync(op.id);
              }
              break;

            case 'delete':
              if (op.serverDeliveryId != null) {
                await _remoteDataSource.deleteDelivery(op.serverDeliveryId!);
                await _localDataSource.removeDelivery(op.serverDeliveryId!);
                await _localDataSource.removePendingSync(op.id);
              } else {
                // Never synced, just remove local data
                await _localDataSource.removeDelivery(op.localDeliveryId);
                await _localDataSource.removePendingSync(op.id);
              }
              break;
          }
        } catch (e) {
          AppLogger.error('DeliveryRepository: Error syncing operation', e);
          await _localDataSource.markSyncAttempted(op.id, error: e.toString());
        }
      }

      // Fetch latest from server
      final deliveryModels = await _remoteDataSource.getDeliveries();
      final deliveries = deliveryModels.map((m) => m.toEntity()).toList();
      await _localDataSource.cacheDeliveries(_cashierId, deliveries);

      AppLogger.debug(
        'DeliveryRepository: Sync complete (${deliveries.length} deliveries)',
      );

      return (null, null);
    } on DioException catch (e) {
      final failure = _mapDioException(e);
      await _localDataSource.setSyncError(_cashierId, failure.toString());
      return (failure, null);
    } catch (e, stackTrace) {
      AppLogger.error('DeliveryRepository: Sync error', e, stackTrace);
      final failure = _mapException(e);
      await _localDataSource.setSyncError(_cashierId, failure.toString());
      return (failure, null);
    }
  }

  @override
  Future<int> getPendingSyncCount() async {
    return _localDataSource.getPendingSyncCount();
  }

  // ==================== Private Helper Methods ====================

  /// Fetches deliveries from server and caches them.
  Future<(Failure?, List<Delivery>?)> _fetchAndCacheDeliveries({
    DeliveryFilter? filter,
  }) async {
    try {
      await _localDataSource.setSyncStatus(_cashierId, isSyncing: true);

      // Fetch all deliveries (without filter) for caching
      final deliveryModels = await _remoteDataSource.getDeliveries();
      final allDeliveries = deliveryModels.map((m) => m.toEntity()).toList();

      // Cache all deliveries
      await _localDataSource.cacheDeliveries(_cashierId, allDeliveries);

      // Apply filter for return value
      if (filter != null) {
        final filteredDeliveries = await _localDataSource.getCachedDeliveries(
          _cashierId,
          filter: filter,
        );
        return (null, filteredDeliveries);
      }

      return (null, allDeliveries);
    } on DioException catch (e) {
      AppLogger.error(
          'DeliveryRepository: DioException fetching deliveries', e);

      // Try to return cached data as fallback
      try {
        final cachedDeliveries = await _localDataSource.getCachedDeliveries(
          _cashierId,
          filter: filter,
        );

        if (cachedDeliveries.isNotEmpty) {
          await _localDataSource.setSyncError(
              _cashierId, e.message ?? 'Network error');
          return (null, cachedDeliveries);
        }
      } catch (_) {
        // Ignore cache errors
      }

      return (_mapDioException(e), null);
    } finally {
      await _localDataSource.setSyncStatus(_cashierId, isSyncing: false);
    }
  }

  /// Refreshes deliveries in the background (non-blocking).
  void _refreshInBackground({DeliveryFilter? filter}) {
    _fetchAndCacheDeliveries(filter: filter).then((_) {
      AppLogger.debug('DeliveryRepository: Background refresh complete');
    }).catchError((e) {
      AppLogger.error('DeliveryRepository: Background refresh error', e);
    });
  }

  /// Parses CreateDeliveryDto from JSON payload.
  CreateDeliveryDto _parseCreateDtoFromPayload(String payload) {
    final json = Map<String, dynamic>.from(
      jsonDecode(payload) as Map,
    );

    final deliveryItemsJson = json['deliveryItems'] as List<dynamic>? ?? [];
    final deliveryItems = deliveryItemsJson.map<CreateDeliveryItemDto>((item) {
      final itemMap = item as Map<String, dynamic>;
      final sackPriceJson = itemMap['sackPrice'] as Map<String, dynamic>?;
      final perKiloPriceJson = itemMap['perKiloPrice'] as Map<String, dynamic>?;

      return CreateDeliveryItemDto(
        productId: itemMap['productId'] as String,
        sackPrice: sackPriceJson != null
            ? SackPriceDto(
                id: sackPriceJson['id'] as String,
                quantity: (sackPriceJson['quantity'] as num).toDouble(),
                type: SackType.fromString(sackPriceJson['type'] as String),
              )
            : null,
        perKiloPrice: perKiloPriceJson != null
            ? PerKiloPriceDto(
                id: perKiloPriceJson['id'] as String,
                quantity: (perKiloPriceJson['quantity'] as num).toDouble(),
              )
            : null,
      );
    }).toList();

    return CreateDeliveryDto(
      driverName: json['driverName'] as String,
      deliveryTimeStart: DateTime.parse(json['deliveryTimeStart'] as String),
      deliveryItems: deliveryItems,
    );
  }

  /// Parses UpdateDeliveryDto from JSON payload.
  UpdateDeliveryDto _parseUpdateDtoFromPayload(String payload) {
    final json = Map<String, dynamic>.from(
      jsonDecode(payload) as Map,
    );

    List<CreateDeliveryItemDto>? deliveryItems;
    if (json['deliveryItems'] != null) {
      final deliveryItemsJson = json['deliveryItems'] as List<dynamic>;
      deliveryItems = deliveryItemsJson.map<CreateDeliveryItemDto>((item) {
        final itemMap = item as Map<String, dynamic>;
        final sackPriceJson = itemMap['sackPrice'] as Map<String, dynamic>?;
        final perKiloPriceJson =
            itemMap['perKiloPrice'] as Map<String, dynamic>?;

        return CreateDeliveryItemDto(
          productId: itemMap['productId'] as String,
          sackPrice: sackPriceJson != null
              ? SackPriceDto(
                  id: sackPriceJson['id'] as String,
                  quantity: (sackPriceJson['quantity'] as num).toDouble(),
                  type: SackType.fromString(sackPriceJson['type'] as String),
                )
              : null,
          perKiloPrice: perKiloPriceJson != null
              ? PerKiloPriceDto(
                  id: perKiloPriceJson['id'] as String,
                  quantity: (perKiloPriceJson['quantity'] as num).toDouble(),
                )
              : null,
        );
      }).toList();
    }

    return UpdateDeliveryDto(
      driverName: json['driverName'] as String?,
      deliveryTimeStart: json['deliveryTimeStart'] != null
          ? DateTime.parse(json['deliveryTimeStart'] as String)
          : null,
      deliveryItems: deliveryItems,
    );
  }

  /// Checks if the error is a network-related error.
  bool _isNetworkError(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.unknown;
  }

  /// Maps DioException to Failure.
  Failure _mapDioException(DioException e) {
    final appException = e.toAppException();
    return appException.toFailure();
  }

  /// Maps general exceptions to Failure.
  Failure _mapException(Object e) {
    if (e is AppException) {
      return e.toFailure();
    }
    return Failure.unknown(message: e.toString());
  }
}
