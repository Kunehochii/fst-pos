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
          productId: $checkedConvert('productId', (v) => v as String),
          productName: $checkedConvert('productName', (v) => v as String),
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

Map<String, dynamic> _$$ProductStockModelImplToJson(
        _$ProductStockModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'sold': instance.sold,
      'transferredKahon': instance.transferredKahon,
      'otherTransfers': instance.otherTransfers,
      'total': instance.total,
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

_$StockStatisticsModelImpl _$$StockStatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StockStatisticsModelImpl',
      json,
      ($checkedConvert) {
        final val = _$StockStatisticsModelImpl(
          dateRange: $checkedConvert('dateRange', (v) => v as String),
          regular: $checkedConvert('regular',
              (v) => StockCategoryModel.fromJson(v as Map<String, dynamic>)),
          plastic: $checkedConvert('plastic',
              (v) => StockCategoryModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$StockStatisticsModelImplToJson(
        _$StockStatisticsModelImpl instance) =>
    <String, dynamic>{
      'dateRange': instance.dateRange,
      'regular': instance.regular.toJson(),
      'plastic': instance.plastic.toJson(),
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
