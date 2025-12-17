import '../../../../core/errors/failure.dart';
import '../entities/stock_statistics.dart';
import '../entities/transfer.dart';

/// Repository interface for stock operations.
///
/// Defines the contract for fetching stock statistics and managing transfers.
/// Implementation should handle offline-first caching.
abstract class StockRepository {
  // ============================================================================
  // STOCK STATISTICS
  // ============================================================================

  /// Fetches stock statistics for the current cashier.
  ///
  /// [filter] - Optional filter for date range.
  /// [forceRefresh] - If true, bypasses cache and fetches from server.
  ///
  /// Returns a tuple of (Failure?, StockStatistics?).
  Future<(Failure?, StockStatistics?)> getStockStatistics({
    StockFilter? filter,
    bool forceRefresh = false,
  });

  // ============================================================================
  // TRANSFERS
  // ============================================================================

  /// Creates a new transfer with sack price.
  ///
  /// Returns a tuple of (Failure?, Transfer?).
  Future<(Failure?, Transfer?)> createSackTransfer(CreateTransferSackDto dto);

  /// Creates a new transfer with per kilo price.
  ///
  /// Returns a tuple of (Failure?, Transfer?).
  Future<(Failure?, Transfer?)> createPerKiloTransfer(
      CreateTransferPerKiloDto dto);

  /// Fetches all transfers for the current cashier.
  ///
  /// Supports offline-first:
  /// 1. Returns cached data immediately if available
  /// 2. Fetches fresh data from server in background
  /// 3. Updates cache with server data
  ///
  /// [filter] - Optional filter for date range and type.
  /// [forceRefresh] - If true, bypasses cache and fetches from server.
  ///
  /// Returns a tuple of (Failure?, List<Transfer>?).
  Future<(Failure?, List<Transfer>?)> getTransfers({
    TransferFilter? filter,
    bool forceRefresh = false,
  });

  /// Fetches a single transfer by ID.
  ///
  /// Returns cached data if offline.
  Future<(Failure?, Transfer?)> getTransferById(String transferId);

  /// Updates a transfer.
  ///
  /// Returns a tuple of (Failure?, Transfer?).
  Future<(Failure?, Transfer?)> updateTransfer(
      String transferId, UpdateTransferDto dto);

  /// Deletes a transfer.
  ///
  /// Returns a tuple of (Failure?, void).
  Future<(Failure?, void)> deleteTransfer(String transferId);

  // ============================================================================
  // SYNC OPERATIONS
  // ============================================================================

  /// Clears the transfer cache for the current cashier.
  ///
  /// Used when switching cashiers or on logout.
  Future<void> clearCache();

  /// Syncs local cache with server.
  ///
  /// Should be called when network becomes available.
  Future<(Failure?, void)> syncWithServer();

  /// Gets the count of pending sync operations.
  Future<int> getPendingSyncCount();
}
