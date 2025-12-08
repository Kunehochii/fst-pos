import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_remote_datasource.dart';

/// Implementation of [ExpenseRepository].
///
/// For expenses, we use a simple online-first approach since
/// expenses are not as critical for offline operation as sales.
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remoteDataSource;

  ExpenseRepositoryImpl({
    required ExpenseRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<(Failure?, ExpenseList?)> getExpenseByDate({
    DateTime? date,
  }) async {
    try {
      final dateString = date?.toUtc().toIso8601String();

      final expenseModel = await _remoteDataSource.getCashierExpenseByDate(
        date: dateString,
      );

      if (expenseModel == null) {
        AppLogger.info('No expense found for date', {'date': dateString});
        return (null, null);
      }

      final expense = expenseModel.toEntity();
      AppLogger.info('Fetched expense', {
        'id': expense.id,
        'itemCount': expense.itemCount,
        'totalAmount': expense.totalAmount,
      });

      return (null, expense);
    } on AppException catch (e) {
      AppLogger.error('Failed to get expense by date', e);
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Unexpected error getting expense', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, ExpenseList?)> saveExpense({
    required List<ExpenseItemInput> items,
    DateTime? date,
  }) async {
    try {
      final dateString = date?.toUtc().toIso8601String();

      final expenseModel = await _remoteDataSource.createOrUpdateExpense(
        items: items,
        date: dateString,
      );

      final expense = expenseModel.toEntity();
      AppLogger.info('Saved expense', {
        'id': expense.id,
        'itemCount': expense.itemCount,
        'totalAmount': expense.totalAmount,
      });

      return (null, expense);
    } on AppException catch (e) {
      AppLogger.error('Failed to save expense', e);
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Unexpected error saving expense', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, bool)> deleteExpense(String expenseId) async {
    try {
      await _remoteDataSource.deleteExpense(expenseId);
      AppLogger.info('Deleted expense', {'expenseId': expenseId});
      return (null, true);
    } on AppException catch (e) {
      AppLogger.error('Failed to delete expense', e);
      return (e.toFailure(), false);
    } catch (e) {
      AppLogger.error('Unexpected error deleting expense', e);
      return (Failure.unknown(message: e.toString()), false);
    }
  }
}
