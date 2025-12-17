import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/grouped_sale.dart';
import '../../domain/entities/sales_check_filter.dart';
import '../../domain/entities/sales_summary.dart';
import '../../domain/repositories/sales_check_repository.dart';
import '../datasources/sales_check_local_datasource.dart';
import '../datasources/sales_check_remote_datasource.dart';

/// Implementation of [SalesCheckRepository] with offline-first strategy.
///
/// When online:
/// - Fetches data from server
/// - Returns server data
///
/// When offline:
/// - Uses locally cached sales data
/// - Processes and groups locally
/// - Marks result as offline data
class SalesCheckRepositoryImpl implements SalesCheckRepository {
  final SalesCheckRemoteDataSource _remoteDataSource;
  final SalesCheckLocalDataSource _localDataSource;
  final String _cashierId;

  SalesCheckRepositoryImpl({
    required SalesCheckRemoteDataSource remoteDataSource,
    required SalesCheckLocalDataSource localDataSource,
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
  Future<(Failure?, SalesCheckResult?)> getGroupedSales({
    required SalesCheckFilter filter,
  }) async {
    try {
      final online = await isOnline();

      if (online) {
        try {
          // Fetch from server
          final remoteData =
              await _remoteDataSource.getCashierGroupedSales(filter);
          final summaryData =
              await _remoteDataSource.getCashierTotalSales(filter);

          final groupedSales =
              remoteData.map((model) => model.toEntity()).toList();
          final summary = summaryData.toEntity();

          AppLogger.info('Fetched sales check from server', {
            'groups': groupedSales.length,
            'totalAmount': summary.totalAmount,
          });

          return (
            null,
            (
              groupedSales: groupedSales,
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
        AppLogger.info('Offline - using local sales data');
        return _getLocalData(filter);
      }
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to get grouped sales', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  /// Get grouped sales from local cache.
  Future<(Failure?, SalesCheckResult?)> _getLocalData(
    SalesCheckFilter filter,
  ) async {
    try {
      final groupedSales =
          await _localDataSource.getGroupedSales(_cashierId, filter);
      final summary = await _localDataSource.getTotalSales(_cashierId, filter);

      AppLogger.info('Retrieved local sales data', {
        'groups': groupedSales.length,
        'totalAmount': summary.totalAmount,
      });

      return (
        null,
        (
          groupedSales: groupedSales,
          summary: summary,
          isOfflineData: true,
        )
      );
    } catch (e) {
      AppLogger.error('Failed to get local sales data', e);
      return (Failure.cache(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, SalesSummary?)> getTotalSales({
    required SalesCheckFilter filter,
  }) async {
    try {
      final online = await isOnline();

      if (online) {
        try {
          final summaryData =
              await _remoteDataSource.getCashierTotalSales(filter);
          return (null, summaryData.toEntity());
        } catch (e) {
          AppLogger.error(
              'Failed to fetch summary from server, falling back to local', e);
          final summary =
              await _localDataSource.getTotalSales(_cashierId, filter);
          return (null, summary);
        }
      } else {
        final summary =
            await _localDataSource.getTotalSales(_cashierId, filter);
        return (null, summary);
      }
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to get total sales', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }
}

/// Extension to group sales by category for display.
extension SalesCheckGroupingExtension on List<GroupedSale> {
  /// Get sales for NORMAL category only (for chronological view).
  List<GroupedSale> get normalCategorySales => this;

  /// Group sales by product base name (e.g., "Rice" groups all Rice variants).
  Map<String, List<GroupedSale>> groupByProductBaseName() {
    final grouped = <String, List<GroupedSale>>{};

    for (final sale in this) {
      // Extract base product name (remove variant suffix like "50 KG", "Per Kilo")
      final baseName = _extractBaseName(sale.productName);
      grouped.putIfAbsent(baseName, () => []);
      grouped[baseName]!.add(sale);
    }

    // Sort variants within each group
    for (final group in grouped.values) {
      group.sort((a, b) => _variantSortOrder(a.productName)
          .compareTo(_variantSortOrder(b.productName)));
    }

    return grouped;
  }

  /// Extract base product name without variant suffix.
  String _extractBaseName(String productName) {
    // Remove common suffixes
    final suffixes = [
      ' 50 KG',
      ' 25 KG',
      ' 5 KG',
      ' Per Kilo',
      ' Per Kilo (Gantang)',
    ];

    var baseName = productName;
    for (final suffix in suffixes) {
      if (baseName.endsWith(suffix)) {
        baseName = baseName.substring(0, baseName.length - suffix.length);
        break;
      }
    }

    return baseName;
  }

  /// Get sort order for variants (50kg first, then 25kg, 5kg, per kilo).
  int _variantSortOrder(String productName) {
    if (productName.contains('50 KG')) return 0;
    if (productName.contains('25 KG')) return 1;
    if (productName.contains('5 KG')) return 2;
    if (productName.contains('Per Kilo (Gantang)')) return 4;
    if (productName.contains('Per Kilo')) return 3;
    return 5;
  }
}

/// Helper to get filter for specific category view.
extension SalesCheckFilterExtension on SalesCheckFilter {
  /// Create filter for chronological/normal category view.
  SalesCheckFilter forNormalCategory() => copyWith(
        category: ProductCategory.normal,
      );

  /// Create filter for ASIN category view.
  SalesCheckFilter forAsinCategory() => copyWith(
        category: ProductCategory.asin,
      );

  /// Create filter for PLASTIC category view.
  SalesCheckFilter forPlasticCategory() => copyWith(
        category: ProductCategory.plastic,
      );
}
