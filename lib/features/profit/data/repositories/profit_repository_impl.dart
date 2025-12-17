import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/grouped_profit.dart';
import '../../domain/entities/profit_filter.dart';
import '../../domain/entities/profit_summary.dart';
import '../../domain/repositories/profit_repository.dart';
import '../datasources/profit_local_datasource.dart';
import '../datasources/profit_remote_datasource.dart';

/// Implementation of [ProfitRepository] with offline-first strategy.
///
/// When online:
/// - Fetches data from server
/// - Returns server data
///
/// When offline:
/// - Uses locally cached sales data to calculate profits
/// - Processes and groups locally
/// - Marks result as offline data
class ProfitRepositoryImpl implements ProfitRepository {
  final ProfitRemoteDataSource _remoteDataSource;
  final ProfitLocalDataSource _localDataSource;
  final String _cashierId;

  ProfitRepositoryImpl({
    required ProfitRemoteDataSource remoteDataSource,
    required ProfitLocalDataSource localDataSource,
    required String cashierId,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId;

  @override
  Future<bool> isOnline() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Future<(Failure?, ProfitResult?)> getGroupedProfits({
    required ProfitFilter filter,
  }) async {
    try {
      final online = await isOnline();

      if (online) {
        try {
          // Fetch from server
          final remoteData =
              await _remoteDataSource.getCashierGroupedProfits(filter);

          final groupedProfits =
              remoteData.map((model) => model.toEntity()).toList();

          // Calculate summary from grouped profits
          final summary = _calculateSummaryFromGroups(groupedProfits, filter);

          AppLogger.info('Fetched profits from server', {
            'groups': groupedProfits.length,
            'totalProfit': summary.totalProfit,
          });

          return (
            null,
            (
              groupedProfits: groupedProfits,
              summary: summary,
              isOfflineData: false,
            )
          );
        } catch (e) {
          AppLogger.error(
              'Failed to fetch from server, falling back to local', e);
          // Fall back to local data on server error
          return _getLocalData(filter);
        }
      } else {
        // Offline - use local data
        AppLogger.info('Offline - using local sales data for profits');
        return _getLocalData(filter);
      }
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to get grouped profits', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  /// Calculate summary from grouped profits.
  ProfitSummary _calculateSummaryFromGroups(
    List<GroupedProfit> groupedProfits,
    ProfitFilter filter,
  ) {
    double totalQuantity = 0;
    double totalProfit = 0;
    int transactionCount = 0;

    for (final group in groupedProfits) {
      totalQuantity += group.totalQuantity;
      totalProfit += group.totalProfit;
      transactionCount += group.orderCount;
    }

    return ProfitSummary(
      totalQuantity: totalQuantity,
      totalProfit: totalProfit,
      paymentTotals: const ProfitPaymentTotals(
        cash: 0,
        check: 0,
        bankTransfer: 0,
      ),
      transactionCount: transactionCount,
      startDate: filter.startDate,
      endDate: filter.endDate,
    );
  }

  /// Get grouped profits from local cache.
  Future<(Failure?, ProfitResult?)> _getLocalData(
    ProfitFilter filter,
  ) async {
    try {
      final groupedProfits =
          await _localDataSource.getGroupedProfits(_cashierId, filter);
      final summary = await _localDataSource.getTotalProfit(_cashierId, filter);

      AppLogger.info('Retrieved local profit data', {
        'groups': groupedProfits.length,
        'totalProfit': summary.totalProfit,
      });

      return (
        null,
        (
          groupedProfits: groupedProfits,
          summary: summary,
          isOfflineData: true,
        )
      );
    } catch (e) {
      AppLogger.error('Failed to get local profit data', e);
      return (Failure.cache(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, ProfitSummary?)> getTotalProfit({
    required ProfitFilter filter,
  }) async {
    try {
      final online = await isOnline();

      if (online) {
        try {
          final summaryData =
              await _remoteDataSource.getCashierTotalProfit(filter);
          return (null, summaryData.toEntity());
        } catch (e) {
          AppLogger.error(
              'Failed to fetch summary from server, falling back to local', e);
          final summary =
              await _localDataSource.getTotalProfit(_cashierId, filter);
          return (null, summary);
        }
      } else {
        final summary =
            await _localDataSource.getTotalProfit(_cashierId, filter);
        return (null, summary);
      }
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to get total profit', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }
}

/// Extension to group profits by category for display.
extension ProfitGroupingExtension on List<GroupedProfit> {
  /// Get profits for NORMAL category only (for chronological view).
  List<GroupedProfit> get normalCategoryProfits => this;

  /// Group profits by product base name (e.g., "Rice" groups all Rice variants).
  Map<String, List<GroupedProfit>> groupByProductBaseName() {
    final grouped = <String, List<GroupedProfit>>{};

    for (final profit in this) {
      // Use product name as base (already separated in API)
      final baseName = profit.productName;
      grouped.putIfAbsent(baseName, () => []);
      grouped[baseName]!.add(profit);
    }

    // Sort variants within each group
    for (final group in grouped.values) {
      group.sort((a, b) => _variantSortOrder(a.priceType)
          .compareTo(_variantSortOrder(b.priceType)));
    }

    return grouped;
  }

  /// Get sort order for variants (50kg first, then 25kg, 5kg, per kilo).
  int _variantSortOrder(String priceType) {
    if (priceType.contains('50 KG')) return 0;
    if (priceType.contains('25 KG')) return 1;
    if (priceType.contains('5 KG')) return 2;
    if (priceType.contains('Per Kilo (Gantang)')) return 4;
    if (priceType.contains('Per Kilo')) return 3;
    return 5;
  }
}

/// Helper to get filter for specific category view.
extension ProfitFilterExtension on ProfitFilter {
  /// Create filter for chronological/normal category view.
  ProfitFilter forNormalCategory() => copyWith(
        category: ProductCategory.normal,
      );

  /// Create filter for ASIN category view.
  ProfitFilter forAsinCategory() => copyWith(
        category: ProductCategory.asin,
      );

  /// Create filter for PLASTIC category view.
  ProfitFilter forPlasticCategory() => copyWith(
        category: ProductCategory.plastic,
      );
}
