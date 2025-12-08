import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../sales/domain/entities/payment_method.dart';

part 'grouped_profit.freezed.dart';

/// Represents a single profit item within a group.
@freezed
class GroupedProfitItem with _$GroupedProfitItem {
  const GroupedProfitItem._();

  const factory GroupedProfitItem({
    required double quantity,
    required double profitPerUnit,
    required double totalProfit,
    required PaymentMethod paymentMethod,
    required bool isSpecialPrice,
    required DateTime saleDate,
    required String formattedProfit,
  }) = _GroupedProfitItem;

  /// Format profit display
  String get profitDisplay => '₱${totalProfit.toStringAsFixed(2)}';
}

/// Payment totals breakdown by method for profit.
@freezed
class ProfitPaymentTotals with _$ProfitPaymentTotals {
  const ProfitPaymentTotals._();

  const factory ProfitPaymentTotals({
    required double cash,
    required double check,
    required double bankTransfer,
  }) = _ProfitPaymentTotals;

  double get total => cash + check + bankTransfer;

  bool get hasCash => cash > 0;
  bool get hasCheck => check > 0;
  bool get hasBankTransfer => bankTransfer > 0;
}

/// Represents a group of profits for a specific product/variant combination.
@freezed
class GroupedProfit with _$GroupedProfit {
  const GroupedProfit._();

  const factory GroupedProfit({
    /// Display name for the group (e.g., "Rice 50 KG")
    required String productName,

    /// Price type display (e.g., "50 KG", "Per Kilo")
    required String priceType,

    /// Profit per unit for this group
    required double profitPerUnit,

    /// Total quantity sold
    required double totalQuantity,

    /// Total profit for this group
    required double totalProfit,

    /// Number of orders/transactions
    required int orderCount,
  }) = _GroupedProfit;

  /// Number of transactions in this group
  int get transactionCount => orderCount;

  /// Get display name combining product and price type
  String get displayName => '$productName $priceType'.trim();
}

/// Display view types for the profit check
enum ProfitViewType {
  /// Chronological list of NORMAL category products
  chronological,

  /// Grouped by product name under NORMAL category
  normalGrouped,

  /// ASIN category products
  asin,

  /// PLASTIC category products
  plastic;

  String get displayName {
    switch (this) {
      case ProfitViewType.chronological:
        return 'Chronological';
      case ProfitViewType.normalGrouped:
        return 'By Product';
      case ProfitViewType.asin:
        return 'Asin';
      case ProfitViewType.plastic:
        return 'Plastic';
    }
  }

  String get description {
    switch (this) {
      case ProfitViewType.chronological:
        return 'All Normal category profits in order';
      case ProfitViewType.normalGrouped:
        return 'Normal category profits grouped by product';
      case ProfitViewType.asin:
        return 'Asin category profits';
      case ProfitViewType.plastic:
        return 'Plastic category profits';
    }
  }
}
