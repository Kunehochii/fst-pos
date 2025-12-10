import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/sheet.dart';
import '../../domain/repositories/sheet_repository.dart';
import '../datasources/sheet_local_datasource.dart';
import '../datasources/sheet_remote_datasource.dart';
import '../models/sheet_model.dart';

/// Implementation of [SheetRepository].
///
/// Follows offline-first strategy:
/// 1. Returns cached data immediately if available
/// 2. Fetches fresh data from server in background
/// 3. Updates cache with server data
/// 4. Queues changes locally when offline
/// 5. Syncs pending changes when online
class SheetRepositoryImpl implements SheetRepository {
  final SheetRemoteDataSource _remoteDataSource;
  final SheetLocalDataSource _localDataSource;
  final String _cashierId;

  SheetRepositoryImpl({
    required SheetRemoteDataSource remoteDataSource,
    required SheetLocalDataSource localDataSource,
    required String cashierId,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId;

  // ============================================================================
  // Get Sheet Operations
  // ============================================================================

  @override
  Future<(Failure?, Sheet?)> getKahonSheet({
    DateTime? startDate,
    DateTime? endDate,
    bool forceRefresh = false,
  }) async {
    return _getSheet(
      type: SheetType.kahon,
      startDate: startDate,
      endDate: endDate,
      forceRefresh: forceRefresh,
    );
  }

  @override
  Future<(Failure?, Sheet?)> getInventorySheet({
    DateTime? startDate,
    DateTime? endDate,
    bool forceRefresh = false,
  }) async {
    return _getSheet(
      type: SheetType.inventory,
      startDate: startDate,
      endDate: endDate,
      forceRefresh: forceRefresh,
    );
  }

  Future<(Failure?, Sheet?)> _getSheet({
    required SheetType type,
    DateTime? startDate,
    DateTime? endDate,
    bool forceRefresh = false,
  }) async {
    AppLogger.debug('SheetRepository: Getting ${type.name} sheet', {
      'cashierId': _cashierId,
      'forceRefresh': forceRefresh,
      'hasDateRange': startDate != null && endDate != null,
    });

    try {
      // Check cache
      final hasCached = await _localDataSource.hasCachedSheet(_cashierId, type);
      final isStale = await _localDataSource.isCacheStale(_cashierId, type);

      // If force refresh or no cache, fetch from server
      if (forceRefresh || !hasCached) {
        return _fetchAndCacheSheet(
          type: type,
          startDate: startDate,
          endDate: endDate,
        );
      }

      // Return cached data
      final cachedSheet =
          await _localDataSource.getCachedSheet(_cashierId, type);

      // Background refresh if stale
      if (isStale) {
        _refreshInBackground(
          type: type,
          startDate: startDate,
          endDate: endDate,
        );
      }

      AppLogger.debug(
        'SheetRepository: Returning cached ${type.name} sheet with ${cachedSheet?.rows.length ?? 0} rows',
      );

      return (null, cachedSheet);
    } catch (e, stackTrace) {
      AppLogger.error(
        'SheetRepository: Error getting ${type.name} sheet',
        e,
        stackTrace,
      );

      // Fallback to cache
      try {
        final cachedSheet =
            await _localDataSource.getCachedSheet(_cashierId, type);
        if (cachedSheet != null) {
          AppLogger.debug('SheetRepository: Returning cached fallback');
          return (null, cachedSheet);
        }
      } catch (_) {}

      return (_mapException(e), null);
    }
  }

  Future<(Failure?, Sheet?)> _fetchAndCacheSheet({
    required SheetType type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      SheetModel model;

      if (startDate != null && endDate != null) {
        if (type == SheetType.kahon) {
          model = await _remoteDataSource.getKahonSheetByDate(
            startDate: startDate,
            endDate: endDate,
          );
        } else {
          model = await _remoteDataSource.getInventorySheetByDate(
            startDate: startDate,
            endDate: endDate,
          );
        }
      } else {
        if (type == SheetType.kahon) {
          model = await _remoteDataSource.getKahonSheet();
        } else {
          model = await _remoteDataSource.getInventorySheet();
        }
      }

      final sheet = model.toEntity();
      await _localDataSource.cacheSheet(_cashierId, sheet);

      return (null, sheet);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error fetching sheet', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  void _refreshInBackground({
    required SheetType type,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    _fetchAndCacheSheet(
      type: type,
      startDate: startDate,
      endDate: endDate,
    ).then((_) {
      AppLogger.debug('SheetRepository: Background refresh completed');
    }).catchError((e) {
      AppLogger.warning('SheetRepository: Background refresh failed: $e');
    });
  }

  // ============================================================================
  // Row Operations
  // ============================================================================

  @override
  Future<(Failure?, SheetRow?)> addRow({
    required String sheetId,
    required int rowIndex,
    bool isItemRow = true,
    String? itemName,
    DateTime? createdAt,
    List<CellInput>? cells,
  }) async {
    AppLogger.debug('SheetRepository: Adding row', {
      'sheetId': sheetId,
      'rowIndex': rowIndex,
      'isItemRow': isItemRow,
    });

    try {
      // Try to add directly to server
      final model = await _remoteDataSource.addRow(
        sheetId: sheetId,
        rowIndex: rowIndex,
        isItemRow: isItemRow,
        itemName: itemName,
        createdAt: createdAt,
        cells: cells,
      );

      return (null, model.toEntity());
    } on DioException catch (e) {
      // Offline - queue for sync
      if (_isNetworkError(e)) {
        AppLogger.debug('SheetRepository: Offline, queuing row creation');

        final localId = _localDataSource.generateLocalRowId();
        await _localDataSource.queueRowCreate(
          localId: localId,
          sheetId: sheetId,
          rowIndex: rowIndex,
          isItemRow: isItemRow,
          itemName: itemName,
          createdAt: createdAt,
          cells: cells,
        );

        // Return a temporary local row
        final now = DateTime.now();
        final localRow = SheetRow(
          id: localId,
          sheetId: sheetId,
          rowIndex: rowIndex,
          isItemRow: isItemRow,
          itemName: itemName,
          cells: _createLocalCells(localId, cells, now),
          createdAt: createdAt ?? now,
          updatedAt: now,
        );

        return (null, localRow);
      }

      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error adding row', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  List<Cell> _createLocalCells(
    String rowId,
    List<CellInput>? cellInputs,
    DateTime now,
  ) {
    if (cellInputs == null || cellInputs.isEmpty) {
      // Create default empty cells for all columns (10)
      return List.generate(
        10,
        (i) => Cell(
          id: _localDataSource.generateLocalCellId(),
          rowId: rowId,
          columnIndex: i,
          value: null,
          formula: null,
          color: null,
          isCalculated: false,
          createdAt: now,
          updatedAt: now,
        ),
      );
    }

    return cellInputs
        .map((c) => Cell(
              id: _localDataSource.generateLocalCellId(),
              rowId: rowId,
              columnIndex: c.columnIndex,
              value: c.value,
              formula: c.formula,
              color: c.color,
              isCalculated: c.isCalculated,
              createdAt: now,
              updatedAt: now,
            ))
        .toList();
  }

  @override
  Future<(Failure?, List<SheetRow>?)> addRows({
    required String sheetId,
    required List<RowInput> rows,
  }) async {
    AppLogger.debug('SheetRepository: Adding ${rows.length} rows');

    try {
      final models = await _remoteDataSource.addRows(
        sheetId: sheetId,
        rows: rows,
      );

      return (null, models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        // Queue each row for sync
        final localRows = <SheetRow>[];
        final now = DateTime.now();

        for (final row in rows) {
          final localId = _localDataSource.generateLocalRowId();
          await _localDataSource.queueRowCreate(
            localId: localId,
            sheetId: sheetId,
            rowIndex: row.rowIndex,
            isItemRow: row.isItemRow,
            itemName: row.itemName,
            createdAt: row.createdAt,
            cells: row.cells,
          );

          localRows.add(SheetRow(
            id: localId,
            sheetId: sheetId,
            rowIndex: row.rowIndex,
            isItemRow: row.isItemRow,
            itemName: row.itemName,
            cells: _createLocalCells(localId, row.cells, now),
            createdAt: row.createdAt ?? now,
            updatedAt: now,
          ));
        }

        return (null, localRows);
      }

      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error adding rows', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, void)> deleteRow(String rowId) async {
    AppLogger.debug('SheetRepository: Deleting row', {'rowId': rowId});

    try {
      await _remoteDataSource.deleteRow(rowId);
      return (null, null);
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        await _localDataSource.queueRowDelete(rowId);
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error deleting row', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, SheetRow?)> reorderRow({
    required String rowId,
    required int newRowIndex,
  }) async {
    AppLogger.debug('SheetRepository: Reordering row', {
      'rowId': rowId,
      'newRowIndex': newRowIndex,
    });

    try {
      final model = await _remoteDataSource.reorderRow(
        rowId: rowId,
        newRowIndex: newRowIndex,
      );
      return (null, model.toEntity());
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        await _localDataSource.queueRowReorder(
          rowId: rowId,
          newRowIndex: newRowIndex,
        );
        // Return null - caller should update local state optimistically
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error reordering row', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, void)> updateRowPositions(
    List<RowPositionUpdate> updates,
  ) async {
    AppLogger.debug(
        'SheetRepository: Updating ${updates.length} row positions');

    try {
      await _remoteDataSource.updateRowPositions(updates);
      return (null, null);
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        // Queue each reorder
        for (final update in updates) {
          await _localDataSource.queueRowReorder(
            rowId: update.rowId,
            newRowIndex: update.newRowIndex,
          );
        }
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
        'SheetRepository: Error updating row positions',
        e,
        stackTrace,
      );
      return (_mapException(e), null);
    }
  }

  // ============================================================================
  // Cell Operations
  // ============================================================================

  @override
  Future<(Failure?, Cell?)> addCell({
    required String rowId,
    required int columnIndex,
    String? value,
    String? formula,
    String? color,
    bool isCalculated = false,
  }) async {
    AppLogger.debug('SheetRepository: Adding cell', {
      'rowId': rowId,
      'columnIndex': columnIndex,
    });

    try {
      final model = await _remoteDataSource.addCell(
        rowId: rowId,
        columnIndex: columnIndex,
        value: value,
        formula: formula,
        color: color,
        isCalculated: isCalculated,
      );
      return (null, model.toEntity());
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        final localId = _localDataSource.generateLocalCellId();
        await _localDataSource.queueCellCreate(
          localId: localId,
          rowId: rowId,
          columnIndex: columnIndex,
          value: value,
          formula: formula,
          color: color,
          isCalculated: isCalculated,
        );

        final now = DateTime.now();
        return (
          null,
          Cell(
            id: localId,
            rowId: rowId,
            columnIndex: columnIndex,
            value: value,
            formula: formula,
            color: color,
            isCalculated: isCalculated,
            createdAt: now,
            updatedAt: now,
          )
        );
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error adding cell', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, void)> addCells(List<CellInput> cells) async {
    AppLogger.debug('SheetRepository: Adding ${cells.length} cells');

    try {
      await _remoteDataSource.addCells(cells);
      return (null, null);
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        for (final cell in cells) {
          final localId = _localDataSource.generateLocalCellId();
          await _localDataSource.queueCellCreate(
            localId: localId,
            rowId: cell.rowId,
            columnIndex: cell.columnIndex,
            value: cell.value,
            formula: cell.formula,
            color: cell.color,
            isCalculated: cell.isCalculated,
          );
        }
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error adding cells', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, Cell?)> updateCell({
    required String cellId,
    String? value,
    String? formula,
    String? color,
    bool? isCalculated,
  }) async {
    AppLogger.debug('SheetRepository: Updating cell', {'cellId': cellId});

    try {
      final model = await _remoteDataSource.updateCell(
        cellId: cellId,
        value: value,
        formula: formula,
        color: color,
        isCalculated: isCalculated,
      );
      return (null, model.toEntity());
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        await _localDataSource.queueCellUpdate(
          cellId: cellId,
          value: value,
          formula: formula,
          color: color,
          isCalculated: isCalculated,
        );
        // Return null - caller should update local state optimistically
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error updating cell', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, void)> updateCells(List<CellUpdate> cells) async {
    AppLogger.debug('SheetRepository: Updating ${cells.length} cells');

    try {
      await _remoteDataSource.updateCells(cells);
      return (null, null);
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        for (final cell in cells) {
          await _localDataSource.queueCellUpdate(
            cellId: cell.cellId,
            value: cell.value,
            formula: cell.formula,
            color: cell.color,
            isCalculated: cell.isCalculated,
          );
        }
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error updating cells', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, void)> deleteCell(String cellId) async {
    AppLogger.debug('SheetRepository: Deleting cell', {'cellId': cellId});

    try {
      await _remoteDataSource.deleteCell(cellId);
      return (null, null);
    } on DioException catch (e) {
      if (_isNetworkError(e)) {
        await _localDataSource.queueCellDelete(cellId);
        return (null, null);
      }
      return (_mapException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Error deleting cell', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  // ============================================================================
  // Cache & Sync Operations
  // ============================================================================

  @override
  Future<void> clearCache() async {
    await _localDataSource.clearCache(_cashierId);
  }

  @override
  Future<(Failure?, void)> syncWithServer() async {
    AppLogger.debug('SheetRepository: Starting sync');

    try {
      // Sync pending row operations first
      final pendingRows = await _localDataSource.getPendingRowSyncs();
      for (final pendingRow in pendingRows) {
        await _syncRowOperation(pendingRow);
      }

      // Then sync pending cell operations
      final pendingCells = await _localDataSource.getPendingCellSyncs();
      for (final pendingCell in pendingCells) {
        await _syncCellOperation(pendingCell);
      }

      // Clear old synced items
      await _localDataSource.clearOldSyncedItems();

      AppLogger.debug('SheetRepository: Sync completed');
      return (null, null);
    } catch (e, stackTrace) {
      AppLogger.error('SheetRepository: Sync failed', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  Future<void> _syncRowOperation(dynamic pendingRow) async {
    final payload =
        jsonDecode(pendingRow.payload as String) as Map<String, dynamic>;

    try {
      switch (pendingRow.operation as String) {
        case 'create':
          final model = await _remoteDataSource.addRow(
            sheetId: payload['sheetId'] as String,
            rowIndex: payload['rowIndex'] as int,
            isItemRow: payload['isItemRow'] as bool? ?? true,
            itemName: payload['itemName'] as String?,
            createdAt: payload['createdAt'] != null
                ? DateTime.parse(payload['createdAt'] as String)
                : null,
          );

          // Save mapping
          await _localDataSource.saveRowIdMapping(
            localId: pendingRow.localId as String,
            serverId: model.id,
            sheetId: payload['sheetId'] as String,
          );
          break;

        case 'delete':
          final rowId = await _localDataSource.resolveRowId(
            payload['rowId'] as String,
          );
          await _remoteDataSource.deleteRow(rowId);
          break;

        case 'reorder':
          final rowId = await _localDataSource.resolveRowId(
            payload['rowId'] as String,
          );
          await _remoteDataSource.reorderRow(
            rowId: rowId,
            newRowIndex: payload['newRowIndex'] as int,
          );
          break;
      }

      await _localDataSource.markRowSynced(pendingRow.id as int);
    } catch (e) {
      AppLogger.error('SheetRepository: Failed to sync row operation', e);
      // Don't mark as synced - will retry next time
    }
  }

  Future<void> _syncCellOperation(dynamic pendingCell) async {
    final payload =
        jsonDecode(pendingCell.payload as String) as Map<String, dynamic>;

    try {
      switch (pendingCell.operation as String) {
        case 'create':
          final rowId = await _localDataSource.resolveRowId(
            payload['rowId'] as String,
          );
          final model = await _remoteDataSource.addCell(
            rowId: rowId,
            columnIndex: payload['columnIndex'] as int,
            value: payload['value'] as String?,
            formula: payload['formula'] as String?,
            color: payload['color'] as String?,
            isCalculated: payload['isCalculated'] as bool? ?? false,
          );

          await _localDataSource.saveCellIdMapping(
            localId: pendingCell.localId as String,
            serverId: model.id,
            rowId: rowId,
          );
          break;

        case 'update':
          final cellId = await _localDataSource.resolveCellId(
            payload['id'] as String,
          );
          await _remoteDataSource.updateCell(
            cellId: cellId,
            value: payload['value'] as String?,
            formula: payload['formula'] as String?,
            color: payload['color'] as String?,
            isCalculated: payload['isCalculated'] as bool?,
          );
          break;

        case 'delete':
          final cellId = await _localDataSource.resolveCellId(
            payload['cellId'] as String,
          );
          await _remoteDataSource.deleteCell(cellId);
          break;
      }

      await _localDataSource.markCellSynced(pendingCell.id as int);
    } catch (e) {
      AppLogger.error('SheetRepository: Failed to sync cell operation', e);
    }
  }

  @override
  Future<int> getPendingSyncCount(SheetType type) async {
    return _localDataSource.getPendingSyncCount();
  }

  @override
  Future<bool> hasPendingSync() async {
    return _localDataSource.hasPendingSync();
  }

  // ============================================================================
  // Helper Methods
  // ============================================================================

  bool _isNetworkError(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.unknown;
  }

  Failure _mapException(dynamic e) {
    if (e is DioException) {
      return e.toAppException().toFailure();
    }
    if (e is AppException) {
      return e.toFailure();
    }
    return Failure.unknown(message: e.toString());
  }
}
