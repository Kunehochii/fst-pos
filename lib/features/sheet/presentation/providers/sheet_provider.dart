import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/sheet_local_datasource.dart';
import '../../data/datasources/sheet_remote_datasource.dart';
import '../../data/repositories/sheet_repository_impl.dart';
import '../../domain/entities/formula.dart';
import '../../domain/entities/number_format.dart';
import '../../domain/entities/quick_formula.dart';
import '../../domain/entities/sheet.dart';
import '../../domain/repositories/sheet_repository.dart';

part 'sheet_provider.g.dart';

/// Provides the SheetRemoteDataSource.
@riverpod
SheetRemoteDataSource sheetRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return SheetRemoteDataSource(dio);
}

/// Provides the SheetLocalDataSource.
@riverpod
SheetLocalDataSource sheetLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SheetLocalDataSource(db);
}

/// Provides the SheetRepository.
///
/// Requires authenticated cashier - throws if not logged in.
@riverpod
SheetRepository sheetRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(sheetRemoteDataSourceProvider);
          final localDataSource = ref.watch(sheetLocalDataSourceProvider);

          return SheetRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access sheets'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// =============================================================================
// Sheet State
// =============================================================================

/// Generic provider to get sheet by type.
@riverpod
Future<Sheet?> sheetByType(Ref ref, SheetType sheetType) async {
  final repository = ref.watch(sheetRepositoryProvider);

  final (failure, sheet) = sheetType == SheetType.kahon
      ? await repository.getKahonSheet()
      : await repository.getInventorySheet();

  if (failure != null) {
    return null;
  }

  return sheet;
}

/// State for the sheet data.
sealed class SheetState {
  const SheetState();
}

class SheetLoading extends SheetState {
  const SheetLoading();
}

class SheetLoaded extends SheetState {
  final Sheet sheet;
  final bool isRefreshing;
  final bool hasPendingChanges;

  const SheetLoaded({
    required this.sheet,
    this.isRefreshing = false,
    this.hasPendingChanges = false,
  });

  SheetLoaded copyWith({
    Sheet? sheet,
    bool? isRefreshing,
    bool? hasPendingChanges,
  }) {
    return SheetLoaded(
      sheet: sheet ?? this.sheet,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      hasPendingChanges: hasPendingChanges ?? this.hasPendingChanges,
    );
  }
}

class SheetError extends SheetState {
  final Failure failure;
  final Sheet? cachedSheet;

  const SheetError({
    required this.failure,
    this.cachedSheet,
  });
}

// =============================================================================
// Kahon Sheet Notifier
// =============================================================================

/// Manages the Kahon sheet state.
@riverpod
class KahonSheetNotifier extends _$KahonSheetNotifier {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Future<SheetState> build() async {
    return _loadSheet();
  }

  Future<SheetState> _loadSheet({bool forceRefresh = false}) async {
    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, sheet) = await repository.getKahonSheet(
        startDate: _startDate,
        endDate: _endDate,
        forceRefresh: forceRefresh,
      );

      if (failure != null) {
        return SheetError(failure: failure);
      }

      return SheetLoaded(sheet: sheet!);
    } on StateError catch (e) {
      return SheetError(failure: Failure.auth(message: e.message));
    }
  }

  /// Refreshes the sheet from server.
  Future<void> refresh() async {
    final currentState = state.valueOrNull;

    if (currentState is SheetLoaded) {
      state = AsyncData(currentState.copyWith(isRefreshing: true));
    }

    final newState = await _loadSheet(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Sets a date range filter.
  Future<void> setDateRange(DateTime? start, DateTime? end) async {
    _startDate = start;
    _endDate = end;

    state = const AsyncLoading();
    final newState = await _loadSheet(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Clears date filter.
  Future<void> clearDateFilter() async {
    if (_startDate == null && _endDate == null) return;

    _startDate = null;
    _endDate = null;

    state = const AsyncLoading();
    final newState = await _loadSheet();
    state = AsyncData(newState);
  }
}

// =============================================================================
// Inventory Sheet Notifier
// =============================================================================

/// Manages the Inventory sheet state.
@riverpod
class InventorySheetNotifier extends _$InventorySheetNotifier {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Future<SheetState> build() async {
    return _loadSheet();
  }

  Future<SheetState> _loadSheet({bool forceRefresh = false}) async {
    try {
      final repository = ref.read(sheetRepositoryProvider);
      final (failure, sheet) = await repository.getInventorySheet(
        startDate: _startDate,
        endDate: _endDate,
        forceRefresh: forceRefresh,
      );

      if (failure != null) {
        return SheetError(failure: failure);
      }

      return SheetLoaded(sheet: sheet!);
    } on StateError catch (e) {
      return SheetError(failure: Failure.auth(message: e.message));
    }
  }

  /// Refreshes the sheet from server.
  Future<void> refresh() async {
    final currentState = state.valueOrNull;

    if (currentState is SheetLoaded) {
      state = AsyncData(currentState.copyWith(isRefreshing: true));
    }

    final newState = await _loadSheet(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Sets a date range filter.
  Future<void> setDateRange(DateTime? start, DateTime? end) async {
    _startDate = start;
    _endDate = end;

    state = const AsyncLoading();
    final newState = await _loadSheet(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Clears date filter.
  Future<void> clearDateFilter() async {
    if (_startDate == null && _endDate == null) return;

    _startDate = null;
    _endDate = null;

    state = const AsyncLoading();
    final newState = await _loadSheet();
    state = AsyncData(newState);
  }
}

// =============================================================================
// Pending Changes State
// =============================================================================

/// Tracks pending cell changes before saving.
class PendingCellChange {
  final String? cellId; // null = new cell
  final String rowId;
  final int columnIndex;
  final String? value;
  final String? formula;
  final String? color;
  final bool isCalculated;

  PendingCellChange({
    this.cellId,
    required this.rowId,
    required this.columnIndex,
    this.value,
    this.formula,
    this.color,
    this.isCalculated = false,
  });

  String get key => '$rowId:$columnIndex';

  PendingCellChange copyWith({
    String? value,
    String? formula,
    String? color,
    bool? isCalculated,
  }) {
    return PendingCellChange(
      cellId: cellId,
      rowId: rowId,
      columnIndex: columnIndex,
      value: value ?? this.value,
      formula: formula ?? this.formula,
      color: color ?? this.color,
      isCalculated: isCalculated ?? this.isCalculated,
    );
  }
}

/// Manages pending cell changes.
@riverpod
class PendingChangesNotifier extends _$PendingChangesNotifier {
  @override
  Map<String, PendingCellChange> build() {
    return {};
  }

  /// Add or update a pending change.
  void addChange(PendingCellChange change) {
    state = {...state, change.key: change};
  }

  /// Remove a pending change.
  void removeChange(String key) {
    final newState = {...state};
    newState.remove(key);
    state = newState;
  }

  /// Clear all pending changes.
  void clearAll() {
    state = {};
  }

  /// Check if there are pending changes.
  bool get hasChanges => state.isNotEmpty;

  /// Get all pending changes.
  List<PendingCellChange> get changes => state.values.toList();
}

// =============================================================================
// Selection State
// =============================================================================

/// Selected cell state.
class SelectedCell {
  final int rowIndex;
  final int columnIndex;
  final String? cellId;
  final String rowId;

  SelectedCell({
    required this.rowIndex,
    required this.columnIndex,
    this.cellId,
    required this.rowId,
  });

  String get address => getCellAddress(rowIndex, columnIndex);
}

/// Manages selected cell state.
@riverpod
class SelectedCellNotifier extends _$SelectedCellNotifier {
  @override
  SelectedCell? build() => null;

  void select(SelectedCell cell) {
    state = cell;
  }

  void clear() {
    state = null;
  }
}

/// Manages editing cell state.
@riverpod
class EditingCellNotifier extends _$EditingCellNotifier {
  @override
  SelectedCell? build() => null;

  void startEditing(SelectedCell cell) {
    state = cell;
  }

  void stopEditing() {
    state = null;
  }
}

/// Manages selected rows for bulk operations.
@riverpod
class SelectedRowsNotifier extends _$SelectedRowsNotifier {
  @override
  Set<String> build() => {};

  void toggleRow(String rowId) {
    if (state.contains(rowId)) {
      state = {...state}..remove(rowId);
    } else {
      state = {...state, rowId};
    }
  }

  void selectAll(List<String> rowIds) {
    state = rowIds.toSet();
  }

  void clear() {
    state = {};
  }

  bool isSelected(String rowId) => state.contains(rowId);
}

// =============================================================================
// Formula Evaluation Helper
// =============================================================================

/// Creates a cell value lookup function for formula evaluation.
CellValueLookup createCellValueLookup(
  List<SheetRow> rows,
  Map<String, PendingCellChange> pendingChanges,
) {
  return (int rowIndex, int columnIndex) {
    // First check pending changes
    final row = rows.where((r) => r.rowIndex == rowIndex).firstOrNull;
    if (row != null) {
      final key = '${row.id}:$columnIndex';
      if (pendingChanges.containsKey(key)) {
        return parseDoubleOrZero(pendingChanges[key]!.value);
      }

      // Check actual cell
      final cell = row.getCellByColumnIndex(columnIndex);
      if (cell != null) {
        return parseDoubleOrZero(cell.value);
      }
    }

    return 0;
  };
}

/// Evaluate a formula in the context of a sheet.
double evaluateSheetFormula(
  String formula,
  List<SheetRow> rows,
  Map<String, PendingCellChange> pendingChanges,
) {
  final lookup = createCellValueLookup(rows, pendingChanges);
  return evaluateFormula(formula, lookup);
}

/// Get computed display value for a cell.
String getDisplayValue(
  Cell cell,
  List<SheetRow> rows,
  Map<String, PendingCellChange> pendingChanges,
  SheetType sheetType,
) {
  // Check pending changes first
  final row = rows.firstWhere((r) => r.id == cell.rowId);
  final key = '${cell.rowId}:${cell.columnIndex}';

  String? valueToDisplay;
  String? formulaToEvaluate;

  if (pendingChanges.containsKey(key)) {
    final pending = pendingChanges[key]!;
    valueToDisplay = pending.value;
    formulaToEvaluate = pending.formula;
  } else {
    valueToDisplay = cell.value;
    formulaToEvaluate = cell.formula;
  }

  // If there's a formula, evaluate it
  if (formulaToEvaluate != null && formulaToEvaluate.isNotEmpty) {
    final result =
        evaluateSheetFormula(formulaToEvaluate, rows, pendingChanges);
    return formatCellNumber(result, getFormatMode(sheetType));
  }

  // Return the value or empty
  if (valueToDisplay == null || valueToDisplay.isEmpty) {
    return '';
  }

  // Try to parse and format
  final numValue = double.tryParse(valueToDisplay);
  if (numValue != null) {
    return formatCellNumber(numValue, getFormatMode(sheetType));
  }

  return valueToDisplay;
}
