import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

/// Remote data source for product API calls.
class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  /// Fetches all products for the current cashier.
  ///
  /// Uses the `/products/cashier/my-products` endpoint which returns
  /// products based on the authenticated cashier's JWT token.
  ///
  /// [filter] - Optional filter for category and search.
  Future<List<ProductModel>> getProducts({ProductFilter? filter}) async {
    AppLogger.debug('Fetching cashier products', {
      'category': filter?.category?.toApiString(),
      'search': filter?.searchQuery,
    });

    final queryParams = <String, dynamic>{};

    if (filter?.category != null) {
      queryParams['category'] = filter!.category!.toApiString();
    }

    if (filter?.searchQuery != null && filter!.searchQuery!.isNotEmpty) {
      queryParams['productSearch'] = filter.searchQuery;
    }

    final response = await _dio.get(
      ApiEndpoints.products.myProducts,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    AppLogger.json('Parsing products response', response.data);

    final List<dynamic> data = response.data as List<dynamic>;
    final products = data
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();

    AppLogger.debug('Parsed ${products.length} products');

    return products;
  }

  /// Fetches a single product by ID.
  ///
  /// Uses the `/products/cashier/my-products/:id` endpoint.
  Future<ProductModel> getProductById(String productId) async {
    AppLogger.debug('Fetching product by ID', {'productId': productId});

    final response = await _dio.get(
      ApiEndpoints.products.myProductById(productId),
    );

    AppLogger.json('Parsing single product response', response.data);

    return ProductModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Checks if the server is reachable.
  Future<bool> checkConnectivity() async {
    try {
      await _dio.get(
        '/',
        options: Options(
          extra: {'skipAuth': true},
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      return true;
    } catch (_) {
      return false;
    }
  }
}
