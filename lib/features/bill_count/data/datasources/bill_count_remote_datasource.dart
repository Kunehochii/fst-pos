import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/bill_count.dart';
import '../models/bill_count_model.dart';

/// Remote data source for bill count API operations.
class BillCountRemoteDataSource {
  final Dio _dio;

  BillCountRemoteDataSource(this._dio);

  /// Get bill count for the current cashier by date.
  ///
  /// [date] - ISO 8601 UTC timestamp. If not provided, server uses current date.
  Future<BillCountModel?> getBillCountByDate({String? date}) async {
    AppLogger.debug('Fetching bill count by date', {'date': date});

    try {
      final queryParams = <String, dynamic>{};
      if (date != null) {
        queryParams['date'] = date;
      }

      final response = await _dio.get(
        ApiEndpoints.bills.cashierByDate,
        queryParameters: queryParams,
      );

      if (response.data == null) {
        AppLogger.debug('No bill count found for date');
        return null;
      }

      AppLogger.debug('Fetched bill count by date');
      return BillCountModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // Handle 404 as "no bill count exists" rather than an error
      if (e.response?.statusCode == 404) {
        AppLogger.debug('No bill count found for date (404)');
        return null;
      }
      AppLogger.error('Failed to fetch bill count by date', e);
      throw e.toAppException();
    }
  }

  /// Create or update bill count for the current cashier.
  ///
  /// If a bill count already exists for the date, it will be updated.
  Future<BillCountModel> createOrUpdateBillCount({
    required double beginningBalance,
    required bool showBeginningBalance,
    required List<BillItemInput> bills,
    String? date,
  }) async {
    AppLogger.debug('Creating/updating bill count', {
      'beginningBalance': beginningBalance,
      'showBeginningBalance': showBeginningBalance,
      'billCount': bills.length,
      'date': date,
    });

    try {
      final queryParams = <String, dynamic>{};
      if (date != null) {
        queryParams['date'] = date;
      }

      final request = CreateBillCountRequest(
        beginningBalance: beginningBalance,
        showBeginningBalance: showBeginningBalance,
        bills: bills
            .map((item) => BillItemRequest(
                  type: item.type.apiValue,
                  amount: item.amount,
                ))
            .toList(),
      );

      final response = await _dio.post(
        ApiEndpoints.bills.cashierCreate,
        data: request.toJson(),
        queryParameters: queryParams,
      );

      AppLogger.debug('Bill count created/updated successfully');
      return BillCountModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      AppLogger.error('Failed to create/update bill count', e);
      throw e.toAppException();
    }
  }

  /// Get bill count by ID.
  Future<BillCountModel?> getBillCountById(String billCountId) async {
    AppLogger.debug('Fetching bill count by ID', {'billCountId': billCountId});

    try {
      final response = await _dio.get(
        ApiEndpoints.bills.byId(billCountId),
      );

      if (response.data == null) {
        AppLogger.debug('No bill count found for ID');
        return null;
      }

      AppLogger.debug('Fetched bill count by ID');
      return BillCountModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        AppLogger.debug('No bill count found for ID (404)');
        return null;
      }
      AppLogger.error('Failed to fetch bill count by ID', e);
      throw e.toAppException();
    }
  }
}
