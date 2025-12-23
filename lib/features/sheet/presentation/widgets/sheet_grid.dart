// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sheet.dart';
import '../providers/sheet_provider.dart';
import 'cell_widgets.dart';

/// Main sheet grid widget displaying rows and columns.
class SheetGrid extends ConsumerStatefulWidget {
  final Sheet sheet;
  final Map<String, PendingCellChange> pendingChanges;
  final ValueChanged<SelectedCell>? onCellTap;
  final ValueChanged<SelectedCell>? onCellDoubleTap;
  final bool isEditing;
  final SelectedCell? selectedCell;
  final SelectedCell? editingCell;

  const SheetGrid({
    super.key,
    required this.sheet,
    required this.pendingChanges,
    this.onCellTap,
    this.onCellDoubleTap,
    this.isEditing = false,
    this.selectedCell,
    this.editingCell,
  });

  @override
  ConsumerState<SheetGrid> createState() => _SheetGridState();
}

class _SheetGridState extends ConsumerState<SheetGrid> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  static const double cellWidth = 100.0;
  static const double cellHeight = 40.0;
  static const double rowHeaderWidth = 60.0;
  static const double columnHeaderHeight = 32.0;

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedRows = ref.watch(selectedRowsNotifierProvider);
    final rows = widget.sheet.rows
      ..sort((a, b) => a.rowIndex.compareTo(b.rowIndex));

    return Column(
      children: [
        // Column headers
        SizedBox(
          height: columnHeaderHeight,
          child: Row(
            children: [
              // Corner cell
              CornerCell(
                width: rowHeaderWidth,
                height: columnHeaderHeight,
                allSelected:
                    rows.isNotEmpty && selectedRows.length == rows.length,
                onSelectAll: (value) {
                  if (value == true) {
                    ref
                        .read(selectedRowsNotifierProvider.notifier)
                        .selectAll(rows.map((r) => r.id).toList());
                  } else {
                    ref.read(selectedRowsNotifierProvider.notifier).clear();
                  }
                },
              ),
              // Column headers
              Expanded(
                child: ListView.builder(
                  controller: _horizontalScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.sheet.columns,
                  itemBuilder: (context, index) {
                    return ColumnHeader(
                      columnIndex: index,
                      width: cellWidth,
                      height: columnHeaderHeight,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Sheet body
        Expanded(
          child: rows.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  controller: _verticalScrollController,
                  itemCount: rows.length,
                  itemBuilder: (context, rowListIndex) {
                    final row = rows[rowListIndex];
                    return _buildRow(row, selectedRows.contains(row.id));
                  },
                ),
        ),
      ],
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
            'No data yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add a row to get started',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(SheetRow row, bool isRowSelected) {
    return SizedBox(
      height: cellHeight,
      child: Row(
        children: [
          // Row header
          RowHeader(
            rowIndex: row.rowIndex,
            isSelected: isRowSelected,
            onSelectionChanged: (value) {
              ref.read(selectedRowsNotifierProvider.notifier).toggleRow(row.id);
            },
            width: rowHeaderWidth,
            height: cellHeight,
          ),
          // Cells
          Expanded(
            child: ListView.builder(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.sheet.columns,
              itemBuilder: (context, columnIndex) {
                final cell = row.getCellByColumnIndex(columnIndex);
                final isSelected =
                    widget.selectedCell?.rowIndex == row.rowIndex &&
                        widget.selectedCell?.columnIndex == columnIndex;
                final isEditing =
                    widget.editingCell?.rowIndex == row.rowIndex &&
                        widget.editingCell?.columnIndex == columnIndex;

                // Get display value
                final displayValue = cell != null
                    ? getDisplayValue(
                        cell,
                        widget.sheet.rows,
                        widget.pendingChanges,
                        widget.sheet.type,
                      )
                    : '';

                // Get pending color
                final pendingKey = '${row.id}:$columnIndex';
                final pendingChange = widget.pendingChanges[pendingKey];
                final color = pendingChange?.color ?? cell?.color;
                final isCalculated =
                    pendingChange?.isCalculated ?? cell?.isCalculated ?? false;

                return CellDisplay(
                  value: displayValue,
                  formula: cell?.formula ?? pendingChange?.formula,
                  color: color,
                  isSelected: isSelected,
                  isCalculated: isCalculated,
                  width: cellWidth,
                  height: cellHeight,
                  onTap: () {
                    widget.onCellTap?.call(SelectedCell(
                      rowIndex: row.rowIndex,
                      columnIndex: columnIndex,
                      cellId: cell?.id,
                      rowId: row.id,
                    ));
                  },
                  onDoubleTap: () {
                    widget.onCellDoubleTap?.call(SelectedCell(
                      rowIndex: row.rowIndex,
                      columnIndex: columnIndex,
                      cellId: cell?.id,
                      rowId: row.id,
                    ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
