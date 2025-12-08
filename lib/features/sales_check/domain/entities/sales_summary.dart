import 'package:freezed_annotation/freezed_annotation.dart';

import 'grouped_sale.dart';

part 'sales_summary.freezed.dart';

/// Summary of total sales for a period.
@freezed
class SalesSummary with _$SalesSummary {
  const SalesSummary._();

  const factory SalesSummary({
    /// Total quantity sold
    required double totalQuantity,

    /// Total sales amount
    required double totalAmount,

    /// Payment method breakdown
    required PaymentTotals paymentTotals,

    /// Number of transactions
    required int transactionCount,

    /// Start date of the summary period
    DateTime? startDate,

    /// End date of the summary period
    DateTime? endDate,
  }) = _SalesSummary;

  /// Create an empty summary
  factory SalesSummary.empty() => const SalesSummary(
        totalQuantity: 0,
        totalAmount: 0,
        paymentTotals: PaymentTotals(cash: 0, check: 0, bankTransfer: 0),
        transactionCount: 0,
      );

  /// Average transaction amount
  double get averageTransaction {
    if (transactionCount == 0) return 0;
    return totalAmount / transactionCount;
  }
}
