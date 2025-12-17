// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stockRemoteDataSourceHash() =>
    r'89f8b3c75bff490f7e84fa552ad9ecd65c914861';

/// Provides the StockRemoteDataSource.
///
/// Copied from [stockRemoteDataSource].
@ProviderFor(stockRemoteDataSource)
final stockRemoteDataSourceProvider =
    AutoDisposeProvider<StockRemoteDataSource>.internal(
  stockRemoteDataSource,
  name: r'stockRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stockRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockRemoteDataSourceRef
    = AutoDisposeProviderRef<StockRemoteDataSource>;
String _$stockLocalDataSourceHash() =>
    r'a3f531c9c1719d965032e60e22bebf4d2c54ad8b';

/// Provides the StockLocalDataSource.
///
/// Copied from [stockLocalDataSource].
@ProviderFor(stockLocalDataSource)
final stockLocalDataSourceProvider =
    AutoDisposeProvider<StockLocalDataSource>.internal(
  stockLocalDataSource,
  name: r'stockLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stockLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockLocalDataSourceRef = AutoDisposeProviderRef<StockLocalDataSource>;
String _$stockRepositoryHash() => r'3992f48097c360c32da7cb8ef36fb67c5eec52fb';

/// Provides the StockRepository.
///
/// Requires authenticated cashier - throws if not logged in.
///
/// Copied from [stockRepository].
@ProviderFor(stockRepository)
final stockRepositoryProvider = AutoDisposeProvider<StockRepository>.internal(
  stockRepository,
  name: r'stockRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stockRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockRepositoryRef = AutoDisposeProviderRef<StockRepository>;
String _$pendingTransferSyncCountHash() =>
    r'c129e367279e4ee30caabedcb0b00f63b2db140a';

/// Provides the pending sync count for transfers.
///
/// Copied from [pendingTransferSyncCount].
@ProviderFor(pendingTransferSyncCount)
final pendingTransferSyncCountProvider =
    AutoDisposeFutureProvider<int>.internal(
  pendingTransferSyncCount,
  name: r'pendingTransferSyncCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingTransferSyncCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingTransferSyncCountRef = AutoDisposeFutureProviderRef<int>;
String _$stockStatisticsNotifierHash() =>
    r'e0a5d075ae0b5d8617ed8c2cacd2e153863c4b70';

/// Notifier for stock statistics.
///
/// Copied from [StockStatisticsNotifier].
@ProviderFor(StockStatisticsNotifier)
final stockStatisticsNotifierProvider = AutoDisposeNotifierProvider<
    StockStatisticsNotifier, StockStatisticsState>.internal(
  StockStatisticsNotifier.new,
  name: r'stockStatisticsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stockStatisticsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StockStatisticsNotifier = AutoDisposeNotifier<StockStatisticsState>;
String _$transferListNotifierHash() =>
    r'ed7614d45a7ba362381c44b759950494881d5e19';

/// Notifier for managing transfer list.
///
/// Copied from [TransferListNotifier].
@ProviderFor(TransferListNotifier)
final transferListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    TransferListNotifier, TransferListState>.internal(
  TransferListNotifier.new,
  name: r'transferListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transferListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransferListNotifier = AutoDisposeAsyncNotifier<TransferListState>;
String _$createTransferNotifierHash() =>
    r'56411a89ef57f38b37c7366af0005ead00e9f306';

/// Notifier for creating transfers.
///
/// Copied from [CreateTransferNotifier].
@ProviderFor(CreateTransferNotifier)
final createTransferNotifierProvider = AutoDisposeNotifierProvider<
    CreateTransferNotifier, CreateTransferState>.internal(
  CreateTransferNotifier.new,
  name: r'createTransferNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createTransferNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateTransferNotifier = AutoDisposeNotifier<CreateTransferState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
