import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../domain/entities/sheet.dart';

/// Color picker popover for cell background colors.
class CellColorPicker extends StatelessWidget {
  final String? currentColor;
  final ValueChanged<String?> onColorSelected;

  const CellColorPicker({
    super.key,
    this.currentColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusMd),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cell Color',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: cellColorPalette.map((color) {
              final isSelected = currentColor == color ||
                  (currentColor == null && color == '#FFFFFF');
              return _ColorButton(
                color: color,
                isSelected: isSelected,
                onTap: () => onColorSelected(color == '#FFFFFF' ? null : color),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: AppButton.ghost(
              onPressed: () => onColorSelected(null),
              small: true,
              child: const Text('Clear Color'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final String color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorButton({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        Color(int.parse(color.substring(1), radix: 16) + 0xFF000000);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                size: 16,
                color: AppColors.primary,
              )
            : null,
      ),
    );
  }
}

/// Color picker button that shows a popover.
class ColorPickerButton extends StatelessWidget {
  final String? currentColor;
  final ValueChanged<String?> onColorSelected;
  final bool enabled;

  const ColorPickerButton({
    super.key,
    this.currentColor,
    required this.onColorSelected,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String?>(
      enabled: enabled,
      tooltip: 'Cell Color',
      onSelected: onColorSelected,
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: CellColorPicker(
            currentColor: currentColor,
            onColorSelected: (color) {
              Navigator.of(context).pop();
              onColorSelected(color);
            },
          ),
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
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: currentColor != null && isValidHexColor(currentColor!)
                    ? Color(int.parse(currentColor!.substring(1), radix: 16) +
                        0xFF000000)
                    : AppColors.card,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.border),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: enabled ? AppColors.foreground : AppColors.mutedForeground,
            ),
          ],
        ),
      ),
    );
  }
}
