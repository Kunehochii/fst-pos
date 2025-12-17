import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource.dart';

/// Implementation of [ProductRepository].
///
/// Follows offline-first strategy:
/// 1. Returns cached data immediately if available
/// 2. Fetches fresh data from server in background
/// 3. Updates cache with server data
///
/// Supports multi-cashier scenarios by using cashierId for cache isolation.
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;
  final ProductLocalDataSource _localDataSource;
  final String _cashierId;

  ProductRepositoryImpl({
    required ProductRemoteDataSource remoteDataSource,
    required ProductLocalDataSource localDataSource,
    required String cashierId,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId;

  @override
  Future<(Failure?, List<Product>?)> getProducts({
    ProductFilter? filter,
    bool forceRefresh = false,
  }) async {
    AppLogger.debug('ProductRepository: Getting products', {
      'cashierId': _cashierId,
      'forceRefresh': forceRefresh,
      'hasFilter': filter != null,
    });

    try {
      // Check if we have cached data
      final hasCached = await _localDataSource.hasCachedProducts(_cashierId);
      final isStale = await _localDataSource.isCacheStale(_cashierId);

      // If force refresh or no cache, try to fetch from server first
      if (forceRefresh || !hasCached) {
        return _fetchAndCacheProducts(filter: filter);
      }

      // Return cached data immediately
      final cachedProducts = await _localDataSource.getCachedProducts(
        _cashierId,
        filter: filter,
      );

      // If cache is stale, trigger background refresh (non-blocking)
      if (isStale) {
        _refreshInBackground(filter: filter);
      }

      AppLogger.debug(
        'ProductRepository: Returning ${cachedProducts.length} cached products',
      );

      return (null, cachedProducts);
    } catch (e, stackTrace) {
      AppLogger.error(
          'ProductRepository: Error getting products', e, stackTrace);

      // On error, try to return cached data as fallback
      try {
        final cachedProducts = await _localDataSource.getCachedProducts(
          _cashierId,
          filter: filter,
        );

        if (cachedProducts.isNotEmpty) {
          AppLogger.debug(
            'ProductRepository: Returning cached fallback (${cachedProducts.length} products)',
          );
          return (null, cachedProducts);
        }
      } catch (_) {
        // Ignore cache errors
      }

      return (_mapException(e), null);
    }
  }

  @override
  Future<(Failure?, Product?)> getProductById(String productId) async {
    AppLogger.debug('ProductRepository: Getting product by ID', {
      'productId': productId,
      'cashierId': _cashierId,
    });

    try {
      // Try to get from cache first
      final cachedProduct = await _localDataSource.getCachedProductById(
        _cashierId,
        productId,
      );

      if (cachedProduct != null) {
        return (null, cachedProduct);
      }

      // Not in cache, fetch from server
      final productModel = await _remoteDataSource.getProductById(productId);
      final product = productModel.toEntity();

      return (null, product);
    } on DioException catch (e) {
      AppLogger.error('ProductRepository: DioException getting product', e);

      // Try cache fallback
      final cachedProduct = await _localDataSource.getCachedProductById(
        _cashierId,
        productId,
      );

      if (cachedProduct != null) {
        return (null, cachedProduct);
      }

      return (_mapDioException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'ProductRepository: Error getting product', e, stackTrace);
      return (_mapException(e), null);
    }
  }

  @override
  Future<void> clearCache() async {
    AppLogger.debug(
        'ProductRepository: Clearing cache', {'cashierId': _cashierId});
    await _localDataSource.clearCache(_cashierId);
  }

  @override
  Future<(Failure?, void)> syncWithServer() async {
    AppLogger.debug('ProductRepository: Syncing with server', {
      'cashierId': _cashierId,
    });

    try {
      await _localDataSource.setSyncStatus(_cashierId, isSyncing: true);

      final productModels = await _remoteDataSource.getProducts();
      final products = productModels.map((m) => m.toEntity()).toList();

      await _localDataSource.cacheProducts(_cashierId, products);

      AppLogger.debug(
        'ProductRepository: Sync complete (${products.length} products)',
      );

      return (null, null);
    } on DioException catch (e) {
      final failure = _mapDioException(e);
      await _localDataSource.setSyncError(_cashierId, failure.toString());
      return (failure, null);
    } catch (e, stackTrace) {
      AppLogger.error('ProductRepository: Sync error', e, stackTrace);
      final failure = _mapException(e);
      await _localDataSource.setSyncError(_cashierId, failure.toString());
      return (failure, null);
    }
  }

  /// Fetches products from server and caches them.
  Future<(Failure?, List<Product>?)> _fetchAndCacheProducts({
    ProductFilter? filter,
  }) async {
    try {
      await _localDataSource.setSyncStatus(_cashierId, isSyncing: true);

      // Fetch all products (without filter) for caching
      final productModels = await _remoteDataSource.getProducts();
      final allProducts = productModels.map((m) => m.toEntity()).toList();

      // Cache all products
      await _localDataSource.cacheProducts(_cashierId, allProducts);

      // Apply filter for return value
      if (filter != null) {
        final filteredProducts = await _localDataSource.getCachedProducts(
          _cashierId,
          filter: filter,
        );
        return (null, filteredProducts);
      }

      return (null, allProducts);
    } on DioException catch (e) {
      AppLogger.error('ProductRepository: DioException fetching products', e);
      await _localDataSource.setSyncError(
          _cashierId, e.message ?? 'Unknown error');
      return (_mapDioException(e), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'ProductRepository: Error fetching products', e, stackTrace);
      await _localDataSource.setSyncError(_cashierId, e.toString());
      return (_mapException(e), null);
    }
  }

  /// Refreshes products in background without blocking.
  void _refreshInBackground({ProductFilter? filter}) {
    AppLogger.debug('ProductRepository: Starting background refresh');

    // Fire and forget - don't await
    Future(() async {
      try {
        await _localDataSource.setSyncStatus(_cashierId, isSyncing: true);

        final productModels = await _remoteDataSource.getProducts();
        final products = productModels.map((m) => m.toEntity()).toList();

        await _localDataSource.cacheProducts(_cashierId, products);

        AppLogger.debug(
          'ProductRepository: Background refresh complete (${products.length} products)',
        );
      } catch (e, stackTrace) {
        AppLogger.error(
          'ProductRepository: Background refresh failed',
          e,
          stackTrace,
        );
        await _localDataSource.setSyncError(_cashierId, e.toString());
      }
    });
  }

  /// Maps DioException to Failure.
  Failure _mapDioException(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      return const Failure.network();
    }

    final statusCode = e.response?.statusCode;
    final message = e.response?.data?['message'] as String? ?? 'Server error';

    if (statusCode == 401) {
      return Failure.auth(message: message);
    }

    return Failure.server(message: message, statusCode: statusCode);
  }

  /// Maps generic exceptions to Failure.
  Failure _mapException(Object e) {
    if (e is DioException) {
      return _mapDioException(e);
    }

    if (e is AppException) {
      return e.toFailure();
    }

    return Failure.unknown(message: e.toString());
  }
}
