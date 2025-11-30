// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleItemModelImpl _$$SaleItemModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SaleItemModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SaleItemModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
          discountedPrice:
              $checkedConvert('discounted_price', (v) => v as String?),
          isDiscounted:
              $checkedConvert('is_discounted', (v) => v as bool? ?? false),
          isGantang: $checkedConvert('is_gantang', (v) => v as bool? ?? false),
          isSpecialPrice:
              $checkedConvert('is_special_price', (v) => v as bool? ?? false),
          productId: $checkedConvert('productId', (v) => v as String),
          sackPriceId: $checkedConvert('sack_price_id', (v) => v as String?),
          sackType: $checkedConvert('sack_type', (v) => v as String?),
          perKiloPriceId:
              $checkedConvert('per_kilo_price_id', (v) => v as String?),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
          product: $checkedConvert(
              'product',
              (v) => v == null
                  ? null
                  : ProductModel.fromJson(v as Map<String, dynamic>)),
          sackPrice: $checkedConvert(
              'sack_price',
              (v) => v == null
                  ? null
                  : SackPriceModel.fromJson(v as Map<String, dynamic>)),
          perKiloPrice: $checkedConvert(
              'per_kilo_price',
              (v) => v == null
                  ? null
                  : PerKiloPriceModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'discountedPrice': 'discounted_price',
        'isDiscounted': 'is_discounted',
        'isGantang': 'is_gantang',
        'isSpecialPrice': 'is_special_price',
        'sackPriceId': 'sack_price_id',
        'sackType': 'sack_type',
        'perKiloPriceId': 'per_kilo_price_id',
        'sackPrice': 'sack_price',
        'perKiloPrice': 'per_kilo_price'
      },
    );

Map<String, dynamic> _$$SaleItemModelImplToJson(_$SaleItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
      if (instance.discountedPrice case final value?) 'discounted_price': value,
      'is_discounted': instance.isDiscounted,
      'is_gantang': instance.isGantang,
      'is_special_price': instance.isSpecialPrice,
      'productId': instance.productId,
      if (instance.sackPriceId case final value?) 'sack_price_id': value,
      if (instance.sackType case final value?) 'sack_type': value,
      if (instance.perKiloPriceId case final value?) 'per_kilo_price_id': value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      if (instance.product?.toJson() case final value?) 'product': value,
      if (instance.sackPrice?.toJson() case final value?) 'sack_price': value,
      if (instance.perKiloPrice?.toJson() case final value?)
        'per_kilo_price': value,
    };

_$SaleModelImpl _$$SaleModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SaleModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SaleModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          totalAmount: $checkedConvert('totalAmount', (v) => v as String),
          paymentMethod: $checkedConvert('paymentMethod', (v) => v as String),
          isVoid: $checkedConvert('is_void', (v) => v as bool? ?? false),
          voidedAt: $checkedConvert('voided_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          orderId: $checkedConvert('order_id', (v) => v as String?),
          saleItems: $checkedConvert(
              'sale_items',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          SaleItemModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
          metadata:
              $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
        );
        return val;
      },
      fieldKeyMap: const {
        'isVoid': 'is_void',
        'voidedAt': 'voided_at',
        'orderId': 'order_id',
        'saleItems': 'sale_items'
      },
    );

Map<String, dynamic> _$$SaleModelImplToJson(_$SaleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'paymentMethod': instance.paymentMethod,
      'is_void': instance.isVoid,
      if (instance.voidedAt?.toIso8601String() case final value?)
        'voided_at': value,
      'cashierId': instance.cashierId,
      if (instance.orderId case final value?) 'order_id': value,
      'sale_items': instance.saleItems.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      if (instance.metadata case final value?) 'metadata': value,
    };

_$CreateSaleRequestImpl _$$CreateSaleRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateSaleRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateSaleRequestImpl(
          totalAmount: $checkedConvert('total_amount', (v) => v as String),
          paymentMethod: $checkedConvert('payment_method', (v) => v as String),
          orderId: $checkedConvert('order_id', (v) => v as String?),
          saleItem: $checkedConvert(
              'sale_item',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      CreateSaleItemRequest.fromJson(e as Map<String, dynamic>))
                  .toList()),
          metadata:
              $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalAmount': 'total_amount',
        'paymentMethod': 'payment_method',
        'orderId': 'order_id',
        'saleItem': 'sale_item'
      },
    );

Map<String, dynamic> _$$CreateSaleRequestImplToJson(
        _$CreateSaleRequestImpl instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'payment_method': instance.paymentMethod,
      if (instance.orderId case final value?) 'order_id': value,
      'sale_item': instance.saleItem.map((e) => e.toJson()).toList(),
      if (instance.metadata case final value?) 'metadata': value,
    };

_$CreateSaleItemRequestImpl _$$CreateSaleItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateSaleItemRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateSaleItemRequestImpl(
          id: $checkedConvert('id', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String?),
          discountedPrice:
              $checkedConvert('discounted_price', (v) => v as String?),
          isDiscounted:
              $checkedConvert('is_discounted', (v) => v as bool? ?? false),
          isGantang: $checkedConvert('is_gantang', (v) => v as bool? ?? false),
          isSpecialPrice:
              $checkedConvert('is_special_price', (v) => v as bool? ?? false),
          perKiloPrice: $checkedConvert(
              'per_kilo_price',
              (v) => v == null
                  ? null
                  : PerKiloPriceRequest.fromJson(v as Map<String, dynamic>)),
          sackPrice: $checkedConvert(
              'sack_price',
              (v) => v == null
                  ? null
                  : SackPriceRequest.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'discountedPrice': 'discounted_price',
        'isDiscounted': 'is_discounted',
        'isGantang': 'is_gantang',
        'isSpecialPrice': 'is_special_price',
        'perKiloPrice': 'per_kilo_price',
        'sackPrice': 'sack_price'
      },
    );

Map<String, dynamic> _$$CreateSaleItemRequestImplToJson(
        _$CreateSaleItemRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.price case final value?) 'price': value,
      if (instance.discountedPrice case final value?) 'discounted_price': value,
      'is_discounted': instance.isDiscounted,
      'is_gantang': instance.isGantang,
      'is_special_price': instance.isSpecialPrice,
      if (instance.perKiloPrice?.toJson() case final value?)
        'per_kilo_price': value,
      if (instance.sackPrice?.toJson() case final value?) 'sack_price': value,
    };

_$PerKiloPriceRequestImpl _$$PerKiloPriceRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PerKiloPriceRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$PerKiloPriceRequestImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$PerKiloPriceRequestImplToJson(
        _$PerKiloPriceRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };

_$SackPriceRequestImpl _$$SackPriceRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SackPriceRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$SackPriceRequestImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SackPriceRequestImplToJson(
        _$SackPriceRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'type': instance.type,
    };
