import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shift.dart';
import 'shift_employee_model.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

/// Shift model for API serialization.
///
/// Maps API response to domain entity.
@freezed
class ShiftModel with _$ShiftModel {
  const ShiftModel._();

  const factory ShiftModel({
    required String id,
    @JsonKey(name: 'cashierId') required String cashierId,
    @JsonKey(name: 'startTime') required DateTime startTime,
    @JsonKey(name: 'endTime') DateTime? endTime,
    required List<ShiftEmployeeModel> employees,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);

  /// Converts the model to a domain entity.
  Shift toEntity() => Shift(
        id: id,
        cashierId: cashierId,
        startTime: startTime,
        endTime: endTime,
        employees: employees.map((e) => e.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Creates a model from a domain entity.
  factory ShiftModel.fromEntity(Shift entity) => ShiftModel(
        id: entity.id,
        cashierId: entity.cashierId,
        startTime: entity.startTime,
        endTime: entity.endTime,
        employees: entity.employees
            .map((e) => ShiftEmployeeModel(
                  id: e.id,
                  shiftId: e.shiftId,
                  employeeId: e.employeeId,
                  employee: ShiftEmployeeInfo(
                    id: e.employeeId,
                    name: e.employeeName,
                  ),
                  createdAt: e.createdAt,
                ))
            .toList(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Request DTO for creating/updating shifts.
@freezed
class ShiftRequest with _$ShiftRequest {
  const factory ShiftRequest({
    required List<String> employees,
  }) = _ShiftRequest;

  factory ShiftRequest.fromJson(Map<String, dynamic> json) =>
      _$ShiftRequestFromJson(json);
}
