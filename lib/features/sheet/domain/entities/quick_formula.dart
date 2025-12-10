import 'sheet.dart';

/// Quick formula types for common operations.
enum QuickFormulaType {
  /// Sum all cells above in the column.
  sumAllAbove,

  /// Sum N cells above in the column.
  sumAbove,

  /// Subtract N cells above in the column.
  subtractAbove,

  /// Subtract all cells above in the column.
  subtractAllAbove,

  /// Multiply N cells to the left.
  multiplyLeft,

  /// Add N cells to the left.
  addLeft,
}

/// Generate a formula to sum all cells above in the same column.
///
/// Example: In cell A5, generates "A1+A2+A3+A4"
String generateSumAllAboveFormula(int currentRowIndex, int columnIndex) {
  if (currentRowIndex <= 0) return '';

  final parts = <String>[];
  for (int i = 0; i < currentRowIndex; i++) {
    parts.add(getCellAddress(i, columnIndex));
  }

  return parts.join('+');
}

/// Generate a formula to sum N cells above.
///
/// Example: In A3 with count=2, generates "A1+A2"
String generateSumAboveFormula(
  int currentRowIndex,
  int columnIndex, [
  int count = 2,
]) {
  final parts = <String>[];
  final startRow = (currentRowIndex - count).clamp(0, currentRowIndex);

  for (int i = startRow; i < currentRowIndex; i++) {
    parts.add(getCellAddress(i, columnIndex));
  }

  return parts.join('+');
}

/// Generate a formula to subtract cells above.
///
/// Example: In A3 with count=2, generates "A1-A2"
String generateSubtractAboveFormula(
  int currentRowIndex,
  int columnIndex, [
  int count = 2,
]) {
  final parts = <String>[];
  final startRow = (currentRowIndex - count).clamp(0, currentRowIndex);

  for (int i = startRow; i < currentRowIndex; i++) {
    parts.add(getCellAddress(i, columnIndex));
  }

  return parts.join('-');
}

/// Generate a formula to subtract all cells above.
///
/// Example: In A5, generates "A1-A2-A3-A4"
String generateSubtractAllAboveFormula(int currentRowIndex, int columnIndex) {
  if (currentRowIndex <= 0) return '';

  final parts = <String>[];
  for (int i = 0; i < currentRowIndex; i++) {
    parts.add(getCellAddress(i, columnIndex));
  }

  return parts.join('-');
}

/// Generate a formula to multiply N cells to the left.
///
/// Example: In C1 with count=2, generates "A1*B1"
String generateMultiplyLeftFormula(
  int rowIndex,
  int currentColumnIndex, [
  int count = 2,
]) {
  final parts = <String>[];
  final startCol = (currentColumnIndex - count).clamp(0, currentColumnIndex);

  for (int i = startCol; i < currentColumnIndex; i++) {
    parts.add(getCellAddress(rowIndex, i));
  }

  return parts.join('*');
}

/// Generate a formula to add N cells to the left.
///
/// Example: In C1 with count=2, generates "A1+B1"
String generateAddLeftFormula(
  int rowIndex,
  int currentColumnIndex, [
  int count = 2,
]) {
  final parts = <String>[];
  final startCol = (currentColumnIndex - count).clamp(0, currentColumnIndex);

  for (int i = startCol; i < currentColumnIndex; i++) {
    parts.add(getCellAddress(rowIndex, i));
  }

  return parts.join('+');
}

/// Generate formula based on type.
String generateQuickFormula({
  required QuickFormulaType type,
  required int rowIndex,
  required int columnIndex,
  int count = 2,
}) {
  switch (type) {
    case QuickFormulaType.sumAllAbove:
      return generateSumAllAboveFormula(rowIndex, columnIndex);
    case QuickFormulaType.sumAbove:
      return generateSumAboveFormula(rowIndex, columnIndex, count);
    case QuickFormulaType.subtractAbove:
      return generateSubtractAboveFormula(rowIndex, columnIndex, count);
    case QuickFormulaType.subtractAllAbove:
      return generateSubtractAllAboveFormula(rowIndex, columnIndex);
    case QuickFormulaType.multiplyLeft:
      return generateMultiplyLeftFormula(rowIndex, columnIndex, count);
    case QuickFormulaType.addLeft:
      return generateAddLeftFormula(rowIndex, columnIndex, count);
  }
}
