import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Multi-variant button with "Aura Daybreak" styling.
///
/// Features:
/// - Primary: Vivid Orange with white text (main CTAs, "Pay" buttons)
/// - Secondary: Outlined with gray border, gray wash on hover
/// - Ghost: Text only with gray wash on hover
/// - Destructive: Rose/red for delete actions
/// - Distinct "pressed" state (darker or inset) for tactile feedback
///
/// Example:
/// ```dart
/// AppButton.primary(
///   onPressed: () => print('Pressed'),
///   child: Text('Pay Now'),
/// )
/// ```
class AppButton extends StatelessWidget {
  const AppButton._({
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.isExpanded = false,
    this.variant = _ButtonVariant.primary,
    this.icon,
    this.size = _ButtonSize.medium,
  });

  /// Creates a primary filled button (Vivid Orange).
  /// Use for main call-to-action buttons like "Pay", "Submit", etc.
  factory AppButton.primary({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
    bool small = false,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.primary,
      icon: icon,
      size: small ? _ButtonSize.small : _ButtonSize.medium,
    );
  }

  /// Creates a secondary outlined button.
  /// Use for secondary actions like "Cancel", "Back", etc.
  factory AppButton.secondary({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
    bool small = false,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.secondary,
      icon: icon,
      size: small ? _ButtonSize.small : _ButtonSize.medium,
    );
  }

  /// Creates a ghost/text button with no background.
  /// Use for tertiary actions like "Skip", "Learn more", etc.
  factory AppButton.ghost({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
    bool small = false,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.ghost,
      icon: icon,
      size: small ? _ButtonSize.small : _ButtonSize.medium,
    );
  }

  /// Creates a destructive/danger button (Rose red).
  /// Use for delete, remove, or other destructive actions.
  factory AppButton.destructive({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
    bool small = false,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.destructive,
      icon: icon,
      size: small ? _ButtonSize.small : _ButtonSize.medium,
    );
  }

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final bool isExpanded;
  final _ButtonVariant variant;
  final Widget? icon;
  final _ButtonSize size;

  EdgeInsetsGeometry get _padding {
    switch (size) {
      case _ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case _ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    }
  }

  double get _fontSize {
    switch (size) {
      case _ButtonSize.small:
        return 13;
      case _ButtonSize.medium:
        return 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonChild = isLoading
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _getForegroundColor(),
                ),
              ),
              const SizedBox(width: 10),
              child,
            ],
          )
        : icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  child,
                ],
              )
            : child;

    final button = _buildButton(buttonChild);

    if (isExpanded) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }

  Widget _buildButton(Widget child) {
    switch (variant) {
      case _ButtonVariant.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: _padding,
            textStyle:
                TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w500),
          ),
          child: child,
        );
      case _ButtonVariant.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: _padding,
            textStyle:
                TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w500),
          ),
          child: child,
        );
      case _ButtonVariant.ghost:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            padding: _padding,
            textStyle:
                TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w500),
          ),
          child: child,
        );
      case _ButtonVariant.destructive:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.destructive,
            foregroundColor: AppColors.destructiveForeground,
            padding: _padding,
            textStyle:
                TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w500),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered)) {
                // Darker rose on hover/press
                return const Color(0xFFE11D48);
              }
              return AppColors.destructive;
            }),
          ),
          child: child,
        );
    }
  }

  Color _getForegroundColor() {
    switch (variant) {
      case _ButtonVariant.primary:
        return AppColors.primaryForeground;
      case _ButtonVariant.secondary:
        return AppColors.foreground;
      case _ButtonVariant.ghost:
        return AppColors.primary;
      case _ButtonVariant.destructive:
        return AppColors.destructiveForeground;
    }
  }
}

enum _ButtonVariant { primary, secondary, ghost, destructive }

enum _ButtonSize { small, medium }
