import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/formula.dart';
import '../../domain/entities/sheet.dart';
import '../../domain/repositories/sheet_repository.dart';
import 'sheet_provider.dart';

part 'sheet_operations_provider.g.dart';

/// Result of a sheet operation.
sealed class SheetOperationResult {
  const SheetOperationResult();
}

class SheetOperationSuccess extends SheetOperationResult {
  final String? message;
  const SheetOperationSuccess([this.message]);
}

class SheetOperationError extends SheetOperationResult {
  final Failure failure;
  const SheetOperationError(this.failure);
}

/// Handles sheet operations (add row, update cells, delete, etc.)
@riverpod
class SheetOperations extends _$SheetOperations {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  /// Add a new row to a sheet.
  Future<SheetOperationResult> addRow({
    required String sheetId,
    required int rowIndex,
    bool isItemRow = true,
    String? itemName,
    DateTime? createdAt,
    List<CellInput>? cells,
  }) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, row) = await repository.addRow(
        sheetId: sheetId,
        rowIndex: rowIndex,
        isItemRow: isItemRow,
        itemName: itemName,
        createdAt: createdAt,
        cells: cells,
      );

      state = const AsyncData(null);

      if (failure != null) {
        return SheetOperationError(failure);
      }

      return const SheetOperationSuccess('Row added successfully');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Delete a row.
  Future<SheetOperationResult> deleteRow(String rowId) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, _) = await repository.deleteRow(rowId);

      state = const AsyncData(null);

      if (failure != null) {
        return SheetOperationError(failure);
      }

      return const SheetOperationSuccess('Row deleted');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Delete multiple rows.
  Future<SheetOperationResult> deleteRows(List<String> rowIds) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(sheetRepositoryProvider);

      for (final rowId in rowIds) {
        final (failure, _) = await repository.deleteRow(rowId);
        if (failure != null) {
          state = const AsyncData(null);
          return SheetOperationError(failure);
        }
      }

      state = const AsyncData(null);
      return SheetOperationSuccess('${rowIds.length} rows deleted');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Reorder a row.
  Future<SheetOperationResult> reorderRow({
    required String rowId,
    required int newRowIndex,
  }) async {
    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, _) = await repository.reorderRow(
        rowId: rowId,
        newRowIndex: newRowIndex,
      );

      if (failure != null) {
        return SheetOperationError(failure);
      }

      return const SheetOperationSuccess();
    } catch (e) {
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Update a single cell.
  Future<SheetOperationResult> updateCell({
    required String cellId,
    String? value,
    String? formula,
    String? color,
    bool? isCalculated,
  }) async {
    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, _) = await repository.updateCell(
        cellId: cellId,
        value: value,
        formula: formula,
        color: color,
        isCalculated: isCalculated,
      );

      if (failure != null) {
        return SheetOperationError(failure);
      }

      return const SheetOperationSuccess();
    } catch (e) {
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Save all pending changes.
  Future<SheetOperationResult> savePendingChanges(
    List<PendingCellChange> changes,
  ) async {
    if (changes.isEmpty) {
      return const SheetOperationSuccess();
    }

    state = const AsyncLoading();

    try {
      final repository = ref.read(sheetRepositoryProvider);

      // Separate new cells (create) from existing cells (update)
      final newCells = changes.where((c) => c.cellId == null).toList();
      final existingCells = changes.where((c) => c.cellId != null).toList();

      // Create new cells
      if (newCells.isNotEmpty) {
        final (failure, _) = await repository.addCells(
          newCells
              .map((c) => CellInput(
                    rowId: c.rowId,
                    columnIndex: c.columnIndex,
                    value: c.value,
                    formula: c.formula,
                    color: c.color,
                    isCalculated: c.isCalculated,
                  ))
              .toList(),
        );

        if (failure != null) {
          state = const AsyncData(null);
          return SheetOperationError(failure);
        }
      }

      // Update existing cells
      if (existingCells.isNotEmpty) {
        final (failure, _) = await repository.updateCells(
          existingCells
              .map((c) => CellUpdate(
                    cellId: c.cellId!,
                    value: c.value,
                    formula: c.formula,
                    color: c.color,
                    isCalculated: c.isCalculated,
                  ))
              .toList(),
        );

        if (failure != null) {
          state = const AsyncData(null);
          return SheetOperationError(failure);
        }
      }

      state = const AsyncData(null);
      return const SheetOperationSuccess('Changes saved');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Apply a quick formula to a cell.
  Future<SheetOperationResult> applyQuickFormula({
    required String cellId,
    required String formula,
    required String computedValue,
    required List<SheetRow> rows,
    required Map<String, PendingCellChange> pendingChanges,
  }) async {
    // Evaluate the formula
    final value = evaluateFormula(
      formula,
      createCellValueLookup(rows, pendingChanges),
    );

    return updateCell(
      cellId: cellId,
      value: value.toString(),
      formula: formula,
      isCalculated: true,
    );
  }

  /// Sync pending changes with server.
  Future<SheetOperationResult> syncWithServer() async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, _) = await repository.syncWithServer();

      state = const AsyncData(null);

      if (failure != null) {
        return SheetOperationError(failure);
      }

      return const SheetOperationSuccess('Synced successfully');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return SheetOperationError(
        Failure.unknown(message: e.toString()),
      );
    }
  }
}

/// Checks if there are pending syncs.
@riverpod
Future<bool> hasPendingSync(Ref ref) async {
  try {
    final repository = ref.watch(sheetRepositoryProvider);
    return repository.hasPendingSync();
  } catch (_) {
    return false;
  }
}
