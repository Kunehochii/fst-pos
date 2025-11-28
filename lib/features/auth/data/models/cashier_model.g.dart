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
          branchName: $checkedConvert('branch_name', (v) => v as String),
          businessId: $checkedConvert('business_id', (v) => v as String),
          permissions: $checkedConvert(
              'permissions',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'branchName': 'branch_name',
        'businessId': 'business_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$$CashierModelImplToJson(_$CashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'branch_name': instance.branchName,
      'business_id': instance.businessId,
      'permissions': instance.permissions,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LoginRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$LoginRequestImpl(
          username: $checkedConvert('username', (v) => v as String),
          accessKey: $checkedConvert('access_key', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'accessKey': 'access_key'},
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'access_key': instance.accessKey,
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
