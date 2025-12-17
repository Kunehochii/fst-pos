import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_employee.freezed.dart';

/// Represents an employee assigned to a shift.
///
/// Contains the relationship data between a shift and an employee.
@freezed
class ShiftEmployee with _$ShiftEmployee {
  const factory ShiftEmployee({
    required String id,
    required String shiftId,
    required String employeeId,
    required String employeeName,
    required DateTime createdAt,
  }) = _ShiftEmployee;
}
