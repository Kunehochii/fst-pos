import '../../../../core/errors/failure.dart';
import '../entities/product.dart';

/// Repository interface for product operations.
///
/// Defines the contract for fetching products.
/// Implementation should handle offline-first caching.
abstract class ProductRepository {
  /// Fetches all products for the current cashier.
  ///
  /// Supports offline-first:
  /// 1. Returns cached data immediately if available
  /// 2. Fetches fresh data from server in background
  /// 3. Updates cache with server data
  ///
  /// [filter] - Optional filter for category and search query.
  /// [forceRefresh] - If true, bypasses cache and fetches from server.
  ///
  /// Returns a tuple of (Failure?, List<Product>?).
  Future<(Failure?, List<Product>?)> getProducts({
    ProductFilter? filter,
    bool forceRefresh = false,
  });

  /// Fetches a single product by ID.
  ///
  /// Returns cached data if offline.
  Future<(Failure?, Product?)> getProductById(String productId);

  /// Clears the product cache for the current cashier.
  ///
  /// Used when switching cashiers or on logout.
  Future<void> clearCache();

  /// Syncs local cache with server.
  ///
  /// Should be called when network becomes available.
  Future<(Failure?, void)> syncWithServer();
}
