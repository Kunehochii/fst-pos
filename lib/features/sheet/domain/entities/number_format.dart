import 'sheet.dart';

/// Number format mode for cell display.
enum FormatMode {
  /// Default mode - removes trailing zeros, up to 4 decimals.
  defaultMode,

  /// Ceiling mode - rounds up to nearest integer (for Kahon).
  ceil,

  /// Decimal mode - always shows 2 decimal places (for Inventory).
  decimal,
}

/// Format a cell number for display.
///
/// - `defaultMode`: Removes trailing zeros, up to 4 decimals
/// - `ceil`: Rounds up to nearest integer (Kahon sheets)
/// - `decimal`: Always shows 2 decimal places (Inventory sheets)
String formatCellNumber(double value,
    [FormatMode mode = FormatMode.defaultMode]) {
  switch (mode) {
    case FormatMode.defaultMode:
      // Remove trailing zeros but keep up to 4 decimals
      final formatted = value.toStringAsFixed(4);
      final trimmed = formatted.replaceAll(RegExp(r'\.?0+$'), '');
      return trimmed.isEmpty ? '0' : trimmed;

    case FormatMode.ceil:
      // Round up to nearest integer
      return value.ceil().toString();

    case FormatMode.decimal:
      // Always 2 decimal places
      return value.toStringAsFixed(2);
  }
}

/// Get the format mode based on sheet type.
FormatMode getFormatMode(SheetType type) {
  return type == SheetType.kahon ? FormatMode.ceil : FormatMode.decimal;
}

/// Parse a string value to double, returning 0 if invalid.
double parseDoubleOrZero(String? value) {
  if (value == null || value.isEmpty) return 0;
  return double.tryParse(value) ?? 0;
}
