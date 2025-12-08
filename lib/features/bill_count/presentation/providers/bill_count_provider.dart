import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/bill_count_local_datasource.dart';
import '../../data/datasources/bill_count_remote_datasource.dart';
import '../../data/repositories/bill_count_repository_impl.dart';
import '../../domain/entities/bill_count.dart';
import '../../domain/repositories/bill_count_repository.dart';

part 'bill_count_provider.g.dart';

// ============================================================================
// DATA SOURCE PROVIDERS
// ============================================================================

/// Provides the BillCountRemoteDataSource.
@riverpod
BillCountRemoteDataSource billCountRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return BillCountRemoteDataSource(dio);
}

/// Provides the BillCountLocalDataSource.
@riverpod
BillCountLocalDataSource billCountLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return BillCountLocalDataSource(db);
}

/// Provides the BillCountRepository.
@riverpod
BillCountRepository billCountRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (cashier, _) {
          final remoteDataSource = ref.watch(billCountRemoteDataSourceProvider);
          final localDataSource = ref.watch(billCountLocalDataSourceProvider);

          return BillCountRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            cashierId: cashier.id,
            cashierUsername: cashier.username,
            cashierBranchName: cashier.branchName,
          );
        },
        orElse: () =>
            throw StateError('Must be authenticated to access bill counts'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// DATE FILTER STATE
// ============================================================================

/// State for the current bill count date filter.
@riverpod
class BillCountDateNotifier extends _$BillCountDateNotifier {
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
// BILL COUNT STATE
// ============================================================================

/// State for bill count data.
sealed class BillCountState {
  const BillCountState();
}

class BillCountLoading extends BillCountState {
  const BillCountLoading();
}

class BillCountLoaded extends BillCountState {
  final BillCount? billCount;

  const BillCountLoaded({this.billCount});

  /// Whether there's a bill count for this date.
  bool get hasBillCount => billCount != null;
}

class BillCountError extends BillCountState {
  final Failure failure;

  const BillCountError(this.failure);
}

class BillCountSaving extends BillCountState {
  const BillCountSaving();
}

// ============================================================================
// BILL COUNT NOTIFIER
// ============================================================================

/// Notifier for managing bill count state.
@riverpod
class BillCountNotifier extends _$BillCountNotifier {
  @override
  Future<BillCountState> build() async {
    // Watch for date changes to refetch
    final date = ref.watch(billCountDateNotifierProvider);

    return _fetchBillCount(date);
  }

  Future<BillCountState> _fetchBillCount(DateTime date) async {
    try {
      final repository = ref.read(billCountRepositoryProvider);
      final (failure, billCount) =
          await repository.getBillCountByDate(date: date);

      if (failure != null) {
        return BillCountError(failure);
      }

      return BillCountLoaded(billCount: billCount);
    } catch (e) {
      return BillCountError(Failure.unknown(message: e.toString()));
    }
  }

  /// Refresh the bill count data.
  Future<void> refresh() async {
    state = const AsyncValue.loading();

    final date = ref.read(billCountDateNotifierProvider);
    final newState = await _fetchBillCount(date);

    state = AsyncValue.data(newState);
  }

  /// Save bill count.
  Future<bool> saveBillCount({
    required double beginningBalance,
    required bool showBeginningBalance,
    required List<BillItemInput> bills,
  }) async {
    // Show saving state
    state = const AsyncValue.data(BillCountSaving());

    try {
      final repository = ref.read(billCountRepositoryProvider);
      final date = ref.read(billCountDateNotifierProvider);

      final (failure, billCount) = await repository.saveBillCount(
        beginningBalance: beginningBalance,
        showBeginningBalance: showBeginningBalance,
        bills: bills,
        date: date,
      );

      if (failure != null) {
        state = AsyncValue.data(BillCountError(failure));
        return false;
      }

      state = AsyncValue.data(BillCountLoaded(billCount: billCount));
      return true;
    } catch (e) {
      state = AsyncValue.data(
          BillCountError(Failure.unknown(message: e.toString())));
      return false;
    }
  }

  /// Sync pending bill counts to server.
  Future<int> syncPending() async {
    try {
      final repository = ref.read(billCountRepositoryProvider);
      final (failure, count) = await repository.syncPendingBillCounts();

      if (failure != null) {
        return 0;
      }

      // Refresh to get updated data
      if (count > 0) {
        await refresh();
      }

      return count;
    } catch (e) {
      return 0;
    }
  }

  /// Check if there are pending syncs.
  Future<bool> hasPendingSync() async {
    try {
      final repository = ref.read(billCountRepositoryProvider);
      return repository.hasPendingSync();
    } catch (e) {
      return false;
    }
  }
}

// ============================================================================
// BILL INPUT STATE (for the form)
// ============================================================================

/// State for bill input form.
class BillInputState {
  final double beginningBalance;
  final bool showBeginningBalance;
  final Map<BillType, int> billAmounts;

  const BillInputState({
    this.beginningBalance = 0,
    this.showBeginningBalance = false,
    required this.billAmounts,
  });

  /// Create initial state with all bill types set to 0.
  factory BillInputState.initial() {
    return BillInputState(
      billAmounts: {
        for (var type in BillType.values) type: 0,
      },
    );
  }

  /// Create state from existing bill count.
  factory BillInputState.fromBillCount(BillCount billCount) {
    return BillInputState(
      beginningBalance: billCount.beginningBalance,
      showBeginningBalance: billCount.showBeginningBalance,
      billAmounts: Map.from(billCount.billsByType),
    );
  }

  /// Calculate total from all bills.
  double get billsTotal {
    double total = 0;
    billAmounts.forEach((type, amount) {
      total += type.value * amount;
    });
    return total;
  }

  /// Get amount for a specific bill type.
  int getAmount(BillType type) => billAmounts[type] ?? 0;

  /// Create a copy with updated values.
  BillInputState copyWith({
    double? beginningBalance,
    bool? showBeginningBalance,
    Map<BillType, int>? billAmounts,
  }) {
    return BillInputState(
      beginningBalance: beginningBalance ?? this.beginningBalance,
      showBeginningBalance: showBeginningBalance ?? this.showBeginningBalance,
      billAmounts: billAmounts ?? Map.from(this.billAmounts),
    );
  }

  /// Convert to list of BillItemInput for saving.
  List<BillItemInput> toBillItemInputs() {
    return billAmounts.entries
        .where((e) => e.value > 0)
        .map((e) => BillItemInput(type: e.key, amount: e.value))
        .toList();
  }
}

/// Notifier for managing bill input form state.
@riverpod
class BillInputNotifier extends _$BillInputNotifier {
  @override
  BillInputState build() {
    // Watch bill count state to initialize form
    final billCountState = ref.watch(billCountNotifierProvider);

    return billCountState.when(
      data: (state) {
        if (state is BillCountLoaded && state.billCount != null) {
          return BillInputState.fromBillCount(state.billCount!);
        }
        return BillInputState.initial();
      },
      loading: () => BillInputState.initial(),
      error: (_, __) => BillInputState.initial(),
    );
  }

  /// Set beginning balance.
  void setBeginningBalance(double value) {
    state = state.copyWith(beginningBalance: value);
  }

  /// Toggle show beginning balance.
  void toggleShowBeginningBalance() {
    state = state.copyWith(showBeginningBalance: !state.showBeginningBalance);
  }

  /// Set show beginning balance.
  void setShowBeginningBalance(bool value) {
    state = state.copyWith(showBeginningBalance: value);
  }

  /// Set amount for a specific bill type.
  void setBillAmount(BillType type, int amount) {
    final newAmounts = Map<BillType, int>.from(state.billAmounts);
    newAmounts[type] = amount;
    state = state.copyWith(billAmounts: newAmounts);
  }

  /// Increment amount for a specific bill type.
  void incrementBillAmount(BillType type, [int delta = 1]) {
    final currentAmount = state.billAmounts[type] ?? 0;
    setBillAmount(type, currentAmount + delta);
  }

  /// Decrement amount for a specific bill type.
  void decrementBillAmount(BillType type, [int delta = 1]) {
    final currentAmount = state.billAmounts[type] ?? 0;
    final newAmount = currentAmount - delta;
    setBillAmount(type, newAmount < 0 ? 0 : newAmount);
  }

  /// Reset all amounts to 0.
  void resetAmounts() {
    state = BillInputState.initial().copyWith(
      beginningBalance: state.beginningBalance,
      showBeginningBalance: state.showBeginningBalance,
    );
  }

  /// Reset entire form to initial state.
  void reset() {
    state = BillInputState.initial();
  }
}
