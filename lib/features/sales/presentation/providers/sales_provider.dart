import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../product/domain/entities/product.dart';
import '../../data/datasources/sales_local_datasource.dart';
import '../../data/datasources/sales_remote_datasource.dart';
import '../../data/repositories/sales_repository_impl.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/sale.dart';
import '../../domain/repositories/sales_repository.dart';

part 'sales_provider.g.dart';

// ============================================================================
// DATA SOURCE PROVIDERS
// ============================================================================

/// Provides the SalesRemoteDataSource.
@riverpod
SalesRemoteDataSource salesRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return SalesRemoteDataSource(dio);
}

/// Provides the SalesLocalDataSource.
@riverpod
SalesLocalDataSource salesLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SalesLocalDataSource(db);
}

/// Provides the SalesRepository.
@riverpod
SalesRepository salesRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(salesRemoteDataSourceProvider);
          final localDataSource = ref.watch(salesLocalDataSourceProvider);

          return SalesRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
          );
        },
        orElse: () => throw StateError('Must be authenticated to access sales'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// CART STATE
// ============================================================================

/// Cart state containing all items.
class CartState {
  final List<CartItem> items;

  const CartState({this.items = const []});

  /// Total price of all items.
  double get totalPrice =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  /// Total number of items.
  int get itemCount => items.length;

  /// Whether cart is empty.
  bool get isEmpty => items.isEmpty;

  /// Whether cart has items.
  bool get isNotEmpty => items.isNotEmpty;

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }
}

/// Cart notifier for managing cart state.
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() => const CartState();

  /// Add an item to cart.
  void addItem(CartItem item) {
    state = state.copyWith(items: [...state.items, item]);
  }

  /// Remove an item from cart by its unique cart item ID.
  void removeItem(String cartItemId) {
    state = state.copyWith(
      items:
          state.items.where((item) => item.cartItemId != cartItemId).toList(),
    );
  }

  /// Update an item in the cart.
  void updateItem(String cartItemId, CartItem updatedItem) {
    state = state.copyWith(
      items: state.items.map((item) {
        if (item.cartItemId == cartItemId) {
          return updatedItem;
        }
        return item;
      }).toList(),
    );
  }

  /// Clear all items from cart.
  void clearCart() {
    state = const CartState();
  }

  /// Get remaining stock for a product variant (considering items in cart).
  double getRemainingStock(
      Product product, CartPriceType priceType, SackType? sackType) {
    // Get base stock
    double baseStock;
    if (priceType == CartPriceType.perKilo) {
      baseStock = product.perKiloPrice?.stock ?? 0;
    } else {
      final sackPrice = product.sackPrices.firstWhere(
        (sp) => sp.type == sackType,
        orElse: () => throw StateError('Sack type not found'),
      );
      baseStock = sackPrice.stock;
    }

    // Subtract items in cart with same variant
    final cartQuantity = state.items
        .where((item) =>
            item.product.id == product.id &&
            item.priceType == priceType &&
            item.sackType == sackType)
        .fold(0.0, (sum, item) => sum + item.quantity);

    return baseStock - cartQuantity;
  }

  /// Check if there's enough stock for adding a quantity.
  bool hasEnoughStock(
    Product product,
    CartPriceType priceType,
    SackType? sackType,
    double quantity,
  ) {
    final remaining = getRemainingStock(product, priceType, sackType);
    return remaining >= quantity;
  }
}

// ============================================================================
// CHECKOUT STATE
// ============================================================================

/// Checkout state for managing payment.
sealed class CheckoutState {
  const CheckoutState();
}

class CheckoutIdle extends CheckoutState {
  const CheckoutIdle();
}

class CheckoutProcessing extends CheckoutState {
  const CheckoutProcessing();
}

class CheckoutSuccess extends CheckoutState {
  final Sale sale;
  const CheckoutSuccess(this.sale);
}

class CheckoutError extends CheckoutState {
  final Failure failure;
  const CheckoutError(this.failure);
}

/// Checkout notifier for processing sales.
@riverpod
class CheckoutNotifier extends _$CheckoutNotifier {
  @override
  CheckoutState build() => const CheckoutIdle();

  /// Process the checkout.
  Future<Sale?> checkout({
    required List<CartItem> items,
    required PaymentMethod paymentMethod,
    double? cashTendered,
  }) async {
    if (items.isEmpty) {
      state = const CheckoutError(
        Failure.validation(message: 'Cart is empty'),
      );
      return null;
    }

    state = const CheckoutProcessing();

    try {
      final repository = ref.read(salesRepositoryProvider);

      // Calculate total
      final totalAmount = items.fold(0.0, (sum, item) => sum + item.totalPrice);

      // Build metadata
      final metadata = <String, dynamic>{};
      if (paymentMethod == PaymentMethod.cash && cashTendered != null) {
        metadata['cashTendered'] = cashTendered;
        metadata['change'] = cashTendered - totalAmount;
      }

      // Convert cart items to sale items
      final saleItems = items
          .map((item) => SaleItem(
                id: '', // Will be assigned by server
                quantity: item.quantity,
                price: item.effectiveUnitPrice,
                discountedPrice: item.discountedPrice,
                isDiscounted: item.isDiscounted,
                isGantang: item.isGantang,
                productId: item.product.id,
                sackPriceId: item.sackPriceId,
                sackType: item.sackType,
                perKiloPriceId: item.perKiloPriceId,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                // Preserve product data for local cache
                product: item.product,
                sackPrice: item.sackPriceId != null
                    ? item.product.sackPrices.firstWhere(
                        (sp) => sp.id == item.sackPriceId,
                      )
                    : null,
                perKiloPrice: item.perKiloPriceId != null
                    ? item.product.perKiloPrice
                    : null,
              ))
          .toList();

      // Create sale
      final sale = Sale(
        id: '', // Will be assigned
        totalAmount: totalAmount,
        paymentMethod: paymentMethod,
        cashierId: '', // Will be assigned
        saleItems: saleItems,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        metadata: metadata.isEmpty ? null : metadata,
      );

      final (failure, createdSale) = await repository.createSale(sale);

      if (failure != null) {
        state = CheckoutError(failure);
        return null;
      }

      state = CheckoutSuccess(createdSale!);
      return createdSale;
    } catch (e) {
      state = CheckoutError(Failure.unknown(message: e.toString()));
      return null;
    }
  }

  /// Reset to idle state.
  void reset() {
    state = const CheckoutIdle();
  }
}

// ============================================================================
// SALES HISTORY STATE
// ============================================================================

/// Sales list state.
sealed class SalesListState {
  const SalesListState();
}

class SalesListLoading extends SalesListState {
  const SalesListLoading();
}

class SalesListLoaded extends SalesListState {
  final List<Sale> sales;
  final bool hasMore;
  final bool isLoadingMore;

  const SalesListLoaded({
    required this.sales,
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  SalesListLoaded copyWith({
    List<Sale>? sales,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SalesListLoaded(
      sales: sales ?? this.sales,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class SalesListError extends SalesListState {
  final Failure failure;
  const SalesListError(this.failure);
}

/// Sales history notifier.
@riverpod
class SalesHistoryNotifier extends _$SalesHistoryNotifier {
  static const _pageSize = 20;
  int _currentPage = 1;

  @override
  Future<SalesListState> build() async {
    return _loadSales();
  }

  Future<SalesListState> _loadSales({bool loadMore = false}) async {
    try {
      final repository = ref.read(salesRepositoryProvider);

      if (loadMore) {
        _currentPage++;
      } else {
        _currentPage = 1;
      }

      final (failure, sales) = await repository.getSales(
        page: _currentPage,
        limit: _pageSize,
      );

      if (failure != null) {
        return SalesListError(failure);
      }

      final currentSales = loadMore && state.valueOrNull is SalesListLoaded
          ? (state.valueOrNull as SalesListLoaded).sales
          : <Sale>[];

      return SalesListLoaded(
        sales: [...currentSales, ...sales!],
        hasMore: sales.length >= _pageSize,
      );
    } on StateError catch (e) {
      return SalesListError(Failure.auth(message: e.message));
    }
  }

  /// Refresh the list.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _loadSales());
  }

  /// Load more sales.
  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState is! SalesListLoaded || currentState.isLoadingMore) return;

    state = AsyncData(currentState.copyWith(isLoadingMore: true));
    state = AsyncData(await _loadSales(loadMore: true));
  }
}

/// Voided sales history notifier.
@riverpod
class VoidedSalesNotifier extends _$VoidedSalesNotifier {
  static const _pageSize = 20;
  int _currentPage = 1;

  @override
  Future<SalesListState> build() async {
    return _loadSales();
  }

  Future<SalesListState> _loadSales({bool loadMore = false}) async {
    try {
      final repository = ref.read(salesRepositoryProvider);

      if (loadMore) {
        _currentPage++;
      } else {
        _currentPage = 1;
      }

      final (failure, sales) = await repository.getVoidedSales(
        page: _currentPage,
        limit: _pageSize,
      );

      if (failure != null) {
        return SalesListError(failure);
      }

      final currentSales = loadMore && state.valueOrNull is SalesListLoaded
          ? (state.valueOrNull as SalesListLoaded).sales
          : <Sale>[];

      return SalesListLoaded(
        sales: [...currentSales, ...sales!],
        hasMore: sales.length >= _pageSize,
      );
    } on StateError catch (e) {
      return SalesListError(Failure.auth(message: e.message));
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _loadSales());
  }

  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState is! SalesListLoaded || currentState.isLoadingMore) return;

    state = AsyncData(currentState.copyWith(isLoadingMore: true));
    state = AsyncData(await _loadSales(loadMore: true));
  }
}

// ============================================================================
// VOID SALE STATE
// ============================================================================

/// Void sale state.
sealed class VoidSaleState {
  const VoidSaleState();
}

class VoidSaleIdle extends VoidSaleState {
  const VoidSaleIdle();
}

class VoidSaleProcessing extends VoidSaleState {
  const VoidSaleProcessing();
}

class VoidSaleSuccess extends VoidSaleState {
  final Sale sale;
  const VoidSaleSuccess(this.sale);
}

class VoidSaleError extends VoidSaleState {
  final Failure failure;
  const VoidSaleError(this.failure);
}

/// Void sale notifier.
@riverpod
class VoidSaleNotifier extends _$VoidSaleNotifier {
  @override
  VoidSaleState build() => const VoidSaleIdle();

  /// Void a sale.
  Future<bool> voidSale(String saleId) async {
    state = const VoidSaleProcessing();

    try {
      final repository = ref.read(salesRepositoryProvider);
      final (failure, sale) = await repository.voidSale(saleId);

      if (failure != null) {
        state = VoidSaleError(failure);
        return false;
      }

      state = VoidSaleSuccess(sale!);

      // Refresh sales lists
      ref.invalidate(salesHistoryNotifierProvider);
      ref.invalidate(voidedSalesNotifierProvider);

      return true;
    } catch (e) {
      state = VoidSaleError(Failure.unknown(message: e.toString()));
      return false;
    }
  }

  /// Reset to idle.
  void reset() {
    state = const VoidSaleIdle();
  }
}

// ============================================================================
// PENDING SYNC COUNT
// ============================================================================

/// Provides the count of pending sync operations.
@riverpod
Future<int> pendingSalesCount(Ref ref) async {
  try {
    final repository = ref.watch(salesRepositoryProvider);
    return await repository.getPendingSalesCount();
  } catch (e) {
    return 0;
  }
}

// ============================================================================
// SYNC PENDING SALES
// ============================================================================

/// Sync pending sales state.
sealed class SyncSalesState {
  const SyncSalesState();
}

class SyncSalesIdle extends SyncSalesState {
  const SyncSalesIdle();
}

class SyncSalesSyncing extends SyncSalesState {
  const SyncSalesSyncing();
}

class SyncSalesSuccess extends SyncSalesState {
  final int count;
  const SyncSalesSuccess(this.count);
}

class SyncSalesError extends SyncSalesState {
  final Failure failure;
  const SyncSalesError(this.failure);
}

/// Notifier for syncing pending sales.
@riverpod
class SyncSalesNotifier extends _$SyncSalesNotifier {
  @override
  SyncSalesState build() => const SyncSalesIdle();

  /// Sync all pending sales.
  Future<bool> syncPendingSales() async {
    state = const SyncSalesSyncing();

    try {
      final repository = ref.read(salesRepositoryProvider);
      final (failure, count) = await repository.syncPendingSales();

      if (failure != null) {
        state = SyncSalesError(failure);
        return false;
      }

      state = SyncSalesSuccess(count);

      // Refresh sales lists and pending count
      ref.invalidate(salesHistoryNotifierProvider);
      ref.invalidate(voidedSalesNotifierProvider);
      ref.invalidate(pendingSalesCountProvider);

      return true;
    } catch (e) {
      state = SyncSalesError(Failure.unknown(message: e.toString()));
      return false;
    }
  }

  /// Reset to idle.
  void reset() {
    state = const SyncSalesIdle();
  }
}
