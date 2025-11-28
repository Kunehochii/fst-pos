import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Styled card with consistent theming.
///
/// Features:
/// - White background
/// - Subtle border
/// - Soft shadow
/// - Customizable padding
///
/// Example:
/// ```dart
/// AppCard(
///   child: Text('Card content'),
/// )
/// ```
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.elevation = 0,
    this.borderRadius,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double elevation;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: borderRadius ?? BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppColors.radiusLg),
        child: padding != null
            ? Padding(padding: padding!, child: child)
            : child,
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppColors.radiusLg),
          child: card,
        ),
      );
    }

    return card;
  }
}
