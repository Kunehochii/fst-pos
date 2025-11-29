import '../../../../core/errors/failure.dart';
import '../entities/employee.dart';
import '../entities/shift.dart';

/// Repository interface for shift operations.
///
/// Defines the contract for shift-related operations including
/// time in, time out, and employee management.
abstract class ShiftRepository {
  /// Gets all employees for the current cashier's branch.
  Future<(Failure?, List<Employee>?)> getEmployees();

  /// Gets the current active shift for the cashier.
  ///
  /// Returns null for the shift if no active shift exists.
  Future<(Failure?, Shift?)> getActiveShift();

  /// Gets all shifts for the current cashier.
  Future<(Failure?, List<Shift>?)> getAllShifts();

  /// Gets a specific shift by ID.
  Future<(Failure?, Shift?)> getShift(String id);

  /// Creates a new shift (time in).
  ///
  /// [employeeIds] - List of employee IDs assigned to this shift.
  /// The first employee in the list is designated as the "Cashier".
  Future<(Failure?, Shift?)> createShift(List<String> employeeIds);

  /// Updates the employees assigned to a shift.
  Future<(Failure?, Shift?)> updateShift(String id, List<String> employeeIds);

  /// Ends a shift (time out).
  Future<(Failure?, Shift?)> endShift(String id);
}
