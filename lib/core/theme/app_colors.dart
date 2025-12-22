import 'package:flutter/widgets.dart';

/// Application color palette based on the "Aura Daybreak" design system.
///
/// This light mode design is inspired by modern productivity tools
/// (Linear, Stripe, AirBnB) prioritizing openness, breathability,
/// and shadows/borders for depth definition.
///
/// Use these colors for:
/// - Custom widgets
/// - Platform-specific styling
/// - Direct color access when theme context is unavailable
///
/// For themed components, use Theme.of(context).colorScheme instead.
abstract final class AppColors {
  // ==========================================================================
  // PRIMARY COLORS - Vivid Orange (Action/CTA)
  // ==========================================================================

  /// Primary brand color - Vivid Orange
  /// Used for: CTAs, "Pay" buttons, active navigation states
  static const Color primary = Color(0xFFF97316);

  /// Primary foreground - White text on primary
  static const Color primaryForeground = Color(0xFFFFFFFF);

  /// Primary hover/pressed state - Darker orange
  static const Color primaryHover = Color(0xFFEA580C);

  // ==========================================================================
  // SECONDARY COLORS - Deep Navy (Text emphasis)
  // ==========================================================================

  /// Secondary color - Deep Navy for emphasis
  static const Color secondary = Color(0xFF1E293B);

  /// Secondary foreground - White text on secondary
  static const Color secondaryForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // BACKGROUND & FOREGROUND
  // ==========================================================================

  /// Main background color - Cool White / Light Gray
  /// Slightly off-white to reduce glare
  static const Color background = Color(0xFFF3F4F6);

  /// Main foreground/text color - Deep Navy / Charcoal
  /// High contrast against light background
  static const Color foreground = Color(0xFF0F172A);

  // ==========================================================================
  // CARD COLORS
  // ==========================================================================

  /// Card background - Pure White
  /// Content cards are pure white for separation
  static const Color card = Color(0xFFFFFFFF);

  /// Card foreground/text color
  static const Color cardForeground = Color(0xFF0F172A);

  // ==========================================================================
  // POPOVER COLORS
  // ==========================================================================

  /// Popover background
  static const Color popover = Color(0xFFFFFFFF);

  /// Popover foreground/text color
  static const Color popoverForeground = Color(0xFF0F172A);

  // ==========================================================================
  // MUTED COLORS
  // ==========================================================================

  /// Muted background - Slate 100 (Inputs/Hover states)
  static const Color muted = Color(0xFFF1F5F9);

  /// Muted foreground/text color - Slate 500
  /// For labels and metadata
  static const Color mutedForeground = Color(0xFF64748B);

  // ==========================================================================
  // ACCENT COLORS
  // ==========================================================================

  /// Accent background - Light gray wash for hover states
  static const Color accent = Color(0xFFF1F5F9);

  /// Accent foreground/text color
  static const Color accentForeground = Color(0xFF0F172A);

  // ==========================================================================
  // DESTRUCTIVE COLORS
  // ==========================================================================

  /// Destructive/error color - Rose
  static const Color destructive = Color(0xFFF43F5E);

  /// Destructive foreground - White text
  static const Color destructiveForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // BORDER & INPUT COLORS
  // ==========================================================================

  /// Border color - Pale Gray
  /// Essential for defining structure without heavy backgrounds
  static const Color border = Color(0xFFE2E8F0);

  /// Input border/background color - Gray for unfocused state
  static const Color input = Color(0xFFF1F5F9);

  /// Focus ring color - Vivid Orange
  static const Color ring = primary;

  // ==========================================================================
  // SIDEBAR COLORS - White with Orange accents (Aura Daybreak)
  // ==========================================================================

  /// Sidebar background - White
  static const Color sidebar = Color(0xFFFFFFFF);

  /// Sidebar text color - Deep Navy
  static const Color sidebarForeground = Color(0xFF0F172A);

  /// Sidebar primary accent - Vivid Orange (selected item)
  static const Color sidebarPrimary = Color(0xFFF97316);

  /// Sidebar primary foreground
  static const Color sidebarPrimaryForeground = Color(0xFFFFFFFF);

  /// Sidebar accent/hover background - Light gray wash
  static const Color sidebarAccent = Color(0xFFF1F5F9);

  /// Sidebar accent foreground
  static const Color sidebarAccentForeground = Color(0xFF0F172A);

  /// Sidebar border color - Pale Gray (stronger separator)
  static const Color sidebarBorder = Color(0xFFE2E8F0);

  /// Sidebar focus ring color - Orange
  static const Color sidebarRing = Color(0xFFF97316);

  // ==========================================================================
  // CHART COLORS
  // ==========================================================================

  /// Chart color 1 - Navy (primary data line)
  static const Color chart1 = Color(0xFF1E293B);

  /// Chart color 2 - Orange (accent data line)
  static const Color chart2 = Color(0xFFF97316);

  /// Chart color 3 - Emerald
  static const Color chart3 = Color(0xFF10B981);

  /// Chart color 4 - Blue
  static const Color chart4 = Color(0xFF3B82F6);

  /// Chart color 5 - Purple
  static const Color chart5 = Color(0xFF8B5CF6);

  // ==========================================================================
  // SEMANTIC COLORS
  // ==========================================================================

  /// Success color - Emerald
  static const Color success = Color(0xFF10B981);

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
