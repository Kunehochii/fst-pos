import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../product/domain/entities/product.dart';
import '../../data/datasources/sales_check_local_datasource.dart';
import '../../data/datasources/sales_check_remote_datasource.dart';
import '../../data/repositories/sales_check_repository_impl.dart';
import '../../domain/entities/grouped_sale.dart';
import '../../domain/entities/sales_check_filter.dart';
import '../../domain/entities/sales_summary.dart';
import '../../domain/repositories/sales_check_repository.dart';

part 'sales_check_provider.g.dart';

// ============================================================================
// DATA SOURCE PROVIDERS
// ============================================================================

/// Provides the SalesCheckRemoteDataSource.
@riverpod
SalesCheckRemoteDataSource salesCheckRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return SalesCheckRemoteDataSource(dio);
}

/// Provides the SalesCheckLocalDataSource.
@riverpod
SalesCheckLocalDataSource salesCheckLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SalesCheckLocalDataSource(db);
}

/// Provides the SalesCheckRepository.
@riverpod
SalesCheckRepository salesCheckRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource =
              ref.watch(salesCheckRemoteDataSourceProvider);
          final localDataSource = ref.watch(salesCheckLocalDataSourceProvider);

          return SalesCheckRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access sales check'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// FILTER STATE
// ============================================================================

/// State for the current sales check filter.
@riverpod
class SalesCheckFilterNotifier extends _$SalesCheckFilterNotifier {
  @override
  SalesCheckFilter build() => SalesCheckFilter.today();

  /// Update the filter.
  void updateFilter(SalesCheckFilter filter) {
    state = filter;
  }

  /// Set date range.
  void setDateRange(DateTime? start, DateTime? end) {
    state = state.copyWith(
      startDate: start?.toUtc(),
      endDate: end?.toUtc(),
    );
  }

  /// Set product search.
  void setProductSearch(String? search) {
    state = state.copyWith(productSearch: search);
  }

  /// Set category filter.
  void setCategory(ProductCategory? category) {
    state = state.copyWith(category: category);
  }

  /// Set price type filter.
  void setPriceType(PriceTypeFilter? priceType) {
    state = state.copyWith(priceType: priceType);
  }

  /// Set sack type filter.
  void setSackType(SackType? sackType) {
    state = state.copyWith(sackType: sackType);
  }

  /// Set discounted filter.
  void setDiscounted(bool? isDiscounted) {
    state = state.copyWith(isDiscounted: isDiscounted);
  }

  /// Reset all filters to today.
  void resetFilters() {
    state = SalesCheckFilter.today();
  }

  /// Clear all filters.
  void clearFilters() {
    state = const SalesCheckFilter();
  }
}

// ============================================================================
// VIEW TYPE STATE
// ============================================================================

/// Current view type for sales check display.
@riverpod
class SalesCheckViewTypeNotifier extends _$SalesCheckViewTypeNotifier {
  @override
  SalesCheckViewType build() => SalesCheckViewType.chronological;

  void setViewType(SalesCheckViewType type) {
    state = type;
  }
}

// ============================================================================
// SALES CHECK DATA STATE
// ============================================================================

/// State for sales check data.
sealed class SalesCheckState {
  const SalesCheckState();
}

class SalesCheckLoading extends SalesCheckState {
  const SalesCheckLoading();
}

class SalesCheckLoaded extends SalesCheckState {
  final List<GroupedSale> groupedSales;
  final SalesSummary summary;
  final bool isOfflineData;
  final SalesCheckFilter appliedFilter;

  const SalesCheckLoaded({
    required this.groupedSales,
    required this.summary,
    required this.isOfflineData,
    required this.appliedFilter,
  });
}

class SalesCheckError extends SalesCheckState {
  final Failure failure;

  const SalesCheckError(this.failure);
}

/// Notifier for fetching and managing sales check data.
@riverpod
class SalesCheckNotifier extends _$SalesCheckNotifier {
  @override
  Future<SalesCheckState> build() async {
    final filter = ref.watch(salesCheckFilterNotifierProvider);
    final viewType = ref.watch(salesCheckViewTypeNotifierProvider);

    return _fetchData(filter, viewType);
  }

  /// Fetch sales check data based on filter and view type.
  Future<SalesCheckState> _fetchData(
    SalesCheckFilter filter,
    SalesCheckViewType viewType,
  ) async {
    try {
      final repository = ref.read(salesCheckRepositoryProvider);

      // Apply category filter based on view type
      final effectiveFilter = _getEffectiveFilter(filter, viewType);

      final (failure, result) = await repository.getGroupedSales(
        filter: effectiveFilter,
      );

      if (failure != null) {
        return SalesCheckError(failure);
      }

      if (result == null) {
        return const SalesCheckError(
            Failure.unknown(message: 'No data returned'));
      }

      return SalesCheckLoaded(
        groupedSales: result.groupedSales,
        summary: result.summary,
        isOfflineData: result.isOfflineData,
        appliedFilter: effectiveFilter,
      );
    } catch (e) {
      return SalesCheckError(Failure.unknown(message: e.toString()));
    }
  }

  /// Get effective filter based on view type.
  SalesCheckFilter _getEffectiveFilter(
    SalesCheckFilter filter,
    SalesCheckViewType viewType,
  ) {
    switch (viewType) {
      case SalesCheckViewType.chronological:
      case SalesCheckViewType.normalGrouped:
        // Normal category for chronological and grouped views
        return filter.copyWith(category: ProductCategory.normal);
      case SalesCheckViewType.asin:
        return filter.copyWith(category: ProductCategory.asin);
      case SalesCheckViewType.plastic:
        return filter.copyWith(category: ProductCategory.plastic);
    }
  }

  /// Refresh data.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final filter = ref.read(salesCheckFilterNotifierProvider);
    final viewType = ref.read(salesCheckViewTypeNotifierProvider);
    state = AsyncValue.data(await _fetchData(filter, viewType));
  }
}

// ============================================================================
// COMPUTED PROVIDERS
// ============================================================================

/// Provider for grouped sales organized by product name.
/// Used for the "By Product" view.
@riverpod
Map<String, List<GroupedSale>> groupedSalesByProduct(Ref ref) {
  final state = ref.watch(salesCheckNotifierProvider);

  return state.maybeWhen(
    data: (salesState) {
      if (salesState is SalesCheckLoaded) {
        return salesState.groupedSales.groupByProductBaseName();
      }
      return {};
    },
    orElse: () => {},
  );
}

/// Provider for checking if currently offline.
@riverpod
Future<bool> isOffline(Ref ref) async {
  final repository = ref.watch(salesCheckRepositoryProvider);
  return !(await repository.isOnline());
}
