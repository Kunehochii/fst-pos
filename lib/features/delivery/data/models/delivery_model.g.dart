// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryCashierModelImpl _$$DeliveryCashierModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$DeliveryCashierModelImpl',
      json,
      ($checkedConvert) {
        final val = _$DeliveryCashierModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          branchName: $checkedConvert('branchName', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$DeliveryCashierModelImplToJson(
        _$DeliveryCashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'branchName': instance.branchName,
    };

_$DeliveryItemModelImpl _$$DeliveryItemModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$DeliveryItemModelImpl',
      json,
      ($checkedConvert) {
        final val = _$DeliveryItemModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => v as String),
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

Map<String, dynamic> _$$DeliveryItemModelImplToJson(
        _$DeliveryItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
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

_$DeliveryModelImpl _$$DeliveryModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$DeliveryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$DeliveryModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          driverName: $checkedConvert('driverName', (v) => v as String),
          deliveryTimeStart: $checkedConvert(
              'deliveryTimeStart', (v) => DateTime.parse(v as String)),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
          deliveryItems: $checkedConvert(
              'deliveryItems',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          DeliveryItemModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          cashier: $checkedConvert(
              'cashier',
              (v) => v == null
                  ? null
                  : DeliveryCashierModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$DeliveryModelImplToJson(_$DeliveryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverName': instance.driverName,
      'deliveryTimeStart': instance.deliveryTimeStart.toIso8601String(),
      'cashierId': instance.cashierId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deliveryItems': instance.deliveryItems.map((e) => e.toJson()).toList(),
      if (instance.cashier?.toJson() case final value?) 'cashier': value,
    };

_$CreateDeliveryItemModelImpl _$$CreateDeliveryItemModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateDeliveryItemModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateDeliveryItemModelImpl(
          productId: $checkedConvert('productId', (v) => v as String),
          sackPrice: $checkedConvert(
              'sackPrice',
              (v) => v == null
                  ? null
                  : SackPriceDtoModel.fromJson(v as Map<String, dynamic>)),
          perKiloPrice: $checkedConvert(
              'perKiloPrice',
              (v) => v == null
                  ? null
                  : PerKiloPriceDtoModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CreateDeliveryItemModelImplToJson(
        _$CreateDeliveryItemModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      if (instance.sackPrice?.toJson() case final value?) 'sackPrice': value,
      if (instance.perKiloPrice?.toJson() case final value?)
        'perKiloPrice': value,
    };

_$SackPriceDtoModelImpl _$$SackPriceDtoModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SackPriceDtoModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SackPriceDtoModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
          type: $checkedConvert('type', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SackPriceDtoModelImplToJson(
        _$SackPriceDtoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'type': instance.type,
    };

_$PerKiloPriceDtoModelImpl _$$PerKiloPriceDtoModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PerKiloPriceDtoModelImpl',
      json,
      ($checkedConvert) {
        final val = _$PerKiloPriceDtoModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$PerKiloPriceDtoModelImplToJson(
        _$PerKiloPriceDtoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };

_$CreateDeliveryModelImpl _$$CreateDeliveryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateDeliveryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateDeliveryModelImpl(
          driverName: $checkedConvert('driverName', (v) => v as String),
          deliveryTimeStart:
              $checkedConvert('deliveryTimeStart', (v) => v as String),
          deliveryItems: $checkedConvert(
              'deliveryItems',
              (v) => (v as List<dynamic>)
                  .map((e) => CreateDeliveryItemModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CreateDeliveryModelImplToJson(
        _$CreateDeliveryModelImpl instance) =>
    <String, dynamic>{
      'driverName': instance.driverName,
      'deliveryTimeStart': instance.deliveryTimeStart,
      'deliveryItems': instance.deliveryItems.map((e) => e.toJson()).toList(),
    };

_$UpdateDeliveryModelImpl _$$UpdateDeliveryModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$UpdateDeliveryModelImpl',
      json,
      ($checkedConvert) {
        final val = _$UpdateDeliveryModelImpl(
          driverName: $checkedConvert('driverName', (v) => v as String?),
          deliveryTimeStart:
              $checkedConvert('deliveryTimeStart', (v) => v as String?),
          deliveryItems: $checkedConvert(
              'deliveryItems',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => CreateDeliveryItemModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$UpdateDeliveryModelImplToJson(
        _$UpdateDeliveryModelImpl instance) =>
    <String, dynamic>{
      if (instance.driverName case final value?) 'driverName': value,
      if (instance.deliveryTimeStart case final value?)
        'deliveryTimeStart': value,
      if (instance.deliveryItems?.map((e) => e.toJson()).toList()
          case final value?)
        'deliveryItems': value,
    };
