// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecialPriceModelImpl _$$SpecialPriceModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SpecialPriceModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SpecialPriceModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
          minimumQty: $checkedConvert('minimumQty', (v) => v as String),
          profit: $checkedConvert('profit', (v) => v as String?),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SpecialPriceModelImplToJson(
        _$SpecialPriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'minimumQty': instance.minimumQty,
      if (instance.profit case final value?) 'profit': value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$SackPriceModelImpl _$$SackPriceModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SackPriceModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SackPriceModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
          stock: $checkedConvert('stock', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          profit: $checkedConvert('profit', (v) => v as String?),
          specialPrice: $checkedConvert(
              'special_price',
              (v) => v == null
                  ? null
                  : SpecialPriceModel.fromJson(v as Map<String, dynamic>)),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'specialPrice': 'special_price'},
    );

Map<String, dynamic> _$$SackPriceModelImplToJson(
        _$SackPriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'stock': instance.stock,
      'type': instance.type,
      if (instance.profit case final value?) 'profit': value,
      if (instance.specialPrice?.toJson() case final value?)
        'special_price': value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$PerKiloPriceModelImpl _$$PerKiloPriceModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PerKiloPriceModelImpl',
      json,
      ($checkedConvert) {
        final val = _$PerKiloPriceModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
          stock: $checkedConvert('stock', (v) => v as String),
          profit: $checkedConvert('profit', (v) => v as String?),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$PerKiloPriceModelImplToJson(
        _$PerKiloPriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'stock': instance.stock,
      if (instance.profit case final value?) 'profit': value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ProductCashierModelImpl _$$ProductCashierModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProductCashierModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ProductCashierModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          branchName: $checkedConvert('branchName', (v) => v as String),
          businessId: $checkedConvert('businessId', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ProductCashierModelImplToJson(
        _$ProductCashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'branchName': instance.branchName,
      'businessId': instance.businessId,
    };

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProductModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ProductModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          picture: $checkedConvert('picture', (v) => v as String),
          category: $checkedConvert('category', (v) => v as String),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          sackPrices: $checkedConvert(
              'sack_prices',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          SackPriceModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          perKiloPrice: $checkedConvert(
              'per_kilo_price',
              (v) => v == null
                  ? null
                  : PerKiloPriceModel.fromJson(v as Map<String, dynamic>)),
          cashier: $checkedConvert(
              'cashier',
              (v) => v == null
                  ? null
                  : ProductCashierModel.fromJson(v as Map<String, dynamic>)),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'sackPrices': 'sack_prices',
        'perKiloPrice': 'per_kilo_price'
      },
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'category': instance.category,
      'cashierId': instance.cashierId,
      'sack_prices': instance.sackPrices.map((e) => e.toJson()).toList(),
      if (instance.perKiloPrice?.toJson() case final value?)
        'per_kilo_price': value,
      if (instance.cashier?.toJson() case final value?) 'cashier': value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
