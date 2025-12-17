import 'package:drift/drift.dart';

/// Cached sales table for offline-first storage.
@DataClassName('CachedSaleRow')
class CachedSales extends Table {
  /// Sale ID from the server (or local UUID if not synced).
  TextColumn get id => text()();

  /// Local UUID for tracking before server sync.
  TextColumn get localId => text().nullable()();

  /// Cashier ID who made the sale.
  TextColumn get cashierId => text()();

  /// Total sale amount.
  RealColumn get totalAmount => real()();

  /// Payment method (CASH, BANK_TRANSFER, CHECK).
  TextColumn get paymentMethod => text()();

  /// Whether the sale is voided.
  BoolColumn get isVoid => boolean().withDefault(const Constant(false))();

  /// When the sale was voided.
  DateTimeColumn get voidedAt => dateTime().nullable()();

  /// Optional order ID.
  TextColumn get orderId => text().nullable()();

  /// Complete sale data as JSON (includes items, etc.).
  TextColumn get data => text()();

  /// Whether this sale has been synced to the server.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// When the sale was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When the sale was last updated.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Pending sale sync operations.
/// Tracks sales that need to be synced to the server.
@DataClassName('PendingSaleSyncRow')
class PendingSaleSync extends Table {
  /// Auto-increment ID.
  IntColumn get id => integer().autoIncrement()();

  /// The local sale ID.
  TextColumn get localSaleId => text()();

  /// Operation type: 'create' or 'void'.
  TextColumn get operation => text()();

  /// The sale data as JSON for creation.
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

/// Stock adjustments table for tracking local stock changes.
/// Used to keep local stock in sync when sales are made offline.
@DataClassName('LocalStockAdjustmentRow')
class LocalStockAdjustments extends Table {
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

  /// Quantity change (negative for sales, positive for voids).
  RealColumn get quantityChange => real()();

  /// Related sale ID.
  TextColumn get saleId => text()();

  /// Whether this adjustment has been synced.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// When the adjustment was made.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
