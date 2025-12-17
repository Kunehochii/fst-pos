import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shift_employee.dart';

part 'shift_employee_model.freezed.dart';
part 'shift_employee_model.g.dart';

/// Shift employee model for API serialization.
@freezed
class ShiftEmployeeModel with _$ShiftEmployeeModel {
  const ShiftEmployeeModel._();

  const factory ShiftEmployeeModel({
    required String id,
    @JsonKey(name: 'shiftId') required String shiftId,
    @JsonKey(name: 'employeeId') required String employeeId,
    required ShiftEmployeeInfo employee,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
  }) = _ShiftEmployeeModel;

  factory ShiftEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftEmployeeModelFromJson(json);

  /// Converts the model to a domain entity.
  ShiftEmployee toEntity() => ShiftEmployee(
        id: id,
        shiftId: shiftId,
        employeeId: employeeId,
        employeeName: employee.name,
        createdAt: createdAt,
      );
}

/// Nested employee info in shift employee response.
@freezed
class ShiftEmployeeInfo with _$ShiftEmployeeInfo {
  const factory ShiftEmployeeInfo({
    required String id,
    required String name,
  }) = _ShiftEmployeeInfo;

  factory ShiftEmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$ShiftEmployeeInfoFromJson(json);
}
