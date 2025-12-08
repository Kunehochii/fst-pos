import '../../../../core/errors/failure.dart';
import '../entities/expense.dart';

/// Repository interface for expense operations.
abstract class ExpenseRepository {
  /// Get expense list for a specific date.
  ///
  /// Returns a tuple of (Failure?, ExpenseList?).
  /// If no expense exists for the date, returns null for ExpenseList.
  /// The date should be in UTC format.
  Future<(Failure?, ExpenseList?)> getExpenseByDate({
    DateTime? date,
  });

  /// Create or update expense list.
  ///
  /// Returns a tuple of (Failure?, ExpenseList?).
  /// If an expense list already exists for the date, it will be updated.
  /// If no date is provided, uses current date.
  Future<(Failure?, ExpenseList?)> saveExpense({
    required List<ExpenseItemInput> items,
    DateTime? date,
  });

  /// Delete an expense list by ID.
  ///
  /// Returns a tuple of (Failure?, bool) indicating success.
  Future<(Failure?, bool)> deleteExpense(String expenseId);
}

/// Input model for creating/updating expense items.
class ExpenseItemInput {
  final String name;
  final double amount;

  const ExpenseItemInput({
    required this.name,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
      };
}
