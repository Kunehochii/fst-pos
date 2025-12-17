import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';

/// Employee entity representing a branch employee.
///
/// Employees are specific to a cashier's branch and can be
/// assigned to shifts for time tracking.
@freezed
class Employee with _$Employee {
  const factory Employee({
    required String id,
    required String name,
    required String? cashierId,
    required String businessId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Employee;
}
