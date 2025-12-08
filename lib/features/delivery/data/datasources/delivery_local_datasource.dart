import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/delivery.dart';
import '../models/delivery_model.dart';

/// Local data source for delivery caching using Drift.
///
/// Stores deliveries per cashier to support multi-cashier scenarios.
/// Each cashier has their own isolated delivery cache.
/// Supports offline-first with pending sync operations.
class DeliveryLocalDataSource {
  final AppDatabase _db;
  final Uuid _uuid = const Uuid();

  DeliveryLocalDataSource(this._db);

  // ==================== Cache Operations ====================

  /// Caches deliveries for a specific cashier.
  ///
  /// Replaces all existing cached deliveries for the cashier.
  Future<void> cacheDeliveries(
      String cashierId, List<Delivery> deliveries) async {
    AppLogger.debug('Caching ${deliveries.length} deliveries for cashier', {
      'cashierId': cashierId,
    });

    await _db.transaction(() async {
      // Delete existing deliveries for this cashier (except pending ones)
      await (_db.delete(_db.cachedDeliveries)
            ..where((t) => t.cashierId.equals(cashierId))
            ..where((t) => t.isSynced.equals(true)))
          .go();

      // Insert new deliveries
      final now = DateTime.now();
      for (final delivery in deliveries) {
        final model = DeliveryModel.fromEntity(delivery);
        await _db.into(_db.cachedDeliveries).insertOnConflictUpdate(
              CachedDeliveriesCompanion.insert(
                id: delivery.id,
                localId: const Value(null),
                cashierId: cashierId,
                driverName: delivery.driverName,
                deliveryTimeStart: delivery.deliveryTimeStart,
                data: jsonEncode(model.toJson()),
                isSynced: const Value(true),
                isDeleted: const Value(false),
                createdAt: Value(delivery.createdAt),
                updatedAt: Value(now),
              ),
            );
      }

      // Update cache metadata
      await _db.into(_db.deliveryCacheMeta).insertOnConflictUpdate(
            DeliveryCacheMetaCompanion.insert(
              cashierId: cashierId,
              lastSyncedAt: now,
              isSyncing: const Value(false),
              lastError: const Value(null),
            ),
          );
    });

    AppLogger.debug('Deliveries cached successfully');
  }

  /// Creates a delivery locally for offline-first.
  ///
  /// Returns the generated local ID.
  Future<String> createDeliveryLocally(
    String cashierId,
    CreateDeliveryDto dto,
  ) async {
    final localId = _uuid.v4();
    final now = DateTime.now();

    AppLogger.debug('Creating delivery locally', {
      'localId': localId,
      'cashierId': cashierId,
    });

    // Create a model for JSON storage
    final model = CreateDeliveryModel.fromDto(dto);

    await _db.into(_db.cachedDeliveries).insert(
          CachedDeliveriesCompanion.insert(
            id: localId,
            localId: Value(localId),
            cashierId: cashierId,
            driverName: dto.driverName,
            deliveryTimeStart: dto.deliveryTimeStart,
            data: jsonEncode(model.toJson()),
            isSynced: const Value(false),
            isDeleted: const Value(false),
            createdAt: Value(now),
            updatedAt: Value(now),
          ),
        );

    // Queue for sync
    await _db.into(_db.pendingDeliverySync).insert(
          PendingDeliverySyncCompanion.insert(
            localDeliveryId: localId,
            serverDeliveryId: const Value(null),
            operation: 'create',
            payload: jsonEncode(model.toJson()),
            createdAt: Value(now),
          ),
        );

    return localId;
  }

  /// Updates a delivery locally for offline-first.
  Future<void> updateDeliveryLocally(
    String cashierId,
    String deliveryId,
    UpdateDeliveryDto dto,
  ) async {
    final now = DateTime.now();

    AppLogger.debug('Updating delivery locally', {
      'deliveryId': deliveryId,
      'cashierId': cashierId,
    });

    // Get existing delivery
    final existing = await (_db.select(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId)))
        .getSingleOrNull();

    if (existing == null) {
      throw Exception('Delivery not found: $deliveryId');
    }

    // Merge updates
    final existingData = jsonDecode(existing.data) as Map<String, dynamic>;
    final updateModel = UpdateDeliveryModel.fromDto(dto);
    final updateData = updateModel.toJson();

    // Apply updates to existing data
    if (updateData['driverName'] != null) {
      existingData['driverName'] = updateData['driverName'];
    }
    if (updateData['deliveryTimeStart'] != null) {
      existingData['deliveryTimeStart'] = updateData['deliveryTimeStart'];
    }
    if (updateData['deliveryItems'] != null) {
      existingData['deliveryItems'] = updateData['deliveryItems'];
    }

    // Update local cache
    await (_db.update(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId)))
        .write(CachedDeliveriesCompanion(
      driverName: dto.driverName != null
          ? Value(dto.driverName!)
          : const Value.absent(),
      deliveryTimeStart: dto.deliveryTimeStart != null
          ? Value(dto.deliveryTimeStart!)
          : const Value.absent(),
      data: Value(jsonEncode(existingData)),
      isSynced: const Value(false),
      updatedAt: Value(now),
    ));

    // Queue for sync (only if it was previously synced)
    if (existing.isSynced) {
      await _db.into(_db.pendingDeliverySync).insert(
            PendingDeliverySyncCompanion.insert(
              localDeliveryId: existing.localId ?? deliveryId,
              serverDeliveryId: Value(deliveryId),
              operation: 'update',
              payload: jsonEncode(updateData),
              createdAt: Value(now),
            ),
          );
    }
  }

  /// Marks a delivery as deleted locally for offline-first.
  Future<void> deleteDeliveryLocally(String deliveryId) async {
    final now = DateTime.now();

    AppLogger.debug('Deleting delivery locally', {'deliveryId': deliveryId});

    final existing = await (_db.select(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId)))
        .getSingleOrNull();

    if (existing == null) {
      throw Exception('Delivery not found: $deliveryId');
    }

    // Mark as deleted
    await (_db.update(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId)))
        .write(CachedDeliveriesCompanion(
      isDeleted: const Value(true),
      isSynced: const Value(false),
      updatedAt: Value(now),
    ));

    // Queue for sync (only if it was previously synced)
    if (existing.isSynced) {
      await _db.into(_db.pendingDeliverySync).insert(
            PendingDeliverySyncCompanion.insert(
              localDeliveryId: existing.localId ?? deliveryId,
              serverDeliveryId: Value(deliveryId),
              operation: 'delete',
              payload: '{}',
              createdAt: Value(now),
            ),
          );
    } else {
      // If not synced, just remove from pending creates
      await (_db.delete(_db.pendingDeliverySync)
            ..where((t) => t.localDeliveryId.equals(deliveryId)))
          .go();
      // And delete the local record
      await (_db.delete(_db.cachedDeliveries)
            ..where((t) => t.id.equals(deliveryId)))
          .go();
    }
  }

  /// Retrieves all cached deliveries for a cashier with optional filters.
  Future<List<Delivery>> getCachedDeliveries(
    String cashierId, {
    DeliveryFilter? filter,
  }) async {
    AppLogger.debug('Retrieving cached deliveries', {
      'cashierId': cashierId,
      'startDate': filter?.startDate?.toIso8601String(),
      'endDate': filter?.endDate?.toIso8601String(),
    });

    var query = _db.select(_db.cachedDeliveries)
      ..where((t) => t.cashierId.equals(cashierId))
      ..where((t) => t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.deliveryTimeStart)]);

    // Apply date filters
    if (filter?.startDate != null) {
      query = query
        ..where((t) =>
            t.deliveryTimeStart.isBiggerOrEqualValue(filter!.startDate!));
    }

    if (filter?.endDate != null) {
      query = query
        ..where(
            (t) => t.deliveryTimeStart.isSmallerOrEqualValue(filter!.endDate!));
    }

    final rows = await query.get();

    final deliveries = rows.map((row) {
      final json = jsonDecode(row.data) as Map<String, dynamic>;
      // Ensure we have all required fields for parsing
      json['id'] = row.id;
      json['cashierId'] = row.cashierId;
      json['driverName'] = row.driverName;
      json['deliveryTimeStart'] = row.deliveryTimeStart.toIso8601String();
      json['createdAt'] = row.createdAt.toIso8601String();
      json['updatedAt'] = row.updatedAt.toIso8601String();
      return DeliveryModel.fromJson(json).toEntity();
    }).toList();

    // Apply product filter locally (search in JSON data)
    if (filter?.productSearch != null && filter!.productSearch!.isNotEmpty) {
      final search = filter.productSearch!.toLowerCase();
      return deliveries.where((d) {
        return d.deliveryItems.any((item) =>
            item.product?.name.toLowerCase().contains(search) ?? false);
      }).toList();
    }

    if (filter?.productId != null) {
      return deliveries.where((d) {
        return d.deliveryItems
            .any((item) => item.productId == filter!.productId);
      }).toList();
    }

    AppLogger.debug('Retrieved ${deliveries.length} cached deliveries');

    return deliveries;
  }

  /// Retrieves a single cached delivery by ID.
  Future<Delivery?> getCachedDeliveryById(String deliveryId) async {
    final row = await (_db.select(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId))
          ..where((t) => t.isDeleted.equals(false)))
        .getSingleOrNull();

    if (row == null) return null;

    final json = jsonDecode(row.data) as Map<String, dynamic>;
    json['id'] = row.id;
    json['cashierId'] = row.cashierId;
    json['driverName'] = row.driverName;
    json['deliveryTimeStart'] = row.deliveryTimeStart.toIso8601String();
    json['createdAt'] = row.createdAt.toIso8601String();
    json['updatedAt'] = row.updatedAt.toIso8601String();
    return DeliveryModel.fromJson(json).toEntity();
  }

  /// Checks if cache exists for a cashier.
  Future<bool> hasCachedDeliveries(String cashierId) async {
    final count = await (_db.selectOnly(_db.cachedDeliveries)
          ..where(_db.cachedDeliveries.cashierId.equals(cashierId))
          ..where(_db.cachedDeliveries.isDeleted.equals(false))
          ..addColumns([_db.cachedDeliveries.id.count()]))
        .getSingle();

    return (count.read(_db.cachedDeliveries.id.count()) ?? 0) > 0;
  }

  /// Gets the last sync time for a cashier's deliveries.
  Future<DateTime?> getLastSyncTime(String cashierId) async {
    final meta = await (_db.select(_db.deliveryCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .getSingleOrNull();

    return meta?.lastSyncedAt;
  }

  /// Checks if the cache is stale (older than specified duration).
  Future<bool> isCacheStale(
    String cashierId, {
    Duration staleDuration = const Duration(minutes: 15),
  }) async {
    final lastSync = await getLastSyncTime(cashierId);

    if (lastSync == null) return true;

    return DateTime.now().difference(lastSync) > staleDuration;
  }

  /// Clears the delivery cache for a specific cashier.
  Future<void> clearCache(String cashierId) async {
    AppLogger.debug('Clearing delivery cache', {'cashierId': cashierId});

    await _db.transaction(() async {
      await (_db.delete(_db.cachedDeliveries)
            ..where((t) => t.cashierId.equals(cashierId)))
          .go();

      await (_db.delete(_db.deliveryCacheMeta)
            ..where((t) => t.cashierId.equals(cashierId)))
          .go();
    });
  }

  /// Updates sync status for a cashier.
  Future<void> setSyncStatus(String cashierId,
      {required bool isSyncing}) async {
    await (_db.update(_db.deliveryCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .write(DeliveryCacheMetaCompanion(isSyncing: Value(isSyncing)));
  }

  /// Records a sync error.
  Future<void> setSyncError(String cashierId, String error) async {
    await (_db.update(_db.deliveryCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .write(DeliveryCacheMetaCompanion(
      isSyncing: const Value(false),
      lastError: Value(error),
    ));
  }

  // ==================== Pending Sync Operations ====================

  /// Gets all pending sync operations.
  Future<List<PendingDeliverySyncRow>> getPendingSyncOperations() async {
    return await (_db.select(_db.pendingDeliverySync)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Gets the count of pending sync operations.
  Future<int> getPendingSyncCount() async {
    final count = await (_db.selectOnly(_db.pendingDeliverySync)
          ..addColumns([_db.pendingDeliverySync.id.count()]))
        .getSingle();

    return count.read(_db.pendingDeliverySync.id.count()) ?? 0;
  }

  /// Marks a pending sync operation as attempted.
  Future<void> markSyncAttempted(int syncId, {String? error}) async {
    final now = DateTime.now();

    // Get current attempts count
    final current = await (_db.select(_db.pendingDeliverySync)
          ..where((t) => t.id.equals(syncId)))
        .getSingleOrNull();

    final newAttempts = (current?.attempts ?? 0) + 1;

    await (_db.update(_db.pendingDeliverySync)
          ..where((t) => t.id.equals(syncId)))
        .write(PendingDeliverySyncCompanion(
      attempts: Value(newAttempts),
      lastAttemptAt: Value(now),
      lastError: Value(error),
    ));
  }

  /// Removes a pending sync operation after successful sync.
  Future<void> removePendingSync(int syncId) async {
    await (_db.delete(_db.pendingDeliverySync)
          ..where((t) => t.id.equals(syncId)))
        .go();
  }

  /// Updates the local delivery with server ID after successful sync.
  Future<void> updateDeliveryWithServerId(
    String localId,
    String serverId,
    Delivery serverDelivery,
  ) async {
    final model = DeliveryModel.fromEntity(serverDelivery);
    final now = DateTime.now();

    await _db.transaction(() async {
      // Delete old record
      await (_db.delete(_db.cachedDeliveries)
            ..where((t) => t.id.equals(localId)))
          .go();

      // Insert with server ID
      await _db.into(_db.cachedDeliveries).insert(
            CachedDeliveriesCompanion.insert(
              id: serverId,
              localId: Value(localId),
              cashierId: serverDelivery.cashierId,
              driverName: serverDelivery.driverName,
              deliveryTimeStart: serverDelivery.deliveryTimeStart,
              data: jsonEncode(model.toJson()),
              isSynced: const Value(true),
              isDeleted: const Value(false),
              createdAt: Value(serverDelivery.createdAt),
              updatedAt: Value(now),
            ),
          );
    });
  }

  /// Marks a delivery as synced after successful update.
  Future<void> markDeliverySynced(String deliveryId) async {
    await (_db.update(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId)))
        .write(const CachedDeliveriesCompanion(
      isSynced: Value(true),
    ));
  }

  /// Removes a delivery after successful delete sync.
  Future<void> removeDelivery(String deliveryId) async {
    await (_db.delete(_db.cachedDeliveries)
          ..where((t) => t.id.equals(deliveryId)))
        .go();
  }

  // ==================== Stock Adjustment Operations ====================

  /// Records a stock adjustment from a delivery.
  Future<void> recordStockAdjustment({
    required String deliveryId,
    required String productId,
    required String priceType,
    String? sackPriceId,
    String? perKiloPriceId,
    required double quantityChange,
  }) async {
    await _db.into(_db.deliveryStockAdjustments).insert(
          DeliveryStockAdjustmentsCompanion.insert(
            productId: productId,
            priceType: priceType,
            sackPriceId: Value(sackPriceId),
            perKiloPriceId: Value(perKiloPriceId),
            quantityChange: quantityChange,
            deliveryId: deliveryId,
            isSynced: const Value(false),
          ),
        );
  }

  /// Gets unsynced stock adjustments.
  Future<List<DeliveryStockAdjustmentRow>> getUnsyncedStockAdjustments() async {
    return await (_db.select(_db.deliveryStockAdjustments)
          ..where((t) => t.isSynced.equals(false)))
        .get();
  }

  /// Marks stock adjustments as synced for a delivery.
  Future<void> markStockAdjustmentsSynced(String deliveryId) async {
    await (_db.update(_db.deliveryStockAdjustments)
          ..where((t) => t.deliveryId.equals(deliveryId)))
        .write(const DeliveryStockAdjustmentsCompanion(
      isSynced: Value(true),
    ));
  }
}
