// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupedProfitModelImpl _$$GroupedProfitModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GroupedProfitModelImpl',
      json,
      ($checkedConvert) {
        final val = _$GroupedProfitModelImpl(
          productName: $checkedConvert('productName', (v) => v as String),
          priceType: $checkedConvert('priceType', (v) => v as String),
          profitPerUnit: $checkedConvert('profitPerUnit', (v) => v as String),
          totalQuantity: $checkedConvert('totalQuantity', (v) => v as String),
          totalProfit: $checkedConvert('totalProfit', (v) => v as String),
          orderCount: $checkedConvert('orderCount', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GroupedProfitModelImplToJson(
        _$GroupedProfitModelImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'priceType': instance.priceType,
      'profitPerUnit': instance.profitPerUnit,
      'totalQuantity': instance.totalQuantity,
      'totalProfit': instance.totalProfit,
      'orderCount': instance.orderCount,
    };

_$ProfitPaymentTotalsModelImpl _$$ProfitPaymentTotalsModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProfitPaymentTotalsModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ProfitPaymentTotalsModelImpl(
          cash: $checkedConvert('cash', (v) => v as String),
          checkAmount: $checkedConvert('check', (v) => v as String),
          bankTransfer: $checkedConvert('bankTransfer', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'checkAmount': 'check'},
    );

Map<String, dynamic> _$$ProfitPaymentTotalsModelImplToJson(
        _$ProfitPaymentTotalsModelImpl instance) =>
    <String, dynamic>{
      'cash': instance.cash,
      'check': instance.checkAmount,
      'bankTransfer': instance.bankTransfer,
    };

_$ProfitSummaryModelImpl _$$ProfitSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProfitSummaryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ProfitSummaryModelImpl(
          totalQuantity: $checkedConvert('totalQuantity', (v) => v as String),
          totalProfit: $checkedConvert('totalProfit', (v) => v as String),
          paymentTotals: $checkedConvert(
              'paymentTotals',
              (v) =>
                  ProfitPaymentTotalsModel.fromJson(v as Map<String, dynamic>)),
          transactionCount:
              $checkedConvert('transactionCount', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ProfitSummaryModelImplToJson(
        _$ProfitSummaryModelImpl instance) =>
    <String, dynamic>{
      'totalQuantity': instance.totalQuantity,
      'totalProfit': instance.totalProfit,
      'paymentTotals': instance.paymentTotals.toJson(),
      'transactionCount': instance.transactionCount,
    };
