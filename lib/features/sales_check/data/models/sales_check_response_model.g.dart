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
          unitPrice: $checkedConvert('unit_price', (v) => v as String),
          totalAmount: $checkedConvert('total_amount', (v) => v as String),
          paymentMethod: $checkedConvert('payment_method', (v) => v as String),
          isSpecialPrice: $checkedConvert('is_special_price', (v) => v as bool),
          isDiscounted: $checkedConvert('is_discounted', (v) => v as bool),
          discountedPrice:
              $checkedConvert('discounted_price', (v) => v as String?),
          saleDate:
              $checkedConvert('sale_date', (v) => DateTime.parse(v as String)),
          formattedSale: $checkedConvert('formatted_sale', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'unitPrice': 'unit_price',
        'totalAmount': 'total_amount',
        'paymentMethod': 'payment_method',
        'isSpecialPrice': 'is_special_price',
        'isDiscounted': 'is_discounted',
        'discountedPrice': 'discounted_price',
        'saleDate': 'sale_date',
        'formattedSale': 'formatted_sale'
      },
    );

Map<String, dynamic> _$$GroupedSaleItemModelImplToJson(
        _$GroupedSaleItemModelImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'total_amount': instance.totalAmount,
      'payment_method': instance.paymentMethod,
      'is_special_price': instance.isSpecialPrice,
      'is_discounted': instance.isDiscounted,
      if (instance.discountedPrice case final value?) 'discounted_price': value,
      'sale_date': instance.saleDate.toIso8601String(),
      'formatted_sale': instance.formattedSale,
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
          bankTransfer: $checkedConvert('bank_transfer', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'checkAmount': 'check',
        'bankTransfer': 'bank_transfer'
      },
    );

Map<String, dynamic> _$$PaymentTotalsModelImplToJson(
        _$PaymentTotalsModelImpl instance) =>
    <String, dynamic>{
      'cash': instance.cash,
      'check': instance.checkAmount,
      'bank_transfer': instance.bankTransfer,
    };

_$GroupedSaleModelImpl _$$GroupedSaleModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GroupedSaleModelImpl',
      json,
      ($checkedConvert) {
        final val = _$GroupedSaleModelImpl(
          productName: $checkedConvert('product_name', (v) => v as String),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      GroupedSaleItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalQuantity: $checkedConvert('total_quantity', (v) => v as String),
          totalAmount: $checkedConvert('total_amount', (v) => v as String),
          paymentTotals: $checkedConvert('payment_totals',
              (v) => PaymentTotalsModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'productName': 'product_name',
        'totalQuantity': 'total_quantity',
        'totalAmount': 'total_amount',
        'paymentTotals': 'payment_totals'
      },
    );

Map<String, dynamic> _$$GroupedSaleModelImplToJson(
        _$GroupedSaleModelImpl instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total_quantity': instance.totalQuantity,
      'total_amount': instance.totalAmount,
      'payment_totals': instance.paymentTotals.toJson(),
    };

_$SalesSummaryModelImpl _$$SalesSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SalesSummaryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SalesSummaryModelImpl(
          totalQuantity: $checkedConvert('total_quantity', (v) => v as String),
          totalAmount: $checkedConvert('total_amount', (v) => v as String),
          paymentTotals: $checkedConvert('payment_totals',
              (v) => PaymentTotalsModel.fromJson(v as Map<String, dynamic>)),
          transactionCount:
              $checkedConvert('transaction_count', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalQuantity': 'total_quantity',
        'totalAmount': 'total_amount',
        'paymentTotals': 'payment_totals',
        'transactionCount': 'transaction_count'
      },
    );

Map<String, dynamic> _$$SalesSummaryModelImplToJson(
        _$SalesSummaryModelImpl instance) =>
    <String, dynamic>{
      'total_quantity': instance.totalQuantity,
      'total_amount': instance.totalAmount,
      'payment_totals': instance.paymentTotals.toJson(),
      'transaction_count': instance.transactionCount,
    };
