import '../entities/sheet.dart';

/// Token types for formula parsing.
enum TokenType { cell, number, operator, lparen, rparen }

/// A token in a formula.
class FormulaToken {
  final TokenType type;
  final String value;

  FormulaToken(this.type, this.value);

  @override
  String toString() => 'FormulaToken($type, $value)';
}

/// Tokenize a formula string into tokens.
///
/// Example: "A1+B1*2" -> [cell(A1), op(+), cell(B1), op(*), num(2)]
List<FormulaToken> tokenizeFormula(String formula) {
  final tokens = <FormulaToken>[];
  final chars = formula.toUpperCase().split('');
  int i = 0;

  while (i < chars.length) {
    final c = chars[i];

    // Skip whitespace
    if (c == ' ') {
      i++;
      continue;
    }

    // Parentheses
    if (c == '(') {
      tokens.add(FormulaToken(TokenType.lparen, c));
      i++;
      continue;
    }
    if (c == ')') {
      tokens.add(FormulaToken(TokenType.rparen, c));
      i++;
      continue;
    }

    // Operators
    if (['+', '-', '*', '/'].contains(c)) {
      tokens.add(FormulaToken(TokenType.operator, c));
      i++;
      continue;
    }

    // Cell reference (letter(s) followed by number(s))
    if (RegExp(r'[A-Z]').hasMatch(c)) {
      String cellRef = '';

      // Get column letters
      while (i < chars.length && RegExp(r'[A-Z]').hasMatch(chars[i])) {
        cellRef += chars[i];
        i++;
      }

      // Get row numbers
      while (i < chars.length && RegExp(r'[0-9]').hasMatch(chars[i])) {
        cellRef += chars[i];
        i++;
      }

      // Validate it's a proper cell reference
      if (parseCellAddress(cellRef) != null) {
        tokens.add(FormulaToken(TokenType.cell, cellRef));
      } else {
        // Invalid cell reference, skip
        continue;
      }
      continue;
    }

    // Number (including decimals)
    if (RegExp(r'[0-9.]').hasMatch(c)) {
      String num = '';
      while (i < chars.length && RegExp(r'[0-9.]').hasMatch(chars[i])) {
        num += chars[i];
        i++;
      }
      tokens.add(FormulaToken(TokenType.number, num));
      continue;
    }

    // Unknown character, skip
    i++;
  }

  return tokens;
}

/// Function type for looking up cell values.
typedef CellValueLookup = double Function(int rowIndex, int columnIndex);

/// Evaluate a formula and return the result.
///
/// Uses a simple recursive descent parser supporting:
/// - Cell references (A1, B2, etc.)
/// - Numbers (integers and decimals)
/// - Operators (+, -, *, /)
/// - Parentheses for grouping
double evaluateFormula(String formula, CellValueLookup getCellValue) {
  final tokens = tokenizeFormula(formula);
  if (tokens.isEmpty) return 0;

  final parser = _FormulaParser(tokens, getCellValue);
  return parser.parseExpression();
}

/// Internal parser class for formula evaluation.
class _FormulaParser {
  final List<FormulaToken> tokens;
  final CellValueLookup getCellValue;
  int pos = 0;

  _FormulaParser(this.tokens, this.getCellValue);

  double parseExpression() {
    double result = parseTerm();

    while (pos < tokens.length) {
      final token = tokens[pos];
      if (token.type == TokenType.operator &&
          (token.value == '+' || token.value == '-')) {
        pos++;
        final right = parseTerm();
        if (token.value == '+') {
          result += right;
        } else {
          result -= right;
        }
      } else {
        break;
      }
    }

    return result;
  }

  double parseTerm() {
    double result = parseFactor();

    while (pos < tokens.length) {
      final token = tokens[pos];
      if (token.type == TokenType.operator &&
          (token.value == '*' || token.value == '/')) {
        pos++;
        final right = parseFactor();
        if (token.value == '*') {
          result *= right;
        } else {
          if (right != 0) {
            result /= right;
          } else {
            result = 0; // Division by zero returns 0
          }
        }
      } else {
        break;
      }
    }

    return result;
  }

  double parseFactor() {
    if (pos >= tokens.length) return 0;

    final token = tokens[pos];

    // Handle parentheses
    if (token.type == TokenType.lparen) {
      pos++; // Skip '('
      final result = parseExpression();
      if (pos < tokens.length && tokens[pos].type == TokenType.rparen) {
        pos++; // Skip ')'
      }
      return result;
    }

    // Handle cell reference
    if (token.type == TokenType.cell) {
      pos++;
      final parsed = parseCellAddress(token.value);
      if (parsed != null) {
        return getCellValue(parsed.rowIndex, parsed.columnIndex);
      }
      return 0;
    }

    // Handle number
    if (token.type == TokenType.number) {
      pos++;
      return double.tryParse(token.value) ?? 0;
    }

    // Handle negative numbers
    if (token.type == TokenType.operator && token.value == '-') {
      pos++;
      return -parseFactor();
    }

    return 0;
  }
}

/// Check if a string is likely a formula (contains cell references and operators).
bool isLikelyFormula(String input) {
  // Must contain at least one operator
  final hasOperator = RegExp(r'[\+\-\*\/]').hasMatch(input);
  if (!hasOperator) return false;

  // Must contain at least one cell reference (letter followed by number)
  final hasCellRef = RegExp(r'[A-Za-z]+\d+').hasMatch(input);
  return hasCellRef;
}
