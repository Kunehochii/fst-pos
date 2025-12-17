import 'package:flutter/widgets.dart';

/// Application color palette extracted from the FST design system.
///
/// These colors are derived from the admin dashboard's globals.css
/// and converted from OKLCH to Flutter Color format.
///
/// Use these colors for:
/// - Custom widgets
/// - Platform-specific styling
/// - Direct color access when theme context is unavailable
///
/// For themed components, use Theme.of(context).colorScheme instead.
abstract final class AppColors {
  // ==========================================================================
  // PRIMARY COLORS - Deep Navy Blue
  // ==========================================================================

  /// Primary brand color - Deep Navy Blue
  /// oklch(0.35 0.18 250) → RGB
  static const Color primary = Color(0xFF1A3A6E);

  /// Primary foreground - White text on primary
  static const Color primaryForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // SECONDARY COLORS - Vibrant Teal/Cyan
  // ==========================================================================

  /// Secondary accent color - Vibrant Teal/Cyan
  /// oklch(0.65 0.15 195) → RGB
  static const Color secondary = Color(0xFF2BA5A5);

  /// Secondary foreground - White text on secondary
  static const Color secondaryForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // BACKGROUND & FOREGROUND
  // ==========================================================================

  /// Main background color - Clean white
  /// oklch(0.995 0 0) → RGB
  static const Color background = Color(0xFFFDFDFD);

  /// Main foreground/text color - Near black
  /// oklch(0.145 0 0) → RGB
  static const Color foreground = Color(0xFF171717);

  // ==========================================================================
  // CARD COLORS
  // ==========================================================================

  /// Card background - Pure white
  static const Color card = Color(0xFFFFFFFF);

  /// Card foreground/text color
  static const Color cardForeground = Color(0xFF171717);

  // ==========================================================================
  // POPOVER COLORS
  // ==========================================================================

  /// Popover background
  static const Color popover = Color(0xFFFFFFFF);

  /// Popover foreground/text color
  static const Color popoverForeground = Color(0xFF171717);

  // ==========================================================================
  // MUTED COLORS
  // ==========================================================================

  /// Muted background - Subtle blue tint
  /// oklch(0.97 0.005 250) → RGB
  static const Color muted = Color(0xFFF5F5F7);

  /// Muted foreground/text color
  /// oklch(0.5 0 0) → RGB
  static const Color mutedForeground = Color(0xFF737373);

  // ==========================================================================
  // ACCENT COLORS
  // ==========================================================================

  /// Accent background
  /// oklch(0.95 0.02 250) → RGB
  static const Color accent = Color(0xFFEEEFF4);

  /// Accent foreground/text color
  /// oklch(0.25 0.1 250) → RGB
  static const Color accentForeground = Color(0xFF1E2A4A);

  // ==========================================================================
  // DESTRUCTIVE COLORS
  // ==========================================================================

  /// Destructive/error color - Red
  /// oklch(0.577 0.245 27.325) → RGB
  static const Color destructive = Color(0xFFDC2626);

  /// Destructive foreground - White text
  static const Color destructiveForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // BORDER & INPUT COLORS
  // ==========================================================================

  /// Border color - Subtle blue tint
  /// oklch(0.92 0.01 250) → RGB
  static const Color border = Color(0xFFE5E5EB);

  /// Input border/background color
  /// oklch(0.94 0.01 250) → RGB
  static const Color input = Color(0xFFEBEBF0);

  /// Focus ring color - Matches primary
  static const Color ring = primary;

  // ==========================================================================
  // SIDEBAR COLORS - Deep Navy Blue theme
  // ==========================================================================

  /// Sidebar background - Deep Navy
  /// oklch(0.25 0.12 250) → RGB
  static const Color sidebar = Color(0xFF0F1E3D);

  /// Sidebar text color - Light
  /// oklch(0.92 0.02 250) → RGB
  static const Color sidebarForeground = Color(0xFFE5E7F0);

  /// Sidebar primary accent
  /// oklch(0.45 0.2 250) → RGB
  static const Color sidebarPrimary = Color(0xFF2952A3);

  /// Sidebar primary foreground
  static const Color sidebarPrimaryForeground = Color(0xFFFFFFFF);

  /// Sidebar accent/hover background
  /// oklch(0.32 0.1 250) → RGB
  static const Color sidebarAccent = Color(0xFF1A2E52);

  /// Sidebar accent foreground
  /// oklch(0.95 0.01 250) → RGB
  static const Color sidebarAccentForeground = Color(0xFFF0F1F5);

  /// Sidebar border color
  /// oklch(0.35 0.08 250) → RGB
  static const Color sidebarBorder = Color(0xFF2A3F66);

  /// Sidebar focus ring color
  /// oklch(0.55 0.2 250) → RGB
  static const Color sidebarRing = Color(0xFF4169B3);

  // ==========================================================================
  // CHART COLORS
  // ==========================================================================

  /// Chart color 1 - Blue
  /// oklch(0.45 0.2 250) → RGB
  static const Color chart1 = Color(0xFF2952A3);

  /// Chart color 2 - Teal
  /// oklch(0.65 0.15 195) → RGB
  static const Color chart2 = Color(0xFF2BA5A5);

  /// Chart color 3 - Green
  /// oklch(0.7 0.18 145) → RGB
  static const Color chart3 = Color(0xFF34B870);

  /// Chart color 4 - Orange
  /// oklch(0.65 0.2 40) → RGB
  static const Color chart4 = Color(0xFFD97B2A);

  /// Chart color 5 - Purple
  /// oklch(0.55 0.22 320) → RGB
  static const Color chart5 = Color(0xFFA855B8);

  // ==========================================================================
  // SEMANTIC COLORS
  // ==========================================================================

  /// Success color - Green
  static const Color success = Color(0xFF22C55E);

  /// Success foreground
  static const Color successForeground = Color(0xFFFFFFFF);

  /// Warning color - Amber
  static const Color warning = Color(0xFFF59E0B);

  /// Warning foreground
  static const Color warningForeground = Color(0xFFFFFFFF);

  /// Info color - Blue
  static const Color info = Color(0xFF3B82F6);

  /// Info foreground
  static const Color infoForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // DESIGN TOKENS
  // ==========================================================================

  /// Default border radius value (matches CSS --radius: 1rem)
  static const double radiusLg = 16.0;

  /// Medium border radius
  static const double radiusMd = 14.0;

  /// Small border radius
  static const double radiusSm = 12.0;

  /// Extra large border radius
  static const double radiusXl = 20.0;

  // ==========================================================================
  // HELPER METHODS
  // ==========================================================================

  /// Returns chart color by index (1-5), cycling if out of range
  static Color chartColor(int index) {
    final colors = [chart1, chart2, chart3, chart4, chart5];
    return colors[(index - 1) % colors.length];
  }
}
