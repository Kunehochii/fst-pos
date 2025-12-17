import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/employee.dart';
import '../../domain/entities/shift.dart';
import '../../domain/repositories/shift_repository.dart';
import '../datasources/shift_local_datasource.dart';
import '../datasources/shift_remote_datasource.dart';

/// Implementation of [ShiftRepository].
///
/// Handles shift and employee operations with offline-first support.
/// Caches active shift and employees for offline access.
class ShiftRepositoryImpl implements ShiftRepository {
  final ShiftRemoteDataSource _remoteDataSource;
  final ShiftLocalDataSource _localDataSource;

  ShiftRepositoryImpl({
    required ShiftRemoteDataSource remoteDataSource,
    required ShiftLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  /// Checks if the server is reachable.
  Future<bool> _isOnline() async {
    try {
      await _remoteDataSource.getShifts();
      return true;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return false;
      }
      // Other errors mean we're online but got a different error
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<(Failure?, List<Employee>?)> getEmployees() async {
    try {
      final models = await _remoteDataSource.getEmployees();
      final employees = models.map((m) => m.toEntity()).toList();

      // Cache for offline access
      await _localDataSource.cacheEmployees(employees);

      return (null, employees);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to get employees from server', e, stackTrace);

      // Try to return cached employees if network error
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        final cachedEmployees = _localDataSource.getCachedEmployees();
        if (cachedEmployees.isNotEmpty) {
          AppLogger.info('Returning cached employees (offline mode)');
          return (null, cachedEmployees);
        }
        return (const Failure.network(), null);
      }

      final message =
          e.response?.data?['message'] as String? ?? 'Failed to get employees';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error getting employees', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Shift?)> getActiveShift() async {
    try {
      final shifts = await _remoteDataSource.getShifts();
      // Find the first shift that has no endTime (active shift)
      final activeShiftList = shifts.where((s) => s.endTime == null).toList();

      if (activeShiftList.isEmpty) {
        // No active shift - clear cache
        await _localDataSource.clearCachedActiveShift();
        return (null, null);
      }

      final activeShift = activeShiftList.first.toEntity();

      // Cache for offline access
      await _localDataSource.cacheActiveShift(activeShift);

      return (null, activeShift);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to get active shift from server', e, stackTrace);

      // Try to return cached shift if network error
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        final cachedShift = _localDataSource.getCachedActiveShift();
        if (cachedShift != null) {
          AppLogger.info('Returning cached active shift (offline mode)');
          return (null, cachedShift);
        }
        // No cached shift means no active shift (which is okay)
        return (null, null);
      }

      final message = e.response?.data?['message'] as String? ??
          'Failed to get active shift';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error getting active shift', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, List<Shift>?)> getAllShifts() async {
    try {
      final models = await _remoteDataSource.getShifts();
      final shifts = models.map((m) => m.toEntity()).toList();
      return (null, shifts);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to get shifts', e, stackTrace);
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return (const Failure.network(), null);
      }
      final message =
          e.response?.data?['message'] as String? ?? 'Failed to get shifts';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error getting shifts', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Shift?)> getShift(String id) async {
    try {
      final model = await _remoteDataSource.getShift(id);
      final shift = model.toEntity();

      // Cache if active
      if (shift.isActive) {
        await _localDataSource.cacheActiveShift(shift);
      }

      return (null, shift);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to get shift', e, stackTrace);

      // Try cached if network error and looking for active shift
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        final cachedShift = _localDataSource.getCachedActiveShift();
        if (cachedShift != null && cachedShift.id == id) {
          return (null, cachedShift);
        }
        return (const Failure.network(), null);
      }

      final message =
          e.response?.data?['message'] as String? ?? 'Failed to get shift';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error getting shift', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Shift?)> createShift(List<String> employeeIds) async {
    try {
      final model = await _remoteDataSource.createShift(employeeIds);
      final shift = model.toEntity();

      // Cache the new active shift
      await _localDataSource.cacheActiveShift(shift);

      return (null, shift);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to create shift', e, stackTrace);
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return (const Failure.network(), null);
      }
      final message =
          e.response?.data?['message'] as String? ?? 'Failed to create shift';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error creating shift', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Shift?)> updateShift(
      String id, List<String> employeeIds) async {
    try {
      final model = await _remoteDataSource.updateShift(id, employeeIds);
      final shift = model.toEntity();

      // Update cache
      if (shift.isActive) {
        await _localDataSource.cacheActiveShift(shift);
      }

      return (null, shift);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to update shift', e, stackTrace);
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return (const Failure.network(), null);
      }
      final message =
          e.response?.data?['message'] as String? ?? 'Failed to update shift';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error updating shift', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Shift?)> endShift(String id) async {
    try {
      final model = await _remoteDataSource.endShift(id);
      final shift = model.toEntity();

      // Clear cached active shift since it's now ended
      await _localDataSource.clearCachedActiveShift();

      return (null, shift);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Failed to end shift', e, stackTrace);
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return (const Failure.network(), null);
      }
      final message =
          e.response?.data?['message'] as String? ?? 'Failed to end shift';
      return (
        Failure.server(message: message, statusCode: e.response?.statusCode),
        null
      );
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error ending shift', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }
}
