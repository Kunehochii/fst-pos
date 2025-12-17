// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_check_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$salesCheckRemoteDataSourceHash() =>
    r'365fa05f1dc5a87a8b392ce7b9ae5c178611f1a3';

/// Provides the SalesCheckRemoteDataSource.
///
/// Copied from [salesCheckRemoteDataSource].
@ProviderFor(salesCheckRemoteDataSource)
final salesCheckRemoteDataSourceProvider =
    AutoDisposeProvider<SalesCheckRemoteDataSource>.internal(
  salesCheckRemoteDataSource,
  name: r'salesCheckRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesCheckRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesCheckRemoteDataSourceRef
    = AutoDisposeProviderRef<SalesCheckRemoteDataSource>;
String _$salesCheckLocalDataSourceHash() =>
    r'2e3d30ced84c12a20890fd25b839db4af1b5bfec';

/// Provides the SalesCheckLocalDataSource.
///
/// Copied from [salesCheckLocalDataSource].
@ProviderFor(salesCheckLocalDataSource)
final salesCheckLocalDataSourceProvider =
    AutoDisposeProvider<SalesCheckLocalDataSource>.internal(
  salesCheckLocalDataSource,
  name: r'salesCheckLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesCheckLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesCheckLocalDataSourceRef
    = AutoDisposeProviderRef<SalesCheckLocalDataSource>;
String _$salesCheckRepositoryHash() =>
    r'f290011291ccb9eb42371e9d733702ceff736140';

/// Provides the SalesCheckRepository.
///
/// Copied from [salesCheckRepository].
@ProviderFor(salesCheckRepository)
final salesCheckRepositoryProvider =
    AutoDisposeProvider<SalesCheckRepository>.internal(
  salesCheckRepository,
  name: r'salesCheckRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesCheckRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesCheckRepositoryRef = AutoDisposeProviderRef<SalesCheckRepository>;
String _$groupedSalesByProductHash() =>
    r'1d2a6517a7298a4efcaadfff84c99c035a33895b';

/// Provider for grouped sales organized by product name.
/// Used for the "By Product" view.
///
/// Copied from [groupedSalesByProduct].
@ProviderFor(groupedSalesByProduct)
final groupedSalesByProductProvider =
    AutoDisposeProvider<Map<String, List<GroupedSale>>>.internal(
  groupedSalesByProduct,
  name: r'groupedSalesByProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupedSalesByProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupedSalesByProductRef
    = AutoDisposeProviderRef<Map<String, List<GroupedSale>>>;
String _$isOfflineHash() => r'd4f21a25273581ad45b06184f414473edee09878';

/// Provider for checking if currently offline.
///
/// Copied from [isOffline].
@ProviderFor(isOffline)
final isOfflineProvider = AutoDisposeFutureProvider<bool>.internal(
  isOffline,
  name: r'isOfflineProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isOfflineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsOfflineRef = AutoDisposeFutureProviderRef<bool>;
String _$salesCheckFilterNotifierHash() =>
    r'fcb4432e7027dc20a56c6e338bce55edcbec066f';

/// State for the current sales check filter.
///
/// Copied from [SalesCheckFilterNotifier].
@ProviderFor(SalesCheckFilterNotifier)
final salesCheckFilterNotifierProvider = AutoDisposeNotifierProvider<
    SalesCheckFilterNotifier, SalesCheckFilter>.internal(
  SalesCheckFilterNotifier.new,
  name: r'salesCheckFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesCheckFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SalesCheckFilterNotifier = AutoDisposeNotifier<SalesCheckFilter>;
String _$salesCheckViewTypeNotifierHash() =>
    r'47b1b00a101e373dcbdeea2f016f950b81e7067f';

/// Current view type for sales check display.
///
/// Copied from [SalesCheckViewTypeNotifier].
@ProviderFor(SalesCheckViewTypeNotifier)
final salesCheckViewTypeNotifierProvider = AutoDisposeNotifierProvider<
    SalesCheckViewTypeNotifier, SalesCheckViewType>.internal(
  SalesCheckViewTypeNotifier.new,
  name: r'salesCheckViewTypeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesCheckViewTypeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SalesCheckViewTypeNotifier = AutoDisposeNotifier<SalesCheckViewType>;
String _$salesCheckNotifierHash() =>
    r'1bc40239c4ce5822579b40198940f320d2e080a0';

/// Notifier for fetching and managing sales check data.
///
/// Copied from [SalesCheckNotifier].
@ProviderFor(SalesCheckNotifier)
final salesCheckNotifierProvider = AutoDisposeAsyncNotifierProvider<
    SalesCheckNotifier, SalesCheckState>.internal(
  SalesCheckNotifier.new,
  name: r'salesCheckNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesCheckNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SalesCheckNotifier = AutoDisposeAsyncNotifier<SalesCheckState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
