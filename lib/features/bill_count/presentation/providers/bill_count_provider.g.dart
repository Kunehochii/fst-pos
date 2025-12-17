// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$billCountRemoteDataSourceHash() =>
    r'5c0aa4b83b68f284c9c36fc7ea99c6c0ef240647';

/// Provides the BillCountRemoteDataSource.
///
/// Copied from [billCountRemoteDataSource].
@ProviderFor(billCountRemoteDataSource)
final billCountRemoteDataSourceProvider =
    AutoDisposeProvider<BillCountRemoteDataSource>.internal(
  billCountRemoteDataSource,
  name: r'billCountRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billCountRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BillCountRemoteDataSourceRef
    = AutoDisposeProviderRef<BillCountRemoteDataSource>;
String _$billCountLocalDataSourceHash() =>
    r'6fe9f76d23d8be2f55846eaee1f889c32cc90942';

/// Provides the BillCountLocalDataSource.
///
/// Copied from [billCountLocalDataSource].
@ProviderFor(billCountLocalDataSource)
final billCountLocalDataSourceProvider =
    AutoDisposeProvider<BillCountLocalDataSource>.internal(
  billCountLocalDataSource,
  name: r'billCountLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billCountLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BillCountLocalDataSourceRef
    = AutoDisposeProviderRef<BillCountLocalDataSource>;
String _$billCountRepositoryHash() =>
    r'bc6a01a81490ff5b9282fdfe7f3f600566eabafc';

/// Provides the BillCountRepository.
///
/// Copied from [billCountRepository].
@ProviderFor(billCountRepository)
final billCountRepositoryProvider =
    AutoDisposeProvider<BillCountRepository>.internal(
  billCountRepository,
  name: r'billCountRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billCountRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BillCountRepositoryRef = AutoDisposeProviderRef<BillCountRepository>;
String _$billCountDateNotifierHash() =>
    r'dc513910798ac174c637831ee49867f4d2bfeb47';

/// State for the current bill count date filter.
///
/// Copied from [BillCountDateNotifier].
@ProviderFor(BillCountDateNotifier)
final billCountDateNotifierProvider =
    AutoDisposeNotifierProvider<BillCountDateNotifier, DateTime>.internal(
  BillCountDateNotifier.new,
  name: r'billCountDateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billCountDateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BillCountDateNotifier = AutoDisposeNotifier<DateTime>;
String _$billCountNotifierHash() => r'5ac53ebd3c9f94295c82a5960a87b25a9f4c5ff4';

/// Notifier for managing bill count state.
///
/// Copied from [BillCountNotifier].
@ProviderFor(BillCountNotifier)
final billCountNotifierProvider = AutoDisposeAsyncNotifierProvider<
    BillCountNotifier, BillCountState>.internal(
  BillCountNotifier.new,
  name: r'billCountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billCountNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BillCountNotifier = AutoDisposeAsyncNotifier<BillCountState>;
String _$billInputNotifierHash() => r'0de9c181bd7c9162105b9645c806264cd6a2c0ec';

/// Notifier for managing bill input form state.
///
/// Copied from [BillInputNotifier].
@ProviderFor(BillInputNotifier)
final billInputNotifierProvider =
    AutoDisposeNotifierProvider<BillInputNotifier, BillInputState>.internal(
  BillInputNotifier.new,
  name: r'billInputNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billInputNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BillInputNotifier = AutoDisposeNotifier<BillInputState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
