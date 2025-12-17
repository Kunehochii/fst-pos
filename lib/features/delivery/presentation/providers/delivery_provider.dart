import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/delivery_local_datasource.dart';
import '../../data/datasources/delivery_remote_datasource.dart';
import '../../data/repositories/delivery_repository_impl.dart';
import '../../domain/entities/delivery.dart';
import '../../domain/repositories/delivery_repository.dart';

part 'delivery_provider.g.dart';

/// Provides the DeliveryRemoteDataSource.
@riverpod
DeliveryRemoteDataSource deliveryRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return DeliveryRemoteDataSource(dio);
}

/// Provides the DeliveryLocalDataSource.
@riverpod
DeliveryLocalDataSource deliveryLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return DeliveryLocalDataSource(db);
}

/// Provides the DeliveryRepository.
///
/// Requires authenticated cashier - throws if not logged in.
@riverpod
DeliveryRepository deliveryRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(deliveryRemoteDataSourceProvider);
          final localDataSource = ref.watch(deliveryLocalDataSourceProvider);

          return DeliveryRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access deliveries'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

/// State for the delivery list.
sealed class DeliveryListState {
  const DeliveryListState();
}

class DeliveryListLoading extends DeliveryListState {
  const DeliveryListLoading();
}

class DeliveryListLoaded extends DeliveryListState {
  final List<Delivery> deliveries;
  final bool isRefreshing;
  final int pendingSyncCount;

  const DeliveryListLoaded({
    required this.deliveries,
    this.isRefreshing = false,
    this.pendingSyncCount = 0,
  });

  DeliveryListLoaded copyWith({
    List<Delivery>? deliveries,
    bool? isRefreshing,
    int? pendingSyncCount,
  }) {
    return DeliveryListLoaded(
      deliveries: deliveries ?? this.deliveries,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      pendingSyncCount: pendingSyncCount ?? this.pendingSyncCount,
    );
  }
}

class DeliveryListError extends DeliveryListState {
  final Failure failure;
  final List<Delivery>? cachedDeliveries;

  const DeliveryListError({
    required this.failure,
    this.cachedDeliveries,
  });
}

/// Manages the delivery list state with filtering.
///
/// Provides:
/// - Fetching deliveries with offline-first strategy
/// - Filtering by date range
/// - Searching by product
/// - Pull-to-refresh functionality
/// - Sync status tracking
@riverpod
class DeliveryListNotifier extends _$DeliveryListNotifier {
  DeliveryFilter _currentFilter = const DeliveryFilter();

  @override
  Future<DeliveryListState> build() async {
    // Sync pending deliveries in the background when provider initializes
    _syncPendingDeliveriesInBackground();
    return _loadDeliveries();
  }

  /// Gets the current filter.
  DeliveryFilter get currentFilter => _currentFilter;

  /// Syncs pending deliveries in the background (non-blocking).
  void _syncPendingDeliveriesInBackground() {
    Future.microtask(() async {
      try {
        final repository = ref.read(deliveryRepositoryProvider);
        final pendingCount = await repository.getPendingSyncCount();

        if (pendingCount > 0) {
          await repository.syncWithServer();

          // Refresh the list after sync
          final newState = await _loadDeliveries(forceRefresh: true);
          state = AsyncData(newState);
        }
      } catch (e) {
        // Silently fail - sync will be retried on next refresh
      }
    });
  }

  /// Loads deliveries with the current filter.
  Future<DeliveryListState> _loadDeliveries({bool forceRefresh = false}) async {
    try {
      final repository = ref.read(deliveryRepositoryProvider);
      final (failure, deliveries) = await repository.getDeliveries(
        filter: _currentFilter,
        forceRefresh: forceRefresh,
      );

      if (failure != null) {
        return DeliveryListError(failure: failure);
      }

      final pendingSyncCount = await repository.getPendingSyncCount();

      return DeliveryListLoaded(
        deliveries: deliveries ?? [],
        pendingSyncCount: pendingSyncCount,
      );
    } on StateError catch (e) {
      return DeliveryListError(
        failure: Failure.auth(message: e.message),
      );
    }
  }

  /// Refreshes the delivery list from server.
  Future<void> refresh() async {
    final currentState = state.valueOrNull;

    if (currentState is DeliveryListLoaded) {
      state = AsyncData(currentState.copyWith(isRefreshing: true));
    }

    final newState = await _loadDeliveries(forceRefresh: true);
    state = AsyncData(newState);
  }

  /// Sets a date range filter.
  Future<void> setDateRange(DateTime? startDate, DateTime? endDate) async {
    _currentFilter = DeliveryFilter(
      startDate: startDate,
      endDate: endDate,
      productId: _currentFilter.productId,
      productSearch: _currentFilter.productSearch,
    );

    state = const AsyncLoading();
    final newState = await _loadDeliveries();
    state = AsyncData(newState);
  }

  /// Sets a product search filter.
  Future<void> setProductSearch(String? query) async {
    final trimmedQuery = query?.trim();
    if (_currentFilter.productSearch == trimmedQuery) return;

    _currentFilter = DeliveryFilter(
      startDate: _currentFilter.startDate,
      endDate: _currentFilter.endDate,
      productId: _currentFilter.productId,
      productSearch: trimmedQuery?.isEmpty == true ? null : trimmedQuery,
    );

    state = const AsyncLoading();
    final newState = await _loadDeliveries();
    state = AsyncData(newState);
  }

  /// Clears all filters.
  Future<void> clearFilters() async {
    if (_currentFilter.startDate == null &&
        _currentFilter.endDate == null &&
        _currentFilter.productId == null &&
        _currentFilter.productSearch == null) {
      return;
    }

    _currentFilter = const DeliveryFilter();
    state = const AsyncLoading();
    final newState = await _loadDeliveries();
    state = AsyncData(newState);
  }

  /// Syncs pending deliveries with server.
  Future<void> syncWithServer() async {
    try {
      final repository = ref.read(deliveryRepositoryProvider);
      await repository.syncWithServer();

      // Refresh the list
      final newState = await _loadDeliveries(forceRefresh: true);
      state = AsyncData(newState);
    } catch (e) {
      // Keep current state but log error
    }
  }

  /// Clears the delivery cache and reloads from server.
  Future<void> clearCacheAndReload() async {
    try {
      final repository = ref.read(deliveryRepositoryProvider);
      await repository.clearCache();

      // Force refresh from server
      state = const AsyncLoading();
      final newState = await _loadDeliveries(forceRefresh: true);
      state = AsyncData(newState);
    } catch (e) {
      state = AsyncData(
        DeliveryListError(
            failure: Failure.cache(message: 'Failed to clear cache: $e')),
      );
    }
  }
}

/// Provides a single delivery by ID.
@riverpod
Future<Delivery?> deliveryById(Ref ref, String deliveryId) async {
  try {
    final repository = ref.watch(deliveryRepositoryProvider);
    final (failure, delivery) = await repository.getDeliveryById(deliveryId);

    if (failure != null) {
      throw Exception(failure.userMessage);
    }

    return delivery;
  } on StateError {
    return null;
  }
}

/// State for creating a delivery.
sealed class CreateDeliveryState {
  const CreateDeliveryState();
}

class CreateDeliveryInitial extends CreateDeliveryState {
  const CreateDeliveryInitial();
}

class CreateDeliveryLoading extends CreateDeliveryState {
  const CreateDeliveryLoading();
}

class CreateDeliverySuccess extends CreateDeliveryState {
  final Delivery delivery;
  final bool isOffline;

  const CreateDeliverySuccess({
    required this.delivery,
    this.isOffline = false,
  });
}

class CreateDeliveryError extends CreateDeliveryState {
  final Failure failure;

  const CreateDeliveryError({required this.failure});
}

/// Manages creating a new delivery.
@riverpod
class CreateDeliveryNotifier extends _$CreateDeliveryNotifier {
  @override
  CreateDeliveryState build() {
    return const CreateDeliveryInitial();
  }

  /// Creates a new delivery.
  Future<void> createDelivery(CreateDeliveryDto dto) async {
    state = const CreateDeliveryLoading();

    try {
      final repository = ref.read(deliveryRepositoryProvider);
      final (failure, delivery) = await repository.createDelivery(dto);

      if (failure != null) {
        state = CreateDeliveryError(failure: failure);
        return;
      }

      if (delivery != null) {
        state = CreateDeliverySuccess(delivery: delivery);

        // Invalidate delivery list to refresh
        ref.invalidate(deliveryListNotifierProvider);
      } else {
        state = CreateDeliveryError(
          failure: const Failure.unknown(message: 'Failed to create delivery'),
        );
      }
    } on StateError catch (e) {
      state = CreateDeliveryError(
        failure: Failure.auth(message: e.message),
      );
    } catch (e) {
      state = CreateDeliveryError(
        failure: Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Resets the state.
  void reset() {
    state = const CreateDeliveryInitial();
  }
}

/// Manages deleting a delivery.
@riverpod
class DeleteDeliveryNotifier extends _$DeleteDeliveryNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  /// Deletes a delivery.
  Future<bool> deleteDelivery(String deliveryId) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(deliveryRepositoryProvider);
      final (failure, success) = await repository.deleteDelivery(deliveryId);

      if (failure != null) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      }

      state = const AsyncData(null);

      // Invalidate delivery list to refresh
      ref.invalidate(deliveryListNotifierProvider);

      return success ?? false;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}

/// Provides the count of pending sync operations.
@riverpod
Future<int> pendingDeliverySyncCount(Ref ref) async {
  try {
    final repository = ref.watch(deliveryRepositoryProvider);
    return await repository.getPendingSyncCount();
  } catch (_) {
    return 0;
  }
}
