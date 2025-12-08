import '../../../../core/errors/failure.dart';
import '../entities/grouped_profit.dart';
import '../entities/profit_filter.dart';
import '../entities/profit_summary.dart';

/// Result type for profit operations
typedef ProfitResult = ({
  List<GroupedProfit> groupedProfits,
  ProfitSummary summary,
  bool isOfflineData,
});

/// Repository interface for profit operations.
abstract class ProfitRepository {
  /// Get grouped profits with filters.
  ///
  /// Returns grouped profit data for display.
  /// If offline, returns local cached sales-based profits with [isOfflineData] = true.
  Future<(Failure?, ProfitResult?)> getGroupedProfits({
    required ProfitFilter filter,
  });

  /// Get total profit summary.
  ///
  /// Returns aggregated totals for the filter period.
  Future<(Failure?, ProfitSummary?)> getTotalProfit({
    required ProfitFilter filter,
  });

  /// Check if device is online.
  Future<bool> isOnline();
}
