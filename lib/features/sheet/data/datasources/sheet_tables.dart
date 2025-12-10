import 'package:drift/drift.dart';

/// Cached sheets table for offline-first storage.
@DataClassName('CachedSheetRow')
class CachedSheets extends Table {
  /// Sheet ID from the server.
  TextColumn get id => text()();

  /// Cashier ID who owns this sheet.
  TextColumn get cashierId => text()();

  /// Sheet type (KAHON, INVENTORY).
  TextColumn get type => text()();

  /// Sheet name.
  TextColumn get name => text()();

  /// Number of columns.
  IntColumn get columns => integer().withDefault(const Constant(10))();

  /// Complete sheet data as JSON (includes rows and cells).
  TextColumn get data => text()();

  /// When the cache entry was created.
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  /// When the cache entry was last updated.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Sheet cache metadata for tracking sync status.
@DataClassName('SheetCacheMetaRow')
class SheetCacheMeta extends Table {
  /// Cashier ID + Sheet type combination.
  TextColumn get cacheKey => text()();

  /// Cashier ID whose sheets are cached.
  TextColumn get cashierId => text()();

  /// Sheet type (KAHON, INVENTORY).
  TextColumn get type => text()();

  /// When the sheets were last synced from server.
  DateTimeColumn get lastSyncedAt => dateTime()();

  /// Whether a sync is currently in progress.
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();

  /// Last sync error message, if any.
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {cacheKey};
}

/// Pending sheet row sync queue.
@DataClassName('PendingSheetRowSyncRow')
class PendingSheetRowSync extends Table {
  /// Auto-generated ID.
  IntColumn get id => integer().autoIncrement()();

  /// Temporary local ID for new rows.
  TextColumn get localId => text()();

  /// Server ID if known (for updates/deletes).
  TextColumn get serverId => text().nullable()();

  /// Sheet ID this row belongs to.
  TextColumn get sheetId => text()();

  /// Operation type: 'create', 'update', 'delete', 'reorder'.
  TextColumn get operation => text()();

  /// Row data as JSON.
  TextColumn get payload => text()();

  /// When this sync entry was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// Whether this has been synced.
  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  /// When this was synced.
  DateTimeColumn get syncedAt => dateTime().nullable()();
}

/// Pending sheet cell sync queue.
@DataClassName('PendingSheetCellSyncRow')
class PendingSheetCellSync extends Table {
  /// Auto-generated ID.
  IntColumn get id => integer().autoIncrement()();

  /// Temporary local ID for new cells.
  TextColumn get localId => text()();

  /// Server ID if known (for updates/deletes).
  TextColumn get serverId => text().nullable()();

  /// Row ID this cell belongs to (may be local or server ID).
  TextColumn get rowId => text()();

  /// Operation type: 'create', 'update', 'delete'.
  TextColumn get operation => text()();

  /// Cell data as JSON.
  TextColumn get payload => text()();

  /// When this sync entry was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// Whether this has been synced.
  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  /// When this was synced.
  DateTimeColumn get syncedAt => dateTime().nullable()();
}

/// Local row ID to server row ID mapping.
/// Used to resolve pending cell syncs that reference local row IDs.
@DataClassName('SheetRowIdMappingRow')
class SheetRowIdMappings extends Table {
  /// Local temporary ID.
  TextColumn get localId => text()();

  /// Server ID after sync.
  TextColumn get serverId => text()();

  /// Sheet ID.
  TextColumn get sheetId => text()();

  /// When this mapping was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {localId};
}

/// Local cell ID to server cell ID mapping.
@DataClassName('SheetCellIdMappingRow')
class SheetCellIdMappings extends Table {
  /// Local temporary ID.
  TextColumn get localId => text()();

  /// Server ID after sync.
  TextColumn get serverId => text()();

  /// Row ID.
  TextColumn get rowId => text()();

  /// When this mapping was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {localId};
}
