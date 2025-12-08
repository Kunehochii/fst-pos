import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/repositories/expense_repository.dart';
import '../models/expense_model.dart';

/// Remote data source for expense API operations.
class ExpenseRemoteDataSource {
  final Dio _dio;

  ExpenseRemoteDataSource(this._dio);

  /// Get expense list for the current cashier by date.
  ///
  /// [date] - ISO 8601 UTC timestamp. If not provided, server uses current date.
  Future<ExpenseListModel?> getCashierExpenseByDate({String? date}) async {
    AppLogger.debug('Fetching cashier expense by date', {'date': date});

    try {
      final queryParams = <String, dynamic>{};
      if (date != null) {
        queryParams['date'] = date;
      }

      final response = await _dio.get(
        ApiEndpoints.expenses.cashierByDate,
        queryParameters: queryParams,
      );

      if (response.data == null) {
        AppLogger.debug('No expense found for date');
        return null;
      }

      AppLogger.debug('Fetched expense by date');
      return ExpenseListModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch expense by date', e);
      throw e.toAppException();
    }
  }

  /// Create or update expense for the current cashier.
  ///
  /// If an expense list already exists for the date, it will be updated.
  Future<ExpenseListModel> createOrUpdateExpense({
    required List<ExpenseItemInput> items,
    String? date,
  }) async {
    AppLogger.debug('Creating/updating expense', {
      'itemCount': items.length,
      'date': date,
    });

    try {
      final request = CreateExpenseRequest(
        date: date,
        expenseItems: items
            .map((item) => ExpenseItemRequest(
                  name: item.name,
                  amount: item.amount,
                ))
            .toList(),
      );

      final response = await _dio.post(
        ApiEndpoints.expenses.cashierCreate,
        data: request.toJson(),
      );

      AppLogger.debug('Expense created/updated successfully');
      return ExpenseListModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      AppLogger.error('Failed to create/update expense', e);
      throw e.toAppException();
    }
  }

  /// Delete an expense list.
  Future<void> deleteExpense(String expenseId) async {
    AppLogger.debug('Deleting expense', {'expenseId': expenseId});

    try {
      await _dio.delete(ApiEndpoints.expenses.cashierDelete(expenseId));
      AppLogger.debug('Expense deleted successfully');
    } on DioException catch (e) {
      AppLogger.error('Failed to delete expense', e);
      throw e.toAppException();
    }
  }
}
