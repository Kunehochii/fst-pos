import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/stock_statistics.dart';

part 'stock_statistics_model.freezed.dart';
part 'stock_statistics_model.g.dart';

/// Product stock model for API serialization.
@freezed
class ProductStockModel with _$ProductStockModel {
  const ProductStockModel._();

  const factory ProductStockModel({
    @JsonKey(name: 'productId') required String productId,
    @JsonKey(name: 'productName') required String productName,
    required double sold,
    @JsonKey(name: 'transferredKahon') required double transferredKahon,
    @JsonKey(name: 'otherTransfers') required double otherTransfers,
    required double total,
  }) = _ProductStockModel;

  factory ProductStockModel.fromJson(Map<String, dynamic> json) =>
      _$ProductStockModelFromJson(json);

  /// Convert to domain entity.
  ProductStock toEntity() => ProductStock(
        productId: productId,
        productName: productName,
        sold: sold,
        transferredKahon: transferredKahon,
        otherTransfers: otherTransfers,
        total: total,
      );
}

/// Stock totals model for API serialization.
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

/// Stock statistics model for API serialization.
@freezed
class StockStatisticsModel with _$StockStatisticsModel {
  const StockStatisticsModel._();

  const factory StockStatisticsModel({
    @JsonKey(name: 'dateRange') required String dateRange,
    @JsonKey(name: 'regular') required StockCategoryModel regular,
    @JsonKey(name: 'plastic') required StockCategoryModel plastic,
  }) = _StockStatisticsModel;

  factory StockStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StockStatisticsModelFromJson(json);

  /// Convert to domain entity.
  StockStatistics toEntity() => StockStatistics(
        dateRange: dateRange,
        regularProducts: regular.products.map((p) => p.toEntity()).toList(),
        regularTotals: regular.totals.toEntity(),
        regularPrinterLines: regular.printerLines,
        plasticProducts: plastic.products.map((p) => p.toEntity()).toList(),
        plasticTotals: plastic.totals.toEntity(),
        plasticPrinterLines: plastic.printerLines,
      );
}

/// Stock category model (regular or plastic) for API serialization.
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
