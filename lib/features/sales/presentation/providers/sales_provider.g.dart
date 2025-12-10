// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$salesRemoteDataSourceHash() =>
    r'8f18629dcc4c81b51fcaed350ec4984f1ef96719';

/// Provides the SalesRemoteDataSource.
///
/// Copied from [salesRemoteDataSource].
@ProviderFor(salesRemoteDataSource)
final salesRemoteDataSourceProvider =
    AutoDisposeProvider<SalesRemoteDataSource>.internal(
  salesRemoteDataSource,
  name: r'salesRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesRemoteDataSourceRef
    = AutoDisposeProviderRef<SalesRemoteDataSource>;
String _$salesLocalDataSourceHash() =>
    r'5819a1e8af94c5a22b8c75aa19fc05db0021ae57';

/// Provides the SalesLocalDataSource.
///
/// Copied from [salesLocalDataSource].
@ProviderFor(salesLocalDataSource)
final salesLocalDataSourceProvider =
    AutoDisposeProvider<SalesLocalDataSource>.internal(
  salesLocalDataSource,
  name: r'salesLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesLocalDataSourceRef = AutoDisposeProviderRef<SalesLocalDataSource>;
String _$salesRepositoryHash() => r'e9821cc197d3fc2ec299e3ba872237c7c3454704';

/// Provides the SalesRepository.
///
/// Copied from [salesRepository].
@ProviderFor(salesRepository)
final salesRepositoryProvider = AutoDisposeProvider<SalesRepository>.internal(
  salesRepository,
  name: r'salesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesRepositoryRef = AutoDisposeProviderRef<SalesRepository>;
String _$pendingSalesCountHash() => r'42dcd7286a8fa97c4477664a5c91ed2257b63227';

/// Provides the count of pending sync operations.
///
/// Copied from [pendingSalesCount].
@ProviderFor(pendingSalesCount)
final pendingSalesCountProvider = AutoDisposeFutureProvider<int>.internal(
  pendingSalesCount,
  name: r'pendingSalesCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingSalesCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingSalesCountRef = AutoDisposeFutureProviderRef<int>;
String _$cartNotifierHash() => r'1bcfbda55fdd1e329c2d87771e03afea2827ee4a';

/// Cart notifier for managing cart state.
///
/// Copied from [CartNotifier].
@ProviderFor(CartNotifier)
final cartNotifierProvider =
    AutoDisposeNotifierProvider<CartNotifier, CartState>.internal(
  CartNotifier.new,
  name: r'cartNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartNotifier = AutoDisposeNotifier<CartState>;
String _$checkoutNotifierHash() => r'19851e62d65d0d6b537577d212498511a32ff07a';

/// Checkout notifier for processing sales.
///
/// Copied from [CheckoutNotifier].
@ProviderFor(CheckoutNotifier)
final checkoutNotifierProvider =
    AutoDisposeNotifierProvider<CheckoutNotifier, CheckoutState>.internal(
  CheckoutNotifier.new,
  name: r'checkoutNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkoutNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckoutNotifier = AutoDisposeNotifier<CheckoutState>;
String _$salesHistoryNotifierHash() =>
    r'9082daebd97dc8b1fc3bde4cec14204e382167c6';

/// Sales history notifier.
///
/// Copied from [SalesHistoryNotifier].
@ProviderFor(SalesHistoryNotifier)
final salesHistoryNotifierProvider = AutoDisposeAsyncNotifierProvider<
    SalesHistoryNotifier, SalesListState>.internal(
  SalesHistoryNotifier.new,
  name: r'salesHistoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesHistoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SalesHistoryNotifier = AutoDisposeAsyncNotifier<SalesListState>;
String _$voidedSalesNotifierHash() =>
    r'a85887e0ac1ff1e0a0b7cf02537f32d80de10f77';

/// Voided sales history notifier.
///
/// Copied from [VoidedSalesNotifier].
@ProviderFor(VoidedSalesNotifier)
final voidedSalesNotifierProvider = AutoDisposeAsyncNotifierProvider<
    VoidedSalesNotifier, SalesListState>.internal(
  VoidedSalesNotifier.new,
  name: r'voidedSalesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voidedSalesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VoidedSalesNotifier = AutoDisposeAsyncNotifier<SalesListState>;
String _$voidSaleNotifierHash() => r'5e356895c30c125f64535a16d69712d09d7d937b';

/// Void sale notifier.
///
/// Copied from [VoidSaleNotifier].
@ProviderFor(VoidSaleNotifier)
final voidSaleNotifierProvider =
    AutoDisposeNotifierProvider<VoidSaleNotifier, VoidSaleState>.internal(
  VoidSaleNotifier.new,
  name: r'voidSaleNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voidSaleNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VoidSaleNotifier = AutoDisposeNotifier<VoidSaleState>;
String _$syncSalesNotifierHash() => r'd75c5c6cd591052324bab435ec0a878ee4013527';

/// Notifier for syncing pending sales.
///
/// Copied from [SyncSalesNotifier].
@ProviderFor(SyncSalesNotifier)
final syncSalesNotifierProvider =
    AutoDisposeNotifierProvider<SyncSalesNotifier, SyncSalesState>.internal(
  SyncSalesNotifier.new,
  name: r'syncSalesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncSalesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncSalesNotifier = AutoDisposeNotifier<SyncSalesState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
