import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Loading indicator with optional message.
///
/// Example:
/// ```dart
/// AppLoadingIndicator(message: 'Loading...')
/// ```
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.message,
    this.size = 32,
    this.color,
  });

  final String? message;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: color ?? AppColors.primary,
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(
            message!,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedForeground,
            ),
          ),
        ],
      ],
    );
  }
}

/// Centered loading indicator that fills available space.
///
/// Example:
/// ```dart
/// AppLoadingOverlay(message: 'Please wait...')
/// ```
class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppLoadingIndicator(message: message),
    );
  }
}
