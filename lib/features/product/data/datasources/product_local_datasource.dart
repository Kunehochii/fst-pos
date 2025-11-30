import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

/// Local data source for product caching using Drift.
///
/// Stores products per cashier to support multi-cashier scenarios.
/// Each cashier has their own isolated product cache.
class ProductLocalDataSource {
  final AppDatabase _db;

  ProductLocalDataSource(this._db);

  /// Caches products for a specific cashier.
  ///
  /// Replaces all existing cached products for the cashier.
  Future<void> cacheProducts(String cashierId, List<Product> products) async {
    AppLogger.debug('Caching ${products.length} products for cashier',
        {'cashierId': cashierId});

    await _db.transaction(() async {
      // Delete existing products for this cashier
      await (_db.delete(_db.cachedProducts)
            ..where((t) => t.cashierId.equals(cashierId)))
          .go();

      // Insert new products
      final now = DateTime.now();
      for (final product in products) {
        final model = ProductModel.fromEntity(product);
        await _db.into(_db.cachedProducts).insert(
              CachedProductsCompanion.insert(
                id: product.id,
                cashierId: cashierId,
                name: product.name,
                picture: product.picture,
                category: product.category.toApiString(),
                data: jsonEncode(model.toJson()),
                cachedAt: Value(now),
                updatedAt: Value(now),
              ),
            );
      }

      // Update cache metadata
      await _db.into(_db.productCacheMeta).insertOnConflictUpdate(
            ProductCacheMetaCompanion.insert(
              cashierId: cashierId,
              lastSyncedAt: now,
              isSyncing: const Value(false),
              lastError: const Value(null),
            ),
          );
    });

    AppLogger.debug('Products cached successfully');
  }

  /// Retrieves all cached products for a cashier with optional filters.
  Future<List<Product>> getCachedProducts(
    String cashierId, {
    ProductFilter? filter,
  }) async {
    AppLogger.debug('Retrieving cached products', {
      'cashierId': cashierId,
      'category': filter?.category?.toApiString(),
      'search': filter?.searchQuery,
    });

    var query = _db.select(_db.cachedProducts)
      ..where((t) => t.cashierId.equals(cashierId))
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);

    // Apply category filter
    if (filter?.category != null) {
      query = query
        ..where((t) => t.category.equals(filter!.category!.toApiString()));
    }

    // Apply search filter
    if (filter?.searchQuery != null && filter!.searchQuery!.isNotEmpty) {
      query = query
        ..where((t) =>
            t.name.lower().like('%${filter.searchQuery!.toLowerCase()}%'));
    }

    final rows = await query.get();

    final products = rows.map((row) {
      final json = jsonDecode(row.data) as Map<String, dynamic>;
      return ProductModel.fromJson(json).toEntity();
    }).toList();

    AppLogger.debug('Retrieved ${products.length} cached products');

    return products;
  }

  /// Retrieves a single cached product by ID.
  Future<Product?> getCachedProductById(
      String cashierId, String productId) async {
    final row = await (_db.select(_db.cachedProducts)
          ..where((t) => t.cashierId.equals(cashierId))
          ..where((t) => t.id.equals(productId)))
        .getSingleOrNull();

    if (row == null) return null;

    final json = jsonDecode(row.data) as Map<String, dynamic>;
    return ProductModel.fromJson(json).toEntity();
  }

  /// Checks if cache exists for a cashier.
  Future<bool> hasCachedProducts(String cashierId) async {
    final count = await (_db.selectOnly(_db.cachedProducts)
          ..where(_db.cachedProducts.cashierId.equals(cashierId))
          ..addColumns([_db.cachedProducts.id.count()]))
        .getSingle();

    return (count.read(_db.cachedProducts.id.count()) ?? 0) > 0;
  }

  /// Gets the last sync time for a cashier's products.
  Future<DateTime?> getLastSyncTime(String cashierId) async {
    final meta = await (_db.select(_db.productCacheMeta)
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

  /// Clears the product cache for a specific cashier.
  Future<void> clearCache(String cashierId) async {
    AppLogger.debug('Clearing product cache', {'cashierId': cashierId});

    await _db.transaction(() async {
      await (_db.delete(_db.cachedProducts)
            ..where((t) => t.cashierId.equals(cashierId)))
          .go();

      await (_db.delete(_db.productCacheMeta)
            ..where((t) => t.cashierId.equals(cashierId)))
          .go();
    });
  }

  /// Clears all product caches (all cashiers).
  ///
  /// Use sparingly - mainly for complete app data reset.
  Future<void> clearAllCaches() async {
    AppLogger.debug('Clearing all product caches');

    await _db.transaction(() async {
      await _db.delete(_db.cachedProducts).go();
      await _db.delete(_db.productCacheMeta).go();
    });
  }

  /// Updates sync status for a cashier.
  Future<void> setSyncStatus(String cashierId,
      {required bool isSyncing}) async {
    await (_db.update(_db.productCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .write(ProductCacheMetaCompanion(isSyncing: Value(isSyncing)));
  }

  /// Records a sync error.
  Future<void> setSyncError(String cashierId, String error) async {
    await (_db.update(_db.productCacheMeta)
          ..where((t) => t.cashierId.equals(cashierId)))
        .write(ProductCacheMetaCompanion(
      isSyncing: const Value(false),
      lastError: Value(error),
    ));
  }
}
