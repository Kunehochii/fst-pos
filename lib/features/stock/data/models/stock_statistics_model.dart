import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/stock_statistics.dart';

part 'stock_statistics_model.freezed.dart';
part 'stock_statistics_model.g.dart';

/// Product stock model for API serialization.
@freezed
class ProductStockModel with _$ProductStockModel {
  const ProductStockModel._();

  const factory ProductStockModel({
    @JsonKey(name: 'productName') required String productName,
    @JsonKey(name: 'stockSold') required double stockSold,
    @JsonKey(name: 'stockTransferredKahon')
    required double stockTransferredKahon,
    @JsonKey(name: 'stockOtherTransfers') required double stockOtherTransfers,
    required double total,
    double? totalPrice,
  }) = _ProductStockModel;

  factory ProductStockModel.fromJson(Map<String, dynamic> json) =>
      _$ProductStockModelFromJson(json);

  /// Convert to domain entity.
  ProductStock toEntity() => ProductStock(
        productId: '', // Not provided by API
        productName: productName,
        sold: stockSold,
        transferredKahon: stockTransferredKahon,
        otherTransfers: stockOtherTransfers,
        total: total,
      );
}

/// Stock totals model for API serialization.
/// Maps to the "totals" object in category responses.
@freezed
class StockTotalsModel with _$StockTotalsModel {
  const StockTotalsModel._();

  const factory StockTotalsModel({
    required double sold,
    @JsonKey(name: 'transferredKahon') required double transferredKahon,
    @JsonKey(name: 'otherTransfers') required double otherTransfers,
    required double total,
  }) = _StockTotalsModel;

  factory StockTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$StockTotalsModelFromJson(json);

  /// Convert to domain entity.
  StockTotals toEntity() => StockTotals(
        sold: sold,
        transferredKahon: transferredKahon,
        otherTransfers: otherTransfers,
        total: total,
      );
}

/// Printer format category model (regular, asin, plastic at root level).
/// Contains "lines" and "totals" fields.
@freezed
class PrinterCategoryModel with _$PrinterCategoryModel {
  const PrinterCategoryModel._();

  const factory PrinterCategoryModel({
    required List<String> lines,
    required StockTotalsModel totals,
  }) = _PrinterCategoryModel;

  factory PrinterCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$PrinterCategoryModelFromJson(json);
}

/// Summary category model (inside "summary" object).
/// Contains "products" and "totals" fields.
@freezed
class SummaryCategoryModel with _$SummaryCategoryModel {
  const SummaryCategoryModel._();

  const factory SummaryCategoryModel({
    required List<ProductStockModel> products,
    required StockTotalsModel totals,
  }) = _SummaryCategoryModel;

  factory SummaryCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryCategoryModelFromJson(json);
}

/// Summary model containing products breakdown and date range.
@freezed
class StockSummaryModel with _$StockSummaryModel {
  const StockSummaryModel._();

  const factory StockSummaryModel({
    required SummaryCategoryModel regular,
    required SummaryCategoryModel asin,
    required SummaryCategoryModel plastic,
    required String dateRange,
  }) = _StockSummaryModel;

  factory StockSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$StockSummaryModelFromJson(json);
}

/// Stock statistics model for API serialization.
/// Matches the actual API response structure:
/// {
///   "regular": { "lines": [...], "totals": {...} },
///   "asin": { "lines": [...], "totals": {...} },
///   "plastic": { "lines": [...], "totals": {...} },
///   "summary": {
///     "regular": { "products": [...], "totals": {...} },
///     "asin": { "products": [...], "totals": {...} },
///     "plastic": { "products": [...], "totals": {...} },
///     "dateRange": "..."
///   }
/// }
@freezed
class StockStatisticsModel with _$StockStatisticsModel {
  const StockStatisticsModel._();

  const factory StockStatisticsModel({
    required PrinterCategoryModel regular,
    required PrinterCategoryModel asin,
    required PrinterCategoryModel plastic,
    required StockSummaryModel summary,
  }) = _StockStatisticsModel;

  factory StockStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StockStatisticsModelFromJson(json);

  /// Convert to domain entity.
  StockStatistics toEntity() => StockStatistics(
        dateRange: summary.dateRange,
        regularProducts:
            summary.regular.products.map((p) => p.toEntity()).toList(),
        regularTotals: summary.regular.totals.toEntity(),
        regularPrinterLines: regular.lines,
        plasticProducts:
            summary.plastic.products.map((p) => p.toEntity()).toList(),
        plasticTotals: summary.plastic.totals.toEntity(),
        plasticPrinterLines: plastic.lines,
      );
}

/// Stock category model (deprecated - kept for backwards compatibility).
@freezed
class StockCategoryModel with _$StockCategoryModel {
  const StockCategoryModel._();

  const factory StockCategoryModel({
    required List<ProductStockModel> products,
    required StockTotalsModel totals,
    @JsonKey(name: 'printerLines') required List<String> printerLines,
  }) = _StockCategoryModel;

  factory StockCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$StockCategoryModelFromJson(json);
}
