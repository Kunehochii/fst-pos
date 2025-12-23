import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../domain/entities/formula.dart';
import '../../domain/entities/sheet.dart';
import '../../domain/repositories/sheet_repository.dart';
import '../providers/sheet_operations_provider.dart';
import '../providers/sheet_provider.dart';
import '../widgets/cell_widgets.dart';
import '../widgets/row_controls.dart';
import '../widgets/sheet_toolbar.dart';

/// Main page for displaying and editing a sheet.
class SheetPage extends ConsumerStatefulWidget {
  final SheetType sheetType;

  const SheetPage({
    super.key,
    required this.sheetType,
  });

  @override
  ConsumerState<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends ConsumerState<SheetPage> {
  SelectedCell? _selectedCell;
  final Set<String> _selectedRowIds = {};
  bool _hasUnsavedChanges = false;
  bool _isSaving = false;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Set initial date filter
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyDateFilter();
    });
  }

  void _applyDateFilter() {
    final startOfDay = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
    );
    final endOfDay = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      23,
      59,
      59,
      999,
    );

    if (widget.sheetType == SheetType.kahon) {
      ref
          .read(kahonSheetNotifierProvider.notifier)
          .setDateRange(startOfDay, endOfDay);
    } else {
      ref
          .read(inventorySheetNotifierProvider.notifier)
          .setDateRange(startOfDay, endOfDay);
    }
  }

  /// Invalidates the correct sheet provider based on sheet type.
  void _invalidateSheet() {
    if (widget.sheetType == SheetType.kahon) {
      ref.read(kahonSheetNotifierProvider.notifier).refresh();
    } else {
      ref.read(inventorySheetNotifierProvider.notifier).refresh();
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
      _applyDateFilter();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the correct notifier provider based on sheet type
    final sheetAsync = widget.sheetType == SheetType.kahon
        ? ref.watch(kahonSheetNotifierProvider)
        : ref.watch(inventorySheetNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sheetType == SheetType.kahon
              ? 'Kahon Sheet'
              : 'Inventory Sheet',
        ),
        centerTitle: false,
        actions: [
          // Date picker button
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.muted,
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              border: Border.all(color: AppColors.border),
            ),
            child: InkWell(
              onTap: _selectDate,
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: AppColors.foreground),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('MMM d, yyyy').format(_selectedDate),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (_hasUnsavedChanges)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AppButton.primary(
                onPressed: _isSaving ? null : _saveChanges,
                isLoading: _isSaving,
                icon: const Icon(Icons.save, size: 16),
                small: true,
                child: Text(_isSaving ? 'Saving...' : 'Save'),
              ),
            ),
        ],
      ),
      body: sheetAsync.when(
        data: (sheetState) {
          if (sheetState is SheetLoaded) {
            return _buildSheetView(sheetState.sheet);
          } else if (sheetState is SheetError) {
            return _buildErrorState(sheetState.failure.message);
          }
          return _buildEmptyState();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorState(error),
      ),
      floatingActionButton: sheetAsync.maybeWhen(
        data: (sheetState) => sheetState is SheetLoaded
            ? AddRowFAB(onPressed: () => _addRow(sheetState.sheet))
            : null,
        orElse: () => null,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.table_chart_outlined,
            size: 64,
            color: AppColors.mutedForeground.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No sheet found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Create a new sheet to get started',
            style: TextStyle(
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 24),
          AppButton.primary(
            onPressed: _createSheet,
            icon: const Icon(Icons.add, size: 18),
            child: const Text('Create Sheet'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.destructive,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading sheet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: TextStyle(
              color: AppColors.mutedForeground,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppButton.primary(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh, size: 18),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildSheetView(Sheet sheet) {
    final cellValue = _getCellValue(sheet);
    final cellFormula = _getCellFormula(sheet);
    final cellColor = _getCellColor(sheet);

    return Column(
      children: [
        // Toolbar
        SheetToolbar(
          sheet: sheet,
          selectedCell: _selectedCell,
          cellValue: cellValue,
          cellFormula: cellFormula,
          cellColor: cellColor,
          hasChanges: _hasUnsavedChanges,
          isSaving: _isSaving,
          onFormulaInput: (formula) => _updateCellFormula(sheet, formula),
          onColorSelected: (color) => _updateCellColor(sheet, color),
          onAddRow: () => _addRow(sheet),
          onDeleteSelected: () => _deleteSelectedRows(sheet),
          onSave: _saveChanges,
          onRefresh: _refresh,
          selectedRowsCount: _selectedRowIds.length,
        ),
        // Formula bar when cell is selected
        if (_selectedCell != null)
          FormulaBar(
            cellAddress: _selectedCell?.address,
            initialValue: cellValue,
            initialFormula: cellFormula,
            onSubmit: (data) => _onFormulaSubmit(sheet, data),
            onCancel: () => setState(() => _selectedCell = null),
          ),
        // Sheet content
        Expanded(
          child: sheet.rows.isEmpty
              ? EmptySheetPlaceholder(onAddRow: () => _addRow(sheet))
              : _buildReorderableSheet(sheet),
        ),
        // Bulk actions bar
        BulkActionsBar(
          selectedCount: _selectedRowIds.length,
          onDelete: () => _deleteSelectedRows(sheet),
          onClearSelection: () => setState(() => _selectedRowIds.clear()),
        ),
      ],
    );
  }

  Widget _buildReorderableSheet(Sheet sheet) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            _buildHeaderRow(sheet),
            // Data rows (reorderable)
            ReorderableRowList(
              sheet: sheet,
              selectedRowIds: _selectedRowIds,
              onReorder: (oldIndex, newIndex) =>
                  _reorderRow(sheet, oldIndex, newIndex),
              onRowSelect: _toggleRowSelection,
              rowBuilder: (row, rowIndex) =>
                  _buildDataRow(sheet, row, rowIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(Sheet sheet) {
    // Find max columns from all rows
    int maxColumns = 0;
    for (final row in sheet.rows) {
      for (final cell in row.cells) {
        if (cell.columnIndex + 1 > maxColumns) {
          maxColumns = cell.columnIndex + 1;
        }
      }
    }
    maxColumns = maxColumns < 5 ? 5 : maxColumns; // minimum 5 columns

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Empty corner cell for row controls
        Container(
          width: 40,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.muted,
            border: Border(
              bottom: BorderSide(color: AppColors.border),
              right: BorderSide(color: AppColors.border),
            ),
          ),
        ),
        // Column headers
        for (int i = 0; i < maxColumns; i++)
          Container(
            width: 120,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.muted,
              border: Border(
                bottom: BorderSide(color: AppColors.border),
                right: BorderSide(color: AppColors.border),
              ),
            ),
            child: Text(
              columnIndexToLetter(i),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.mutedForeground,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDataRow(Sheet sheet, SheetRow row, int rowIndex) {
    // Find max columns from all rows
    int maxColumns = 0;
    for (final r in sheet.rows) {
      for (final cell in r.cells) {
        if (cell.columnIndex + 1 > maxColumns) {
          maxColumns = cell.columnIndex + 1;
        }
      }
    }
    maxColumns = maxColumns < 5 ? 5 : maxColumns;

    // Create a map of cells by column index
    final cellMap = <int, Cell>{};
    for (final cell in row.cells) {
      cellMap[cell.columnIndex] = cell;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int colIndex = 0; colIndex < maxColumns; colIndex++)
          _buildCell(
            sheet: sheet,
            row: row,
            rowIndex: rowIndex,
            columnIndex: colIndex,
            cell: cellMap[colIndex],
          ),
        // Row actions menu
        RowActionsMenu(
          rowId: row.id,
          rowIndex: rowIndex,
          onInsertAbove: () => _insertRowAt(sheet, rowIndex),
          onInsertBelow: () => _insertRowAt(sheet, rowIndex + 1),
          onDuplicate: () => _duplicateRow(sheet, row),
          onDelete: () => _deleteRow(sheet, row.id),
          onMoveUp: rowIndex > 0
              ? () => _reorderRow(sheet, rowIndex, rowIndex - 1)
              : null,
          onMoveDown: rowIndex < sheet.rows.length - 1
              ? () => _reorderRow(sheet, rowIndex, rowIndex + 1)
              : null,
        ),
      ],
    );
  }

  Widget _buildCell({
    required Sheet sheet,
    required SheetRow row,
    required int rowIndex,
    required int columnIndex,
    Cell? cell,
  }) {
    final isSelected = _selectedCell?.rowIndex == rowIndex &&
        _selectedCell?.columnIndex == columnIndex;

    // Calculate formula value if needed
    String? displayValue;
    if (cell?.isCalculated == true && cell?.formula != null) {
      displayValue = _evaluateFormula(sheet, cell!.formula!);
    } else {
      displayValue = cell?.value;
    }

    return SheetCell(
      value: displayValue,
      formula: cell?.formula,
      color: cell?.color,
      isSelected: isSelected,
      onTap: () => _selectCell(row, rowIndex, columnIndex, cell?.id),
      onDoubleTap: () => _editCell(row, rowIndex, columnIndex, cell?.id),
      onValueChanged: (value) =>
          _updateCellValue(sheet, row, columnIndex, value, cell?.id),
    );
  }

  // Cell selection and editing methods

  void _selectCell(
      SheetRow row, int rowIndex, int columnIndex, String? cellId) {
    setState(() {
      _selectedCell = SelectedCell(
        rowIndex: rowIndex,
        columnIndex: columnIndex,
        cellId: cellId,
        rowId: row.id,
      );
    });
  }

  void _editCell(SheetRow row, int rowIndex, int columnIndex, String? cellId) {
    _selectCell(row, rowIndex, columnIndex, cellId);
    // Focus the formula bar or inline editor
  }

  String? _getCellValue(Sheet sheet) {
    if (_selectedCell == null) return null;
    if (sheet.rows.isEmpty) return null;
    final row =
        sheet.rows.where((r) => r.id == _selectedCell!.rowId).firstOrNull;
    if (row == null) return null;
    final cell = row.cells
        .where((c) => c.columnIndex == _selectedCell!.columnIndex)
        .firstOrNull;
    return cell?.value;
  }

  String? _getCellFormula(Sheet sheet) {
    if (_selectedCell == null) return null;
    if (sheet.rows.isEmpty) return null;
    final row =
        sheet.rows.where((r) => r.id == _selectedCell!.rowId).firstOrNull;
    if (row == null) return null;
    final cell = row.cells
        .where((c) => c.columnIndex == _selectedCell!.columnIndex)
        .firstOrNull;
    return cell?.formula;
  }

  String? _getCellColor(Sheet sheet) {
    if (_selectedCell == null) return null;
    if (sheet.rows.isEmpty) return null;
    final row =
        sheet.rows.where((r) => r.id == _selectedCell!.rowId).firstOrNull;
    if (row == null) return null;
    final cell = row.cells
        .where((c) => c.columnIndex == _selectedCell!.columnIndex)
        .firstOrNull;
    return cell?.color;
  }

  String _evaluateFormula(Sheet sheet, String formula) {
    try {
      // Create cell lookup function
      double getCellValue(int rowIndex, int columnIndex) {
        final row = sheet.rows.where((r) => r.rowIndex == rowIndex).firstOrNull;
        if (row == null) return 0;
        final cell = row.getCellByColumnIndex(columnIndex);
        if (cell?.value == null) return 0;
        return double.tryParse(cell!.value!) ?? 0;
      }

      final result = evaluateFormula(formula, getCellValue);
      return result
          .toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
    } catch (_) {
      return '#ERROR';
    }
  }

  // Row and cell manipulation methods

  void _toggleRowSelection(String rowId) {
    setState(() {
      if (_selectedRowIds.contains(rowId)) {
        _selectedRowIds.remove(rowId);
      } else {
        _selectedRowIds.add(rowId);
      }
    });
  }

  Future<void> _addRow(Sheet sheet) async {
    final operations = ref.read(sheetOperationsProvider.notifier);
    await operations.addRow(
      sheetId: sheet.id,
      rowIndex: sheet.rows.length,
    );
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  Future<void> _insertRowAt(Sheet sheet, int index) async {
    final operations = ref.read(sheetOperationsProvider.notifier);
    await operations.addRow(
      sheetId: sheet.id,
      rowIndex: index,
    );
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  Future<void> _deleteRow(Sheet sheet, String rowId) async {
    final operations = ref.read(sheetOperationsProvider.notifier);
    await operations.deleteRow(rowId);
    setState(() {
      _hasUnsavedChanges = true;
      _selectedRowIds.remove(rowId);
      if (_selectedCell?.rowId == rowId) {
        _selectedCell = null;
      }
    });
    _invalidateSheet();
  }

  Future<void> _deleteSelectedRows(Sheet sheet) async {
    if (_selectedRowIds.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: const Text(
          'Delete rows?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        content: Text(
          'Are you sure you want to delete ${_selectedRowIds.length} row(s)? This action cannot be undone.',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.mutedForeground,
          ),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        actions: [
          AppButton.secondary(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 12),
          AppButton.destructive(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.delete_outline, size: 18),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final operations = ref.read(sheetOperationsProvider.notifier);
    await operations.deleteRows(_selectedRowIds.toList());
    setState(() {
      _hasUnsavedChanges = true;
      _selectedRowIds.clear();
      _selectedCell = null;
    });
    _invalidateSheet();
  }

  Future<void> _duplicateRow(Sheet sheet, SheetRow row) async {
    // Add a new row with same values
    final operations = ref.read(sheetOperationsProvider.notifier);
    final rowIndex = sheet.rows.indexOf(row);

    // Copy cell values from original row
    final cellInputs = row.cells
        .map((c) => CellInput(
              rowId: '', // Will be assigned by server
              columnIndex: c.columnIndex,
              value: c.value,
              formula: c.formula,
              color: c.color,
              isCalculated: c.isCalculated,
            ))
        .toList();

    await operations.addRow(
      sheetId: sheet.id,
      rowIndex: rowIndex + 1,
      cells: cellInputs,
    );
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  Future<void> _reorderRow(Sheet sheet, int oldIndex, int newIndex) async {
    if (oldIndex == newIndex) return;

    // Get the row at oldIndex
    final row = sheet.rows.firstWhere((r) => r.rowIndex == oldIndex);

    final operations = ref.read(sheetOperationsProvider.notifier);
    await operations.reorderRow(
      rowId: row.id,
      newRowIndex: newIndex,
    );

    setState(() => _hasUnsavedChanges = true);
    _refresh();
  }

  Future<void> _updateCellValue(
    Sheet sheet,
    SheetRow row,
    int columnIndex,
    String value,
    String? cellId,
  ) async {
    final operations = ref.read(sheetOperationsProvider.notifier);
    if (cellId != null) {
      await operations.updateCell(
        cellId: cellId,
        value: value,
        formula: null,
        isCalculated: false,
      );
    } else {
      // Create new cell
      final repository = ref.read(sheetRepositoryProvider);
      await repository.addCell(
        rowId: row.id,
        columnIndex: columnIndex,
        value: value,
        isCalculated: false,
      );
    }
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  Future<void> _updateCellFormula(Sheet sheet, String formula) async {
    if (_selectedCell == null) return;

    if (_selectedCell!.cellId != null) {
      final operations = ref.read(sheetOperationsProvider.notifier);
      await operations.updateCell(
        cellId: _selectedCell!.cellId!,
        formula: formula,
        isCalculated: true,
      );
    } else {
      // Create new cell with formula
      final repository = ref.read(sheetRepositoryProvider);
      await repository.addCell(
        rowId: _selectedCell!.rowId,
        columnIndex: _selectedCell!.columnIndex,
        formula: formula,
        isCalculated: true,
      );
    }
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  Future<void> _updateCellColor(Sheet sheet, String? color) async {
    if (_selectedCell == null) return;

    if (_selectedCell!.cellId != null) {
      final operations = ref.read(sheetOperationsProvider.notifier);
      await operations.updateCell(
        cellId: _selectedCell!.cellId!,
        color: color,
      );
    } else {
      // Create new cell with color
      final repository = ref.read(sheetRepositoryProvider);
      await repository.addCell(
        rowId: _selectedCell!.rowId,
        columnIndex: _selectedCell!.columnIndex,
        color: color,
      );
    }
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  Future<void> _onFormulaSubmit(
    Sheet sheet,
    ({String? value, String? formula, bool isCalculated}) data,
  ) async {
    if (_selectedCell == null) return;

    if (_selectedCell!.cellId != null) {
      final operations = ref.read(sheetOperationsProvider.notifier);
      await operations.updateCell(
        cellId: _selectedCell!.cellId!,
        value: data.value,
        formula: data.formula,
        isCalculated: data.isCalculated,
      );
    } else {
      // Create new cell
      final repository = ref.read(sheetRepositoryProvider);
      await repository.addCell(
        rowId: _selectedCell!.rowId,
        columnIndex: _selectedCell!.columnIndex,
        value: data.value,
        formula: data.formula,
        isCalculated: data.isCalculated,
      );
    }
    setState(() => _hasUnsavedChanges = true);
    _invalidateSheet();
  }

  // Sheet-level operations

  Future<void> _createSheet() async {
    // Sheet creation is handled by the backend when first accessed
    // The sheetByTypeProvider will create it if it doesn't exist
    _invalidateSheet();
  }

  Future<void> _saveChanges() async {
    setState(() => _isSaving = true);
    try {
      // Sync is automatic through repository
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => _hasUnsavedChanges = false);
    } finally {
      setState(() => _isSaving = false);
    }
  }

  void _refresh() {
    if (widget.sheetType == SheetType.kahon) {
      ref.invalidate(kahonSheetNotifierProvider);
    } else {
      ref.invalidate(inventorySheetNotifierProvider);
    }
    setState(() {
      _selectedCell = null;
      _selectedRowIds.clear();
      _hasUnsavedChanges = false;
    });
    // Re-apply date filter after refresh
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyDateFilter();
    });
  }
}
