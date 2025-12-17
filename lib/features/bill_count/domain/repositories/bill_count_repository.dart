import '../../../../core/errors/failure.dart';
import '../entities/bill_count.dart';

/// Repository interface for bill count operations.
abstract class BillCountRepository {
  /// Get bill count for a specific date.
  ///
  /// Returns a tuple of (Failure?, BillCount?).
  /// If no bill count exists for the date, returns null for BillCount.
  /// The date should be in UTC format.
  Future<(Failure?, BillCount?)> getBillCountByDate({
    DateTime? date,
  });

  /// Create or update bill count.
  ///
  /// Returns a tuple of (Failure?, BillCount?).
  /// If a bill count already exists for the date, it will be updated.
  /// If no date is provided, uses current date.
  Future<(Failure?, BillCount?)> saveBillCount({
    required double beginningBalance,
    required bool showBeginningBalance,
    required List<BillItemInput> bills,
    DateTime? date,
  });

  /// Sync pending bill counts to the server.
  ///
  /// Returns a tuple of (Failure?, int) with the count of synced items.
  Future<(Failure?, int)> syncPendingBillCounts();

  /// Check if there are pending bill counts to sync.
  Future<bool> hasPendingSync();
}
