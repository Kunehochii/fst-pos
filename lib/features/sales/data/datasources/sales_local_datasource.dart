import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/sale.dart';
import '../models/sale_model.dart';

/// Local data source for sales caching using Drift.
class SalesLocalDataSource {
  final AppDatabase _db;

  SalesLocalDataSource(this._db);

  /// Save a sale to local cache.
  Future<void> cacheSale(Sale sale) async {
    AppLogger.debug('Caching sale', {'saleId': sale.id});

    final model = SaleModel.fromEntity(sale);
    final now = DateTime.now();

    await _db.into(_db.cachedSales).insertOnConflictUpdate(
          CachedSalesCompanion.insert(
            id: sale.id,
            localId: Value(sale.localId),
            cashierId: sale.cashierId,
            totalAmount: sale.totalAmount,
            paymentMethod: sale.paymentMethod.toApiString(),
            isVoid: Value(sale.isVoid),
            voidedAt: Value(sale.voidedAt),
            orderId: Value(sale.orderId),
            data: jsonEncode(model.toJson()),
            isSynced: Value(sale.isSynced),
            createdAt: Value(sale.createdAt),
            updatedAt: Value(now),
          ),
        );

    AppLogger.debug('Sale cached successfully');
  }

  /// Cache multiple sales.
  Future<void> cacheSales(List<Sale> sales) async {
    await _db.transaction(() async {
      for (final sale in sales) {
        await cacheSale(sale);
      }
    });
  }

  /// Get all cached sales for a cashier.
  Future<List<Sale>> getCachedSales(
    String cashierId, {
    bool includeVoided = false,
    int? limit,
    int? offset,
  }) async {
    var query = _db.select(_db.cachedSales)
      ..where((t) => t.cashierId.equals(cashierId))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    if (!includeVoided) {
      query = query..where((t) => t.isVoid.equals(false));
    }

    if (limit != null) {
      query = query..limit(limit, offset: offset);
    }

    final rows = await query.get();

    return rows.map((row) {
      final json = jsonDecode(row.data) as Map<String, dynamic>;
      return SaleModel.fromJson(json).toEntity(
        isSynced: row.isSynced,
        localId: row.localId,
      );
    }).toList();
  }

  /// Get voided sales for a cashier.
  Future<List<Sale>> getVoidedSales(
    String cashierId, {
    int? limit,
    int? offset,
  }) async {
    var query = _db.select(_db.cachedSales)
      ..where((t) => t.cashierId.equals(cashierId))
      ..where((t) => t.isVoid.equals(true))
      ..orderBy([(t) => OrderingTerm.desc(t.voidedAt)]);

    if (limit != null) {
      query = query..limit(limit, offset: offset);
    }

    final rows = await query.get();

    return rows.map((row) {
      final json = jsonDecode(row.data) as Map<String, dynamic>;
      return SaleModel.fromJson(json).toEntity(
        isSynced: row.isSynced,
        localId: row.localId,
      );
    }).toList();
  }

  /// Get a single sale by ID.
  Future<Sale?> getSaleById(String saleId) async {
    final row = await (_db.select(_db.cachedSales)
          ..where((t) => t.id.equals(saleId)))
        .getSingleOrNull();

    if (row == null) return null;

    final json = jsonDecode(row.data) as Map<String, dynamic>;
    return SaleModel.fromJson(json).toEntity(
      isSynced: row.isSynced,
      localId: row.localId,
    );
  }

  /// Mark a sale as voided locally.
  Future<void> markSaleAsVoided(String saleId, DateTime voidedAt) async {
    await (_db.update(_db.cachedSales)..where((t) => t.id.equals(saleId)))
        .write(
      CachedSalesCompanion(
        isVoid: const Value(true),
        voidedAt: Value(voidedAt),
        isSynced: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Mark a sale as synced.
  Future<void> markSaleAsSynced(String localId, String serverId) async {
    // Find sale by localId
    final sale = await (_db.select(_db.cachedSales)
          ..where((t) => t.localId.equals(localId)))
        .getSingleOrNull();

    if (sale != null) {
      // Update with server ID and mark as synced
      await (_db.update(_db.cachedSales)
            ..where((t) => t.localId.equals(localId)))
          .write(
        CachedSalesCompanion(
          id: Value(serverId),
          isSynced: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// Queue a sale operation for sync.
  Future<void> queueSaleForSync({
    required String localSaleId,
    required String operation,
    required String payload,
  }) async {
    await _db.into(_db.pendingSaleSync).insert(
          PendingSaleSyncCompanion.insert(
            localSaleId: localSaleId,
            operation: operation,
            payload: payload,
          ),
        );
  }

  /// Get pending sync operations.
  Future<List<PendingSaleSyncRow>> getPendingSyncOperations() async {
    return (_db.select(_db.pendingSaleSync)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Update sync attempt info.
  Future<void> updateSyncAttempt(int id, String? error) async {
    final current = await (_db.select(_db.pendingSaleSync)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();

    if (current != null) {
      await (_db.update(_db.pendingSaleSync)..where((t) => t.id.equals(id)))
          .write(
        PendingSaleSyncCompanion(
          attempts: Value(current.attempts + 1),
          lastError: Value(error),
          lastAttemptAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// Remove a sync operation after successful sync.
  Future<void> removeSyncOperation(int id) async {
    await (_db.delete(_db.pendingSaleSync)..where((t) => t.id.equals(id))).go();
  }

  /// Get count of pending sync operations.
  Future<int> getPendingSyncCount() async {
    final result = await (_db.selectOnly(_db.pendingSaleSync)
          ..addColumns([_db.pendingSaleSync.id.count()]))
        .getSingle();
    return result.read(_db.pendingSaleSync.id.count()) ?? 0;
  }

  /// Add a stock adjustment.
  Future<void> addStockAdjustment({
    required String productId,
    required String priceType,
    String? sackPriceId,
    String? perKiloPriceId,
    required double quantityChange,
    required String saleId,
  }) async {
    await _db.into(_db.localStockAdjustments).insert(
          LocalStockAdjustmentsCompanion.insert(
            productId: productId,
            priceType: priceType,
            sackPriceId: Value(sackPriceId),
            perKiloPriceId: Value(perKiloPriceId),
            quantityChange: quantityChange,
            saleId: saleId,
          ),
        );
  }

  /// Get stock adjustments for a product (to calculate local stock).
  Future<double> getLocalStockAdjustment({
    required String productId,
    String? sackPriceId,
    String? perKiloPriceId,
  }) async {
    var query = _db.select(_db.localStockAdjustments)
      ..where((t) => t.productId.equals(productId));

    if (sackPriceId != null) {
      query = query..where((t) => t.sackPriceId.equals(sackPriceId));
    }

    if (perKiloPriceId != null) {
      query = query..where((t) => t.perKiloPriceId.equals(perKiloPriceId));
    }

    final rows = await query.get();

    return rows.fold<double>(0.0, (sum, row) => sum + row.quantityChange);
  }

  /// Clear synced stock adjustments.
  Future<void> clearSyncedStockAdjustments() async {
    await (_db.delete(_db.localStockAdjustments)
          ..where((t) => t.isSynced.equals(true)))
        .go();
  }

  /// Mark stock adjustments for a sale as synced.
  Future<void> markStockAdjustmentsAsSynced(String saleId) async {
    await (_db.update(_db.localStockAdjustments)
          ..where((t) => t.saleId.equals(saleId)))
        .write(const LocalStockAdjustmentsCompanion(isSynced: Value(true)));
  }
}
