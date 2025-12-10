// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_operations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hasPendingSyncHash() => r'a4566efe3e331c4657f50f8c9d03637e0caa41e8';

/// Checks if there are pending syncs.
///
/// Copied from [hasPendingSync].
@ProviderFor(hasPendingSync)
final hasPendingSyncProvider = AutoDisposeFutureProvider<bool>.internal(
  hasPendingSync,
  name: r'hasPendingSyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasPendingSyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasPendingSyncRef = AutoDisposeFutureProviderRef<bool>;
String _$sheetOperationsHash() => r'0542fe3fc9d1341705427a69152d723015109a3e';

/// Handles sheet operations (add row, update cells, delete, etc.)
///
/// Copied from [SheetOperations].
@ProviderFor(SheetOperations)
final sheetOperationsProvider =
    AutoDisposeNotifierProvider<SheetOperations, AsyncValue<void>>.internal(
  SheetOperations.new,
  name: r'sheetOperationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sheetOperationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SheetOperations = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
