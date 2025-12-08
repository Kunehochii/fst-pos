import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/profit_filter.dart';
import '../models/profit_response_model.dart';

/// Remote data source for profit API operations.
class ProfitRemoteDataSource {
  final Dio _dio;

  ProfitRemoteDataSource(this._dio);

  /// Get grouped profits for the current cashier.
  Future<List<GroupedProfitModel>> getCashierGroupedProfits(
    ProfitFilter filter,
  ) async {
    AppLogger.debug(
        'Fetching cashier grouped profits', {'filter': filter.toQueryParams()});

    try {
      final response = await _dio.get(
        ApiEndpoints.profit.cashier,
        queryParameters: filter.toQueryParams(),
      );

      final profits = (response.data as List)
          .map((json) =>
              GroupedProfitModel.fromJson(json as Map<String, dynamic>))
          .toList();

      AppLogger.debug('Fetched ${profits.length} grouped profits');
      return profits;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch grouped profits', e);
      throw e.toAppException();
    }
  }

  /// Get total profit summary for the current cashier.
  Future<ProfitSummaryModel> getCashierTotalProfit(
    ProfitFilter filter,
  ) async {
    AppLogger.debug(
        'Fetching cashier total profit', {'filter': filter.toQueryParams()});

    try {
      final response = await _dio.get(
        ApiEndpoints.profit.cashierTotal,
        queryParameters: filter.toQueryParams(),
      );

      AppLogger.debug('Fetched total profit summary');
      return ProfitSummaryModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch total profit', e);
      throw e.toAppException();
    }
  }
}
