import 'package:drift/drift.dart';

/// Cached bill counts table for offline-first storage.
@DataClassName('CachedBillCountRow')
class CachedBillCounts extends Table {
  /// Bill count ID from the server (or local UUID if not synced).
  TextColumn get id => text()();

  /// Local UUID for tracking before server sync.
  TextColumn get localId => text().nullable()();

  /// Cashier ID who created the bill count.
  TextColumn get cashierId => text()();

  /// Username of the cashier.
  TextColumn get cashierUsername => text()();

  /// Branch name of the cashier.
  TextColumn get cashierBranchName => text()();

  /// Beginning balance amount.
  RealColumn get beginningBalance => real().withDefault(const Constant(0))();

  /// Whether to show beginning balance.
  BoolColumn get showBeginningBalance =>
      boolean().withDefault(const Constant(false))();

  /// The date this bill count is for (stored as start of day in UTC).
  DateTimeColumn get date => dateTime()();

  /// Complete bill count data as JSON (includes bills, calculated fields, etc.).
  TextColumn get data => text()();

  /// Whether this bill count has been synced to the server.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// When the bill count was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When the bill count was last updated.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Pending bill count sync operations.
/// Tracks bill counts that need to be synced to the server.
@DataClassName('PendingBillCountSyncRow')
class PendingBillCountSync extends Table {
  /// Auto-increment ID.
  IntColumn get id => integer().autoIncrement()();

  /// The local bill count ID.
  TextColumn get localBillCountId => text()();

  /// Operation type: 'create' or 'update'.
  TextColumn get operation => text()();

  /// The bill count data as JSON for syncing.
  TextColumn get payload => text()();

  /// The date filter for syncing (ISO 8601 UTC).
  TextColumn get dateFilter => text()();

  /// Number of sync attempts.
  IntColumn get attempts => integer().withDefault(const Constant(0))();

  /// Last sync error message.
  TextColumn get lastError => text().nullable()();

  /// When the sync operation was queued.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When the sync was last attempted.
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();
}

/// Bill count cache metadata for tracking last sync time.
@DataClassName('BillCountCacheMetaRow')
class BillCountCacheMeta extends Table {
  /// Unique key for the cache entry (e.g., 'cashier_<id>_<date>').
  TextColumn get key => text()();

  /// When the cache was last synced from server.
  DateTimeColumn get lastSyncAt => dateTime().nullable()();

  /// When the cache entry was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {key};
}
