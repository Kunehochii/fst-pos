import 'package:drift/drift.dart';

/// Cached deliveries table for offline-first storage.
@DataClassName('CachedDeliveryRow')
class CachedDeliveries extends Table {
  /// Delivery ID from the server (or local UUID if not synced).
  TextColumn get id => text()();

  /// Local UUID for tracking before server sync.
  TextColumn get localId => text().nullable()();

  /// Cashier ID who received this delivery.
  TextColumn get cashierId => text()();

  /// Driver name who delivered.
  TextColumn get driverName => text()();

  /// When the delivery started/arrived.
  DateTimeColumn get deliveryTimeStart => dateTime()();

  /// Complete delivery data as JSON (includes items, etc.).
  TextColumn get data => text()();

  /// Whether this delivery has been synced to the server.
  BoolColumn get isSynced => boolean().withDefault(const Constant(true))();

  /// Whether this delivery is marked for deletion.
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  /// When the delivery was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When the delivery was last updated.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Delivery cache metadata for tracking sync status.
@DataClassName('DeliveryCacheMetaRow')
class DeliveryCacheMeta extends Table {
  /// Cashier ID whose deliveries are cached.
  TextColumn get cashierId => text()();

  /// When the deliveries were last synced from server.
  DateTimeColumn get lastSyncedAt => dateTime()();

  /// Whether a sync is currently in progress.
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();

  /// Last sync error message, if any.
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {cashierId};
}

/// Pending delivery sync operations.
/// Tracks deliveries that need to be synced to the server.
@DataClassName('PendingDeliverySyncRow')
class PendingDeliverySync extends Table {
  /// Auto-increment ID.
  IntColumn get id => integer().autoIncrement()();

  /// The local delivery ID.
  TextColumn get localDeliveryId => text()();

  /// The server delivery ID (null for creates, set for updates/deletes).
  TextColumn get serverDeliveryId => text().nullable()();

  /// Operation type: 'create', 'update', or 'delete'.
  TextColumn get operation => text()();

  /// The delivery data as JSON for creation/update.
  TextColumn get payload => text()();

  /// Number of sync attempts.
  IntColumn get attempts => integer().withDefault(const Constant(0))();

  /// Last sync error message.
  TextColumn get lastError => text().nullable()();

  /// When the sync operation was queued.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When the sync was last attempted.
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();
}

/// Local stock adjustments from deliveries.
/// Tracks stock changes from deliveries that haven't synced yet.
@DataClassName('DeliveryStockAdjustmentRow')
class DeliveryStockAdjustments extends Table {
  /// Auto-increment ID.
  IntColumn get id => integer().autoIncrement()();

  /// Product ID.
  TextColumn get productId => text()();

  /// Price type: 'perKilo' or 'sack'.
  TextColumn get priceType => text()();

  /// Sack price ID if applicable.
  TextColumn get sackPriceId => text().nullable()();

  /// Per kilo price ID if applicable.
  TextColumn get perKiloPriceId => text().nullable()();

  /// Quantity change (positive for deliveries, negative for void).
  RealColumn get quantityChange => real()();

  /// Related delivery ID.
  TextColumn get deliveryId => text()();

  /// Whether this adjustment has been synced.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// When the adjustment was made.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
