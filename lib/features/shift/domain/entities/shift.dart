import 'package:freezed_annotation/freezed_annotation.dart';

import 'shift_employee.dart';

part 'shift.freezed.dart';

/// Shift entity representing a work shift (time in/time out).
///
/// A shift tracks when employees clock in and out.
/// The first employee in the list is designated as the "Cashier"
/// for that shift.
@freezed
class Shift with _$Shift {
  const Shift._();

  const factory Shift({
    required String id,
    required String cashierId,
    required DateTime startTime,
    DateTime? endTime,
    required List<ShiftEmployee> employees,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Shift;

  /// Whether this shift is currently active (not ended).
  bool get isActive => endTime == null;

  /// Get the designated cashier employee (first in list).
  ShiftEmployee? get designatedCashier =>
      employees.isNotEmpty ? employees.first : null;
}
