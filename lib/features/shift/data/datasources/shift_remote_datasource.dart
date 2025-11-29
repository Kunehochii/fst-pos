import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../models/employee_model.dart';
import '../models/shift_model.dart';

/// Remote data source for shift and employee API calls.
class ShiftRemoteDataSource {
  final Dio _dio;

  ShiftRemoteDataSource(this._dio);

  /// Fetches all employees for the current cashier's branch.
  Future<List<EmployeeModel>> getEmployees() async {
    AppLogger.api('Fetching employees');

    final response = await _dio.get(ApiEndpoints.employees.list);

    AppLogger.json('Parsing employees list', response.data);

    final employees = (response.data as List)
        .map((json) => EmployeeModel.fromJson(json as Map<String, dynamic>))
        .toList();

    AppLogger.api('Parsed ${employees.length} employees');
    return employees;
  }

  /// Fetches all shifts for the current cashier.
  Future<List<ShiftModel>> getShifts() async {
    AppLogger.api('Fetching shifts');

    final response = await _dio.get(ApiEndpoints.shifts.list);

    AppLogger.json('Parsing shifts list', response.data);

    final shifts = (response.data as List)
        .map((json) => ShiftModel.fromJson(json as Map<String, dynamic>))
        .toList();

    AppLogger.api('Parsed ${shifts.length} shifts');
    return shifts;
  }

  /// Fetches a specific shift by ID.
  Future<ShiftModel> getShift(String id) async {
    AppLogger.api('Fetching shift', {'id': id});

    final response = await _dio.get(ApiEndpoints.shifts.byId(id));

    AppLogger.json('Parsing shift', response.data);
    return ShiftModel.fromJson(response.data);
  }

  /// Creates a new shift (time in).
  Future<ShiftModel> createShift(List<String> employeeIds) async {
    AppLogger.api('Creating shift', {'employeeIds': employeeIds});

    final response = await _dio.post(
      ApiEndpoints.shifts.list,
      data: ShiftRequest(employees: employeeIds).toJson(),
    );

    AppLogger.json('Shift created', response.data);
    return ShiftModel.fromJson(response.data);
  }

  /// Updates the employees assigned to a shift.
  Future<ShiftModel> updateShift(String id, List<String> employeeIds) async {
    AppLogger.api('Updating shift', {'id': id, 'employeeIds': employeeIds});

    final response = await _dio.patch(
      ApiEndpoints.shifts.byId(id),
      data: ShiftRequest(employees: employeeIds).toJson(),
    );

    AppLogger.json('Shift updated', response.data);
    return ShiftModel.fromJson(response.data);
  }

  /// Ends a shift (time out).
  Future<ShiftModel> endShift(String id) async {
    AppLogger.api('Ending shift', {'id': id});

    final response = await _dio.patch(ApiEndpoints.shifts.end(id));

    AppLogger.json('Shift ended', response.data);
    return ShiftModel.fromJson(response.data);
  }
}
