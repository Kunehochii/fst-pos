import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet.freezed.dart';

/// Sheet type enum matching the backend.
enum SheetType {
  kahon,
  inventory;

  /// Convert from API string to enum.
  static SheetType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'INVENTORY':
        return SheetType.inventory;
      default:
        return SheetType.kahon;
    }
  }

  /// Convert to API string format.
  String toApiString() => name.toUpperCase();

  /// Get display name.
  String get displayName {
    switch (this) {
      case SheetType.kahon:
        return 'Kahon';
      case SheetType.inventory:
        return 'Inventory';
    }
  }
}

/// Main sheet entity.
///
/// Represents an Excel-style spreadsheet for Kahon or Inventory tracking.
@freezed
class Sheet with _$Sheet {
  const Sheet._();

  const factory Sheet({
    required String id,
    required SheetType type,
    required String name,
    required int columns,
    required String cashierId,
    required List<SheetRow> rows,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Sheet;

  /// Get a row by index (0-based).
  SheetRow? getRowByIndex(int index) {
    try {
      return rows.firstWhere((r) => r.rowIndex == index);
    } catch (_) {
      return null;
    }
  }

  /// Get a cell by address (e.g., "A1", "B2").
  Cell? getCellByAddress(String address) {
    final parsed = parseCellAddress(address);
    if (parsed == null) return null;

    final row = getRowByIndex(parsed.rowIndex);
    if (row == null) return null;

    try {
      return row.cells.firstWhere((c) => c.columnIndex == parsed.columnIndex);
    } catch (_) {
      return null;
    }
  }

  /// Get max row index.
  int get maxRowIndex {
    if (rows.isEmpty) return -1;
    return rows.map((r) => r.rowIndex).reduce((a, b) => a > b ? a : b);
  }
}

/// Row entity within a sheet.
@freezed
class SheetRow with _$SheetRow {
  const SheetRow._();

  const factory SheetRow({
    required String id,
    required String sheetId,
    required int rowIndex,
    required bool isItemRow,
    String? itemName,
    required List<Cell> cells,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SheetRow;

  /// Get a cell by column index (0-based).
  Cell? getCellByColumnIndex(int columnIndex) {
    try {
      return cells.firstWhere((c) => c.columnIndex == columnIndex);
    } catch (_) {
      return null;
    }
  }
}

/// Cell entity within a row.
@freezed
class Cell with _$Cell {
  const Cell._();

  const factory Cell({
    required String id,
    required String rowId,
    required int columnIndex,
    String? value,
    String? formula,
    String? color,
    required bool isCalculated,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Cell;

  /// Get the cell address (e.g., "A1").
  String getAddress(int rowIndex) {
    return getCellAddress(rowIndex, columnIndex);
  }

  /// Check if cell has a color set.
  bool get hasColor => color != null && color!.isNotEmpty && color != '#FFFFFF';
}

// =============================================================================
// Cell Addressing Utilities
// =============================================================================

/// Convert column index (0-based) to column letter.
/// 0 -> A, 25 -> Z, 26 -> AA, etc.
String columnIndexToLetter(int index) {
  String result = '';
  int temp = index;

  while (temp >= 0) {
    result = String.fromCharCode('A'.codeUnitAt(0) + (temp % 26)) + result;
    temp = (temp ~/ 26) - 1;
  }

  return result;
}

/// Convert column letter to column index (0-based).
/// A -> 0, Z -> 25, AA -> 26, etc.
int columnLetterToIndex(String letter) {
  int result = 0;
  final upperLetter = letter.toUpperCase();

  for (int i = 0; i < upperLetter.length; i++) {
    result = result * 26 + (upperLetter.codeUnitAt(i) - 'A'.codeUnitAt(0) + 1);
  }

  return result - 1;
}

/// Get cell address from indices (both 0-based).
/// (0, 0) -> "A1", (0, 1) -> "B1", (1, 0) -> "A2"
String getCellAddress(int rowIndex, int columnIndex) {
  return '${columnIndexToLetter(columnIndex)}${rowIndex + 1}';
}

/// Parse cell address to indices.
/// "A1" -> (rowIndex: 0, columnIndex: 0)
({int rowIndex, int columnIndex})? parseCellAddress(String address) {
  final match = RegExp(r'^([A-Za-z]+)(\d+)$').firstMatch(address.toUpperCase());
  if (match == null) return null;

  final columnLetter = match.group(1)!;
  final rowNumber = int.tryParse(match.group(2)!);

  if (rowNumber == null || rowNumber < 1) return null;

  return (
    rowIndex: rowNumber - 1,
    columnIndex: columnLetterToIndex(columnLetter),
  );
}

// =============================================================================
// Cell Colors
// =============================================================================

/// Predefined color palette for cells.
const List<String> cellColorPalette = [
  '#FFFFFF', // White (default/no color)
  '#FFCDD2', // Light Red
  '#F8BBD9', // Light Pink
  '#E1BEE7', // Light Purple
  '#D1C4E9', // Light Deep Purple
  '#C5CAE9', // Light Indigo
  '#BBDEFB', // Light Blue
  '#B3E5FC', // Light Light Blue
  '#B2EBF2', // Light Cyan
  '#B2DFDB', // Light Teal
  '#C8E6C9', // Light Green
  '#DCEDC8', // Light Light Green
  '#F0F4C3', // Light Lime
  '#FFF9C4', // Light Yellow
  '#FFECB3', // Light Amber
  '#FFE0B2', // Light Orange
  '#FFCCBC', // Light Deep Orange
  '#D7CCC8', // Light Brown
  '#F5F5F5', // Light Grey
  '#CFD8DC', // Light Blue Grey
];

/// Check if a hex color string is valid.
bool isValidHexColor(String color) {
  return RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(color);
}
