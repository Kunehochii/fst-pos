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
              $checkedConvert('discountedPrice', (v) => v as String?),
          isDiscounted:
              $checkedConvert('isDiscounted', (v) => v as bool? ?? false),
          isGantang: $checkedConvert('isGantang', (v) => v as bool? ?? false),
          isSpecialPrice:
              $checkedConvert('isSpecialPrice', (v) => v as bool? ?? false),
          productId: $checkedConvert('productId', (v) => v as String),
          sackPriceId: $checkedConvert('sackPriceId', (v) => v as String?),
          sackType: $checkedConvert('sackType', (v) => v as String?),
          perKiloPriceId:
              $checkedConvert('perKiloPriceId', (v) => v as String?),
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
              'sackPrice',
              (v) => v == null
                  ? null
                  : SackPriceModel.fromJson(v as Map<String, dynamic>)),
          perKiloPrice: $checkedConvert(
              'perKiloPrice',
              (v) => v == null
                  ? null
                  : PerKiloPriceModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SaleItemModelImplToJson(_$SaleItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
      if (instance.discountedPrice case final value?) 'discountedPrice': value,
      'isDiscounted': instance.isDiscounted,
      'isGantang': instance.isGantang,
      'isSpecialPrice': instance.isSpecialPrice,
      'productId': instance.productId,
      if (instance.sackPriceId case final value?) 'sackPriceId': value,
      if (instance.sackType case final value?) 'sackType': value,
      if (instance.perKiloPriceId case final value?) 'perKiloPriceId': value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      if (instance.product?.toJson() case final value?) 'product': value,
      if (instance.sackPrice?.toJson() case final value?) 'sackPrice': value,
      if (instance.perKiloPrice?.toJson() case final value?)
        'perKiloPrice': value,
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
          isVoid: $checkedConvert('isVoid', (v) => v as bool? ?? false),
          voidedAt: $checkedConvert('voidedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          orderId: $checkedConvert('orderId', (v) => v as String?),
          saleItems: $checkedConvert(
              'saleItems',
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
    );

Map<String, dynamic> _$$SaleModelImplToJson(_$SaleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'paymentMethod': instance.paymentMethod,
      'isVoid': instance.isVoid,
      if (instance.voidedAt?.toIso8601String() case final value?)
        'voidedAt': value,
      'cashierId': instance.cashierId,
      if (instance.orderId case final value?) 'orderId': value,
      'saleItems': instance.saleItems.map((e) => e.toJson()).toList(),
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
          totalAmount: $checkedConvert('totalAmount', (v) => v as String),
          paymentMethod: $checkedConvert('paymentMethod', (v) => v as String),
          orderId: $checkedConvert('orderId', (v) => v as String?),
          saleItem: $checkedConvert(
              'saleItem',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      CreateSaleItemRequest.fromJson(e as Map<String, dynamic>))
                  .toList()),
          metadata:
              $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CreateSaleRequestImplToJson(
        _$CreateSaleRequestImpl instance) =>
    <String, dynamic>{
      'totalAmount': instance.totalAmount,
      'paymentMethod': instance.paymentMethod,
      if (instance.orderId case final value?) 'orderId': value,
      'saleItem': instance.saleItem.map((e) => e.toJson()).toList(),
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
              $checkedConvert('discountedPrice', (v) => v as String?),
          isDiscounted:
              $checkedConvert('isDiscounted', (v) => v as bool? ?? false),
          isGantang: $checkedConvert('isGantang', (v) => v as bool? ?? false),
          isSpecialPrice:
              $checkedConvert('isSpecialPrice', (v) => v as bool? ?? false),
          perKiloPrice: $checkedConvert(
              'perKiloPrice',
              (v) => v == null
                  ? null
                  : PerKiloPriceRequest.fromJson(v as Map<String, dynamic>)),
          sackPrice: $checkedConvert(
              'sackPrice',
              (v) => v == null
                  ? null
                  : SackPriceRequest.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CreateSaleItemRequestImplToJson(
        _$CreateSaleItemRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.price case final value?) 'price': value,
      if (instance.discountedPrice case final value?) 'discountedPrice': value,
      'isDiscounted': instance.isDiscounted,
      'isGantang': instance.isGantang,
      'isSpecialPrice': instance.isSpecialPrice,
      if (instance.perKiloPrice?.toJson() case final value?)
        'perKiloPrice': value,
      if (instance.sackPrice?.toJson() case final value?) 'sackPrice': value,
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
