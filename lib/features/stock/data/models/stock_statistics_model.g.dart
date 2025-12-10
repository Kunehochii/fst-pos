// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockModelImpl _$$ProductStockModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProductStockModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ProductStockModelImpl(
          productName: $checkedConvert('productName', (v) => v as String),
          stockSold: $checkedConvert('stockSold', (v) => (v as num).toDouble()),
          stockTransferredKahon: $checkedConvert(
              'stockTransferredKahon', (v) => (v as num).toDouble()),
          stockOtherTransfers: $checkedConvert(
              'stockOtherTransfers', (v) => (v as num).toDouble()),
          total: $checkedConvert('total', (v) => (v as num).toDouble()),
          totalPrice:
              $checkedConvert('totalPrice', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ProductStockModelImplToJson(
        _$ProductStockModelImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'stockSold': instance.stockSold,
      'stockTransferredKahon': instance.stockTransferredKahon,
      'stockOtherTransfers': instance.stockOtherTransfers,
      'total': instance.total,
      if (instance.totalPrice case final value?) 'totalPrice': value,
    };

_$StockTotalsModelImpl _$$StockTotalsModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StockTotalsModelImpl',
      json,
      ($checkedConvert) {
        final val = _$StockTotalsModelImpl(
          sold: $checkedConvert('sold', (v) => (v as num).toDouble()),
          transferredKahon:
              $checkedConvert('transferredKahon', (v) => (v as num).toDouble()),
          otherTransfers:
              $checkedConvert('otherTransfers', (v) => (v as num).toDouble()),
          total: $checkedConvert('total', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$StockTotalsModelImplToJson(
        _$StockTotalsModelImpl instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'transferredKahon': instance.transferredKahon,
      'otherTransfers': instance.otherTransfers,
      'total': instance.total,
    };

_$PrinterCategoryModelImpl _$$PrinterCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PrinterCategoryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$PrinterCategoryModelImpl(
          lines: $checkedConvert('lines',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          totals: $checkedConvert('totals',
              (v) => StockTotalsModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$PrinterCategoryModelImplToJson(
        _$PrinterCategoryModelImpl instance) =>
    <String, dynamic>{
      'lines': instance.lines,
      'totals': instance.totals.toJson(),
    };

_$SummaryCategoryModelImpl _$$SummaryCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SummaryCategoryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SummaryCategoryModelImpl(
          products: $checkedConvert(
              'products',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      ProductStockModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totals: $checkedConvert('totals',
              (v) => StockTotalsModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SummaryCategoryModelImplToJson(
        _$SummaryCategoryModelImpl instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'totals': instance.totals.toJson(),
    };

_$StockSummaryModelImpl _$$StockSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StockSummaryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$StockSummaryModelImpl(
          regular: $checkedConvert('regular',
              (v) => SummaryCategoryModel.fromJson(v as Map<String, dynamic>)),
          asin: $checkedConvert('asin',
              (v) => SummaryCategoryModel.fromJson(v as Map<String, dynamic>)),
          plastic: $checkedConvert('plastic',
              (v) => SummaryCategoryModel.fromJson(v as Map<String, dynamic>)),
          dateRange: $checkedConvert('dateRange', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$StockSummaryModelImplToJson(
        _$StockSummaryModelImpl instance) =>
    <String, dynamic>{
      'regular': instance.regular.toJson(),
      'asin': instance.asin.toJson(),
      'plastic': instance.plastic.toJson(),
      'dateRange': instance.dateRange,
    };

_$StockStatisticsModelImpl _$$StockStatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StockStatisticsModelImpl',
      json,
      ($checkedConvert) {
        final val = _$StockStatisticsModelImpl(
          regular: $checkedConvert('regular',
              (v) => PrinterCategoryModel.fromJson(v as Map<String, dynamic>)),
          asin: $checkedConvert('asin',
              (v) => PrinterCategoryModel.fromJson(v as Map<String, dynamic>)),
          plastic: $checkedConvert('plastic',
              (v) => PrinterCategoryModel.fromJson(v as Map<String, dynamic>)),
          summary: $checkedConvert('summary',
              (v) => StockSummaryModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$StockStatisticsModelImplToJson(
        _$StockStatisticsModelImpl instance) =>
    <String, dynamic>{
      'regular': instance.regular.toJson(),
      'asin': instance.asin.toJson(),
      'plastic': instance.plastic.toJson(),
      'summary': instance.summary.toJson(),
    };

_$StockCategoryModelImpl _$$StockCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StockCategoryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$StockCategoryModelImpl(
          products: $checkedConvert(
              'products',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      ProductStockModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totals: $checkedConvert('totals',
              (v) => StockTotalsModel.fromJson(v as Map<String, dynamic>)),
          printerLines: $checkedConvert('printerLines',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$StockCategoryModelImplToJson(
        _$StockCategoryModelImpl instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'totals': instance.totals.toJson(),
      'printerLines': instance.printerLines,
    };
