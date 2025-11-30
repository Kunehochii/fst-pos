import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/product_local_datasource.dart';
import '../../data/datasources/product_remote_datasource.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

part 'product_provider.g.dart';

/// Provides the ProductRemoteDataSource.
@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return ProductRemoteDataSource(dio);
}

/// Provides the ProductLocalDataSource.
@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return ProductLocalDataSource(db);
}

/// Provides the ProductRepository.
///
/// Requires authenticated cashier - throws if not logged in.
@riverpod
ProductRepository productRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(productRemoteDataSourceProvider);
          final localDataSource = ref.watch(productLocalDataSourceProvider);

          return ProductRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access products'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

/// State for the product list.
sealed class ProductListState {
  const ProductListState();
}

class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

class ProductListLoaded extends ProductListState {
  final List<Product> products;
  final bool isRefreshing;

  const ProductListLoaded({
    required this.products,
    this.isRefreshing = false,
  });

  ProductListLoaded copyWith({
    List<Product>? products,
    bool? isRefreshing,
  }) {
    return ProductListLoaded(
      products: products ?? this.products,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class ProductListError extends ProductListState {
  final Failure failure;
  final List<Product>? cachedProducts;

  const ProductListError({
    required this.failure,
    this.cachedProducts,
  });
}

/// Manages the product list state with filtering.
///
/// Provides:
/// - Fetching products with offline-first strategy
/// - Filtering by category
/// - Searching by name
/// - Pull-to-refresh functionality
@riverpod
class ProductListNotifier extends _$ProductListNotifier {
  ProductFilter _currentFilter = const ProductFilter();

  @override
  Future<ProductListState> build() async {
    return _loadProducts();
  }

  /// Gets the current filter.
  ProductFilter get currentFilter => _currentFilter;

  /// Loads products with the current filter.
  Future<ProductListState> _loadProducts({bool forceRefresh = false}) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      final (failure, products) = await repository.getProducts(
        filter: _currentFilter,
        forceRefresh: forceRefresh,
      );

      if (failure != null) {
        return ProductListError(failure: failure);
      }

      return ProductListLoaded(products: products ?? []);
    } on StateError catch (e) {
      return ProductListError(
        failure: Failure.auth(message: e.message),
      );
    }
  }

  /// Refreshes the product list from server.
  Future<void> refresh() async {
    final currentState = state.valueOrNull;

    if (currentState is ProductListLoaded) {
      state = AsyncData(currentState.copyWith(isRefreshing: true));
    }

    final newState = await _loadProducts(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Sets a category filter.
  Future<void> setCategory(ProductCategory? category) async {
    if (_currentFilter.category == category) return;

    _currentFilter = ProductFilter(
      category: category,
      searchQuery: _currentFilter.searchQuery,
    );

    state = const AsyncLoading();
    final newState = await _loadProducts();
    state = AsyncData(newState);
  }

  /// Sets a search query filter.
  Future<void> setSearchQuery(String? query) async {
    final trimmedQuery = query?.trim();
    if (_currentFilter.searchQuery == trimmedQuery) return;

    _currentFilter = ProductFilter(
      category: _currentFilter.category,
      searchQuery: trimmedQuery?.isEmpty == true ? null : trimmedQuery,
    );

    state = const AsyncLoading();
    final newState = await _loadProducts();
    state = AsyncData(newState);
  }

  /// Clears all filters.
  Future<void> clearFilters() async {
    if (_currentFilter.category == null && _currentFilter.searchQuery == null) {
      return;
    }

    _currentFilter = const ProductFilter();
    state = const AsyncLoading();
    final newState = await _loadProducts();
    state = AsyncData(newState);
  }
}

/// Provides a single product by ID.
///
/// Useful for detail pages or when you need a specific product.
@riverpod
Future<Product?> productById(Ref ref, String productId) async {
  try {
    final repository = ref.watch(productRepositoryProvider);
    final (failure, product) = await repository.getProductById(productId);

    if (failure != null) {
      throw Exception(failure.toString());
    }

    return product;
  } on StateError {
    return null;
  }
}

/// Provides filtered products with a specific category.
///
/// Convenience provider for screens that only need one category.
@riverpod
Future<List<Product>> productsByCategory(
  Ref ref,
  ProductCategory category,
) async {
  try {
    final repository = ref.watch(productRepositoryProvider);
    final (failure, products) = await repository.getProducts(
      filter: ProductFilter(category: category),
    );

    if (failure != null) {
      throw Exception(failure.toString());
    }

    return products ?? [];
  } on StateError {
    return [];
  }
}

/// Provides a stream-like notifier for product search.
///
/// Use this with a debounced text field for search-as-you-type functionality.
@riverpod
class ProductSearchNotifier extends _$ProductSearchNotifier {
  @override
  Future<List<Product>> build(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    try {
      final repository = ref.read(productRepositoryProvider);
      final (failure, products) = await repository.getProducts(
        filter: ProductFilter(searchQuery: query),
      );

      if (failure != null) {
        return [];
      }

      return products ?? [];
    } on StateError {
      return [];
    }
  }
}
