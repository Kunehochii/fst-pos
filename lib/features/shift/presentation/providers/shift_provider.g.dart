// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shiftRemoteDataSourceHash() =>
    r'a609f9f62d805aadf5abcec53071c61c2d3eae15';

/// Provides the ShiftRemoteDataSource.
///
/// Copied from [shiftRemoteDataSource].
@ProviderFor(shiftRemoteDataSource)
final shiftRemoteDataSourceProvider =
    AutoDisposeProvider<ShiftRemoteDataSource>.internal(
  shiftRemoteDataSource,
  name: r'shiftRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shiftRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShiftRemoteDataSourceRef
    = AutoDisposeProviderRef<ShiftRemoteDataSource>;
String _$shiftLocalDataSourceHash() =>
    r'40344638544984aeedfd877c54d96536ce233bf4';

/// Provides the ShiftLocalDataSource.
///
/// Copied from [shiftLocalDataSource].
@ProviderFor(shiftLocalDataSource)
final shiftLocalDataSourceProvider =
    AutoDisposeFutureProvider<ShiftLocalDataSource>.internal(
  shiftLocalDataSource,
  name: r'shiftLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shiftLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShiftLocalDataSourceRef
    = AutoDisposeFutureProviderRef<ShiftLocalDataSource>;
String _$shiftRepositoryHash() => r'e04453547065439771e6ac08305a94f37b1061c0';

/// Provides the ShiftRepository.
///
/// Copied from [shiftRepository].
@ProviderFor(shiftRepository)
final shiftRepositoryProvider =
    AutoDisposeFutureProvider<ShiftRepository>.internal(
  shiftRepository,
  name: r'shiftRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shiftRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShiftRepositoryRef = AutoDisposeFutureProviderRef<ShiftRepository>;
String _$employeesHash() => r'b3262fce087c51750328dc335f9a7bd25640f4aa';

/// Provides the list of employees for the current cashier's branch.
///
/// Copied from [employees].
@ProviderFor(employees)
final employeesProvider = AutoDisposeFutureProvider<List<Employee>>.internal(
  employees,
  name: r'employeesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$employeesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EmployeesRef = AutoDisposeFutureProviderRef<List<Employee>>;
String _$activeShiftHash() => r'51c09df2140af9f3afbee3a0dbc8cd08758a3b62';

/// Provides the current active shift or null.
///
/// Copied from [activeShift].
@ProviderFor(activeShift)
final activeShiftProvider = AutoDisposeProvider<Shift?>.internal(
  activeShift,
  name: r'activeShiftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeShiftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveShiftRef = AutoDisposeProviderRef<Shift?>;
String _$hasActiveShiftHash() => r'ae1a85848a267d1d65502f866cff1968c2580f31';

/// Provides whether there is an active shift.
///
/// Copied from [hasActiveShift].
@ProviderFor(hasActiveShift)
final hasActiveShiftProvider = AutoDisposeProvider<bool>.internal(
  hasActiveShift,
  name: r'hasActiveShiftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasActiveShiftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasActiveShiftRef = AutoDisposeProviderRef<bool>;
String _$shiftNotifierHash() => r'f334fecd52b27edeb8ca17296426b290c9dac102';

/// Manages the shift state including active shift tracking.
///
/// Copied from [ShiftNotifier].
@ProviderFor(ShiftNotifier)
final shiftNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ShiftNotifier, ShiftState>.internal(
  ShiftNotifier.new,
  name: r'shiftNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shiftNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShiftNotifier = AutoDisposeAsyncNotifier<ShiftState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
