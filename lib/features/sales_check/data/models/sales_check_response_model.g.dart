// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_check_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupedSaleItemModelImpl _$$GroupedSaleItemModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GroupedSaleItemModelImpl',
      json,
      ($checkedConvert) {
        final val = _$GroupedSaleItemModelImpl(
          quantity: $checkedConvert('quantity', (v) => v as String),
          unitPrice: $checkedConvert('unitPrice', (v) => v as String),
          totalAmount: $checkedConvert('totalAmount', (v) => v as String),
          paymentMethod: $checkedConvert('paymentMethod', (v) => v as String),
          isSpecialPrice: $checkedConvert('isSpecialPrice', (v) => v as bool),
          isDiscounted: $checkedConvert('isDiscounted', (v) => v as bool),
          discountedPrice:
              $checkedConvert('discountedPrice', (v) => v as String?),
          saleDate:
              $checkedConvert('saleDate', (v) => DateTime.parse(v as String)),
          formattedSale: $checkedConvert('formattedSale', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GroupedSaleItemModelImplToJson(
        _$GroupedSaleItemModelImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalAmount': instance.totalAmount,
      'paymentMethod': instance.paymentMethod,
      'isSpecialPrice': instance.isSpecialPrice,
      'isDiscounted': instance.isDiscounted,
      if (instance.discountedPrice case final value?) 'discountedPrice': value,
      'saleDate': instance.saleDate.toIso8601String(),
      'formattedSale': instance.formattedSale,
    };

_$PaymentTotalsModelImpl _$$PaymentTotalsModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PaymentTotalsModelImpl',
      json,
      ($checkedConvert) {
        final val = _$PaymentTotalsModelImpl(
          cash: $checkedConvert('cash', (v) => v as String),
          checkAmount: $checkedConvert('check', (v) => v as String),
          bankTransfer: $checkedConvert('bankTransfer', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'checkAmount': 'check'},
    );

Map<String, dynamic> _$$PaymentTotalsModelImplToJson(
        _$PaymentTotalsModelImpl instance) =>
    <String, dynamic>{
      'cash': instance.cash,
      'check': instance.checkAmount,
      'bankTransfer': instance.bankTransfer,
    };

_$GroupedSaleModelImpl _$$GroupedSaleModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GroupedSaleModelImpl',
      json,
      ($checkedConvert) {
        final val = _$GroupedSaleModelImpl(
          productName: $checkedConvert('productName', (v) => v as String),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      GroupedSaleItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalQuantity: $checkedConvert('totalQuantity', (v) => v as String),
          totalAmount: $checkedConvert('totalAmount', (v) => v as String),
          paymentTotals: $checkedConvert('paymentTotals',
              (v) => PaymentTotalsModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GroupedSaleModelImplToJson(
        _$GroupedSaleModelImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'totalQuantity': instance.totalQuantity,
      'totalAmount': instance.totalAmount,
      'paymentTotals': instance.paymentTotals.toJson(),
    };

_$SalesSummaryModelImpl _$$SalesSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SalesSummaryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SalesSummaryModelImpl(
          totalQuantity: $checkedConvert('totalQuantity', (v) => v as String),
          totalAmount: $checkedConvert('totalAmount', (v) => v as String),
          paymentTotals: $checkedConvert('paymentTotals',
              (v) => PaymentTotalsModel.fromJson(v as Map<String, dynamic>)),
          transactionCount:
              $checkedConvert('transactionCount', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SalesSummaryModelImplToJson(
        _$SalesSummaryModelImpl instance) =>
    <String, dynamic>{
      'totalQuantity': instance.totalQuantity,
      'totalAmount': instance.totalAmount,
      'paymentTotals': instance.paymentTotals.toJson(),
      'transactionCount': instance.transactionCount,
    };
