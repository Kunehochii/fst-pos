# Cashier Sheet (Kahon & Inventory) Implementation Guide

> **For AI agents implementing the sheet feature in FST POS Flutter app.**

---

## Overview

The Sheet module provides Excel-style spreadsheet functionality for cashiers. Each cashier has:

- **One Kahon sheet** - Tracks product transfers to the cash register (integers only)
- **One Inventory sheet** - Tracks general inventory (decimals allowed)

**Key Principle:** All calculations are performed on the frontend. The backend only stores raw values, formula strings, and cell metadata.

---

## Quick Reference

| Aspect               | Value                                     |
| -------------------- | ----------------------------------------- |
| **Sheet Types**      | `KAHON`, `INVENTORY`                      |
| **Cell Addressing**  | Excel-style (A1, B2, C3, etc.)            |
| **Formula Syntax**   | Cell refs + operators (`A1+B1*C1-D1/E1`)  |
| **Number Format**    | Kahon: `ceil()`, Inventory: `2 decimals`  |
| **Auth**             | Cashier JWT token                         |
| **Default Columns**  | 10 (A through J)                          |

---

## Architecture

### Feature Structure

```
lib/features/kahon/
├── kahon.dart                    # Barrel export
├── data/
│   ├── datasources/
│   │   └── sheet_remote_datasource.dart
│   ├── models/
│   │   ├── sheet_model.dart
│   │   ├── row_model.dart
│   │   └── cell_model.dart
│   └── repositories/
│       └── sheet_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── sheet_entity.dart
│   │   ├── row_entity.dart
│   │   └── cell_entity.dart
│   ├── repositories/
│   │   └── sheet_repository.dart
│   └── usecases/
│       ├── get_sheet_usecase.dart
│       ├── add_row_usecase.dart
│       ├── update_cells_usecase.dart
│       └── ...
└── presentation/
    ├── pages/
    │   └── kahon_page.dart
    ├── widgets/
    │   ├── sheet_table.dart
    │   ├── cell_editor.dart
    │   ├── cell_display.dart
    │   ├── color_picker.dart
    │   ├── quick_formula_menu.dart
    │   └── sheet_toolbar.dart
    └── providers/
        ├── sheet_provider.dart
        └── sheet_state.dart
```

---

## Data Models

### Sheet Entity

```dart
@freezed
class Sheet with _$Sheet {
  const factory Sheet({
    required String id,
    required SheetType type,
    required String cashierId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<SheetRow> rows,
  }) = _Sheet;
}

enum SheetType { kahon, inventory }
```

### Row Entity

```dart
@freezed
class SheetRow with _$SheetRow {
  const factory SheetRow({
    required String id,
    required int rowIndex,
    required bool isItemRow,
    String? itemName,
    required String sheetId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<Cell> cells,
  }) = _SheetRow;
}
```

### Cell Entity

```dart
@freezed
class Cell with _$Cell {
  const factory Cell({
    required String id,
    required int columnIndex,
    String? value,
    String? formula,
    String? color,
    required bool isCalculated,
    required String rowId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Cell;
}
```

---

## Cell Addressing System

Cells use Excel-style addressing (A1, B2, etc.):

- **Column**: Letter (A=0, B=1, ..., Z=25, AA=26, ...)
- **Row**: 1-based number (Row 0 displays as "1")

### Utility Functions

```dart
/// Convert column index (0-based) to column letter
String columnIndexToLetter(int index) {
  String result = '';
  int temp = index;
  
  while (temp >= 0) {
    result = String.fromCharCode((temp % 26) + 65) + result;
    temp = (temp ~/ 26) - 1;
  }
  
  return result;
}

/// Convert column letter to column index (0-based)
int columnLetterToIndex(String letter) {
  int result = 0;
  final upper = letter.toUpperCase();
  
  for (int i = 0; i < upper.length; i++) {
    result = result * 26 + (upper.codeUnitAt(i) - 64);
  }
  
  return result - 1;
}

/// Get cell address from indices (both 0-based)
String getCellAddress(int rowIndex, int columnIndex) {
  return '${columnIndexToLetter(columnIndex)}${rowIndex + 1}';
}

/// Parse cell address to indices
({int rowIndex, int columnIndex})? parseCellAddress(String address) {
  final match = RegExp(r'^([A-Za-z]+)(\d+)$').firstMatch(address.toUpperCase());
  if (match == null) return null;
  
  return (
    columnIndex: columnLetterToIndex(match.group(1)!),
    rowIndex: int.parse(match.group(2)!) - 1,
  );
}
```

---

## Formula System

### Supported Operators

| Operator | Description    |
| -------- | -------------- |
| `+`      | Addition       |
| `-`      | Subtraction    |
| `*`      | Multiplication |
| `/`      | Division       |
| `()`     | Parentheses    |

### Formula Examples

```
A1+B1           # Add cells A1 and B1
A1*B1           # Multiply cells A1 and B1
A1+B1-C1        # A1 + B1 - C1
(A1+B1)*C1      # (A1 + B1) * C1
A1+A2+A3+A4     # Sum all cells above (if in A5)
```

### Formula Tokenizer

```dart
enum TokenType { cell, number, operator, lparen, rparen }

class FormulaToken {
  final TokenType type;
  final dynamic value; // String for cell/operator, num for number
  final int? rowIndex;
  final int? columnIndex;
  
  FormulaToken.cell(String address, this.rowIndex, this.columnIndex)
    : type = TokenType.cell, value = address;
  FormulaToken.number(num n) 
    : type = TokenType.number, value = n, rowIndex = null, columnIndex = null;
  FormulaToken.operator(String op) 
    : type = TokenType.operator, value = op, rowIndex = null, columnIndex = null;
  FormulaToken.lparen() 
    : type = TokenType.lparen, value = '(', rowIndex = null, columnIndex = null;
  FormulaToken.rparen() 
    : type = TokenType.rparen, value = ')', rowIndex = null, columnIndex = null;
}

List<FormulaToken> tokenizeFormula(String formula) {
  final tokens = <FormulaToken>[];
  int i = 0;
  final clean = formula.trim();
  
  while (i < clean.length) {
    final char = clean[i];
    
    // Skip whitespace
    if (char == ' ' || char == '\t') {
      i++;
      continue;
    }
    
    // Operators
    if (['+', '-', '*', '/'].contains(char)) {
      tokens.add(FormulaToken.operator(char));
      i++;
      continue;
    }
    
    // Parentheses
    if (char == '(') {
      tokens.add(FormulaToken.lparen());
      i++;
      continue;
    }
    if (char == ')') {
      tokens.add(FormulaToken.rparen());
      i++;
      continue;
    }
    
    // Cell reference (starts with letter)
    if (RegExp(r'[A-Za-z]').hasMatch(char)) {
      String cellRef = '';
      while (i < clean.length && RegExp(r'[A-Za-z0-9]').hasMatch(clean[i])) {
        cellRef += clean[i];
        i++;
      }
      final parsed = parseCellAddress(cellRef);
      if (parsed != null) {
        tokens.add(FormulaToken.cell(
          cellRef.toUpperCase(), 
          parsed.rowIndex, 
          parsed.columnIndex,
        ));
      }
      continue;
    }
    
    // Number
    if (RegExp(r'[0-9.]').hasMatch(char)) {
      String numStr = '';
      while (i < clean.length && RegExp(r'[0-9.]').hasMatch(clean[i])) {
        numStr += clean[i];
        i++;
      }
      final num = double.tryParse(numStr);
      if (num != null) {
        tokens.add(FormulaToken.number(num));
      }
      continue;
    }
    
    i++; // Skip unknown
  }
  
  return tokens;
}
```

### Formula Evaluator

```dart
typedef CellValueLookup = double Function(int rowIndex, int columnIndex);

double evaluateFormula(String formula, CellValueLookup getCellValue) {
  final tokens = tokenizeFormula(formula);
  int pos = 0;
  
  FormulaToken? peek() => pos < tokens.length ? tokens[pos] : null;
  FormulaToken? consume() => pos < tokens.length ? tokens[pos++] : null;
  
  double parsePrimary() {
    final token = peek();
    if (token == null) return 0;
    
    if (token.type == TokenType.number) {
      consume();
      return (token.value as num).toDouble();
    }
    
    if (token.type == TokenType.cell) {
      consume();
      return getCellValue(token.rowIndex!, token.columnIndex!);
    }
    
    if (token.type == TokenType.lparen) {
      consume(); // consume '('
      final result = parseExpression();
      if (peek()?.type == TokenType.rparen) {
        consume(); // consume ')'
      }
      return result;
    }
    
    // Unary minus
    if (token.type == TokenType.operator && token.value == '-') {
      consume();
      return -parsePrimary();
    }
    
    return 0;
  }
  
  double parseTerm() {
    double left = parsePrimary();
    
    while (true) {
      final token = peek();
      if (token?.type == TokenType.operator && 
          (token!.value == '*' || token.value == '/')) {
        consume();
        final right = parsePrimary();
        if (token.value == '*') {
          left = left * right;
        } else {
          left = right != 0 ? left / right : 0;
        }
      } else {
        break;
      }
    }
    
    return left;
  }
  
  double parseExpression() {
    double left = parseTerm();
    
    while (true) {
      final token = peek();
      if (token?.type == TokenType.operator && 
          (token!.value == '+' || token.value == '-')) {
        consume();
        final right = parseTerm();
        if (token.value == '+') {
          left = left + right;
        } else {
          left = left - right;
        }
      } else {
        break;
      }
    }
    
    return left;
  }
  
  return parseExpression();
}
```

---

## Quick Formula Generators

### Types

```dart
enum QuickFormulaType {
  sumAllAbove,      // Sum all cells above in column
  sumAbove2,        // Sum 2 cells above
  subtractAbove2,   // Subtract 2 cells above
  subtractAllAbove, // Subtract all cells above
  multiplyLeft2,    // Multiply 2 cells to the left
  addLeft2,         // Add 2 cells to the left
  multiplyAllRows,  // Apply multiply to all rows (bulk)
  addAllRows,       // Apply add to all rows (bulk)
}
```

### Generator Functions

```dart
/// Generate formula to sum all cells above
String generateSumAllAboveFormula(int currentRowIndex, int columnIndex) {
  if (currentRowIndex <= 0) return '';
  
  final parts = <String>[];
  for (int row = 0; row < currentRowIndex; row++) {
    parts.add(getCellAddress(row, columnIndex));
  }
  return parts.join('+');
}

/// Generate formula to sum N cells above
String generateSumAboveFormula(int currentRowIndex, int columnIndex, [int count = 2]) {
  final parts = <String>[];
  for (int i = 1; i <= count && currentRowIndex - i >= 0; i++) {
    parts.add(getCellAddress(currentRowIndex - i, columnIndex));
  }
  return parts.reversed.join('+');
}

/// Generate formula to subtract N cells above
String generateSubtractAboveFormula(int currentRowIndex, int columnIndex, [int count = 2]) {
  final parts = <String>[];
  for (int i = 1; i <= count && currentRowIndex - i >= 0; i++) {
    parts.add(getCellAddress(currentRowIndex - i, columnIndex));
  }
  return parts.reversed.join('-');
}

/// Generate formula to subtract all cells above
String generateSubtractAllAboveFormula(int currentRowIndex, int columnIndex) {
  if (currentRowIndex <= 0) return '';
  
  final parts = <String>[];
  for (int row = 0; row < currentRowIndex; row++) {
    parts.add(getCellAddress(row, columnIndex));
  }
  return parts.join('-');
}

/// Generate formula to multiply N cells to the left
String generateMultiplyLeftFormula(int rowIndex, int currentColumnIndex, [int count = 2]) {
  final parts = <String>[];
  for (int i = 1; i <= count && currentColumnIndex - i >= 0; i++) {
    parts.add(getCellAddress(rowIndex, currentColumnIndex - i));
  }
  return parts.reversed.join('*');
}

/// Generate formula to add N cells to the left
String generateAddLeftFormula(int rowIndex, int currentColumnIndex, [int count = 2]) {
  final parts = <String>[];
  for (int i = 1; i <= count && currentColumnIndex - i >= 0; i++) {
    parts.add(getCellAddress(rowIndex, currentColumnIndex - i));
  }
  return parts.reversed.join('+');
}
```

---

## Number Formatting

```dart
enum FormatMode { 
  defaultMode,  // Removes trailing zeros, up to 4 decimals
  ceil,         // Round up to integer (Kahon sheets)
  decimal,      // 2 decimal places (Inventory sheets)
}

String formatCellNumber(double value, [FormatMode mode = FormatMode.defaultMode]) {
  switch (mode) {
    case FormatMode.ceil:
      return value.ceil().toString();
    case FormatMode.decimal:
      return value.toStringAsFixed(2);
    case FormatMode.defaultMode:
    default:
      if (value == value.truncate()) {
        return value.truncate().toString();
      }
      // Format with up to 4 decimal places, remove trailing zeros
      String formatted = value.toStringAsFixed(4);
      // Remove trailing zeros
      while (formatted.endsWith('0')) {
        formatted = formatted.substring(0, formatted.length - 1);
      }
      if (formatted.endsWith('.')) {
        formatted = formatted.substring(0, formatted.length - 1);
      }
      return formatted;
  }
}

/// Get format mode based on sheet type
FormatMode getFormatMode(SheetType type) {
  return type == SheetType.kahon ? FormatMode.ceil : FormatMode.decimal;
}
```

---

## Cell Colors

### Color Palette

```dart
const List<String> cellColorPalette = [
  '#FFFFFF', // White (default/no color)
  '#FFE4E1', // Misty Rose
  '#FFE4B5', // Moccasin
  '#FFFACD', // Lemon Chiffon
  '#E0FFE0', // Light Green
  '#E0FFFF', // Light Cyan
  '#E6E6FA', // Lavender
  '#FFE4E1', // Light Pink
  '#D3D3D3', // Light Gray
  '#FFDAB9', // Peach Puff
];

bool isValidHexColor(String color) {
  return RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(color);
}

Color? parseHexColor(String? hex) {
  if (hex == null || !isValidHexColor(hex)) return null;
  return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
}
```

---

## API Endpoints

### Cashier Endpoints (Use JWT from `flutter_secure_storage`)

| Method | Endpoint              | Description                    |
| ------ | --------------------- | ------------------------------ |
| GET    | `/sheet/kahon`        | Get Kahon sheet with all rows  |
| GET    | `/sheet/kahon/date`   | Get Kahon sheet filtered by date |
| GET    | `/sheet/inventory`    | Get Inventory sheet            |
| GET    | `/sheet/inventory/date` | Get Inventory sheet by date  |
| POST   | `/sheet/row`          | Add single row                 |
| POST   | `/sheet/rows`         | Add multiple rows              |
| DELETE | `/sheet/row/:id`      | Delete a row                   |
| PATCH  | `/sheet/row/reorder`  | Reorder a row                  |
| PATCH  | `/sheet/rows/positions` | Batch update row positions   |
| POST   | `/sheet/cell`         | Add single cell                |
| POST   | `/sheet/cells`        | Add multiple cells             |
| PATCH  | `/sheet/cell/:id`     | Update single cell             |
| PATCH  | `/sheet/cells`        | Update multiple cells          |
| DELETE | `/sheet/cell/:id`     | Delete a cell                  |

### Request/Response Examples

#### Get Sheet by Date

```dart
// Request
GET /sheet/kahon/date?startDate=2025-12-09T16:00:00.000Z&endDate=2025-12-10T15:59:59.999Z
Authorization: Bearer <cashier_jwt_token>

// Response
{
  "id": "sheet_abc123",
  "type": "KAHON",
  "cashierId": "cashier_xyz",
  "createdAt": "2025-01-01T00:00:00.000Z",
  "updatedAt": "2025-12-10T10:00:00.000Z",
  "rows": [
    {
      "id": "row_1",
      "rowIndex": 0,
      "isItemRow": true,
      "itemName": "Product A",
      "sheetId": "sheet_abc123",
      "createdAt": "2025-12-10T08:00:00.000Z",
      "updatedAt": "2025-12-10T08:00:00.000Z",
      "cells": [
        {
          "id": "cell_1",
          "columnIndex": 0,
          "value": "100",
          "formula": null,
          "color": null,
          "isCalculated": false,
          "rowId": "row_1",
          "createdAt": "2025-12-10T08:00:00.000Z",
          "updatedAt": "2025-12-10T08:00:00.000Z"
        }
      ]
    }
  ]
}
```

#### Add Row

```dart
// Request
POST /sheet/row
Authorization: Bearer <cashier_jwt_token>
Content-Type: application/json

{
  "sheetId": "sheet_abc123",
  "rowIndex": 5,
  "isItemRow": true,
  "itemName": "New Product",
  "createdAt": "2025-12-10T08:00:00.000Z",  // Optional: custom date
  "cells": [  // Optional: if omitted, creates empty cells for all columns
    {
      "columnIndex": 0,
      "value": "50"
    },
    {
      "columnIndex": 1,
      "value": null,
      "formula": "A6*2"
    }
  ]
}
```

#### Update Multiple Cells

```dart
// Request
PATCH /sheet/cells
Authorization: Bearer <cashier_jwt_token>
Content-Type: application/json

{
  "cells": [
    {
      "id": "cell_1",
      "value": "150",
      "formula": null,
      "color": "#FFE4E1"
    },
    {
      "id": "cell_2",
      "value": "300",
      "formula": "A1*2",
      "isCalculated": true
    }
  ]
}
```

---

## Timezone Handling

**Critical:** All date queries use ISO 8601 UTC format. Convert local times properly.

```dart
/// Get date range for API query (user's local date -> UTC)
({String startDate, String endDate}) getDateRangeForApi(DateTime date) {
  final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
  final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  
  return (
    startDate: startOfDay.toUtc().toIso8601String(),
    endDate: endOfDay.toUtc().toIso8601String(),
  );
}

// Example: User in Manila (UTC+8) queries "Dec 10, 2025"
// startDate: "2025-12-09T16:00:00.000Z" 
// endDate: "2025-12-10T15:59:59.999Z"
```

---

## State Management

### Sheet Provider

```dart
@riverpod
class SheetNotifier extends _$SheetNotifier {
  @override
  FutureOr<Sheet?> build(SheetType type, DateTime date) async {
    return _fetchSheet(type, date);
  }
  
  Future<Sheet?> _fetchSheet(SheetType type, DateTime date) async {
    final repository = ref.watch(sheetRepositoryProvider);
    final dateRange = getDateRangeForApi(date);
    
    return type == SheetType.kahon
      ? repository.getKahonSheet(dateRange.startDate, dateRange.endDate)
      : repository.getInventorySheet(dateRange.startDate, dateRange.endDate);
  }
  
  Future<void> addRow(AddRowInput input) async {
    final repository = ref.watch(sheetRepositoryProvider);
    await repository.addRow(input);
    ref.invalidateSelf(); // Refresh
  }
  
  Future<void> updateCells(EditCellsInput input) async {
    final repository = ref.watch(sheetRepositoryProvider);
    await repository.updateCells(input);
    ref.invalidateSelf();
  }
  
  // ... more methods
}
```

### Pending Changes (Optimistic Updates)

Track cell changes locally before saving to allow batch updates:

```dart
@riverpod
class PendingChanges extends _$PendingChanges {
  @override
  Map<String, PendingCellChange> build() => {};
  
  void addChange(PendingCellChange change) {
    final key = '${change.rowId}-${change.columnIndex}';
    state = {...state, key: change};
  }
  
  void clearChanges() {
    state = {};
  }
  
  bool get hasChanges => state.isNotEmpty;
}

class PendingCellChange {
  final String? cellId; // null = new cell
  final String rowId;
  final int columnIndex;
  final String? value;
  final String? formula;
  final String? color;
  
  const PendingCellChange({
    this.cellId,
    required this.rowId,
    required this.columnIndex,
    this.value,
    this.formula,
    this.color,
  });
}
```

---

## UI Components

### Sheet Table

Main table component with:
- Column headers (A, B, C, ...)
- Row selection checkboxes
- Drag-to-reorder rows
- Click to select cell
- Double-click to edit cell

```dart
class SheetTable extends ConsumerWidget {
  final List<SheetRow> rows;
  final Set<String> selectedRowIds;
  final ({int rowIndex, int columnIndex})? editingCell;
  final ({int rowIndex, int columnIndex})? selectedCell;
  final SheetType sheetType;
  final void Function(Set<String>) onRowSelectionChange;
  final void Function(int rowIndex, int columnIndex, Cell?) onCellSelect;
  final void Function(String rowId, int columnIndex) onCellEdit;
  final void Function(String rowId, String? cellId, int columnIndex, String? value, String? formula) onCellSave;
  final void Function() onCellEditCancel;
  final void Function(String rowId, int newIndex) onRowReorder;
  
  // ...
}
```

### Cell Editor

Inline editor for cell values/formulas:

```dart
class CellEditor extends StatefulWidget {
  final String? value;
  final String? formula;
  final int rowIndex;
  final int columnIndex;
  final bool isEditing;
  final CellValueLookup getCellValue;
  final void Function(String? value, String? formula) onSave;
  final VoidCallback onCancel;
  
  // Features:
  // - Show cell address (e.g., "A1")
  // - Auto-detect formulas (has cell refs + operators)
  // - Show formula preview while editing
  // - Enter to save, Escape to cancel
}
```

### Cell Display

Read-only cell view with:
- Value display
- Formula indicator (blue text)
- Background color
- Selection ring

```dart
class CellDisplay extends StatelessWidget {
  final String? value;
  final String? formula;
  final String? color;
  final bool isSelected;
  final VoidCallback onClick;
  final VoidCallback onDoubleClick;
  
  // ...
}
```

### Color Picker

Popover with:
- Preset color palette grid
- Custom hex input
- Clear color button

### Quick Formula Menu

Dropdown menu with:
- Single cell formulas (sum above, subtract above, etc.)
- Bulk formulas (apply to all rows)
- Icons and descriptions
- Disabled state based on cell position

### Sheet Toolbar

Contains:
- Add Row button/dialog
- Delete Selected Rows button
- Quick Formula menu
- Color Picker
- Save Changes button
- Reorder hint

---

## Workflow

### Editing Flow

1. User clicks cell → `selectedCell` updated
2. User double-clicks → `editingCell` set, show `CellEditor`
3. User types value/formula
4. User presses Enter:
   - Detect if formula (has cell refs + operators)
   - If formula: evaluate and store both value and formula
   - Add to `pendingChanges`
5. User clicks Save Changes:
   - Separate existing cells (update) vs new cells (create)
   - Call `PATCH /sheet/cells` for updates
   - Call `POST /sheet/cells` for new cells
   - Clear pending changes
   - Refresh sheet data

### Formula Auto-Detection

```dart
bool isLikelyFormula(String input) {
  final hasFormulaChars = RegExp(r'[\+\-\*\/]').hasMatch(input);
  final hasCellRef = RegExp(r'[A-Za-z]+\d+').hasMatch(input);
  return hasFormulaChars && hasCellRef;
}
```

### Cell Value Lookup (for formula evaluation)

```dart
CellValueLookup createCellValueLookup(
  List<SheetRow> rows,
  Map<String, PendingCellChange> pendingChanges,
) {
  return (int rowIndex, int columnIndex) {
    // Check pending changes first
    final pendingKey = rows
      .where((r) => r.rowIndex == rowIndex)
      .map((r) => '${r.id}-$columnIndex')
      .firstOrNull;
    
    if (pendingKey != null && pendingChanges.containsKey(pendingKey)) {
      final pending = pendingChanges[pendingKey]!;
      return double.tryParse(pending.value ?? '') ?? 0;
    }
    
    // Fall back to actual cell data
    final row = rows.firstWhereOrNull((r) => r.rowIndex == rowIndex);
    if (row == null) return 0;
    
    final cell = row.cells.firstWhereOrNull((c) => c.columnIndex == columnIndex);
    return double.tryParse(cell?.value ?? '') ?? 0;
  };
}
```

---

## Route Setup

Add to `app_router.dart`:

```dart
GoRoute(
  path: '/kahon',
  name: 'kahon',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: KahonPage(),
  ),
),
```

The route `/kahon` is already defined in `AppRoutes.kahon`. The page will show both Kahon and Inventory sheets via tabs or toggle.

---

## Testing Considerations

1. **Formula Parser Tests**
   - Simple expressions: `A1+B1`, `A1*2`
   - Nested expressions: `(A1+B1)*C1`
   - Edge cases: empty cells, division by zero
   
2. **Cell Addressing Tests**
   - Column letter conversion: A=0, Z=25, AA=26
   - Address parsing: `A1` → (0, 0)
   
3. **Number Formatting Tests**
   - Kahon mode: `ceil()` always
   - Inventory mode: 2 decimal places

4. **Date Range Tests**
   - Timezone conversion
   - Edge cases around midnight

---

## Summary

The Sheet implementation provides:

1. **Excel-style spreadsheet** with cell addressing (A1, B2)
2. **Formula support** with cell references and basic operators
3. **Quick formulas** for common calculations
4. **Cell coloring** for visual organization
5. **Batch editing** with pending changes
6. **Drag-to-reorder** rows
7. **Date filtering** with proper timezone handling
8. **Two sheet types**: Kahon (integers) and Inventory (decimals)

All calculations happen on the frontend. The backend stores raw values, formula strings (not evaluated), and metadata.
