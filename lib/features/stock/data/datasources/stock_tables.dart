import 'package:drift/drift.dart';

/// Cached transfers table for offline-first storage.
@DataClassName('CachedTransferRow')
class CachedTransfers extends Table {
  /// Transfer ID from the server (or local UUID if not synced).
  TextColumn get id => text()();

  /// Local UUID for tracking before server sync.
  TextColumn get localId => text().nullable()();

  /// Cashier ID who made this transfer.
  TextColumn get cashierId => text()();

  /// Product ID that was transferred.
  TextColumn get productId => text()();

  /// Transfer type (KAHON, BUTAS, SALES_MAID, MANUAL_ADJUST).
  TextColumn get type => text()();

  /// Quantity transferred.
  RealColumn get quantity => real()();

  /// Sack type if applicable (FIFTY_KG, TWENTY_FIVE_KG, FIVE_KG).
  TextColumn get sackType => text().nullable()();

  /// Sack price ID if applicable.
  TextColumn get sackPriceId => text().nullable()();

  /// Per kilo price ID if applicable.
  TextColumn get perKiloPriceId => text().nullable()();

  /// Complete transfer data as JSON (includes product info, etc.).
  TextColumn get data => text()();

  /// Whether this transfer has been synced to the server.
  BoolColumn get isSynced => boolean().withDefault(const Constant(true))();

  /// Whether this transfer is marked for deletion.
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  /// When the transfer was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When the transfer was last updated.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Transfer cache metadata for tracking sync status.
@DataClassName('TransferCacheMetaRow')
class TransferCacheMeta extends Table {
  /// Cashier ID whose transfers are cached.
  TextColumn get cashierId => text()();

  /// When the transfers were last synced from server.
  DateTimeColumn get lastSyncedAt => dateTime()();

  /// Whether a sync is currently in progress.
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();

  /// Last sync error message, if any.
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {cashierId};
}

/// Pending transfer sync operations.
/// Tracks transfers that need to be synced to the server.
@DataClassName('PendingTransferSyncRow')
class PendingTransferSync extends Table {
  /// Auto-increment ID.
  IntColumn get id => integer().autoIncrement()();

  /// The local transfer ID.
  TextColumn get localTransferId => text()();

  /// The server transfer ID (null for creates, set for updates/deletes).
  TextColumn get serverTransferId => text().nullable()();

  /// Operation type: 'create', 'update', or 'delete'.
  TextColumn get operation => text()();

  /// The transfer data as JSON for creation/update.
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

/// Local stock adjustments from transfers.
/// Tracks stock changes from transfers that haven't synced yet.
@DataClassName('TransferStockAdjustmentRow')
class TransferStockAdjustments extends Table {
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

  /// Quantity change (negative for transfers, positive for void).
  RealColumn get quantityChange => real()();

  /// Related transfer ID.
  TextColumn get transferId => text()();

  /// Whether this adjustment has been synced.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// When the adjustment was made.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
