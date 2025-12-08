import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../product/domain/entities/product.dart';
import '../../data/datasources/stock_local_datasource.dart';
import '../../data/datasources/stock_remote_datasource.dart';
import '../../data/repositories/stock_repository_impl.dart';
import '../../domain/entities/stock_statistics.dart';
import '../../domain/entities/transfer.dart';
import '../../domain/repositories/stock_repository.dart';

part 'stock_provider.g.dart';

/// Provides the StockRemoteDataSource.
@riverpod
StockRemoteDataSource stockRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return StockRemoteDataSource(dio);
}

/// Provides the StockLocalDataSource.
@riverpod
StockLocalDataSource stockLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return StockLocalDataSource(db);
}

/// Provides the StockRepository.
///
/// Requires authenticated cashier - throws if not logged in.
@riverpod
StockRepository stockRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(stockRemoteDataSourceProvider);
          final localDataSource = ref.watch(stockLocalDataSourceProvider);

          return StockRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () => throw StateError('Must be authenticated to access stock'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// STOCK STATISTICS
// ============================================================================

/// State for stock statistics.
sealed class StockStatisticsState {
  const StockStatisticsState();
}

class StockStatisticsInitial extends StockStatisticsState {
  const StockStatisticsInitial();
}

class StockStatisticsLoading extends StockStatisticsState {
  const StockStatisticsLoading();
}

class StockStatisticsLoaded extends StockStatisticsState {
  final StockStatistics statistics;
  final StockFilter filter;

  const StockStatisticsLoaded({
    required this.statistics,
    required this.filter,
  });
}

class StockStatisticsError extends StockStatisticsState {
  final Failure failure;

  const StockStatisticsError({required this.failure});
}

/// Notifier for stock statistics.
@riverpod
class StockStatisticsNotifier extends _$StockStatisticsNotifier {
  @override
  StockStatisticsState build() => const StockStatisticsInitial();

  /// Load stock statistics with optional filter.
  Future<void> loadStatistics({StockFilter? filter}) async {
    state = const StockStatisticsLoading();

    try {
      final repository = ref.read(stockRepositoryProvider);

      // Default to today if no filter provided
      final effectiveFilter = filter ??
          StockFilter(
            startDate: _startOfToday(),
            endDate: _endOfToday(),
          );

      final (failure, statistics) = await repository.getStockStatistics(
        filter: effectiveFilter,
      );

      if (failure != null) {
        state = StockStatisticsError(failure: failure);
        return;
      }

      state = StockStatisticsLoaded(
        statistics: statistics!,
        filter: effectiveFilter,
      );
    } on StateError catch (e) {
      state = StockStatisticsError(
        failure: Failure.auth(message: e.message),
      );
    }
  }

  /// Update the date filter and reload.
  Future<void> setDateRange(DateTime startDate, DateTime endDate) async {
    await loadStatistics(
      filter: StockFilter(
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  DateTime _startOfToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  DateTime _endOfToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  }
}

// ============================================================================
// TRANSFER LIST
// ============================================================================

/// State for transfer list.
sealed class TransferListState {
  const TransferListState();
}

class TransferListLoading extends TransferListState {
  const TransferListLoading();
}

class TransferListLoaded extends TransferListState {
  final List<Transfer> transfers;
  final bool isRefreshing;
  final TransferFilter? filter;

  const TransferListLoaded({
    required this.transfers,
    this.isRefreshing = false,
    this.filter,
  });

  TransferListLoaded copyWith({
    List<Transfer>? transfers,
    bool? isRefreshing,
    TransferFilter? filter,
  }) {
    return TransferListLoaded(
      transfers: transfers ?? this.transfers,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      filter: filter ?? this.filter,
    );
  }
}

class TransferListError extends TransferListState {
  final Failure failure;
  final List<Transfer>? cachedTransfers;

  const TransferListError({
    required this.failure,
    this.cachedTransfers,
  });
}

/// Notifier for managing transfer list.
@riverpod
class TransferListNotifier extends _$TransferListNotifier {
  TransferFilter _currentFilter = const TransferFilter();

  @override
  Future<TransferListState> build() async {
    return _loadTransfers();
  }

  /// Gets the current filter.
  TransferFilter get currentFilter => _currentFilter;

  /// Loads transfers with the current filter.
  Future<TransferListState> _loadTransfers({bool forceRefresh = false}) async {
    try {
      final repository = ref.read(stockRepositoryProvider);
      final (failure, transfers) = await repository.getTransfers(
        filter: _currentFilter,
        forceRefresh: forceRefresh,
      );

      if (failure != null) {
        return TransferListError(failure: failure);
      }

      return TransferListLoaded(
        transfers: transfers ?? [],
        filter: _currentFilter,
      );
    } on StateError catch (e) {
      return TransferListError(
        failure: Failure.auth(message: e.message),
      );
    }
  }

  /// Refreshes the transfer list from server.
  Future<void> refresh() async {
    final currentState = state.valueOrNull;

    if (currentState is TransferListLoaded) {
      state = AsyncData(currentState.copyWith(isRefreshing: true));
    }

    final newState = await _loadTransfers(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Sets a date range filter.
  Future<void> setDateRange(DateTime? startDate, DateTime? endDate) async {
    _currentFilter = TransferFilter(
      startDate: startDate,
      endDate: endDate,
      type: _currentFilter.type,
    );
    state = const AsyncLoading();
    final newState = await _loadTransfers(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Sets a type filter.
  Future<void> setTypeFilter(TransferType? type) async {
    _currentFilter = TransferFilter(
      startDate: _currentFilter.startDate,
      endDate: _currentFilter.endDate,
      type: type,
    );
    state = const AsyncLoading();
    final newState = await _loadTransfers();
    state = AsyncData(newState);
  }

  /// Clears all filters.
  Future<void> clearFilters() async {
    _currentFilter = const TransferFilter();
    state = const AsyncLoading();
    final newState = await _loadTransfers(forceRefresh: true);
    state = AsyncData(newState);
  }
}

// ============================================================================
// TRANSFER CREATION
// ============================================================================

/// State for transfer creation.
sealed class CreateTransferState {
  const CreateTransferState();
}

class CreateTransferIdle extends CreateTransferState {
  const CreateTransferIdle();
}

class CreateTransferLoading extends CreateTransferState {
  const CreateTransferLoading();
}

class CreateTransferSuccess extends CreateTransferState {
  final Transfer transfer;

  const CreateTransferSuccess({required this.transfer});
}

class CreateTransferError extends CreateTransferState {
  final Failure failure;

  const CreateTransferError({required this.failure});
}

/// Notifier for creating transfers.
@riverpod
class CreateTransferNotifier extends _$CreateTransferNotifier {
  @override
  CreateTransferState build() => const CreateTransferIdle();

  /// Creates a sack transfer.
  Future<void> createSackTransfer({
    required Product product,
    required SackPrice sackPrice,
    required double quantity,
    required TransferType transferType,
  }) async {
    state = const CreateTransferLoading();

    try {
      final repository = ref.read(stockRepositoryProvider);
      final dto = CreateTransferSackDto(
        productId: product.id,
        sackPriceId: sackPrice.id,
        sackType: sackPrice.type,
        quantity: quantity,
        transferType: transferType,
      );

      final (failure, transfer) = await repository.createSackTransfer(dto);

      if (failure != null) {
        state = CreateTransferError(failure: failure);
        return;
      }

      state = CreateTransferSuccess(transfer: transfer!);

      // Refresh transfer list
      ref.invalidate(transferListNotifierProvider);
    } on StateError catch (e) {
      state = CreateTransferError(
        failure: Failure.auth(message: e.message),
      );
    }
  }

  /// Creates a per kilo transfer.
  Future<void> createPerKiloTransfer({
    required Product product,
    required PerKiloPrice perKiloPrice,
    required double quantity,
    required TransferType transferType,
  }) async {
    state = const CreateTransferLoading();

    try {
      final repository = ref.read(stockRepositoryProvider);
      final dto = CreateTransferPerKiloDto(
        productId: product.id,
        perKiloPriceId: perKiloPrice.id,
        quantity: quantity,
        transferType: transferType,
      );

      final (failure, transfer) = await repository.createPerKiloTransfer(dto);

      if (failure != null) {
        state = CreateTransferError(failure: failure);
        return;
      }

      state = CreateTransferSuccess(transfer: transfer!);

      // Refresh transfer list
      ref.invalidate(transferListNotifierProvider);
    } on StateError catch (e) {
      state = CreateTransferError(
        failure: Failure.auth(message: e.message),
      );
    }
  }

  /// Reset to idle state.
  void reset() {
    state = const CreateTransferIdle();
  }
}

// ============================================================================
// PENDING SYNC COUNT
// ============================================================================

/// Provides the pending sync count for transfers.
@riverpod
Future<int> pendingTransferSyncCount(Ref ref) async {
  try {
    final repository = ref.watch(stockRepositoryProvider);
    return repository.getPendingSyncCount();
  } catch (_) {
    return 0;
  }
}
