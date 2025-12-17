import 'package:drift/drift.dart';

/// Cached products table for offline-first storage.
///
/// Stores products with cashierId to support multi-cashier scenarios.
/// Each cashier has their own product cache.
@DataClassName('CachedProductRow')
class CachedProducts extends Table {
  /// Product ID from the server.
  TextColumn get id => text()();

  /// Cashier ID who owns this product.
  TextColumn get cashierId => text()();

  /// Product name.
  TextColumn get name => text()();

  /// Product picture URL.
  TextColumn get picture => text()();

  /// Product category (NORMAL, ASIN, PLASTIC).
  TextColumn get category => text()();

  /// Complete product data as JSON (includes pricing, etc.).
  TextColumn get data => text()();

  /// When the cache entry was created.
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  /// When the cache entry was last updated.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Product cache metadata for tracking sync status.
@DataClassName('ProductCacheMetaRow')
class ProductCacheMeta extends Table {
  /// Cashier ID whose products are cached.
  TextColumn get cashierId => text()();

  /// When the products were last synced from server.
  DateTimeColumn get lastSyncedAt => dateTime()();

  /// Whether a sync is currently in progress.
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();

  /// Last sync error message, if any.
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {cashierId};
}
