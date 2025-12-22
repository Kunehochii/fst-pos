import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/quick_formula.dart';

/// Quick formula menu for applying common formulas.
class QuickFormulaMenu extends StatelessWidget {
  final int rowIndex;
  final int columnIndex;
  final ValueChanged<String> onFormulaSelected;
  final bool enabled;

  const QuickFormulaMenu({
    super.key,
    required this.rowIndex,
    required this.columnIndex,
    required this.onFormulaSelected,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<QuickFormulaType>(
      enabled: enabled,
      tooltip: 'Quick Formulas',
      onSelected: (type) {
        final formula = generateQuickFormula(
          type: type,
          rowIndex: rowIndex,
          columnIndex: columnIndex,
        );
        if (formula.isNotEmpty) {
          onFormulaSelected(formula);
        }
      },
      itemBuilder: (context) => [
        _buildMenuItem(
          context,
          type: QuickFormulaType.sumAllAbove,
          icon: Icons.arrow_upward,
          title: 'Sum All Above',
          description: 'Add all cells above in this column',
          enabled: rowIndex > 0,
        ),
        _buildMenuItem(
          context,
          type: QuickFormulaType.sumAbove,
          icon: Icons.vertical_align_top,
          title: 'Sum 2 Above',
          description: 'Add 2 cells above',
          enabled: rowIndex >= 2,
        ),
        const PopupMenuDivider(),
        _buildMenuItem(
          context,
          type: QuickFormulaType.subtractAllAbove,
          icon: Icons.remove,
          title: 'Subtract All Above',
          description: 'Subtract all cells above',
          enabled: rowIndex > 0,
        ),
        _buildMenuItem(
          context,
          type: QuickFormulaType.subtractAbove,
          icon: Icons.minimize,
          title: 'Subtract 2 Above',
          description: 'Subtract 2 cells above',
          enabled: rowIndex >= 2,
        ),
        const PopupMenuDivider(),
        _buildMenuItem(
          context,
          type: QuickFormulaType.multiplyLeft,
          icon: Icons.close,
          title: 'Multiply 2 Left',
          description: 'Multiply 2 cells to the left',
          enabled: columnIndex >= 2,
        ),
        _buildMenuItem(
          context,
          type: QuickFormulaType.addLeft,
          icon: Icons.add,
          title: 'Add 2 Left',
          description: 'Add 2 cells to the left',
          enabled: columnIndex >= 2,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: enabled ? AppColors.card : AppColors.muted,
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.functions,
              size: 18,
              color: enabled ? AppColors.foreground : AppColors.mutedForeground,
            ),
            const SizedBox(width: 6),
            Text(
              'Formula',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:
                    enabled ? AppColors.foreground : AppColors.mutedForeground,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: enabled ? AppColors.foreground : AppColors.mutedForeground,
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<QuickFormulaType> _buildMenuItem(
    BuildContext context, {
    required QuickFormulaType type,
    required IconData icon,
    required String title,
    required String description,
    required bool enabled,
  }) {
    return PopupMenuItem<QuickFormulaType>(
      value: type,
      enabled: enabled,
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: enabled ? AppColors.foreground : AppColors.mutedForeground,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: enabled
                        ? AppColors.foreground
                        : AppColors.mutedForeground,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
