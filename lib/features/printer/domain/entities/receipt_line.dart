import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_line.freezed.dart';

/// Paper size options for POS printers.
enum PaperSize {
  /// 57mm thermal paper - 32 characters per line
  mm57(32, 384),

  /// 80mm thermal paper - 48 characters per line
  mm80(48, 576);

  /// Characters per line for this paper size.
  final int charsPerLine;

  /// Dots per line for image printing.
  final int dotsPerLine;

  const PaperSize(this.charsPerLine, this.dotsPerLine);
}

/// Text alignment options for receipt lines.
enum TextAlign {
  /// Align text to the left (default).
  left,

  /// Align text to the center.
  center,

  /// Align text to the right.
  right,
}

/// Represents a single line item on a receipt.
///
/// Can be:
/// - Simple text with alignment
/// - Two-column text (left + right aligned, like "ITEM NAME" and "PRICE")
/// - A separator line (dashes)
/// - Empty line for spacing
@freezed
class ReceiptLine with _$ReceiptLine {
  const ReceiptLine._();

  /// Simple single text line with alignment.
  const factory ReceiptLine.text({
    required String text,
    @Default(TextAlign.left) TextAlign align,
    @Default(false) bool bold,
  }) = ReceiptLineText;

  /// Two-column layout with left and right text on the same line.
  ///
  /// Example: "RICE 25KG          3 PC"
  ///          "10 pesos      200 pesos"
  const factory ReceiptLine.row({
    required String left,
    required String right,
    @Default(false) bool bold,
  }) = ReceiptLineRow;

  /// A separator line (dashes across the receipt width).
  const factory ReceiptLine.separator({
    @Default('-') String char,
  }) = ReceiptLineSeparator;

  /// An empty line for vertical spacing.
  const factory ReceiptLine.empty() = ReceiptLineEmpty;

  /// Double-height text for headers/totals.
  const factory ReceiptLine.header({
    required String text,
    @Default(TextAlign.center) TextAlign align,
    @Default(true) bool bold,
  }) = ReceiptLineHeader;

  /// Format this line for a specific paper size.
  ///
  /// Returns the formatted string ready for printing.
  String format(PaperSize paperSize) {
    final maxChars = paperSize.charsPerLine;

    return map(
      text: (line) => _formatText(line.text, line.align, maxChars),
      row: (line) => _formatRow(line.left, line.right, maxChars),
      separator: (line) => line.char * maxChars,
      empty: (_) => '',
      header: (line) => _formatText(line.text, line.align, maxChars),
    );
  }

  /// Format single text with alignment.
  String _formatText(String text, TextAlign align, int maxChars) {
    // Truncate if too long
    if (text.length > maxChars) {
      text = text.substring(0, maxChars);
    }

    switch (align) {
      case TextAlign.left:
        return text.padRight(maxChars);
      case TextAlign.right:
        return text.padLeft(maxChars);
      case TextAlign.center:
        final totalPadding = maxChars - text.length;
        final leftPadding = totalPadding ~/ 2;
        final rightPadding = totalPadding - leftPadding;
        return ' ' * leftPadding + text + ' ' * rightPadding;
    }
  }

  /// Format two-column row (left text + right text on same line).
  String _formatRow(String left, String right, int maxChars) {
    // Calculate available space
    // Minimum 1 space between left and right
    final minSpacing = 1;
    final availableForText = maxChars - minSpacing;

    // If combined length exceeds available space, truncate left side
    if (left.length + right.length > availableForText) {
      final maxLeftLength = availableForText - right.length;
      if (maxLeftLength > 3) {
        left = '${left.substring(0, maxLeftLength - 3)}...';
      } else if (maxLeftLength > 0) {
        left = left.substring(0, maxLeftLength);
      } else {
        // Right side is too long, truncate it too
        left = '';
        right = right.substring(0, maxChars);
      }
    }

    // Calculate spacing between left and right
    final spacingLength = maxChars - left.length - right.length;
    return '$left${' ' * spacingLength}$right';
  }
}

/// A complete receipt containing multiple lines.
@freezed
class Receipt with _$Receipt {
  const Receipt._();

  const factory Receipt({
    required List<ReceiptLine> lines,
    @Default(PaperSize.mm80) PaperSize paperSize,
  }) = _Receipt;

  /// Convert receipt to list of formatted strings.
  List<String> toFormattedLines() {
    return lines.map((line) => line.format(paperSize)).toList();
  }

  /// Convert receipt to a single formatted string with newlines.
  String toFormattedString() {
    return toFormattedLines().join('\n');
  }
}

/// Builder for creating receipts with a fluent API.
class ReceiptBuilder {
  final List<ReceiptLine> _lines = [];
  PaperSize _paperSize = PaperSize.mm80;

  /// Set the paper size for this receipt.
  ReceiptBuilder paperSize(PaperSize size) {
    _paperSize = size;
    return this;
  }

  /// Add a simple text line.
  ReceiptBuilder text(String text,
      {TextAlign align = TextAlign.left, bool bold = false}) {
    _lines.add(ReceiptLine.text(text: text, align: align, bold: bold));
    return this;
  }

  /// Add a centered text line.
  ReceiptBuilder center(String text, {bool bold = false}) {
    _lines
        .add(ReceiptLine.text(text: text, align: TextAlign.center, bold: bold));
    return this;
  }

  /// Add a right-aligned text line.
  ReceiptBuilder right(String text, {bool bold = false}) {
    _lines
        .add(ReceiptLine.text(text: text, align: TextAlign.right, bold: bold));
    return this;
  }

  /// Add a header (double-height centered text).
  ReceiptBuilder header(String text,
      {TextAlign align = TextAlign.center, bool bold = true}) {
    _lines.add(ReceiptLine.header(text: text, align: align, bold: bold));
    return this;
  }

  /// Add a two-column row (left + right aligned).
  ReceiptBuilder row(String left, String right, {bool bold = false}) {
    _lines.add(ReceiptLine.row(left: left, right: right, bold: bold));
    return this;
  }

  /// Add a separator line.
  ReceiptBuilder separator({String char = '-'}) {
    _lines.add(ReceiptLine.separator(char: char));
    return this;
  }

  /// Add an empty line.
  ReceiptBuilder empty() {
    _lines.add(const ReceiptLine.empty());
    return this;
  }

  /// Add multiple empty lines.
  ReceiptBuilder emptyLines(int count) {
    for (var i = 0; i < count; i++) {
      _lines.add(const ReceiptLine.empty());
    }
    return this;
  }

  /// Build the receipt.
  Receipt build() {
    return Receipt(lines: List.unmodifiable(_lines), paperSize: _paperSize);
  }
}
