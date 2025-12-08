import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../product/domain/entities/product.dart';
import '../../../sales_check/domain/entities/sales_check_filter.dart';
import '../../data/datasources/profit_local_datasource.dart';
import '../../data/datasources/profit_remote_datasource.dart';
import '../../data/repositories/profit_repository_impl.dart';
import '../../domain/entities/grouped_profit.dart';
import '../../domain/entities/profit_filter.dart';
import '../../domain/entities/profit_summary.dart';
import '../../domain/repositories/profit_repository.dart';

part 'profit_provider.g.dart';

// ============================================================================
// DATA SOURCE PROVIDERS
// ============================================================================

/// Provides the ProfitRemoteDataSource.
@riverpod
ProfitRemoteDataSource profitRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return ProfitRemoteDataSource(dio);
}

/// Provides the ProfitLocalDataSource.
@riverpod
ProfitLocalDataSource profitLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return ProfitLocalDataSource(db);
}

/// Provides the ProfitRepository.
@riverpod
ProfitRepository profitRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(profitRemoteDataSourceProvider);
          final localDataSource = ref.watch(profitLocalDataSourceProvider);

          return ProfitRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access profits'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// FILTER STATE
// ============================================================================

/// State for the current profit filter.
@riverpod
class ProfitFilterNotifier extends _$ProfitFilterNotifier {
  @override
  ProfitFilter build() => ProfitFilter.today();

  /// Update the filter.
  void updateFilter(ProfitFilter filter) {
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

  /// Reset all filters to today.
  void resetFilters() {
    state = ProfitFilter.today();
  }

  /// Clear all filters.
  void clearFilters() {
    state = const ProfitFilter();
  }
}

// ============================================================================
// VIEW TYPE STATE
// ============================================================================

/// Current view type for profit display.
@riverpod
class ProfitViewTypeNotifier extends _$ProfitViewTypeNotifier {
  @override
  ProfitViewType build() => ProfitViewType.chronological;

  void setViewType(ProfitViewType type) {
    state = type;
  }
}

// ============================================================================
// PROFIT DATA STATE
// ============================================================================

/// State for profit data.
sealed class ProfitState {
  const ProfitState();
}

class ProfitLoading extends ProfitState {
  const ProfitLoading();
}

class ProfitLoaded extends ProfitState {
  final List<GroupedProfit> groupedProfits;
  final ProfitSummary summary;
  final bool isOfflineData;
  final ProfitFilter appliedFilter;

  const ProfitLoaded({
    required this.groupedProfits,
    required this.summary,
    required this.isOfflineData,
    required this.appliedFilter,
  });
}

class ProfitError extends ProfitState {
  final Failure failure;

  const ProfitError(this.failure);
}

/// Notifier for fetching and managing profit data.
@riverpod
class ProfitNotifier extends _$ProfitNotifier {
  @override
  Future<ProfitState> build() async {
    final filter = ref.watch(profitFilterNotifierProvider);
    final viewType = ref.watch(profitViewTypeNotifierProvider);

    return _fetchData(filter, viewType);
  }

  /// Fetch profit data based on filter and view type.
  Future<ProfitState> _fetchData(
    ProfitFilter filter,
    ProfitViewType viewType,
  ) async {
    try {
      final repository = ref.read(profitRepositoryProvider);

      // Apply category filter based on view type
      final effectiveFilter = _getEffectiveFilter(filter, viewType);

      final (failure, result) = await repository.getGroupedProfits(
        filter: effectiveFilter,
      );

      if (failure != null) {
        return ProfitError(failure);
      }

      if (result == null) {
        return const ProfitError(Failure.unknown(message: 'No data returned'));
      }

      return ProfitLoaded(
        groupedProfits: result.groupedProfits,
        summary: result.summary,
        isOfflineData: result.isOfflineData,
        appliedFilter: effectiveFilter,
      );
    } catch (e) {
      return ProfitError(Failure.unknown(message: e.toString()));
    }
  }

  /// Get effective filter based on view type.
  ProfitFilter _getEffectiveFilter(
    ProfitFilter filter,
    ProfitViewType viewType,
  ) {
    switch (viewType) {
      case ProfitViewType.chronological:
      case ProfitViewType.normalGrouped:
        // Normal category for chronological and grouped views
        return filter.copyWith(category: ProductCategory.normal);
      case ProfitViewType.asin:
        return filter.copyWith(category: ProductCategory.asin);
      case ProfitViewType.plastic:
        return filter.copyWith(category: ProductCategory.plastic);
    }
  }

  /// Refresh data.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final filter = ref.read(profitFilterNotifierProvider);
    final viewType = ref.read(profitViewTypeNotifierProvider);
    state = AsyncValue.data(await _fetchData(filter, viewType));
  }
}

// ============================================================================
// COMPUTED PROVIDERS
// ============================================================================

/// Provider for grouped profits organized by product name.
/// Used for the "By Product" view.
@riverpod
Map<String, List<GroupedProfit>> groupedProfitsByProduct(Ref ref) {
  final state = ref.watch(profitNotifierProvider);

  return state.maybeWhen(
    data: (profitState) {
      if (profitState is ProfitLoaded) {
        return profitState.groupedProfits.groupByProductBaseName();
      }
      return {};
    },
    orElse: () => {},
  );
}

/// Provider for checking if currently offline.
@riverpod
Future<bool> isProfitOffline(Ref ref) async {
  final repository = ref.watch(profitRepositoryProvider);
  return !(await repository.isOnline());
}
