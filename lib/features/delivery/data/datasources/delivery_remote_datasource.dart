import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/delivery.dart';
import '../models/delivery_model.dart';

/// Remote data source for delivery API calls.
class DeliveryRemoteDataSource {
  final Dio _dio;

  DeliveryRemoteDataSource(this._dio);

  /// Creates a new delivery.
  ///
  /// Uses the `POST /delivery` endpoint.
  Future<DeliveryModel> createDelivery(CreateDeliveryDto dto) async {
    AppLogger.debug('Creating delivery', {
      'driverName': dto.driverName,
      'itemsCount': dto.deliveryItems.length,
    });

    final model = CreateDeliveryModel.fromDto(dto);

    final response = await _dio.post(
      ApiEndpoints.delivery.create,
      data: model.toJson(),
    );

    AppLogger.json('Created delivery response', response.data);

    return DeliveryModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Updates an existing delivery.
  ///
  /// Uses the `PUT /delivery/:id` endpoint.
  Future<DeliveryModel> updateDelivery(
    String deliveryId,
    UpdateDeliveryDto dto,
  ) async {
    AppLogger.debug('Updating delivery', {
      'deliveryId': deliveryId,
      'hasDriverName': dto.driverName != null,
      'hasItems': dto.deliveryItems != null,
    });

    final model = UpdateDeliveryModel.fromDto(dto);

    final response = await _dio.put(
      ApiEndpoints.delivery.byId(deliveryId),
      data: model.toJson(),
    );

    AppLogger.json('Updated delivery response', response.data);

    return DeliveryModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes a delivery.
  ///
  /// Uses the `DELETE /delivery/:id` endpoint.
  Future<DeliveryModel> deleteDelivery(String deliveryId) async {
    AppLogger.debug('Deleting delivery', {'deliveryId': deliveryId});

    final response = await _dio.delete(
      ApiEndpoints.delivery.byId(deliveryId),
    );

    AppLogger.json('Deleted delivery response', response.data);

    return DeliveryModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Fetches all deliveries for the current cashier.
  ///
  /// Uses the `GET /delivery/cashier` endpoint.
  ///
  /// [filter] - Optional filter for date range and product.
  Future<List<DeliveryModel>> getDeliveries({DeliveryFilter? filter}) async {
    AppLogger.debug('Fetching cashier deliveries', {
      'startDate': filter?.startDate?.toIso8601String(),
      'endDate': filter?.endDate?.toIso8601String(),
      'productId': filter?.productId,
      'productSearch': filter?.productSearch,
    });

    final queryParams = <String, dynamic>{};

    if (filter?.startDate != null) {
      queryParams['startDate'] = filter!.startDate!.toUtc().toIso8601String();
    }

    if (filter?.endDate != null) {
      queryParams['endDate'] = filter!.endDate!.toUtc().toIso8601String();
    }

    if (filter?.productId != null) {
      queryParams['productId'] = filter!.productId;
    }

    if (filter?.productSearch != null && filter!.productSearch!.isNotEmpty) {
      queryParams['productSearch'] = filter.productSearch;
    }

    final response = await _dio.get(
      ApiEndpoints.delivery.cashier,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    AppLogger.json('Fetched deliveries response', response.data);

    final List<dynamic> data = response.data as List<dynamic>;
    final deliveries = data
        .map((json) => DeliveryModel.fromJson(json as Map<String, dynamic>))
        .toList();

    AppLogger.debug('Parsed ${deliveries.length} deliveries');

    return deliveries;
  }

  /// Fetches a single delivery by ID.
  ///
  /// Uses the `GET /delivery/:id` endpoint.
  Future<DeliveryModel> getDeliveryById(String deliveryId) async {
    AppLogger.debug('Fetching delivery by ID', {'deliveryId': deliveryId});

    final response = await _dio.get(
      ApiEndpoints.delivery.byId(deliveryId),
    );

    AppLogger.json('Fetched delivery response', response.data);

    return DeliveryModel.fromJson(response.data as Map<String, dynamic>);
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
