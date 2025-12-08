// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
          cashier: $checkedConvert(
              'cashier',
              (v) => v == null
                  ? null
                  : TransferCashierModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'sackPrice': 'sack_price',
        'perKiloPrice': 'per_kilo_price'
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
      if (instance.sackPrice?.toJson() case final value?) 'sack_price': value,
      if (instance.perKiloPrice?.toJson() case final value?)
        'per_kilo_price': value,
      if (instance.cashier?.toJson() case final value?) 'cashier': value,
    };

_$CreateTransferSackModelImpl _$$CreateTransferSackModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateTransferSackModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateTransferSackModelImpl(
          productId: $checkedConvert('product_id', (v) => v as String),
          sackPriceId: $checkedConvert('sack_price_id', (v) => v as String),
          sackType: $checkedConvert('sack_type', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
          transferType: $checkedConvert('transfer_type', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'productId': 'product_id',
        'sackPriceId': 'sack_price_id',
        'sackType': 'sack_type',
        'transferType': 'transfer_type'
      },
    );

Map<String, dynamic> _$$CreateTransferSackModelImplToJson(
        _$CreateTransferSackModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'sack_price_id': instance.sackPriceId,
      'sack_type': instance.sackType,
      'quantity': instance.quantity,
      'transfer_type': instance.transferType,
    };

_$CreateTransferPerKiloModelImpl _$$CreateTransferPerKiloModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateTransferPerKiloModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateTransferPerKiloModelImpl(
          productId: $checkedConvert('product_id', (v) => v as String),
          perKiloPriceId:
              $checkedConvert('per_kilo_price_id', (v) => v as String),
          quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
          transferType: $checkedConvert('transfer_type', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'productId': 'product_id',
        'perKiloPriceId': 'per_kilo_price_id',
        'transferType': 'transfer_type'
      },
    );

Map<String, dynamic> _$$CreateTransferPerKiloModelImplToJson(
        _$CreateTransferPerKiloModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'per_kilo_price_id': instance.perKiloPriceId,
      'quantity': instance.quantity,
      'transfer_type': instance.transferType,
    };
