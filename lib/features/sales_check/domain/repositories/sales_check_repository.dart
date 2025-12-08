import '../../../../core/errors/failure.dart';
import '../entities/grouped_sale.dart';
import '../entities/sales_check_filter.dart';
import '../entities/sales_summary.dart';

/// Result type for sales check operations
typedef SalesCheckResult = ({
  List<GroupedSale> groupedSales,
  SalesSummary summary,
  bool isOfflineData,
});

/// Repository interface for sales check operations.
abstract class SalesCheckRepository {
  /// Get grouped sales with filters.
  ///
  /// Returns grouped sales data for display.
  /// If offline, returns local cached sales with [isOfflineData] = true.
  Future<(Failure?, SalesCheckResult?)> getGroupedSales({
    required SalesCheckFilter filter,
  });

  /// Get total sales summary.
  ///
  /// Returns aggregated totals for the filter period.
  Future<(Failure?, SalesSummary?)> getTotalSales({
    required SalesCheckFilter filter,
  });

  /// Check if device is online.
  Future<bool> isOnline();
}
