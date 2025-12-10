// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferProductModelImpl _$$TransferProductModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TransferProductModelImpl',
      json,
      ($checkedConvert) {
        final val = _$TransferProductModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          category: $checkedConvert('category', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TransferProductModelImplToJson(
        _$TransferProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
    };

_$TransferSackPriceModelImpl _$$TransferSackPriceModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TransferSackPriceModelImpl',
      json,
      ($checkedConvert) {
        final val = _$TransferSackPriceModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TransferSackPriceModelImplToJson(
        _$TransferSackPriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
    };

_$TransferPerKiloPriceModelImpl _$$TransferPerKiloPriceModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TransferPerKiloPriceModelImpl',
      json,
      ($checkedConvert) {
        final val = _$TransferPerKiloPriceModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TransferPerKiloPriceModelImplToJson(
        _$TransferPerKiloPriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
    };

_$TransferCashierModelImpl _$$TransferCashierModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TransferCashierModelImpl',
      json,
      ($checkedConvert) {
        final val = _$TransferCashierModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          branchName: $checkedConvert('branchName', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TransferCashierModelImplToJson(
        _$TransferCashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'branchName': instance.branchName,
    };

_$TransferModelImpl _$$TransferModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TransferModelImpl',
      json,
      ($checkedConvert) {
        final val = _$TransferModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          sackType: $checkedConvert('sackType', (v) => v as String?),
          productId: $checkedConvert('productId', (v) => v as String),
          sackPriceId: $checkedConvert('sackPriceId', (v) => v as String?),
          perKiloPriceId:
              $checkedConvert('perKiloPriceId', (v) => v as String?),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
          product: $checkedConvert(
              'product',
              (v) => v == null
                  ? null
                  : TransferProductModel.fromJson(v as Map<String, dynamic>)),
          sackPrice: $checkedConvert(
              'sackPrice',
              (v) => v == null
                  ? null
                  : TransferSackPriceModel.fromJson(v as Map<String, dynamic>)),
          perKiloPrice: $checkedConvert(
              'perKiloPrice',
              (v) => v == null
                  ? null
                  : TransferPerKiloPriceModel.fromJson(
                      v as Map<String, dynamic>)),
          cashier: $checkedConvert(
              'cashier',
              (v) => v == null
                  ? null
                  : TransferCashierModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TransferModelImplToJson(_$TransferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'type': instance.type,
      if (instance.sackType case final value?) 'sackType': value,
      'productId': instance.productId,
      if (instance.sackPriceId case final value?) 'sackPriceId': value,
      if (instance.perKiloPriceId case final value?) 'perKiloPriceId': value,
      'cashierId': instance.cashierId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      if (instance.product?.toJson() case final value?) 'product': value,
      if (instance.sackPrice?.toJson() case final value?) 'sackPrice': value,
      if (instance.perKiloPrice?.toJson() case final value?)
        'perKiloPrice': value,
      if (instance.cashier?.toJson() case final value?) 'cashier': value,
    };

_$CreateTransferSackModelImpl _$$CreateTransferSackModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateTransferSackModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateTransferSackModelImpl(
          productId: $checkedConvert('productId', (v) => v as String),
          sackPriceId: $checkedConvert('sackPriceId', (v) => v as String),
          sackType: $checkedConvert('sackType', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
          transferType: $checkedConvert('transferType', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CreateTransferSackModelImplToJson(
        _$CreateTransferSackModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sackPriceId': instance.sackPriceId,
      'sackType': instance.sackType,
      'quantity': instance.quantity,
      'transferType': instance.transferType,
    };

_$CreateTransferPerKiloModelImpl _$$CreateTransferPerKiloModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateTransferPerKiloModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateTransferPerKiloModelImpl(
          productId: $checkedConvert('productId', (v) => v as String),
          perKiloPriceId: $checkedConvert('perKiloPriceId', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
          transferType: $checkedConvert('transferType', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CreateTransferPerKiloModelImplToJson(
        _$CreateTransferPerKiloModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'perKiloPriceId': instance.perKiloPriceId,
      'quantity': instance.quantity,
      'transferType': instance.transferType,
    };
