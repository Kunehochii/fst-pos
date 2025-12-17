import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Icon container with background color.
///
/// Use for displaying icons with a colored background.
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
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double? iconSize;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppColors.radiusLg),
        boxShadow: [
          BoxShadow(
            color: (backgroundColor ?? AppColors.primary).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: iconSize ?? size * 0.5,
        color: iconColor ?? AppColors.primaryForeground,
      ),
    );
  }
}
