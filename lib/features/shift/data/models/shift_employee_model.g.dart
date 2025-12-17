// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftEmployeeModelImpl _$$ShiftEmployeeModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ShiftEmployeeModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ShiftEmployeeModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          shiftId: $checkedConvert('shiftId', (v) => v as String),
          employeeId: $checkedConvert('employeeId', (v) => v as String),
          employee: $checkedConvert('employee',
              (v) => ShiftEmployeeInfo.fromJson(v as Map<String, dynamic>)),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ShiftEmployeeModelImplToJson(
        _$ShiftEmployeeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftId': instance.shiftId,
      'employeeId': instance.employeeId,
      'employee': instance.employee.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$ShiftEmployeeInfoImpl _$$ShiftEmployeeInfoImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ShiftEmployeeInfoImpl',
      json,
      ($checkedConvert) {
        final val = _$ShiftEmployeeInfoImpl(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ShiftEmployeeInfoImplToJson(
        _$ShiftEmployeeInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
