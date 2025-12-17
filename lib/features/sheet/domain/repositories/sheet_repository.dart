import '../../../../core/errors/failure.dart';
import '../entities/sheet.dart';

/// Repository interface for sheet operations.
///
/// Defines the contract for managing Excel-style sheets.
/// Implementation should handle offline-first caching and sync.
abstract class SheetRepository {
  /// Fetches the Kahon sheet for the current cashier.
  ///
  /// If [startDate] and [endDate] are provided, filters rows by creation date.
  /// Returns cached data if offline, syncs when online.
  Future<(Failure?, Sheet?)> getKahonSheet({
    DateTime? startDate,
    DateTime? endDate,
    bool forceRefresh = false,
  });

  /// Fetches the Inventory sheet for the current cashier.
  ///
  /// If [startDate] and [endDate] are provided, filters rows by creation date.
  /// Returns cached data if offline, syncs when online.
  Future<(Failure?, Sheet?)> getInventorySheet({
    DateTime? startDate,
    DateTime? endDate,
    bool forceRefresh = false,
  });

  /// Adds a new row to a sheet.
  ///
  /// Returns the created row with generated cells.
  /// Queues for sync if offline.
  Future<(Failure?, SheetRow?)> addRow({
    required String sheetId,
    required int rowIndex,
    bool isItemRow = true,
    String? itemName,
    DateTime? createdAt,
    List<CellInput>? cells,
  });

  /// Adds multiple rows to a sheet.
  ///
  /// Returns all created rows.
  /// Queues for sync if offline.
  Future<(Failure?, List<SheetRow>?)> addRows({
    required String sheetId,
    required List<RowInput> rows,
  });

  /// Deletes a row from a sheet.
  ///
  /// Queues for sync if offline.
  Future<(Failure?, void)> deleteRow(String rowId);

  /// Reorders a single row to a new position.
  ///
  /// The server automatically shifts affected rows.
  /// Queues for sync if offline.
  Future<(Failure?, SheetRow?)> reorderRow({
    required String rowId,
    required int newRowIndex,
  });

  /// Batch update row positions.
  ///
  /// For complex reordering scenarios.
  /// Queues for sync if offline.
  Future<(Failure?, void)> updateRowPositions(List<RowPositionUpdate> updates);

  /// Adds a single cell to a row.
  ///
  /// Queues for sync if offline.
  Future<(Failure?, Cell?)> addCell({
    required String rowId,
    required int columnIndex,
    String? value,
    String? formula,
    String? color,
    bool isCalculated = false,
  });

  /// Adds multiple cells to rows.
  ///
  /// Queues for sync if offline.
  Future<(Failure?, void)> addCells(List<CellInput> cells);

  /// Updates a single cell.
  ///
  /// Queues for sync if offline.
  Future<(Failure?, Cell?)> updateCell({
    required String cellId,
    String? value,
    String? formula,
    String? color,
    bool? isCalculated,
  });

  /// Updates multiple cells.
  ///
  /// Queues for sync if offline.
  Future<(Failure?, void)> updateCells(List<CellUpdate> cells);

  /// Deletes a cell.
  ///
  /// Queues for sync if offline.
  Future<(Failure?, void)> deleteCell(String cellId);

  /// Clears the sheet cache for the current cashier.
  Future<void> clearCache();

  /// Syncs all pending changes with the server.
  ///
  /// Should be called when network becomes available.
  Future<(Failure?, void)> syncWithServer();

  /// Gets pending sync count for a sheet type.
  Future<int> getPendingSyncCount(SheetType type);

  /// Checks if there are any pending syncs.
  Future<bool> hasPendingSync();
}

/// Input for creating a new row.
class RowInput {
  final int rowIndex;
  final bool isItemRow;
  final String? itemName;
  final DateTime? createdAt;
  final List<CellInput>? cells;

  const RowInput({
    required this.rowIndex,
    this.isItemRow = true,
    this.itemName,
    this.createdAt,
    this.cells,
  });
}

/// Input for creating a new cell.
class CellInput {
  final String rowId;
  final int columnIndex;
  final String? value;
  final String? formula;
  final String? color;
  final bool isCalculated;

  const CellInput({
    required this.rowId,
    required this.columnIndex,
    this.value,
    this.formula,
    this.color,
    this.isCalculated = false,
  });
}

/// Update for an existing cell.
class CellUpdate {
  final String cellId;
  final String? value;
  final String? formula;
  final String? color;
  final bool? isCalculated;

  const CellUpdate({
    required this.cellId,
    this.value,
    this.formula,
    this.color,
    this.isCalculated,
  });
}

/// Update for row position.
class RowPositionUpdate {
  final String rowId;
  final int newRowIndex;

  const RowPositionUpdate({
    required this.rowId,
    required this.newRowIndex,
  });
}
