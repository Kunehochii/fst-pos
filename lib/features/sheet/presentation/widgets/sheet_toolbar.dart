import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sheet.dart';
import '../providers/sheet_provider.dart';
import 'color_picker.dart';
import 'quick_formula_menu.dart';

/// Toolbar for sheet actions and editing.
class SheetToolbar extends StatelessWidget {
  final Sheet sheet;
  final SelectedCell? selectedCell;
  final String? cellValue;
  final String? cellFormula;
  final String? cellColor;
  final bool isEditing;
  final bool hasChanges;
  final bool isSaving;
  final ValueChanged<String>? onFormulaInput;
  final ValueChanged<String?>? onColorSelected;
  final VoidCallback? onAddRow;
  final VoidCallback? onDeleteSelected;
  final VoidCallback? onSave;
  final VoidCallback? onRefresh;
  final int selectedRowsCount;

  const SheetToolbar({
    super.key,
    required this.sheet,
    this.selectedCell,
    this.cellValue,
    this.cellFormula,
    this.cellColor,
    this.isEditing = false,
    this.hasChanges = false,
    this.isSaving = false,
    this.onFormulaInput,
    this.onColorSelected,
    this.onAddRow,
    this.onDeleteSelected,
    this.onSave,
    this.onRefresh,
    this.selectedRowsCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          // Cell address display
          if (selectedCell != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                selectedCell!.address,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'monospace',
                  color: AppColors.foreground,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],

          // Quick Formula button
          if (selectedCell != null)
            QuickFormulaMenu(
              rowIndex: selectedCell!.rowIndex,
              columnIndex: selectedCell!.columnIndex,
              onFormulaSelected: (formula) {
                onFormulaInput?.call(formula);
              },
            ),

          const SizedBox(width: 8),

          // Color picker
          if (selectedCell != null)
            ColorPickerButton(
              currentColor: cellColor,
              onColorSelected: (color) {
                onColorSelected?.call(color);
              },
            ),

          const Spacer(),

          // Row count
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.muted,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${sheet.rows.length} rows',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedForeground,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Selected rows info
          if (selectedRowsCount > 0) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '$selectedRowsCount selected',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentForeground,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Delete selected button
            IconButton(
              onPressed: onDeleteSelected,
              icon: const Icon(Icons.delete_outline),
              color: AppColors.destructive,
              tooltip: 'Delete selected rows',
            ),
            const SizedBox(width: 8),
          ],

          // Add row button
          ElevatedButton.icon(
            onPressed: onAddRow,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add Row'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.primaryForeground,
            ),
          ),

          const SizedBox(width: 8),

          // Save button
          if (hasChanges)
            ElevatedButton.icon(
              onPressed: isSaving ? null : onSave,
              icon: isSaving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryForeground,
                      ),
                    )
                  : const Icon(Icons.save, size: 18),
              label: Text(isSaving ? 'Saving...' : 'Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.secondaryForeground,
              ),
            ),

          const SizedBox(width: 8),

          // Refresh button
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
      ),
    );
  }
}

/// Formula bar for editing cell formulas.
class FormulaBar extends StatefulWidget {
  final String? cellAddress;
  final String? initialValue;
  final String? initialFormula;
  final ValueChanged<({String? value, String? formula, bool isCalculated})>
      onSubmit;
  final VoidCallback? onCancel;

  const FormulaBar({
    super.key,
    this.cellAddress,
    this.initialValue,
    this.initialFormula,
    required this.onSubmit,
    this.onCancel,
  });

  @override
  State<FormulaBar> createState() => _FormulaBarState();
}

class _FormulaBarState extends State<FormulaBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialFormula ?? widget.initialValue ?? '',
    );
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(FormulaBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cellAddress != oldWidget.cellAddress) {
      _controller.text = widget.initialFormula ?? widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final input = _controller.text.trim();
    final isFormula = _isLikelyFormula(input);

    if (isFormula) {
      widget.onSubmit((
        value: null,
        formula: input,
        isCalculated: true,
      ));
    } else {
      widget.onSubmit((
        value: input.isEmpty ? null : input,
        formula: null,
        isCalculated: false,
      ));
    }
  }

  bool _isLikelyFormula(String input) {
    final hasOperator = RegExp(r'[\+\-\*\/]').hasMatch(input);
    if (!hasOperator) return false;
    final hasCellRef = RegExp(r'[A-Za-z]+\d+').hasMatch(input);
    return hasCellRef;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          // Function icon
          const Icon(
            Icons.functions,
            size: 20,
            color: AppColors.mutedForeground,
          ),
          const SizedBox(width: 12),
          // Formula input
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.cellAddress != null
                    ? 'Enter value or formula for ${widget.cellAddress}'
                    : 'Select a cell to edit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                isDense: true,
              ),
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'monospace',
              ),
              enabled: widget.cellAddress != null,
              onSubmitted: (_) => _handleSubmit(),
            ),
          ),
          const SizedBox(width: 8),
          // Submit button
          IconButton(
            onPressed: widget.cellAddress != null ? _handleSubmit : null,
            icon: const Icon(Icons.check),
            color: AppColors.primary,
            tooltip: 'Apply',
          ),
          // Cancel button
          IconButton(
            onPressed: widget.onCancel,
            icon: const Icon(Icons.close),
            color: AppColors.mutedForeground,
            tooltip: 'Cancel',
          ),
        ],
      ),
    );
  }
}
