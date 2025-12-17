// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftModelImpl _$$ShiftModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ShiftModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ShiftModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          startTime:
              $checkedConvert('startTime', (v) => DateTime.parse(v as String)),
          endTime: $checkedConvert(
              'endTime', (v) => v == null ? null : DateTime.parse(v as String)),
          employees: $checkedConvert(
              'employees',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      ShiftEmployeeModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ShiftModelImplToJson(_$ShiftModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cashierId': instance.cashierId,
      'startTime': instance.startTime.toIso8601String(),
      if (instance.endTime?.toIso8601String() case final value?)
        'endTime': value,
      'employees': instance.employees.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ShiftRequestImpl _$$ShiftRequestImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ShiftRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$ShiftRequestImpl(
          employees: $checkedConvert('employees',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ShiftRequestImplToJson(_$ShiftRequestImpl instance) =>
    <String, dynamic>{
      'employees': instance.employees,
    };
