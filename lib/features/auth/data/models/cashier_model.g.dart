// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashierModelImpl _$$CashierModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CashierModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CashierModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          branchName: $checkedConvert('branchName', (v) => v as String),
          businessId: $checkedConvert('businessId', (v) => v as String),
          permissions: $checkedConvert(
              'permissions',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CashierModelImplToJson(_$CashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'branchName': instance.branchName,
      'businessId': instance.businessId,
      'permissions': instance.permissions,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LoginRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$LoginRequestImpl(
          username: $checkedConvert('username', (v) => v as String),
          accessKey: $checkedConvert('accessKey', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'accessKey': instance.accessKey,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LoginResponseImpl',
      json,
      ($checkedConvert) {
        final val = _$LoginResponseImpl(
          accessToken: $checkedConvert('access_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'accessToken': 'access_token'},
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
    };
