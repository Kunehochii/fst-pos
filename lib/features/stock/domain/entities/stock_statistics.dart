import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_statistics.freezed.dart';

/// Individual product stock data.
@freezed
class ProductStock with _$ProductStock {
  const ProductStock._();

  const factory ProductStock({
    required String productId,
    required String productName,
    required double sold,
    required double transferredKahon,
    required double otherTransfers,
    required double total,
  }) = _ProductStock;

  /// Get the display name (truncated).
  String get displayName {
    // Use productName directly, truncation handled by server
    return productName;
  }
}

/// Stock statistics summary for printing.
@freezed
class StockStatistics with _$StockStatistics {
  const StockStatistics._();

  const factory StockStatistics({
    /// Date range string for display
    required String dateRange,

    /// Regular products (rice, etc.)
    required List<ProductStock> regularProducts,
    required StockTotals regularTotals,
    required List<String> regularPrinterLines,

    /// Plastic products
    required List<ProductStock> plasticProducts,
    required StockTotals plasticTotals,
    required List<String> plasticPrinterLines,
  }) = _StockStatistics;

  /// Get all products combined.
  List<ProductStock> get allProducts =>
      [...regularProducts, ...plasticProducts];

  /// Check if there's any stock data.
  bool get hasData => regularProducts.isNotEmpty || plasticProducts.isNotEmpty;
}

/// Totals for a category of stock.
@freezed
class StockTotals with _$StockTotals {
  const factory StockTotals({
    required double sold,
    required double transferredKahon,
    required double otherTransfers,
    required double total,
  }) = _StockTotals;
}

/// Filter parameters for stock statistics queries.
@freezed
class StockFilter with _$StockFilter {
  const factory StockFilter({
    DateTime? startDate,
    DateTime? endDate,
  }) = _StockFilter;
}
