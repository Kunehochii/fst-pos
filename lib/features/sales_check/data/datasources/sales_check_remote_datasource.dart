import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/sales_check_filter.dart';
import '../models/sales_check_response_model.dart';

/// Remote data source for sales check API operations.
class SalesCheckRemoteDataSource {
  final Dio _dio;

  SalesCheckRemoteDataSource(this._dio);

  /// Get grouped sales for the current cashier.
  Future<List<GroupedSaleModel>> getCashierGroupedSales(
    SalesCheckFilter filter,
  ) async {
    AppLogger.debug(
        'Fetching cashier grouped sales', {'filter': filter.toQueryParams()});

    try {
      final response = await _dio.get(
        ApiEndpoints.salesCheck.cashier,
        queryParameters: filter.toQueryParams(),
      );

      final sales = (response.data as List)
          .map(
              (json) => GroupedSaleModel.fromJson(json as Map<String, dynamic>))
          .toList();

      AppLogger.debug('Fetched ${sales.length} grouped sales');
      return sales;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch grouped sales', e);
      throw e.toAppException();
    }
  }

  /// Get total sales summary for the current cashier.
  Future<SalesSummaryModel> getCashierTotalSales(
    SalesCheckFilter filter,
  ) async {
    AppLogger.debug(
        'Fetching cashier total sales', {'filter': filter.toQueryParams()});

    try {
      final response = await _dio.get(
        ApiEndpoints.salesCheck.cashierTotal,
        queryParameters: filter.toQueryParams(),
      );

      AppLogger.debug('Fetched total sales summary');
      // Server returns { items: [...], summary: {...} }
      // We need to parse the summary field
      final data = response.data as Map<String, dynamic>;
      return SalesSummaryModel.fromJson(
          data['summary'] as Map<String, dynamic>);
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch total sales', e);
      throw e.toAppException();
    }
  }
}
