import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Primary filled button with consistent styling.
///
/// Use for main call-to-action buttons.
///
/// Example:
/// ```dart
/// AppButton.primary(
///   onPressed: () => print('Pressed'),
///   child: Text('Submit'),
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
  });

  /// Creates a primary filled button.
  factory AppButton.primary({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.primary,
      icon: icon,
    );
  }

  /// Creates a secondary outlined button.
  factory AppButton.secondary({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.secondary,
      icon: icon,
    );
  }

  /// Creates a ghost/text button with no background.
  factory AppButton.ghost({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.ghost,
      icon: icon,
    );
  }

  /// Creates a destructive/danger button.
  factory AppButton.destructive({
    required VoidCallback? onPressed,
    required Widget child,
    bool isLoading = false,
    bool isExpanded = false,
    Widget? icon,
  }) {
    return AppButton._(
      onPressed: onPressed,
      child: child,
      isLoading: isLoading,
      isExpanded: isExpanded,
      variant: _ButtonVariant.destructive,
      icon: icon,
    );
  }

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final bool isExpanded;
  final _ButtonVariant variant;
  final Widget? icon;

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
          child: child,
        );
      case _ButtonVariant.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case _ButtonVariant.ghost:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case _ButtonVariant.destructive:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.destructive,
            foregroundColor: AppColors.destructiveForeground,
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
