// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deliveryRemoteDataSourceHash() =>
    r'9885c3ac4bf12b2e1ab6d86903091d892a03a7bc';

/// Provides the DeliveryRemoteDataSource.
///
/// Copied from [deliveryRemoteDataSource].
@ProviderFor(deliveryRemoteDataSource)
final deliveryRemoteDataSourceProvider =
    AutoDisposeProvider<DeliveryRemoteDataSource>.internal(
  deliveryRemoteDataSource,
  name: r'deliveryRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveryRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeliveryRemoteDataSourceRef
    = AutoDisposeProviderRef<DeliveryRemoteDataSource>;
String _$deliveryLocalDataSourceHash() =>
    r'3045f6ccd44a5c57e5225a499b6585c9795c1c34';

/// Provides the DeliveryLocalDataSource.
///
/// Copied from [deliveryLocalDataSource].
@ProviderFor(deliveryLocalDataSource)
final deliveryLocalDataSourceProvider =
    AutoDisposeProvider<DeliveryLocalDataSource>.internal(
  deliveryLocalDataSource,
  name: r'deliveryLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveryLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeliveryLocalDataSourceRef
    = AutoDisposeProviderRef<DeliveryLocalDataSource>;
String _$deliveryRepositoryHash() =>
    r'f0a3d651ded891835a127ff2d2c52ccc6715d44a';

/// Provides the DeliveryRepository.
///
/// Requires authenticated cashier - throws if not logged in.
///
/// Copied from [deliveryRepository].
@ProviderFor(deliveryRepository)
final deliveryRepositoryProvider =
    AutoDisposeProvider<DeliveryRepository>.internal(
  deliveryRepository,
  name: r'deliveryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeliveryRepositoryRef = AutoDisposeProviderRef<DeliveryRepository>;
String _$deliveryByIdHash() => r'0e1efc62010c6645274ff03c41d63f46a326a392';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provides a single delivery by ID.
///
/// Copied from [deliveryById].
@ProviderFor(deliveryById)
const deliveryByIdProvider = DeliveryByIdFamily();

/// Provides a single delivery by ID.
///
/// Copied from [deliveryById].
class DeliveryByIdFamily extends Family<AsyncValue<Delivery?>> {
  /// Provides a single delivery by ID.
  ///
  /// Copied from [deliveryById].
  const DeliveryByIdFamily();

  /// Provides a single delivery by ID.
  ///
  /// Copied from [deliveryById].
  DeliveryByIdProvider call(
    String deliveryId,
  ) {
    return DeliveryByIdProvider(
      deliveryId,
    );
  }

  @override
  DeliveryByIdProvider getProviderOverride(
    covariant DeliveryByIdProvider provider,
  ) {
    return call(
      provider.deliveryId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deliveryByIdProvider';
}

/// Provides a single delivery by ID.
///
/// Copied from [deliveryById].
class DeliveryByIdProvider extends AutoDisposeFutureProvider<Delivery?> {
  /// Provides a single delivery by ID.
  ///
  /// Copied from [deliveryById].
  DeliveryByIdProvider(
    String deliveryId,
  ) : this._internal(
          (ref) => deliveryById(
            ref as DeliveryByIdRef,
            deliveryId,
          ),
          from: deliveryByIdProvider,
          name: r'deliveryByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deliveryByIdHash,
          dependencies: DeliveryByIdFamily._dependencies,
          allTransitiveDependencies:
              DeliveryByIdFamily._allTransitiveDependencies,
          deliveryId: deliveryId,
        );

  DeliveryByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deliveryId,
  }) : super.internal();

  final String deliveryId;

  @override
  Override overrideWith(
    FutureOr<Delivery?> Function(DeliveryByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeliveryByIdProvider._internal(
        (ref) => create(ref as DeliveryByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deliveryId: deliveryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Delivery?> createElement() {
    return _DeliveryByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeliveryByIdProvider && other.deliveryId == deliveryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deliveryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeliveryByIdRef on AutoDisposeFutureProviderRef<Delivery?> {
  /// The parameter `deliveryId` of this provider.
  String get deliveryId;
}

class _DeliveryByIdProviderElement
    extends AutoDisposeFutureProviderElement<Delivery?> with DeliveryByIdRef {
  _DeliveryByIdProviderElement(super.provider);

  @override
  String get deliveryId => (origin as DeliveryByIdProvider).deliveryId;
}

String _$pendingDeliverySyncCountHash() =>
    r'a4f5d2d866b72308a6bc6b3404f8844c79e56b8c';

/// Provides the count of pending sync operations.
///
/// Copied from [pendingDeliverySyncCount].
@ProviderFor(pendingDeliverySyncCount)
final pendingDeliverySyncCountProvider =
    AutoDisposeFutureProvider<int>.internal(
  pendingDeliverySyncCount,
  name: r'pendingDeliverySyncCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingDeliverySyncCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingDeliverySyncCountRef = AutoDisposeFutureProviderRef<int>;
String _$deliveryListNotifierHash() =>
    r'd7a8c13d3dd8b970794133fcc82b2da857cec4f4';

/// Manages the delivery list state with filtering.
///
/// Provides:
/// - Fetching deliveries with offline-first strategy
/// - Filtering by date range
/// - Searching by product
/// - Pull-to-refresh functionality
/// - Sync status tracking
///
/// Copied from [DeliveryListNotifier].
@ProviderFor(DeliveryListNotifier)
final deliveryListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    DeliveryListNotifier, DeliveryListState>.internal(
  DeliveryListNotifier.new,
  name: r'deliveryListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveryListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeliveryListNotifier = AutoDisposeAsyncNotifier<DeliveryListState>;
String _$createDeliveryNotifierHash() =>
    r'2001b798a14acdfb8eaf0e4f4cc342c99a6453ee';

/// Manages creating a new delivery.
///
/// Copied from [CreateDeliveryNotifier].
@ProviderFor(CreateDeliveryNotifier)
final createDeliveryNotifierProvider = AutoDisposeNotifierProvider<
    CreateDeliveryNotifier, CreateDeliveryState>.internal(
  CreateDeliveryNotifier.new,
  name: r'createDeliveryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createDeliveryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateDeliveryNotifier = AutoDisposeNotifier<CreateDeliveryState>;
String _$deleteDeliveryNotifierHash() =>
    r'af77242d69ef0e615a780440fe3e239092898d02';

/// Manages deleting a delivery.
///
/// Copied from [DeleteDeliveryNotifier].
@ProviderFor(DeleteDeliveryNotifier)
final deleteDeliveryNotifierProvider = AutoDisposeNotifierProvider<
    DeleteDeliveryNotifier, AsyncValue<void>>.internal(
  DeleteDeliveryNotifier.new,
  name: r'deleteDeliveryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteDeliveryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeleteDeliveryNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
