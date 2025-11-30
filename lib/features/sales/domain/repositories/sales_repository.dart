import '../../../../core/errors/failure.dart';
import '../entities/sale.dart';

/// Repository interface for sales operations.
abstract class SalesRepository {
  /// Create a new sale.
  ///
  /// Returns a tuple of (Failure?, Sale?).
  /// If online, syncs immediately. If offline, queues for later sync.
  Future<(Failure?, Sale?)> createSale(Sale sale);

  /// Void an existing sale.
  ///
  /// Returns a tuple of (Failure?, Sale?).
  /// If online, syncs immediately. If offline, queues for later sync.
  Future<(Failure?, Sale?)> voidSale(String saleId);

  /// Get all sales for the current cashier.
  ///
  /// Returns a tuple of (Failure?, List<Sale>?).
  /// Fetches from local cache first, then syncs with server if online.
  Future<(Failure?, List<Sale>?)> getSales({
    int page = 1,
    int limit = 20,
    bool includeVoided = false,
  });

  /// Get a single sale by ID.
  Future<(Failure?, Sale?)> getSaleById(String saleId);

  /// Get voided sales for the current cashier.
  Future<(Failure?, List<Sale>?)> getVoidedSales({
    int page = 1,
    int limit = 20,
  });

  /// Sync pending sales with the server.
  ///
  /// Called when the device comes online.
  Future<(Failure?, int)> syncPendingSales();

  /// Get the count of pending (unsynced) sales.
  Future<int> getPendingSalesCount();
}
