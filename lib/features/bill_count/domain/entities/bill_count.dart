import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_count.freezed.dart';

/// Bill denomination types in Philippine Peso.
enum BillType {
  peso1000('PESO_1000', 1000),
  peso500('PESO_500', 500),
  peso200('PESO_200', 200),
  peso100('PESO_100', 100),
  peso50('PESO_50', 50),
  peso20('PESO_20', 20),
  peso1('PESO_1', 1); // Coins (mixed)

  const BillType(this.apiValue, this.value);

  /// API value for serialization.
  final String apiValue;

  /// Monetary value of the bill type.
  final int value;

  /// Get BillType from API string value.
  static BillType fromApiValue(String value) {
    return BillType.values.firstWhere(
      (type) => type.apiValue == value,
      orElse: () => BillType.peso1,
    );
  }

  /// Display name for UI.
  String get displayName {
    switch (this) {
      case BillType.peso1000:
        return '₱1,000';
      case BillType.peso500:
        return '₱500';
      case BillType.peso200:
        return '₱200';
      case BillType.peso100:
        return '₱100';
      case BillType.peso50:
        return '₱50';
      case BillType.peso20:
        return '₱20';
      case BillType.peso1:
        return 'Coins';
    }
  }
}

/// Represents a single bill item (type and count).
@freezed
class BillItem with _$BillItem {
  const BillItem._();

  const factory BillItem({
    required String id,
    required BillType type,
    required int amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BillItem;

  /// Calculate the total value of this bill item.
  int get totalValue => type.value * amount;

  /// Format total value for display.
  String get totalValueDisplay => '₱${totalValue.toStringAsFixed(0)}';
}

/// Represents cashier information for bill count.
@freezed
class BillCountCashier with _$BillCountCashier {
  const factory BillCountCashier({
    required String id,
    required String username,
    required String branchName,
  }) = _BillCountCashier;
}

/// Represents a bill count for a specific date.
///
/// Each cashier can have one bill count per day.
/// If a bill count already exists for a date, it will be updated.
@freezed
class BillCount with _$BillCount {
  const BillCount._();

  const factory BillCount({
    required String id,
    required DateTime date,
    required DateTime updatedAt,
    required BillCountCashier cashier,
    required double beginningBalance,
    required bool showBeginningBalance,
    required double totalCash,
    required double totalExpenses,
    required double netCash,
    required List<BillItem> bills,
    required Map<BillType, int> billsByType,
    required double billsTotal,
    required double summaryStep1,
    required double summaryFinal,

    /// Whether this bill count has been synced to server.
    @Default(true) bool isSynced,

    /// Local ID for tracking before server sync.
    String? localId,
  }) = _BillCount;

  /// Format beginning balance for display.
  String get beginningBalanceDisplay =>
      '₱${beginningBalance.toStringAsFixed(2)}';

  /// Format total cash for display.
  String get totalCashDisplay => '₱${totalCash.toStringAsFixed(2)}';

  /// Format total expenses for display.
  String get totalExpensesDisplay => '₱${totalExpenses.toStringAsFixed(2)}';

  /// Format net cash for display.
  String get netCashDisplay => '₱${netCash.toStringAsFixed(2)}';

  /// Format bills total for display.
  String get billsTotalDisplay => '₱${billsTotal.toStringAsFixed(2)}';

  /// Format summary step 1 for display.
  String get summaryStep1Display => '₱${summaryStep1.toStringAsFixed(2)}';

  /// Format summary final for display.
  String get summaryFinalDisplay => '₱${summaryFinal.toStringAsFixed(2)}';

  /// Get the amount for a specific bill type.
  int getAmountForType(BillType type) => billsByType[type] ?? 0;

  /// Whether this bill count has any bills.
  bool get hasBills => bills.isNotEmpty;

  /// Calculate the difference between net cash and bills total.
  double get difference => summaryFinal - netCash;

  /// Format difference for display.
  String get differenceDisplay {
    final diff = difference;
    final sign = diff >= 0 ? '+' : '';
    return '$sign₱${diff.toStringAsFixed(2)}';
  }
}

/// Input model for creating/updating bill items.
class BillItemInput {
  final BillType type;
  final int amount;

  const BillItemInput({
    required this.type,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {
        'type': type.apiValue,
        'amount': amount,
      };
}
