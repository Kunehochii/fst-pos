import 'package:freezed_annotation/freezed_annotation.dart';

import 'grouped_profit.dart';

part 'profit_summary.freezed.dart';

/// Summary of total profits for a period.
@freezed
class ProfitSummary with _$ProfitSummary {
  const ProfitSummary._();

  const factory ProfitSummary({
    /// Total quantity sold
    required double totalQuantity,

    /// Total profit amount
    required double totalProfit,

    /// Payment method breakdown
    required ProfitPaymentTotals paymentTotals,

    /// Number of transactions
    required int transactionCount,

    /// Start date of the summary period
    DateTime? startDate,

    /// End date of the summary period
    DateTime? endDate,
  }) = _ProfitSummary;

  /// Create an empty summary
  factory ProfitSummary.empty() => const ProfitSummary(
        totalQuantity: 0,
        totalProfit: 0,
        paymentTotals: ProfitPaymentTotals(cash: 0, check: 0, bankTransfer: 0),
        transactionCount: 0,
      );

  /// Average profit per transaction
  double get averageProfit {
    if (transactionCount == 0) return 0;
    return totalProfit / transactionCount;
  }
}
