import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/sheet.dart';
import '../../domain/repositories/sheet_repository.dart';
import '../models/sheet_model.dart';

const _uuid = Uuid();

/// Local data source for sheet caching using Drift.
///
/// Provides offline-first functionality for sheets with pending sync queue.
class SheetLocalDataSource {
  final AppDatabase _db;

  SheetLocalDataSource(this._db);

  // ============================================================================
  // Cache Operations
  // ============================================================================

  /// Caches a sheet for a specific cashier.
  Future<void> cacheSheet(String cashierId, Sheet sheet) async {
    AppLogger.debug('Caching sheet', {
      'cashierId': cashierId,
      'sheetId': sheet.id,
      'type': sheet.type.toApiString(),
    });

    await _db.transaction(() async {
      final now = DateTime.now();
      final model = SheetModel.fromEntity(sheet);

      await _db.into(_db.cachedSheets).insertOnConflictUpdate(
            CachedSheetsCompanion.insert(
              id: sheet.id,
              cashierId: cashierId,
              type: sheet.type.toApiString(),
              name: sheet.name,
              columns: Value(sheet.columns),
              data: jsonEncode(model.toJson()),
              cachedAt: Value(now),
              updatedAt: Value(now),
            ),
          );

      // Update cache metadata
      final cacheKey = '${cashierId}_${sheet.type.toApiString()}';
      await _db.into(_db.sheetCacheMeta).insertOnConflictUpdate(
            SheetCacheMetaCompanion.insert(
              cacheKey: cacheKey,
              cashierId: cashierId,
              type: sheet.type.toApiString(),
              lastSyncedAt: now,
              isSyncing: const Value(false),
              lastError: const Value(null),
            ),
          );
    });

    AppLogger.debug('Sheet cached successfully');
  }

  /// Retrieves a cached sheet by type.
  Future<Sheet?> getCachedSheet(String cashierId, SheetType type) async {
    AppLogger.debug('Retrieving cached sheet', {
      'cashierId': cashierId,
      'type': type.toApiString(),
    });

    final row = await (_db.select(_db.cachedSheets)
          ..where((t) => t.cashierId.equals(cashierId))
          ..where((t) => t.type.equals(type.toApiString())))
        .getSingleOrNull();

    if (row == null) return null;

    final json = jsonDecode(row.data) as Map<String, dynamic>;
    final sheet = SheetModel.fromJson(json).toEntity();

    AppLogger.debug('Retrieved cached sheet with ${sheet.rows.length} rows');

    return sheet;
  }

  /// Checks if cache exists for a sheet type.
  Future<bool> hasCachedSheet(String cashierId, SheetType type) async {
    final count = await (_db.selectOnly(_db.cachedSheets)
          ..where(_db.cachedSheets.cashierId.equals(cashierId))
          ..where(_db.cachedSheets.type.equals(type.toApiString()))
          ..addColumns([_db.cachedSheets.id.count()]))
        .getSingle();

    return (count.read(_db.cachedSheets.id.count()) ?? 0) > 0;
  }

  /// Gets the last sync time for a sheet type.
  Future<DateTime?> getLastSyncTime(String cashierId, SheetType type) async {
    final cacheKey = '${cashierId}_${type.toApiString()}';
    final meta = await (_db.select(_db.sheetCacheMeta)
          ..where((t) => t.cacheKey.equals(cacheKey)))
        .getSingleOrNull();

    return meta?.lastSyncedAt;
  }

  /// Checks if the cache is stale.
  Future<bool> isCacheStale(
    String cashierId,
    SheetType type, {
    Duration staleDuration = const Duration(minutes: 15),
  }) async {
    final lastSync = await getLastSyncTime(cashierId, type);
    if (lastSync == null) return true;
    return DateTime.now().difference(lastSync) > staleDuration;
  }

  /// Clears the sheet cache for a specific cashier and type.
  Future<void> clearCache(String cashierId, {SheetType? type}) async {
    AppLogger.debug('Clearing sheet cache', {
      'cashierId': cashierId,
      'type': type?.toApiString(),
    });

    await _db.transaction(() async {
      var deleteQuery = _db.delete(_db.cachedSheets)
        ..where((t) => t.cashierId.equals(cashierId));

      if (type != null) {
        deleteQuery = deleteQuery
          ..where((t) => t.type.equals(type.toApiString()));
      }

      await deleteQuery.go();

      // Clear meta
      var metaQuery = _db.delete(_db.sheetCacheMeta)
        ..where((t) => t.cashierId.equals(cashierId));

      if (type != null) {
        metaQuery = metaQuery..where((t) => t.type.equals(type.toApiString()));
      }

      await metaQuery.go();
    });
  }

  // ============================================================================
  // Pending Sync Operations - Rows
  // ============================================================================

  /// Generate a local ID for offline-created rows.
  String generateLocalRowId() => 'local_row_${_uuid.v4()}';

  /// Generate a local ID for offline-created cells.
  String generateLocalCellId() => 'local_cell_${_uuid.v4()}';

  /// Queue a row creation for sync.
  Future<void> queueRowCreate({
    required String localId,
    required String sheetId,
    required int rowIndex,
    bool isItemRow = true,
    String? itemName,
    DateTime? createdAt,
    List<CellInput>? cells,
  }) async {
    final payload = {
      'sheetId': sheetId,
      'rowIndex': rowIndex,
      'isItemRow': isItemRow,
      if (itemName != null) 'itemName': itemName,
      if (createdAt != null) 'createdAt': createdAt.toUtc().toIso8601String(),
      if (cells != null)
        'cells': cells
            .map((c) => {
                  'columnIndex': c.columnIndex,
                  if (c.value != null) 'value': c.value,
                  if (c.formula != null) 'formula': c.formula,
                  if (c.color != null) 'color': c.color,
                  'isCalculated': c.isCalculated,
                })
            .toList(),
    };

    await _db.into(_db.pendingSheetRowSync).insert(
          PendingSheetRowSyncCompanion.insert(
            localId: localId,
            sheetId: sheetId,
            operation: 'create',
            payload: jsonEncode(payload),
          ),
        );
  }

  /// Queue a row deletion for sync.
  Future<void> queueRowDelete(String rowId) async {
    // Check if this is a local row that hasn't been synced
    final existingCreate = await (_db.select(_db.pendingSheetRowSync)
          ..where((t) => t.localId.equals(rowId))
          ..where((t) => t.operation.equals('create'))
          ..where((t) => t.synced.equals(false)))
        .getSingleOrNull();

    if (existingCreate != null) {
      // Just remove the pending create
      await (_db.delete(_db.pendingSheetRowSync)
            ..where((t) => t.id.equals(existingCreate.id)))
          .go();
      return;
    }

    // Check if we have a mapping for this local ID
    final mapping = await (_db.select(_db.sheetRowIdMappings)
          ..where((t) => t.localId.equals(rowId)))
        .getSingleOrNull();

    final serverId = mapping?.serverId ?? rowId;

    await _db.into(_db.pendingSheetRowSync).insert(
          PendingSheetRowSyncCompanion.insert(
            localId: rowId,
            serverId: Value(serverId),
            sheetId: '', // Not needed for delete
            operation: 'delete',
            payload: jsonEncode({'rowId': serverId}),
          ),
        );
  }

  /// Queue a row reorder for sync.
  Future<void> queueRowReorder({
    required String rowId,
    required int newRowIndex,
  }) async {
    // Get server ID if available
    final mapping = await (_db.select(_db.sheetRowIdMappings)
          ..where((t) => t.localId.equals(rowId)))
        .getSingleOrNull();

    final serverId = mapping?.serverId ?? rowId;

    final payload = {
      'rowId': serverId,
      'newRowIndex': newRowIndex,
    };

    await _db.into(_db.pendingSheetRowSync).insert(
          PendingSheetRowSyncCompanion.insert(
            localId: rowId,
            serverId: Value(serverId),
            sheetId: '', // Not needed for reorder
            operation: 'reorder',
            payload: jsonEncode(payload),
          ),
        );
  }

  /// Get all pending row syncs.
  Future<List<PendingSheetRowSyncRow>> getPendingRowSyncs() async {
    return (_db.select(_db.pendingSheetRowSync)
          ..where((t) => t.synced.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Mark a row sync as completed.
  Future<void> markRowSynced(int id, {String? serverId}) async {
    await (_db.update(_db.pendingSheetRowSync)..where((t) => t.id.equals(id)))
        .write(
      PendingSheetRowSyncCompanion(
        synced: const Value(true),
        syncedAt: Value(DateTime.now()),
        serverId: serverId != null ? Value(serverId) : const Value.absent(),
      ),
    );
  }

  /// Save row ID mapping (local -> server).
  Future<void> saveRowIdMapping({
    required String localId,
    required String serverId,
    required String sheetId,
  }) async {
    await _db.into(_db.sheetRowIdMappings).insertOnConflictUpdate(
          SheetRowIdMappingsCompanion.insert(
            localId: localId,
            serverId: serverId,
            sheetId: sheetId,
          ),
        );
  }

  // ============================================================================
  // Pending Sync Operations - Cells
  // ============================================================================

  /// Queue a cell creation for sync.
  Future<void> queueCellCreate({
    required String localId,
    required String rowId,
    required int columnIndex,
    String? value,
    String? formula,
    String? color,
    bool isCalculated = false,
  }) async {
    final payload = {
      'rowId': rowId,
      'columnIndex': columnIndex,
      if (value != null) 'value': value,
      if (formula != null) 'formula': formula,
      if (color != null) 'color': color,
      'isCalculated': isCalculated,
    };

    await _db.into(_db.pendingSheetCellSync).insert(
          PendingSheetCellSyncCompanion.insert(
            localId: localId,
            rowId: rowId,
            operation: 'create',
            payload: jsonEncode(payload),
          ),
        );
  }

  /// Queue a cell update for sync.
  Future<void> queueCellUpdate({
    required String cellId,
    String? value,
    String? formula,
    String? color,
    bool? isCalculated,
  }) async {
    // Get server ID if available
    final mapping = await (_db.select(_db.sheetCellIdMappings)
          ..where((t) => t.localId.equals(cellId)))
        .getSingleOrNull();

    final serverId = mapping?.serverId ?? cellId;

    final payload = {
      'id': serverId,
      if (value != null) 'value': value,
      if (formula != null) 'formula': formula,
      if (color != null) 'color': color,
      if (isCalculated != null) 'isCalculated': isCalculated,
    };

    await _db.into(_db.pendingSheetCellSync).insert(
          PendingSheetCellSyncCompanion.insert(
            localId: cellId,
            serverId: Value(serverId),
            rowId: '', // Not needed for update
            operation: 'update',
            payload: jsonEncode(payload),
          ),
        );
  }

  /// Queue a cell deletion for sync.
  Future<void> queueCellDelete(String cellId) async {
    // Check if this is a local cell that hasn't been synced
    final existingCreate = await (_db.select(_db.pendingSheetCellSync)
          ..where((t) => t.localId.equals(cellId))
          ..where((t) => t.operation.equals('create'))
          ..where((t) => t.synced.equals(false)))
        .getSingleOrNull();

    if (existingCreate != null) {
      // Just remove the pending create
      await (_db.delete(_db.pendingSheetCellSync)
            ..where((t) => t.id.equals(existingCreate.id)))
          .go();
      return;
    }

    // Get server ID if available
    final mapping = await (_db.select(_db.sheetCellIdMappings)
          ..where((t) => t.localId.equals(cellId)))
        .getSingleOrNull();

    final serverId = mapping?.serverId ?? cellId;

    await _db.into(_db.pendingSheetCellSync).insert(
          PendingSheetCellSyncCompanion.insert(
            localId: cellId,
            serverId: Value(serverId),
            rowId: '', // Not needed for delete
            operation: 'delete',
            payload: jsonEncode({'cellId': serverId}),
          ),
        );
  }

  /// Get all pending cell syncs.
  Future<List<PendingSheetCellSyncRow>> getPendingCellSyncs() async {
    return (_db.select(_db.pendingSheetCellSync)
          ..where((t) => t.synced.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Mark a cell sync as completed.
  Future<void> markCellSynced(int id, {String? serverId}) async {
    await (_db.update(_db.pendingSheetCellSync)..where((t) => t.id.equals(id)))
        .write(
      PendingSheetCellSyncCompanion(
        synced: const Value(true),
        syncedAt: Value(DateTime.now()),
        serverId: serverId != null ? Value(serverId) : const Value.absent(),
      ),
    );
  }

  /// Save cell ID mapping (local -> server).
  Future<void> saveCellIdMapping({
    required String localId,
    required String serverId,
    required String rowId,
  }) async {
    await _db.into(_db.sheetCellIdMappings).insertOnConflictUpdate(
          SheetCellIdMappingsCompanion.insert(
            localId: localId,
            serverId: serverId,
            rowId: rowId,
          ),
        );
  }

  /// Resolve a row ID from local to server ID.
  Future<String> resolveRowId(String rowId) async {
    if (!rowId.startsWith('local_')) return rowId;

    final mapping = await (_db.select(_db.sheetRowIdMappings)
          ..where((t) => t.localId.equals(rowId)))
        .getSingleOrNull();

    return mapping?.serverId ?? rowId;
  }

  /// Resolve a cell ID from local to server ID.
  Future<String> resolveCellId(String cellId) async {
    if (!cellId.startsWith('local_')) return cellId;

    final mapping = await (_db.select(_db.sheetCellIdMappings)
          ..where((t) => t.localId.equals(cellId)))
        .getSingleOrNull();

    return mapping?.serverId ?? cellId;
  }

  // ============================================================================
  // Utility Operations
  // ============================================================================

  /// Get count of pending syncs.
  Future<int> getPendingSyncCount() async {
    final rowCount = await (_db.selectOnly(_db.pendingSheetRowSync)
          ..where(_db.pendingSheetRowSync.synced.equals(false))
          ..addColumns([_db.pendingSheetRowSync.id.count()]))
        .getSingle();

    final cellCount = await (_db.selectOnly(_db.pendingSheetCellSync)
          ..where(_db.pendingSheetCellSync.synced.equals(false))
          ..addColumns([_db.pendingSheetCellSync.id.count()]))
        .getSingle();

    return (rowCount.read(_db.pendingSheetRowSync.id.count()) ?? 0) +
        (cellCount.read(_db.pendingSheetCellSync.id.count()) ?? 0);
  }

  /// Check if there are any pending syncs.
  Future<bool> hasPendingSync() async {
    return await getPendingSyncCount() > 0;
  }

  /// Clear all synced items older than the specified duration.
  Future<void> clearOldSyncedItems({
    Duration olderThan = const Duration(days: 7),
  }) async {
    final cutoff = DateTime.now().subtract(olderThan);

    await (_db.delete(_db.pendingSheetRowSync)
          ..where((t) => t.synced.equals(true))
          ..where((t) => t.syncedAt.isSmallerThanValue(cutoff)))
        .go();

    await (_db.delete(_db.pendingSheetCellSync)
          ..where((t) => t.synced.equals(true))
          ..where((t) => t.syncedAt.isSmallerThanValue(cutoff)))
        .go();
  }
}
