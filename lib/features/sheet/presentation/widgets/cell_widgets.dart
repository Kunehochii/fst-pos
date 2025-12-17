import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sheet.dart';

/// A single cell display widget (read-only mode).
class CellDisplay extends StatelessWidget {
  final String? value;
  final String? formula;
  final String? color;
  final bool isSelected;
  final bool isCalculated;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  const CellDisplay({
    super.key,
    this.value,
    this.formula,
    this.color,
    this.isSelected = false,
    this.isCalculated = false,
    this.width = 100,
    this.height = 40,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    // Parse background color
    Color? bgColor;
    if (color != null && isValidHexColor(color!)) {
      bgColor = Color(int.parse(color!.substring(1), radix: 16) + 0xFF000000);
    }

    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.centerLeft,
        child: Text(
          value ?? '',
          style: TextStyle(
            fontSize: 14,
            color: isCalculated ? AppColors.primary : AppColors.foreground,
            fontWeight: isCalculated ? FontWeight.w500 : FontWeight.normal,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}

/// A cell editor widget (edit mode).
class CellEditor extends StatefulWidget {
  final String? initialValue;
  final String? initialFormula;
  final double width;
  final double height;
  final ValueChanged<({String? value, String? formula, bool isCalculated})>
      onSubmit;
  final VoidCallback? onCancel;
  final bool autoFocus;

  const CellEditor({
    super.key,
    this.initialValue,
    this.initialFormula,
    this.width = 100,
    this.height = 40,
    required this.onSubmit,
    this.onCancel,
    this.autoFocus = true,
  });

  @override
  State<CellEditor> createState() => _CellEditorState();
}

class _CellEditorState extends State<CellEditor> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showingFormula = false;

  @override
  void initState() {
    super.initState();
    // If there's a formula, show it; otherwise show value
    _showingFormula =
        widget.initialFormula != null && widget.initialFormula!.isNotEmpty;
    _controller = TextEditingController(
      text: _showingFormula ? widget.initialFormula : widget.initialValue,
    );
    _focusNode = FocusNode();

    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
        // Select all text
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      });
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

    // Detect if it's a formula
    final isFormula = _isLikelyFormula(input);

    if (isFormula) {
      widget.onSubmit((
        value: null, // Will be computed
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
    // Must contain at least one operator
    final hasOperator = RegExp(r'[\+\-\*\/]').hasMatch(input);
    if (!hasOperator) return false;

    // Must contain at least one cell reference (letter followed by number)
    final hasCellRef = RegExp(r'[A-Za-z]+\d+').hasMatch(input);
    return hasCellRef;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.escape) {
              widget.onCancel?.call();
            }
          }
        },
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            isDense: true,
          ),
          style: const TextStyle(fontSize: 14),
          onSubmitted: (_) => _handleSubmit(),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}

/// Row header with row number and selection checkbox.
class RowHeader extends StatelessWidget {
  final int rowIndex;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectionChanged;
  final double width;
  final double height;

  const RowHeader({
    super.key,
    required this.rowIndex,
    this.isSelected = false,
    this.onSelectionChanged,
    this.width = 60,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.muted,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: Checkbox(
              value: isSelected,
              onChanged: onSelectionChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '${rowIndex + 1}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedForeground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Column header with letter (A, B, C, etc.).
class ColumnHeader extends StatelessWidget {
  final int columnIndex;
  final double width;
  final double height;

  const ColumnHeader({
    super.key,
    required this.columnIndex,
    this.width = 100,
    this.height = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.muted,
        border: Border.all(color: AppColors.border),
      ),
      alignment: Alignment.center,
      child: Text(
        columnIndexToLetter(columnIndex),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.mutedForeground,
        ),
      ),
    );
  }
}

/// Empty corner cell for the header intersection.
class CornerCell extends StatelessWidget {
  final double width;
  final double height;
  final bool allSelected;
  final ValueChanged<bool?>? onSelectAll;

  const CornerCell({
    super.key,
    this.width = 60,
    this.height = 32,
    this.allSelected = false,
    this.onSelectAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.muted,
        border: Border.all(color: AppColors.border),
      ),
      alignment: Alignment.center,
      child: Checkbox(
        value: allSelected,
        onChanged: onSelectAll,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

/// A combined cell widget that handles both display and editing modes.
class SheetCell extends StatefulWidget {
  final String? value;
  final String? formula;
  final String? color;
  final bool isSelected;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final ValueChanged<String>? onValueChanged;

  const SheetCell({
    super.key,
    this.value,
    this.formula,
    this.color,
    this.isSelected = false,
    this.width = 120,
    this.height = 40,
    this.onTap,
    this.onDoubleTap,
    this.onValueChanged,
  });

  @override
  State<SheetCell> createState() => _SheetCellState();
}

class _SheetCellState extends State<SheetCell> {
  bool _isEditing = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.formula ?? widget.value);
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(SheetCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isEditing) {
      _controller.text = widget.formula ?? widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _isEditing) {
      _finishEditing();
    }
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
      _controller.text = widget.formula ?? widget.value ?? '';
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.text.length,
      );
    });
  }

  void _finishEditing() {
    setState(() => _isEditing = false);
    final value = _controller.text.trim();
    if (value != (widget.formula ?? widget.value ?? '')) {
      widget.onValueChanged?.call(value);
    }
  }

  void _handleTap() {
    widget.onTap?.call();
  }

  void _handleDoubleTap() {
    _startEditing();
    widget.onDoubleTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    // Parse background color
    Color? bgColor;
    if (widget.color != null && isValidHexColor(widget.color!)) {
      bgColor =
          Color(int.parse(widget.color!.substring(1), radix: 16) + 0xFF000000);
    }

    final isCalculated = widget.formula != null && widget.formula!.isNotEmpty;

    if (_isEditing) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          border: Border.all(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) {
            if (event is KeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.escape) {
                setState(() => _isEditing = false);
              }
            }
          },
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              isDense: true,
            ),
            style: const TextStyle(fontSize: 14),
            onSubmitted: (_) => _finishEditing(),
            textInputAction: TextInputAction.done,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _handleTap,
      onDoubleTap: _handleDoubleTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          border: Border.all(
            color: widget.isSelected ? AppColors.primary : AppColors.border,
            width: widget.isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.value ?? '',
          style: TextStyle(
            fontSize: 14,
            color: isCalculated ? AppColors.primary : AppColors.foreground,
            fontWeight: isCalculated ? FontWeight.w500 : FontWeight.normal,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}

/// Helper function to get column label (A, B, C, etc.) from index.
String getColumnLabel(int index) => columnIndexToLetter(index);
