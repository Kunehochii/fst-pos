// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$printerDataSourceHash() => r'd0dff0708d7b3f13257da4c1b9cf7a71847d4d85';

/// Provides the printer data source.
///
/// Copied from [printerDataSource].
@ProviderFor(printerDataSource)
final printerDataSourceProvider =
    AutoDisposeProvider<PrinterDataSource>.internal(
  printerDataSource,
  name: r'printerDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PrinterDataSourceRef = AutoDisposeProviderRef<PrinterDataSource>;
String _$printerRepositoryHash() => r'29f292c3090b4856c666b13571435c202186a7b7';

/// Provides the printer repository.
///
/// Copied from [printerRepository].
@ProviderFor(printerRepository)
final printerRepositoryProvider =
    AutoDisposeProvider<PrinterRepository>.internal(
  printerRepository,
  name: r'printerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PrinterRepositoryRef = AutoDisposeProviderRef<PrinterRepository>;
String _$bluetoothOnHash() => r'499a43ea61da53840e1610b27e69f1b9f0117c69';

/// Provider for Bluetooth state.
///
/// Copied from [bluetoothOn].
@ProviderFor(bluetoothOn)
final bluetoothOnProvider = AutoDisposeFutureProvider<bool>.internal(
  bluetoothOn,
  name: r'bluetoothOnProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bluetoothOnHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BluetoothOnRef = AutoDisposeFutureProviderRef<bool>;
String _$printerListNotifierHash() =>
    r'76f2a60b163c5a2e818aff51ef26385645d7a2b0';

/// Notifier for managing printer discovery and list.
///
/// Copied from [PrinterListNotifier].
@ProviderFor(PrinterListNotifier)
final printerListNotifierProvider =
    AutoDisposeNotifierProvider<PrinterListNotifier, PrinterListState>.internal(
  PrinterListNotifier.new,
  name: r'printerListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PrinterListNotifier = AutoDisposeNotifier<PrinterListState>;
String _$printerNotifierHash() => r'0aa1ef657954aecc8aadf402e656e46c5756f632';

/// Notifier for printing operations.
///
/// Copied from [PrinterNotifier].
@ProviderFor(PrinterNotifier)
final printerNotifierProvider =
    AutoDisposeNotifierProvider<PrinterNotifier, PrintingState>.internal(
  PrinterNotifier.new,
  name: r'printerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PrinterNotifier = AutoDisposeNotifier<PrintingState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
