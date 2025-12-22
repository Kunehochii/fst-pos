import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Styled card with consistent "Aura Daybreak" theming.
///
/// Features:
/// - Pure white background
/// - Crisp 1px border (Pale Gray)
/// - Soft diffused shadow when elevated
/// - Customizable padding and border radius
///
/// Example:
/// ```dart
/// AppCard(
///   child: Text('Card content'),
/// )
///
/// // With elevation for floating effect
/// AppCard(
///   elevation: 1,
///   child: Text('Floating card'),
/// )
///
/// // Selected state with orange ring
/// AppCard(
///   isSelected: true,
///   child: Text('Selected item'),
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
    this.isSelected = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double elevation;
  final BorderRadius? borderRadius;

  /// When true, shows a thick orange border ring (selection state)
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(AppColors.radiusLg);

    final card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: radius,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: isSelected ? 2 : 1,
        ),
        // Soft diffused shadow (box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1))
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                  spreadRadius: -1,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child:
            padding != null ? Padding(padding: padding!, child: child) : child,
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          // Light gray wash hover state
          hoverColor: AppColors.accent,
          splashColor: AppColors.accent,
          child: card,
        ),
      );
    }

    return card;
  }
}
