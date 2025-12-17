import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';

/// Represents a single expense item within an expense list.
@freezed
class ExpenseItem with _$ExpenseItem {
  const ExpenseItem._();

  const factory ExpenseItem({
    required String id,
    required String name,
    required double amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExpenseItem;

  /// Format amount for display in PHP.
  String get amountDisplay => '₱${amount.toStringAsFixed(2)}';
}

/// Represents a list of expenses for a specific date.
///
/// Each cashier can have one expense list per day.
/// If an expense list already exists for a date, it will be updated.
@freezed
class ExpenseList with _$ExpenseList {
  const ExpenseList._();

  const factory ExpenseList({
    required String id,
    required String cashierId,
    required String businessId,
    required List<ExpenseItem> expenseItems,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExpenseList;

  /// Get total amount of all expense items.
  double get totalAmount =>
      expenseItems.fold(0.0, (sum, item) => sum + item.amount);

  /// Format total amount for display in PHP.
  String get totalAmountDisplay => '₱${totalAmount.toStringAsFixed(2)}';

  /// Get the number of expense items.
  int get itemCount => expenseItems.length;

  /// Whether this expense list has any items.
  bool get hasItems => expenseItems.isNotEmpty;
}
