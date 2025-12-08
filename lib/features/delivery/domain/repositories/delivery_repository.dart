import '../../../../core/errors/failure.dart';
import '../entities/delivery.dart';

/// Repository interface for delivery operations.
///
/// Defines the contract for managing deliveries (stock replenishment).
/// Implementation should handle offline-first caching and sync.
abstract class DeliveryRepository {
  /// Creates a new delivery.
  ///
  /// Supports offline-first:
  /// 1. Saves locally first with a generated ID
  /// 2. Queues for sync to server
  /// 3. Updates local record with server ID after sync
  ///
  /// [dto] - The delivery data to create.
  ///
  /// Returns a tuple of (Failure?, Delivery?).
  Future<(Failure?, Delivery?)> createDelivery(CreateDeliveryDto dto);

  /// Updates an existing delivery.
  ///
  /// Supports offline-first:
  /// 1. Updates locally first
  /// 2. Queues changes for sync to server
  ///
  /// [deliveryId] - The ID of the delivery to update.
  /// [dto] - The delivery data to update.
  ///
  /// Returns a tuple of (Failure?, Delivery?).
  Future<(Failure?, Delivery?)> updateDelivery(
    String deliveryId,
    UpdateDeliveryDto dto,
  );

  /// Deletes a delivery.
  ///
  /// Supports offline-first:
  /// 1. Marks as deleted locally
  /// 2. Queues deletion for sync to server
  ///
  /// [deliveryId] - The ID of the delivery to delete.
  ///
  /// Returns a tuple of (Failure?, bool?).
  Future<(Failure?, bool?)> deleteDelivery(String deliveryId);

  /// Fetches all deliveries for the current cashier.
  ///
  /// Supports offline-first:
  /// 1. Returns cached data immediately if available
  /// 2. Fetches fresh data from server in background
  /// 3. Updates cache with server data
  ///
  /// [filter] - Optional filter for date range and product.
  /// [forceRefresh] - If true, bypasses cache and fetches from server.
  ///
  /// Returns a tuple of (Failure?, List<Delivery>?).
  Future<(Failure?, List<Delivery>?)> getDeliveries({
    DeliveryFilter? filter,
    bool forceRefresh = false,
  });

  /// Fetches a single delivery by ID.
  ///
  /// Returns cached data if offline.
  Future<(Failure?, Delivery?)> getDeliveryById(String deliveryId);

  /// Clears the delivery cache for the current cashier.
  ///
  /// Used when switching cashiers or on logout.
  Future<void> clearCache();

  /// Syncs local deliveries with server.
  ///
  /// Should be called when network becomes available.
  /// Syncs pending creates, updates, and deletes.
  Future<(Failure?, void)> syncWithServer();

  /// Gets the count of pending sync operations.
  Future<int> getPendingSyncCount();
}
