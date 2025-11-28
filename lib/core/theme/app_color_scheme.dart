import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'app_colors.dart';

/// Custom color scheme for FST POS application.
///
/// This creates a shadcn_flutter [ColorScheme] that matches the
/// admin dashboard's design system (globals.css).
///
/// Usage:
/// ```dart
/// ShadcnApp(
///   theme: ThemeData(
///     colorScheme: AppColorScheme.light,
///     radius: 0.8,
///   ),
/// )
/// ```
abstract final class AppColorScheme {
  /// Light theme color scheme matching the FST design system.
  ///
  /// Based on:
  /// - Primary: Deep Navy Blue
  /// - Secondary: Vibrant Teal/Cyan
  /// - Clean white backgrounds with subtle blue tints
  static final ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    // Background colors
    background: AppColors.background,
    foreground: AppColors.foreground,
    // Card colors
    card: AppColors.card,
    cardForeground: AppColors.cardForeground,
    // Popover colors
    popover: AppColors.popover,
    popoverForeground: AppColors.popoverForeground,
    // Primary colors - Deep Navy Blue
    primary: AppColors.primary,
    primaryForeground: AppColors.primaryForeground,
    // Secondary colors - Vibrant Teal/Cyan
    secondary: AppColors.secondary,
    secondaryForeground: AppColors.secondaryForeground,
    // Muted colors
    muted: AppColors.muted,
    mutedForeground: AppColors.mutedForeground,
    // Accent colors
    accent: AppColors.accent,
    accentForeground: AppColors.accentForeground,
    // Destructive colors
    destructive: AppColors.destructive,
    destructiveForeground: AppColors.destructiveForeground,
    // Border and input colors
    border: AppColors.border,
    input: AppColors.input,
    ring: AppColors.ring,
    // Chart colors
    chart1: AppColors.chart1,
    chart2: AppColors.chart2,
    chart3: AppColors.chart3,
    chart4: AppColors.chart4,
    chart5: AppColors.chart5,
    // Sidebar colors
    sidebar: AppColors.sidebar,
    sidebarForeground: AppColors.sidebarForeground,
    sidebarPrimary: AppColors.sidebarPrimary,
    sidebarPrimaryForeground: AppColors.sidebarPrimaryForeground,
    sidebarAccent: AppColors.sidebarAccent,
    sidebarAccentForeground: AppColors.sidebarAccentForeground,
    sidebarBorder: AppColors.sidebarBorder,
    sidebarRing: AppColors.sidebarRing,
  );
}
