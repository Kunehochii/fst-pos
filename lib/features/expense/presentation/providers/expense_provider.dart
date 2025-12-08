import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/expense_remote_datasource.dart';
import '../../data/repositories/expense_repository_impl.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';

part 'expense_provider.g.dart';

// ============================================================================
// DATA SOURCE PROVIDERS
// ============================================================================

/// Provides the ExpenseRemoteDataSource.
@riverpod
ExpenseRemoteDataSource expenseRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return ExpenseRemoteDataSource(dio);
}

/// Provides the ExpenseRepository.
@riverpod
ExpenseRepository expenseRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (_, __) {
          final remoteDataSource = ref.watch(expenseRemoteDataSourceProvider);

          return ExpenseRepositoryImpl(
            remoteDataSource: remoteDataSource,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access expenses'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// DATE FILTER STATE
// ============================================================================

/// State for the current expense date filter.
@riverpod
class ExpenseDateNotifier extends _$ExpenseDateNotifier {
  @override
  DateTime build() => DateTime.now();

  /// Set the date.
  void setDate(DateTime date) {
    state = date;
  }

  /// Go to previous day.
  void previousDay() {
    state = state.subtract(const Duration(days: 1));
  }

  /// Go to next day.
  void nextDay() {
    state = state.add(const Duration(days: 1));
  }

  /// Reset to today.
  void resetToToday() {
    state = DateTime.now();
  }
}

// ============================================================================
// EXPENSE STATE
// ============================================================================

/// State for expense data.
sealed class ExpenseState {
  const ExpenseState();
}

class ExpenseLoading extends ExpenseState {
  const ExpenseLoading();
}

class ExpenseLoaded extends ExpenseState {
  final ExpenseList? expense;

  const ExpenseLoaded({this.expense});

  /// Whether there's an expense for this date.
  bool get hasExpense => expense != null;
}

class ExpenseError extends ExpenseState {
  final Failure failure;

  const ExpenseError(this.failure);
}

class ExpenseSaving extends ExpenseState {
  const ExpenseSaving();
}

// ============================================================================
// EXPENSE NOTIFIER
// ============================================================================

/// Notifier for managing expense state.
@riverpod
class ExpenseNotifier extends _$ExpenseNotifier {
  @override
  Future<ExpenseState> build() async {
    // Watch for date changes to refetch
    final date = ref.watch(expenseDateNotifierProvider);

    return _fetchExpense(date);
  }

  Future<ExpenseState> _fetchExpense(DateTime date) async {
    try {
      final repository = ref.read(expenseRepositoryProvider);
      final (failure, expense) = await repository.getExpenseByDate(date: date);

      if (failure != null) {
        return ExpenseError(failure);
      }

      return ExpenseLoaded(expense: expense);
    } catch (e) {
      return ExpenseError(Failure.unknown(message: e.toString()));
    }
  }

  /// Refresh the expense data.
  Future<void> refresh() async {
    state = const AsyncValue.loading();

    final date = ref.read(expenseDateNotifierProvider);
    final newState = await _fetchExpense(date);

    state = AsyncValue.data(newState);
  }

  /// Save expense items.
  Future<bool> saveExpense(List<ExpenseItemInput> items) async {
    // Show saving state
    state = const AsyncValue.data(ExpenseSaving());

    try {
      final repository = ref.read(expenseRepositoryProvider);
      final date = ref.read(expenseDateNotifierProvider);

      final (failure, expense) = await repository.saveExpense(
        items: items,
        date: date,
      );

      if (failure != null) {
        state = AsyncValue.data(ExpenseError(failure));
        return false;
      }

      state = AsyncValue.data(ExpenseLoaded(expense: expense));
      return true;
    } catch (e) {
      state =
          AsyncValue.data(ExpenseError(Failure.unknown(message: e.toString())));
      return false;
    }
  }

  /// Delete the current expense.
  Future<bool> deleteExpense(String expenseId) async {
    state = const AsyncValue.data(ExpenseSaving());

    try {
      final repository = ref.read(expenseRepositoryProvider);
      final (failure, success) = await repository.deleteExpense(expenseId);

      if (failure != null || !success) {
        state = AsyncValue.data(ExpenseError(
            failure ?? Failure.unknown(message: 'Failed to delete')));
        return false;
      }

      // After deletion, show empty state
      state = const AsyncValue.data(ExpenseLoaded(expense: null));
      return true;
    } catch (e) {
      state =
          AsyncValue.data(ExpenseError(Failure.unknown(message: e.toString())));
      return false;
    }
  }
}

// ============================================================================
// EDITING STATE
// ============================================================================

/// Temporary items being edited.
@riverpod
class ExpenseItemsEditor extends _$ExpenseItemsEditor {
  @override
  List<ExpenseItemInput> build() => [];

  /// Initialize with existing items.
  void initializeFrom(ExpenseList? expense) {
    if (expense != null) {
      state = expense.expenseItems
          .map((item) => ExpenseItemInput(name: item.name, amount: item.amount))
          .toList();
    } else {
      state = [];
    }
  }

  /// Add a new item.
  void addItem(ExpenseItemInput item) {
    state = [...state, item];
  }

  /// Update an item at index.
  void updateItem(int index, ExpenseItemInput item) {
    final newList = [...state];
    newList[index] = item;
    state = newList;
  }

  /// Remove an item at index.
  void removeItem(int index) {
    final newList = [...state];
    newList.removeAt(index);
    state = newList;
  }

  /// Clear all items.
  void clear() {
    state = [];
  }

  /// Get total amount.
  double get totalAmount => state.fold(0.0, (sum, item) => sum + item.amount);
}
