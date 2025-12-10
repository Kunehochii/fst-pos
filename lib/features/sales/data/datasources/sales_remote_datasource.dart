import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/payment_method.dart';
import '../models/sale_model.dart';

/// Remote data source for sales API operations.
class SalesRemoteDataSource {
  final Dio _dio;

  SalesRemoteDataSource(this._dio);

  /// Create a new sale.
  Future<SaleModel> createSale({
    required double totalAmount,
    required PaymentMethod paymentMethod,
    required List<CartItem> items,
    String? orderId,
    Map<String, dynamic>? metadata,
  }) async {
    AppLogger.debug('Creating sale', {
      'totalAmount': totalAmount,
      'paymentMethod': paymentMethod.toApiString(),
      'itemCount': items.length,
    });

    try {
      final saleItems = items.map((item) {
        if (item.priceType == CartPriceType.perKilo) {
          return CreateSaleItemRequest(
            id: item.product.id,
            price: item.isGantang
                ? item.effectiveUnitPrice.toString()
                : item.unitPrice.toString(),
            discountedPrice: item.discountedPrice?.toString(),
            isDiscounted: item.isDiscounted,
            isGantang: item.isGantang,
            perKiloPrice: PerKiloPriceRequest(
              id: item.perKiloPriceId!,
              quantity: item.quantity.toString(),
            ),
          );
        } else {
          return CreateSaleItemRequest(
            id: item.product.id,
            price: item.unitPrice.toString(),
            discountedPrice: item.discountedPrice?.toString(),
            isDiscounted: item.isDiscounted,
            sackPrice: SackPriceRequest(
              id: item.sackPriceId!,
              quantity: item.quantity.toString(),
              type: item.sackType!.toApiString(),
            ),
          );
        }
      }).toList();

      final request = CreateSaleRequest(
        totalAmount: totalAmount.toString(),
        paymentMethod: paymentMethod.toApiString(),
        orderId: orderId,
        saleItem: saleItems,
        metadata: metadata,
      );

      final requestJson = request.toJson();
      AppLogger.debug('Request JSON', requestJson);

      final response = await _dio.post(
        ApiEndpoints.sales.create,
        data: requestJson,
      );

      AppLogger.debug('Sale created successfully');
      return SaleModel.fromJson(response.data);
    } on DioException catch (e) {
      AppLogger.error('Failed to create sale', e);
      throw e.toAppException();
    }
  }

  /// Void a sale.
  Future<SaleModel> voidSale(String saleId) async {
    AppLogger.debug('Voiding sale', {'saleId': saleId});

    try {
      final response = await _dio.post(ApiEndpoints.sales.void_(saleId));

      AppLogger.debug('Sale voided successfully');
      return SaleModel.fromJson(response.data);
    } on DioException catch (e) {
      AppLogger.error('Failed to void sale', e);
      throw e.toAppException();
    }
  }

  /// Get sales for the current cashier.
  Future<List<SaleModel>> getCashierSales() async {
    AppLogger.debug('Fetching cashier sales');

    try {
      final response = await _dio.get(ApiEndpoints.sales.cashier);

      final sales = (response.data as List)
          .map((json) => SaleModel.fromJson(json as Map<String, dynamic>))
          .toList();

      AppLogger.debug('Fetched ${sales.length} sales');
      return sales;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch sales', e);
      throw e.toAppException();
    }
  }

  /// Get sales by date for the current cashier.
  Future<Map<String, dynamic>> getSalesByDate(DateTime date) async {
    AppLogger.debug('Fetching sales by date', {'date': date.toIso8601String()});

    try {
      final response = await _dio.get(
        ApiEndpoints.sales.cashierByDate,
        queryParameters: {'date': date.toUtc().toIso8601String()},
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch sales by date', e);
      throw e.toAppException();
    }
  }

  /// Get voided sales for the current cashier.
  Future<List<SaleModel>> getVoidedSales() async {
    AppLogger.debug('Fetching voided sales');

    try {
      final response = await _dio.get(ApiEndpoints.sales.cashierVoided);

      final sales = (response.data as List)
          .map((json) => SaleModel.fromJson(json as Map<String, dynamic>))
          .toList();

      AppLogger.debug('Fetched ${sales.length} voided sales');
      return sales;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch voided sales', e);
      throw e.toAppException();
    }
  }
}
