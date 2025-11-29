import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/shift_local_datasource.dart';
import '../../data/datasources/shift_remote_datasource.dart';
import '../../data/repositories/shift_repository_impl.dart';
import '../../domain/entities/employee.dart';
import '../../domain/entities/shift.dart';
import '../../domain/repositories/shift_repository.dart';

part 'shift_provider.g.dart';

/// Provides the ShiftRemoteDataSource.
@riverpod
ShiftRemoteDataSource shiftRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return ShiftRemoteDataSource(dio);
}

/// Provides the ShiftLocalDataSource.
@riverpod
Future<ShiftLocalDataSource> shiftLocalDataSource(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return ShiftLocalDataSource(prefs);
}

/// Provides the ShiftRepository.
@riverpod
Future<ShiftRepository> shiftRepository(Ref ref) async {
  final remoteDataSource = ref.watch(shiftRemoteDataSourceProvider);
  final localDataSource = await ref.watch(shiftLocalDataSourceProvider.future);
  return ShiftRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

/// Provides the list of employees for the current cashier's branch.
@riverpod
Future<List<Employee>> employees(Ref ref) async {
  final repository = await ref.watch(shiftRepositoryProvider.future);
  final (failure, employees) = await repository.getEmployees();
  if (failure != null) {
    throw failure;
  }
  return employees ?? [];
}

/// Manages the shift state including active shift tracking.
@riverpod
class ShiftNotifier extends _$ShiftNotifier {
  @override
  Future<ShiftState> build() async {
    return _checkActiveShift();
  }

  /// Checks for an active shift.
  Future<ShiftState> _checkActiveShift() async {
    final repository = await ref.read(shiftRepositoryProvider.future);
    final (failure, activeShift) = await repository.getActiveShift();

    if (failure != null) {
      // Don't throw, just return no active shift
      return const ShiftState.noActiveShift();
    }

    if (activeShift != null) {
      return ShiftState.activeShift(shift: activeShift);
    }

    return const ShiftState.noActiveShift();
  }

  /// Creates a new shift (time in).
  ///
  /// [employeeIds] - List of employee IDs. First one is the designated cashier.
  Future<Failure?> timeIn(List<String> employeeIds) async {
    state = const AsyncValue.loading();

    final repository = await ref.read(shiftRepositoryProvider.future);
    final (failure, shift) = await repository.createShift(employeeIds);

    if (failure != null) {
      state = AsyncValue.data(const ShiftState.noActiveShift());
      return failure;
    }

    if (shift != null) {
      state = AsyncValue.data(ShiftState.activeShift(shift: shift));
    }

    return null;
  }

  /// Updates the employees assigned to the current shift.
  Future<Failure?> updateEmployees(
      String shiftId, List<String> employeeIds) async {
    final currentState = state.valueOrNull;
    state = const AsyncValue.loading();

    final repository = await ref.read(shiftRepositoryProvider.future);
    final (failure, shift) = await repository.updateShift(shiftId, employeeIds);

    if (failure != null) {
      // Restore previous state
      if (currentState != null) {
        state = AsyncValue.data(currentState);
      }
      return failure;
    }

    if (shift != null) {
      state = AsyncValue.data(ShiftState.activeShift(shift: shift));
    }

    return null;
  }

  /// Ends the current shift (time out).
  Future<Failure?> timeOut(String shiftId) async {
    state = const AsyncValue.loading();

    final repository = await ref.read(shiftRepositoryProvider.future);
    final (failure, _) = await repository.endShift(shiftId);

    if (failure != null) {
      // Restore active shift state
      state = AsyncValue.data(await _checkActiveShift());
      return failure;
    }

    state = AsyncValue.data(const ShiftState.noActiveShift());
    return null;
  }

  /// Refreshes the shift state.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _checkActiveShift());
  }
}

/// Shift state union type.
sealed class ShiftState {
  const ShiftState();

  const factory ShiftState.noActiveShift() = NoActiveShift;
  const factory ShiftState.activeShift({required Shift shift}) = ActiveShift;
}

class NoActiveShift extends ShiftState {
  const NoActiveShift();
}

class ActiveShift extends ShiftState {
  final Shift shift;
  const ActiveShift({required this.shift});
}

/// Provides the current active shift or null.
@riverpod
Shift? activeShift(Ref ref) {
  final shiftState = ref.watch(shiftNotifierProvider);
  return shiftState.whenOrNull(
    data: (state) {
      if (state is ActiveShift) {
        return state.shift;
      }
      return null;
    },
  );
}

/// Provides whether there is an active shift.
@riverpod
bool hasActiveShift(Ref ref) {
  return ref.watch(activeShiftProvider) != null;
}
