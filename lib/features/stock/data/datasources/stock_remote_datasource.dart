import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/stock_statistics.dart';
import '../../domain/entities/transfer.dart';
import '../models/stock_statistics_model.dart';
import '../models/transfer_model.dart';

/// Remote data source for stock API calls.
class StockRemoteDataSource {
  final Dio _dio;

  StockRemoteDataSource(this._dio);

  // ============================================================================
  // STOCK STATISTICS
  // ============================================================================

  /// Fetches stock statistics for the current cashier.
  ///
  /// Uses the `/stock/statistics/cashier` endpoint.
  ///
  /// [filter] - Optional filter for date range.
  Future<StockStatisticsModel> getStockStatistics({StockFilter? filter}) async {
    AppLogger.debug('Fetching stock statistics', {
      'startDate': filter?.startDate?.toUtc().toIso8601String(),
      'endDate': filter?.endDate?.toUtc().toIso8601String(),
    });

    final queryParams = <String, dynamic>{};

    if (filter?.startDate != null) {
      queryParams['startDate'] = filter!.startDate!.toUtc().toIso8601String();
    }

    if (filter?.endDate != null) {
      queryParams['endDate'] = filter!.endDate!.toUtc().toIso8601String();
    }

    final response = await _dio.get(
      ApiEndpoints.stock.cashierStatistics,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    AppLogger.json('Parsing stock statistics response', response.data);

    return StockStatisticsModel.fromJson(response.data as Map<String, dynamic>);
  }

  // ============================================================================
  // TRANSFERS
  // ============================================================================

  /// Creates a transfer with sack price.
  ///
  /// Uses the `POST /transfer` endpoint.
  Future<TransferModel> createSackTransfer(
      CreateTransferSackModel model) async {
    AppLogger.debug('Creating sack transfer', model.toJson());

    final response = await _dio.post(
      ApiEndpoints.transfer.create,
      data: model.toJson(),
    );

    AppLogger.json('Sack transfer created', response.data);

    return TransferModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a transfer with per kilo price.
  ///
  /// Uses the `POST /transfer` endpoint.
  Future<TransferModel> createPerKiloTransfer(
      CreateTransferPerKiloModel model) async {
    AppLogger.debug('Creating per kilo transfer', model.toJson());

    final response = await _dio.post(
      ApiEndpoints.transfer.create,
      data: model.toJson(),
    );

    AppLogger.json('Per kilo transfer created', response.data);

    return TransferModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Fetches all transfers for the current cashier.
  ///
  /// Uses the `GET /transfer/cashier` endpoint.
  Future<List<TransferModel>> getTransfers() async {
    AppLogger.debug('Fetching cashier transfers');

    final response = await _dio.get(ApiEndpoints.transfer.cashier);

    AppLogger.json('Parsing transfers response', response.data);

    final List<dynamic> data = response.data as List<dynamic>;
    final transfers = data
        .map((json) => TransferModel.fromJson(json as Map<String, dynamic>))
        .toList();

    AppLogger.debug('Parsed ${transfers.length} transfers');

    return transfers;
  }

  /// Fetches transfers by date range.
  ///
  /// Uses the `GET /transfer/cashier/date` endpoint.
  Future<List<TransferModel>> getTransfersByDate({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    AppLogger.debug('Fetching transfers by date', {
      'startDate': startDate.toUtc().toIso8601String(),
      'endDate': endDate.toUtc().toIso8601String(),
    });

    final response = await _dio.get(
      ApiEndpoints.transfer.cashierByDate,
      queryParameters: {
        'startDate': startDate.toUtc().toIso8601String(),
        'endDate': endDate.toUtc().toIso8601String(),
      },
    );

    AppLogger.json('Parsing transfers by date response', response.data);

    final List<dynamic> data = response.data as List<dynamic>;
    final transfers = data
        .map((json) => TransferModel.fromJson(json as Map<String, dynamic>))
        .toList();

    AppLogger.debug('Parsed ${transfers.length} transfers');

    return transfers;
  }

  /// Fetches a single transfer by ID.
  ///
  /// Uses the `GET /transfer/:id` endpoint.
  Future<TransferModel> getTransferById(String transferId) async {
    AppLogger.debug('Fetching transfer by ID', {'transferId': transferId});

    final response = await _dio.get(
      ApiEndpoints.transfer.byId(transferId),
    );

    AppLogger.json('Parsing single transfer response', response.data);

    return TransferModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Updates a transfer.
  ///
  /// Uses the `PATCH /transfer/:id` endpoint.
  Future<TransferModel> updateTransfer(
    String transferId,
    UpdateTransferDto dto,
  ) async {
    AppLogger.debug('Updating transfer', {
      'transferId': transferId,
      'dto': dto.toString(),
    });

    final data = <String, dynamic>{};
    if (dto.quantity != null) {
      data['quantity'] = dto.quantity;
    }
    if (dto.transferType != null) {
      data['transferType'] = dto.transferType!.toApiString();
    }
    if (dto.sackType != null) {
      data['sackType'] = dto.sackType!.toApiString();
    }

    final response = await _dio.patch(
      ApiEndpoints.transfer.byId(transferId),
      data: data,
    );

    AppLogger.json('Transfer updated', response.data);

    return TransferModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes a transfer.
  ///
  /// Uses the `DELETE /transfer/:id` endpoint.
  Future<void> deleteTransfer(String transferId) async {
    AppLogger.debug('Deleting transfer', {'transferId': transferId});

    await _dio.delete(ApiEndpoints.transfer.byId(transferId));

    AppLogger.debug('Transfer deleted');
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
