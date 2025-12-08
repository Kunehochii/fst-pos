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
          productName: $checkedConvert('product_name', (v) => v as String),
          priceType: $checkedConvert('price_type', (v) => v as String),
          profitPerUnit: $checkedConvert('profit_per_unit', (v) => v as String),
          totalQuantity: $checkedConvert('total_quantity', (v) => v as String),
          totalProfit: $checkedConvert('total_profit', (v) => v as String),
          orderCount: $checkedConvert('order_count', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'productName': 'product_name',
        'priceType': 'price_type',
        'profitPerUnit': 'profit_per_unit',
        'totalQuantity': 'total_quantity',
        'totalProfit': 'total_profit',
        'orderCount': 'order_count'
      },
    );

Map<String, dynamic> _$$GroupedProfitModelImplToJson(
        _$GroupedProfitModelImpl instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'price_type': instance.priceType,
      'profit_per_unit': instance.profitPerUnit,
      'total_quantity': instance.totalQuantity,
      'total_profit': instance.totalProfit,
      'order_count': instance.orderCount,
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
          bankTransfer: $checkedConvert('bank_transfer', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'checkAmount': 'check',
        'bankTransfer': 'bank_transfer'
      },
    );

Map<String, dynamic> _$$ProfitPaymentTotalsModelImplToJson(
        _$ProfitPaymentTotalsModelImpl instance) =>
    <String, dynamic>{
      'cash': instance.cash,
      'check': instance.checkAmount,
      'bank_transfer': instance.bankTransfer,
    };

_$ProfitSummaryModelImpl _$$ProfitSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProfitSummaryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ProfitSummaryModelImpl(
          totalQuantity: $checkedConvert('total_quantity', (v) => v as String),
          totalProfit: $checkedConvert('total_profit', (v) => v as String),
          paymentTotals: $checkedConvert(
              'payment_totals',
              (v) =>
                  ProfitPaymentTotalsModel.fromJson(v as Map<String, dynamic>)),
          transactionCount:
              $checkedConvert('transaction_count', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalQuantity': 'total_quantity',
        'totalProfit': 'total_profit',
        'paymentTotals': 'payment_totals',
        'transactionCount': 'transaction_count'
      },
    );

Map<String, dynamic> _$$ProfitSummaryModelImplToJson(
        _$ProfitSummaryModelImpl instance) =>
    <String, dynamic>{
      'total_quantity': instance.totalQuantity,
      'total_profit': instance.totalProfit,
      'payment_totals': instance.paymentTotals.toJson(),
      'transaction_count': instance.transactionCount,
    };
