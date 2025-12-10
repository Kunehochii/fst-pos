import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/sale.dart';
import '../../domain/repositories/sales_repository.dart';
import '../datasources/sales_local_datasource.dart';
import '../datasources/sales_remote_datasource.dart';
import '../models/sale_model.dart';

/// Implementation of [SalesRepository] with offline-first strategy.
class SalesRepositoryImpl implements SalesRepository {
  final SalesRemoteDataSource _remoteDataSource;
  final SalesLocalDataSource _localDataSource;
  final String _cashierId;

  SalesRepositoryImpl({
    required SalesRemoteDataSource remoteDataSource,
    required SalesLocalDataSource localDataSource,
    required String cashierId,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _cashierId = cashierId;

  /// Check if device is online.
  Future<bool> _isOnline() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Future<(Failure?, Sale?)> createSale(Sale sale) async {
    try {
      // Generate local ID
      final localId = const Uuid().v4();
      final now = DateTime.now();

      // Create local sale first
      final localSale = sale.copyWith(
        id: localId,
        localId: localId,
        cashierId: _cashierId,
        createdAt: now,
        updatedAt: now,
        isSynced: false,
      );

      // Save to local cache
      await _localDataSource.cacheSale(localSale);

      // Track stock adjustments locally
      for (final item in sale.saleItems) {
        await _localDataSource.addStockAdjustment(
          productId: item.productId,
          priceType: item.perKiloPriceId != null ? 'perKilo' : 'sack',
          perKiloPriceId: item.perKiloPriceId,
          sackPriceId: item.sackPriceId,
          quantityChange: -item.quantity, // Negative for sales
          saleId: localId,
        );
      }

      // Check if online
      final isOnline = await _isOnline();

      if (isOnline) {
        try {
          // Try to sync immediately
          final cartItems = _convertSaleItemsToCartItems(sale.saleItems);
          final remoteSale = await _remoteDataSource.createSale(
            totalAmount: sale.totalAmount,
            paymentMethod: sale.paymentMethod,
            items: cartItems,
            orderId: sale.orderId,
            metadata: sale.metadata,
          );

          // Update local with server data
          final syncedSale =
              remoteSale.toEntity(isSynced: true, localId: localId);
          await _localDataSource.cacheSale(syncedSale);
          await _localDataSource.markStockAdjustmentsAsSynced(localId);

          AppLogger.info('Sale created and synced', {'saleId': syncedSale.id});
          return (null, syncedSale);
        } catch (e) {
          // Failed to sync, queue for later
          AppLogger.error('Failed to sync sale, queuing for later', e);
          await _queueSaleForSync(localSale);
          return (null, localSale);
        }
      } else {
        // Offline, queue for later sync
        await _queueSaleForSync(localSale);
        AppLogger.info('Offline - Sale queued for sync', {'localId': localId});
        return (null, localSale);
      }
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to create sale', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  /// Queue a sale for later sync.
  Future<void> _queueSaleForSync(Sale sale) async {
    final model = SaleModel.fromEntity(sale);
    await _localDataSource.queueSaleForSync(
      localSaleId: sale.localId!,
      operation: 'create',
      payload: jsonEncode(model.toJson()),
    );
  }

  /// Convert sale items to cart items for API request.
  List<CartItem> _convertSaleItemsToCartItems(List<SaleItem> items) {
    return items.map((item) {
      // Determine if this is a per kilo or sack item
      final isPerKilo = item.perKiloPriceId != null;

      if (item.product == null) {
        throw StateError('Product data missing in sale item ${item.id}');
      }

      return CartItem(
        cartItemId: item.id.isEmpty ? CartItem.generateId() : item.id,
        product: item.product!,
        priceType: isPerKilo ? CartPriceType.perKilo : CartPriceType.sack,
        sackType: item.sackType,
        quantity: item.quantity,
        unitPrice: item.price,
        discountedPrice: item.discountedPrice,
        isDiscounted: item.isDiscounted,
        isGantang: item.isGantang,
        sackPriceId: item.sackPriceId,
        perKiloPriceId: item.perKiloPriceId,
      );
    }).toList();
  }

  @override
  Future<(Failure?, Sale?)> voidSale(String saleId) async {
    try {
      final now = DateTime.now();

      // Get the sale first
      final sale = await _localDataSource.getSaleById(saleId);
      if (sale == null) {
        return (const Failure.unknown(message: 'Sale not found'), null);
      }

      // Mark as voided locally
      await _localDataSource.markSaleAsVoided(saleId, now);

      // Restore stock locally
      for (final item in sale.saleItems) {
        await _localDataSource.addStockAdjustment(
          productId: item.productId,
          priceType: item.perKiloPriceId != null ? 'perKilo' : 'sack',
          perKiloPriceId: item.perKiloPriceId,
          sackPriceId: item.sackPriceId,
          quantityChange: item.quantity, // Positive to restore
          saleId: saleId,
        );
      }

      // Check if online and sale was synced
      final isOnline = await _isOnline();

      if (isOnline && sale.isSynced) {
        try {
          // Sync void to server
          final remoteSale = await _remoteDataSource.voidSale(saleId);
          final syncedSale = remoteSale.toEntity(isSynced: true);
          await _localDataSource.cacheSale(syncedSale);

          AppLogger.info('Sale voided and synced', {'saleId': saleId});
          return (null, syncedSale);
        } catch (e) {
          AppLogger.error('Failed to sync void, queuing for later', e);
          await _queueVoidForSync(saleId);
        }
      } else if (!sale.isSynced) {
        // Sale was never synced, just remove it from sync queue
        AppLogger.info('Voided unsynced sale', {'saleId': saleId});
      } else {
        // Offline, queue void for later
        await _queueVoidForSync(saleId);
        AppLogger.info('Offline - Void queued for sync', {'saleId': saleId});
      }

      // Get updated sale
      final voidedSale = await _localDataSource.getSaleById(saleId);
      return (null, voidedSale);
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to void sale', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  /// Queue a void operation for sync.
  Future<void> _queueVoidForSync(String saleId) async {
    await _localDataSource.queueSaleForSync(
      localSaleId: saleId,
      operation: 'void',
      payload: jsonEncode({'saleId': saleId}),
    );
  }

  @override
  Future<(Failure?, List<Sale>?)> getSales({
    int page = 1,
    int limit = 20,
    bool includeVoided = false,
  }) async {
    try {
      final offset = (page - 1) * limit;

      // Get from local cache first
      final localSales = await _localDataSource.getCachedSales(
        _cashierId,
        includeVoided: includeVoided,
        limit: limit,
        offset: offset,
      );

      // Try to refresh from server if online
      final isOnline = await _isOnline();
      if (isOnline) {
        try {
          final remoteSales = await _remoteDataSource.getCashierSales();
          final sales =
              remoteSales.map((m) => m.toEntity(isSynced: true)).toList();
          await _localDataSource.cacheSales(sales);

          // Return fresh data
          final freshSales = await _localDataSource.getCachedSales(
            _cashierId,
            includeVoided: includeVoided,
            limit: limit,
            offset: offset,
          );
          return (null, freshSales);
        } catch (e) {
          AppLogger.error('Failed to refresh sales from server', e);
          // Return cached data
          return (null, localSales);
        }
      }

      return (null, localSales);
    } on AppException catch (e) {
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Failed to get sales', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Sale?)> getSaleById(String saleId) async {
    try {
      final sale = await _localDataSource.getSaleById(saleId);
      return (null, sale);
    } catch (e) {
      AppLogger.error('Failed to get sale by ID', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, List<Sale>?)> getVoidedSales({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final offset = (page - 1) * limit;

      final sales = await _localDataSource.getVoidedSales(
        _cashierId,
        limit: limit,
        offset: offset,
      );

      // Try to refresh from server if online
      final isOnline = await _isOnline();
      if (isOnline) {
        try {
          final remoteSales = await _remoteDataSource.getVoidedSales();
          final voidedSales =
              remoteSales.map((m) => m.toEntity(isSynced: true)).toList();
          await _localDataSource.cacheSales(voidedSales);

          // Return fresh data
          final freshSales = await _localDataSource.getVoidedSales(
            _cashierId,
            limit: limit,
            offset: offset,
          );
          return (null, freshSales);
        } catch (e) {
          AppLogger.error('Failed to refresh voided sales from server', e);
          return (null, sales);
        }
      }

      return (null, sales);
    } catch (e) {
      AppLogger.error('Failed to get voided sales', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, int)> syncPendingSales() async {
    try {
      final isOnline = await _isOnline();
      if (!isOnline) {
        return (const Failure.network(message: 'No internet connection'), 0);
      }

      final pendingOps = await _localDataSource.getPendingSyncOperations();
      int syncedCount = 0;

      for (final op in pendingOps) {
        try {
          if (op.operation == 'create') {
            // Parse payload and create sale
            final payload = jsonDecode(op.payload) as Map<String, dynamic>;
            final saleModel = SaleModel.fromJson(payload);

            // Convert sale items to cart items for API request
            final cartItems = saleModel.saleItems.map((item) {
              final product = item.product;
              if (product == null) {
                throw StateError(
                    'Product data missing in sale item ${item.id}');
              }

              if (item.perKiloPriceId != null) {
                return CartItem(
                  cartItemId: item.id,
                  product: product.toEntity(),
                  priceType: CartPriceType.perKilo,
                  quantity: double.parse(item.quantity),
                  unitPrice: double.parse(item.price),
                  discountedPrice: item.discountedPrice != null
                      ? double.parse(item.discountedPrice!)
                      : null,
                  isDiscounted: item.isDiscounted,
                  isGantang: item.isGantang,
                  perKiloPriceId: item.perKiloPriceId,
                );
              } else {
                return CartItem(
                  cartItemId: item.id,
                  product: product.toEntity(),
                  priceType: CartPriceType.sack,
                  sackType: item.sackType != null
                      ? SackType.fromString(item.sackType!)
                      : null,
                  quantity: double.parse(item.quantity),
                  unitPrice: double.parse(item.price),
                  discountedPrice: item.discountedPrice != null
                      ? double.parse(item.discountedPrice!)
                      : null,
                  isDiscounted: item.isDiscounted,
                  sackPriceId: item.sackPriceId,
                );
              }
            }).toList();

            // Create sale on server
            final remoteSale = await _remoteDataSource.createSale(
              totalAmount: double.parse(saleModel.totalAmount),
              paymentMethod: PaymentMethod.fromString(saleModel.paymentMethod),
              items: cartItems,
              orderId: saleModel.orderId,
              metadata: saleModel.metadata,
            );

            // Update local with server data
            await _localDataSource.markSaleAsSynced(
                op.localSaleId, remoteSale.id);
            await _localDataSource.markStockAdjustmentsAsSynced(op.localSaleId);
          } else if (op.operation == 'void') {
            // Void the sale on server
            await _remoteDataSource.voidSale(op.localSaleId);
          }

          // Remove from sync queue
          await _localDataSource.removeSyncOperation(op.id);
          syncedCount++;
        } catch (e) {
          AppLogger.error('Failed to sync operation ${op.id}', e);
          await _localDataSource.updateSyncAttempt(op.id, e.toString());
        }
      }

      AppLogger.info('Synced $syncedCount sales');
      return (null, syncedCount);
    } catch (e) {
      AppLogger.error('Failed to sync pending sales', e);
      return (Failure.unknown(message: e.toString()), 0);
    }
  }

  @override
  Future<int> getPendingSalesCount() async {
    return _localDataSource.getPendingSyncCount();
  }
}
