// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profitRemoteDataSourceHash() =>
    r'754a61c2eca632e71a3ac6b5c64e1951bfd46a4a';

/// Provides the ProfitRemoteDataSource.
///
/// Copied from [profitRemoteDataSource].
@ProviderFor(profitRemoteDataSource)
final profitRemoteDataSourceProvider =
    AutoDisposeProvider<ProfitRemoteDataSource>.internal(
  profitRemoteDataSource,
  name: r'profitRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profitRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfitRemoteDataSourceRef
    = AutoDisposeProviderRef<ProfitRemoteDataSource>;
String _$profitLocalDataSourceHash() =>
    r'37e6bd0cec1a2d39411b1d62d5219c65233f46de';

/// Provides the ProfitLocalDataSource.
///
/// Copied from [profitLocalDataSource].
@ProviderFor(profitLocalDataSource)
final profitLocalDataSourceProvider =
    AutoDisposeProvider<ProfitLocalDataSource>.internal(
  profitLocalDataSource,
  name: r'profitLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profitLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfitLocalDataSourceRef
    = AutoDisposeProviderRef<ProfitLocalDataSource>;
String _$profitRepositoryHash() => r'9015cc304153e1b00f75c9f4b72275e0cdf75f66';

/// Provides the ProfitRepository.
///
/// Copied from [profitRepository].
@ProviderFor(profitRepository)
final profitRepositoryProvider = AutoDisposeProvider<ProfitRepository>.internal(
  profitRepository,
  name: r'profitRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profitRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfitRepositoryRef = AutoDisposeProviderRef<ProfitRepository>;
String _$groupedProfitsByProductHash() =>
    r'2d7cf29fbb301d6cae1183bf468bfbf26c6776d6';

/// Provider for grouped profits organized by product name.
/// Used for the "By Product" view.
///
/// Copied from [groupedProfitsByProduct].
@ProviderFor(groupedProfitsByProduct)
final groupedProfitsByProductProvider =
    AutoDisposeProvider<Map<String, List<GroupedProfit>>>.internal(
  groupedProfitsByProduct,
  name: r'groupedProfitsByProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupedProfitsByProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupedProfitsByProductRef
    = AutoDisposeProviderRef<Map<String, List<GroupedProfit>>>;
String _$isProfitOfflineHash() => r'925af4deb0f308ae85b8129c9596add6fc3c6a25';

/// Provider for checking if currently offline.
///
/// Copied from [isProfitOffline].
@ProviderFor(isProfitOffline)
final isProfitOfflineProvider = AutoDisposeFutureProvider<bool>.internal(
  isProfitOffline,
  name: r'isProfitOfflineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isProfitOfflineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsProfitOfflineRef = AutoDisposeFutureProviderRef<bool>;
String _$profitFilterNotifierHash() =>
    r'4d76312b0312057b9f5f87b4337d5924cd30e296';

/// State for the current profit filter.
///
/// Copied from [ProfitFilterNotifier].
@ProviderFor(ProfitFilterNotifier)
final profitFilterNotifierProvider =
    AutoDisposeNotifierProvider<ProfitFilterNotifier, ProfitFilter>.internal(
  ProfitFilterNotifier.new,
  name: r'profitFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profitFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfitFilterNotifier = AutoDisposeNotifier<ProfitFilter>;
String _$profitViewTypeNotifierHash() =>
    r'2b9e9cb362c532fa25850e14c9f1655a5d78a478';

/// Current view type for profit display.
///
/// Copied from [ProfitViewTypeNotifier].
@ProviderFor(ProfitViewTypeNotifier)
final profitViewTypeNotifierProvider = AutoDisposeNotifierProvider<
    ProfitViewTypeNotifier, ProfitViewType>.internal(
  ProfitViewTypeNotifier.new,
  name: r'profitViewTypeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profitViewTypeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfitViewTypeNotifier = AutoDisposeNotifier<ProfitViewType>;
String _$profitNotifierHash() => r'67eb47daf8d06b2f749817690b491008ef8f9aad';

/// Notifier for fetching and managing profit data.
///
/// Copied from [ProfitNotifier].
@ProviderFor(ProfitNotifier)
final profitNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProfitNotifier, ProfitState>.internal(
  ProfitNotifier.new,
  name: r'profitNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profitNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfitNotifier = AutoDisposeAsyncNotifier<ProfitState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
