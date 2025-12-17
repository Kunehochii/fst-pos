import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sheet.dart';

/// Widget for row drag handle and actions.
class RowDragHandle extends StatelessWidget {
  final int rowIndex;
  final bool isSelected;
  final bool isDragging;
  final VoidCallback? onTap;

  const RowDragHandle({
    super.key,
    required this.rowIndex,
    this.isSelected = false,
    this.isDragging = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent
              : isDragging
                  ? AppColors.muted
                  : Colors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.border),
            right: BorderSide(color: AppColors.border),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected)
                Icon(
                  Icons.check,
                  size: 14,
                  color: AppColors.accentForeground,
                ),
              if (!isSelected)
                Icon(
                  Icons.drag_indicator,
                  size: 16,
                  color: isDragging
                      ? AppColors.primary
                      : AppColors.mutedForeground,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A list of sheet rows (without built-in reordering due to scroll constraints).
/// Reordering is handled via the row action menu instead.
class ReorderableRowList extends StatelessWidget {
  final Sheet sheet;
  final Set<String> selectedRowIds;
  final String? editingCellId;
  final Function(int oldIndex, int newIndex)? onReorder;
  final Function(String rowId) onRowSelect;
  final Function(String rowId, int cellIndex)? onCellTap;
  final Function(String rowId, int cellIndex, String value)? onCellValueChanged;
  final Widget Function(SheetRow row, int rowIndex) rowBuilder;

  const ReorderableRowList({
    super.key,
    required this.sheet,
    required this.selectedRowIds,
    this.editingCellId,
    this.onReorder,
    required this.onRowSelect,
    this.onCellTap,
    this.onCellValueChanged,
    required this.rowBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int index = 0; index < sheet.rows.length; index++)
          _buildRow(index),
      ],
    );
  }

  Widget _buildRow(int index) {
    final row = sheet.rows[index];
    final isSelected = selectedRowIds.contains(row.id);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Row number and selection handle
        RowDragHandle(
          rowIndex: index,
          isSelected: isSelected,
          isDragging: false,
          onTap: () => onRowSelect(row.id),
        ),
        // Row content
        rowBuilder(row, index),
      ],
    );
  }
}

/// Row actions popup menu.
class RowActionsMenu extends StatelessWidget {
  final String rowId;
  final int rowIndex;
  final VoidCallback? onInsertAbove;
  final VoidCallback? onInsertBelow;
  final VoidCallback? onDuplicate;
  final VoidCallback? onDelete;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;

  const RowActionsMenu({
    super.key,
    required this.rowId,
    required this.rowIndex,
    this.onInsertAbove,
    this.onInsertBelow,
    this.onDuplicate,
    this.onDelete,
    this.onMoveUp,
    this.onMoveDown,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, size: 18),
      tooltip: 'Row actions',
      onSelected: (value) {
        switch (value) {
          case 'insert_above':
            onInsertAbove?.call();
            break;
          case 'insert_below':
            onInsertBelow?.call();
            break;
          case 'duplicate':
            onDuplicate?.call();
            break;
          case 'delete':
            onDelete?.call();
            break;
          case 'move_up':
            onMoveUp?.call();
            break;
          case 'move_down':
            onMoveDown?.call();
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'insert_above',
          child: Row(
            children: [
              Icon(Icons.add, size: 18),
              SizedBox(width: 8),
              Text('Insert row above'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'insert_below',
          child: Row(
            children: [
              Icon(Icons.add, size: 18),
              SizedBox(width: 8),
              Text('Insert row below'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'move_up',
          child: Row(
            children: [
              Icon(Icons.arrow_upward, size: 18),
              SizedBox(width: 8),
              Text('Move up'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'move_down',
          child: Row(
            children: [
              Icon(Icons.arrow_downward, size: 18),
              SizedBox(width: 8),
              Text('Move down'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'duplicate',
          child: Row(
            children: [
              Icon(Icons.copy, size: 18),
              SizedBox(width: 8),
              Text('Duplicate'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete, size: 18, color: AppColors.destructive),
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: AppColors.destructive)),
            ],
          ),
        ),
      ],
    );
  }
}

/// Row selection checkbox.
class RowSelectionCheckbox extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const RowSelectionCheckbox({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isSelected,
      onChanged: onChanged,
      activeColor: AppColors.primary,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Floating action button for adding rows.
class AddRowFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const AddRowFAB({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      child: const Icon(
        Icons.add,
        color: AppColors.primaryForeground,
      ),
    );
  }
}

/// Bottom bar for bulk row actions.
class BulkActionsBar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback? onDelete;
  final VoidCallback? onClearSelection;

  const BulkActionsBar({
    super.key,
    required this.selectedCount,
    this.onDelete,
    this.onClearSelection,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedCount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.accent,
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          Text(
            '$selectedCount row${selectedCount > 1 ? 's' : ''} selected',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.accentForeground,
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: onClearSelection,
            icon: const Icon(Icons.clear, size: 18),
            label: const Text('Clear'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline, size: 18),
            label: const Text('Delete'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.destructive,
              foregroundColor: AppColors.destructiveForeground,
            ),
          ),
        ],
      ),
    );
  }
}

/// Empty state widget for sheets with no rows.
class EmptySheetPlaceholder extends StatelessWidget {
  final VoidCallback? onAddRow;

  const EmptySheetPlaceholder({
    super.key,
    this.onAddRow,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.grid_off,
            size: 64,
            color: AppColors.mutedForeground.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No rows yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add a row to start building your sheet',
            style: TextStyle(
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onAddRow,
            icon: const Icon(Icons.add),
            label: const Text('Add First Row'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.primaryForeground,
            ),
          ),
        ],
      ),
    );
  }
}
