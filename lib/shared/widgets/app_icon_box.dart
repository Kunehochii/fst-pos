import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Icon container with background color and subtle shadow.
///
/// "Aura Daybreak" styling with soft diffused shadows.
///
/// Example:
/// ```dart
/// AppIconBox(
///   icon: Icons.store,
///   backgroundColor: AppColors.primary,
///   iconColor: AppColors.primaryForeground,
///   size: 72,
/// )
/// ```
class AppIconBox extends StatelessWidget {
  const AppIconBox({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.size = 48,
    this.iconSize,
    this.borderRadius,
    this.elevation = true,
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double? iconSize;
  final double? borderRadius;

  /// Whether to show the soft shadow
  final bool elevation;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppColors.radiusLg),
        // Soft diffused shadow
        boxShadow: elevation
            ? [
                BoxShadow(
                  color: bgColor.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Icon(
        icon,
        size: iconSize ?? size * 0.5,
        color: iconColor ?? AppColors.primaryForeground,
      ),
    );
  }
}
