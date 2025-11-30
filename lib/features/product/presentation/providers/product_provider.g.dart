// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRemoteDataSourceHash() =>
    r'a150ae982e1ac111729af7f6eb5e20d99c601940';

/// Provides the ProductRemoteDataSource.
///
/// Copied from [productRemoteDataSource].
@ProviderFor(productRemoteDataSource)
final productRemoteDataSourceProvider =
    AutoDisposeProvider<ProductRemoteDataSource>.internal(
  productRemoteDataSource,
  name: r'productRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRemoteDataSourceRef
    = AutoDisposeProviderRef<ProductRemoteDataSource>;
String _$productLocalDataSourceHash() =>
    r'5109b504aff341940c8d78a84fe98c19d167c9a1';

/// Provides the ProductLocalDataSource.
///
/// Copied from [productLocalDataSource].
@ProviderFor(productLocalDataSource)
final productLocalDataSourceProvider =
    AutoDisposeProvider<ProductLocalDataSource>.internal(
  productLocalDataSource,
  name: r'productLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductLocalDataSourceRef
    = AutoDisposeProviderRef<ProductLocalDataSource>;
String _$productRepositoryHash() => r'aaee0c11edddbe9e9f7de66f02a39d67ea207ce2';

/// Provides the ProductRepository.
///
/// Requires authenticated cashier - throws if not logged in.
///
/// Copied from [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productByIdHash() => r'dd122e2a8d554929d4d4d17e473f0c753599b58b';

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

/// Provides a single product by ID.
///
/// Useful for detail pages or when you need a specific product.
///
/// Copied from [productById].
@ProviderFor(productById)
const productByIdProvider = ProductByIdFamily();

/// Provides a single product by ID.
///
/// Useful for detail pages or when you need a specific product.
///
/// Copied from [productById].
class ProductByIdFamily extends Family<AsyncValue<Product?>> {
  /// Provides a single product by ID.
  ///
  /// Useful for detail pages or when you need a specific product.
  ///
  /// Copied from [productById].
  const ProductByIdFamily();

  /// Provides a single product by ID.
  ///
  /// Useful for detail pages or when you need a specific product.
  ///
  /// Copied from [productById].
  ProductByIdProvider call(
    String productId,
  ) {
    return ProductByIdProvider(
      productId,
    );
  }

  @override
  ProductByIdProvider getProviderOverride(
    covariant ProductByIdProvider provider,
  ) {
    return call(
      provider.productId,
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
  String? get name => r'productByIdProvider';
}

/// Provides a single product by ID.
///
/// Useful for detail pages or when you need a specific product.
///
/// Copied from [productById].
class ProductByIdProvider extends AutoDisposeFutureProvider<Product?> {
  /// Provides a single product by ID.
  ///
  /// Useful for detail pages or when you need a specific product.
  ///
  /// Copied from [productById].
  ProductByIdProvider(
    String productId,
  ) : this._internal(
          (ref) => productById(
            ref as ProductByIdRef,
            productId,
          ),
          from: productByIdProvider,
          name: r'productByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productByIdHash,
          dependencies: ProductByIdFamily._dependencies,
          allTransitiveDependencies:
              ProductByIdFamily._allTransitiveDependencies,
          productId: productId,
        );

  ProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    FutureOr<Product?> Function(ProductByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductByIdProvider._internal(
        (ref) => create(ref as ProductByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product?> createElement() {
    return _ProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByIdProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductByIdRef on AutoDisposeFutureProviderRef<Product?> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductByIdProviderElement
    extends AutoDisposeFutureProviderElement<Product?> with ProductByIdRef {
  _ProductByIdProviderElement(super.provider);

  @override
  String get productId => (origin as ProductByIdProvider).productId;
}

String _$productsByCategoryHash() =>
    r'5c49d35170fd988abf9ce2d8c6deb3fd036f3d7e';

/// Provides filtered products with a specific category.
///
/// Convenience provider for screens that only need one category.
///
/// Copied from [productsByCategory].
@ProviderFor(productsByCategory)
const productsByCategoryProvider = ProductsByCategoryFamily();

/// Provides filtered products with a specific category.
///
/// Convenience provider for screens that only need one category.
///
/// Copied from [productsByCategory].
class ProductsByCategoryFamily extends Family<AsyncValue<List<Product>>> {
  /// Provides filtered products with a specific category.
  ///
  /// Convenience provider for screens that only need one category.
  ///
  /// Copied from [productsByCategory].
  const ProductsByCategoryFamily();

  /// Provides filtered products with a specific category.
  ///
  /// Convenience provider for screens that only need one category.
  ///
  /// Copied from [productsByCategory].
  ProductsByCategoryProvider call(
    ProductCategory category,
  ) {
    return ProductsByCategoryProvider(
      category,
    );
  }

  @override
  ProductsByCategoryProvider getProviderOverride(
    covariant ProductsByCategoryProvider provider,
  ) {
    return call(
      provider.category,
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
  String? get name => r'productsByCategoryProvider';
}

/// Provides filtered products with a specific category.
///
/// Convenience provider for screens that only need one category.
///
/// Copied from [productsByCategory].
class ProductsByCategoryProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// Provides filtered products with a specific category.
  ///
  /// Convenience provider for screens that only need one category.
  ///
  /// Copied from [productsByCategory].
  ProductsByCategoryProvider(
    ProductCategory category,
  ) : this._internal(
          (ref) => productsByCategory(
            ref as ProductsByCategoryRef,
            category,
          ),
          from: productsByCategoryProvider,
          name: r'productsByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsByCategoryHash,
          dependencies: ProductsByCategoryFamily._dependencies,
          allTransitiveDependencies:
              ProductsByCategoryFamily._allTransitiveDependencies,
          category: category,
        );

  ProductsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final ProductCategory category;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(ProductsByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductsByCategoryProvider._internal(
        (ref) => create(ref as ProductsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _ProductsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsByCategoryProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsByCategoryRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `category` of this provider.
  ProductCategory get category;
}

class _ProductsByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with ProductsByCategoryRef {
  _ProductsByCategoryProviderElement(super.provider);

  @override
  ProductCategory get category =>
      (origin as ProductsByCategoryProvider).category;
}

String _$productListNotifierHash() =>
    r'085a9a887a0fb5b6ec178b78496032b4f39a19e7';

/// Manages the product list state with filtering.
///
/// Provides:
/// - Fetching products with offline-first strategy
/// - Filtering by category
/// - Searching by name
/// - Pull-to-refresh functionality
///
/// Copied from [ProductListNotifier].
@ProviderFor(ProductListNotifier)
final productListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    ProductListNotifier, ProductListState>.internal(
  ProductListNotifier.new,
  name: r'productListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductListNotifier = AutoDisposeAsyncNotifier<ProductListState>;
String _$productSearchNotifierHash() =>
    r'3fa9459556a1644764c7ba0c24e4abdf74fb8e6d';

abstract class _$ProductSearchNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final String query;

  FutureOr<List<Product>> build(
    String query,
  );
}

/// Provides a stream-like notifier for product search.
///
/// Use this with a debounced text field for search-as-you-type functionality.
///
/// Copied from [ProductSearchNotifier].
@ProviderFor(ProductSearchNotifier)
const productSearchNotifierProvider = ProductSearchNotifierFamily();

/// Provides a stream-like notifier for product search.
///
/// Use this with a debounced text field for search-as-you-type functionality.
///
/// Copied from [ProductSearchNotifier].
class ProductSearchNotifierFamily extends Family<AsyncValue<List<Product>>> {
  /// Provides a stream-like notifier for product search.
  ///
  /// Use this with a debounced text field for search-as-you-type functionality.
  ///
  /// Copied from [ProductSearchNotifier].
  const ProductSearchNotifierFamily();

  /// Provides a stream-like notifier for product search.
  ///
  /// Use this with a debounced text field for search-as-you-type functionality.
  ///
  /// Copied from [ProductSearchNotifier].
  ProductSearchNotifierProvider call(
    String query,
  ) {
    return ProductSearchNotifierProvider(
      query,
    );
  }

  @override
  ProductSearchNotifierProvider getProviderOverride(
    covariant ProductSearchNotifierProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'productSearchNotifierProvider';
}

/// Provides a stream-like notifier for product search.
///
/// Use this with a debounced text field for search-as-you-type functionality.
///
/// Copied from [ProductSearchNotifier].
class ProductSearchNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductSearchNotifier,
        List<Product>> {
  /// Provides a stream-like notifier for product search.
  ///
  /// Use this with a debounced text field for search-as-you-type functionality.
  ///
  /// Copied from [ProductSearchNotifier].
  ProductSearchNotifierProvider(
    String query,
  ) : this._internal(
          () => ProductSearchNotifier()..query = query,
          from: productSearchNotifierProvider,
          name: r'productSearchNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productSearchNotifierHash,
          dependencies: ProductSearchNotifierFamily._dependencies,
          allTransitiveDependencies:
              ProductSearchNotifierFamily._allTransitiveDependencies,
          query: query,
        );

  ProductSearchNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<Product>> runNotifierBuild(
    covariant ProductSearchNotifier notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(ProductSearchNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductSearchNotifierProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductSearchNotifier, List<Product>>
      createElement() {
    return _ProductSearchNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductSearchNotifierProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductSearchNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _ProductSearchNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductSearchNotifier,
        List<Product>> with ProductSearchNotifierRef {
  _ProductSearchNotifierProviderElement(super.provider);

  @override
  String get query => (origin as ProductSearchNotifierProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
