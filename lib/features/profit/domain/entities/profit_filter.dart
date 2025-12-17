import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';
import '../../../sales_check/domain/entities/sales_check_filter.dart';

part 'profit_filter.freezed.dart';

/// Filter options for profit queries.
@freezed
class ProfitFilter with _$ProfitFilter {
  const ProfitFilter._();

  const factory ProfitFilter({
    /// Start date for filtering (UTC)
    DateTime? startDate,

    /// End date for filtering (UTC)
    DateTime? endDate,

    /// Filter by specific product ID
    String? productId,

    /// Search products by name
    String? productSearch,

    /// Filter by product category
    ProductCategory? category,

    /// Filter by price type (SACK or KILO)
    PriceTypeFilter? priceType,

    /// Filter by sack type
    SackType? sackType,
  }) = _ProfitFilter;

  /// Check if any filter is applied
  bool get hasFilters =>
      startDate != null ||
      endDate != null ||
      productId != null ||
      productSearch != null ||
      category != null ||
      priceType != null ||
      sackType != null;

  /// Create filter for today's profits
  factory ProfitFilter.today() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay
        .add(const Duration(days: 1))
        .subtract(const Duration(milliseconds: 1));

    return ProfitFilter(
      startDate: startOfDay.toUtc(),
      endDate: endOfDay.toUtc(),
    );
  }

  /// Convert to query parameters for API request
  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};

    if (startDate != null) {
      params['startDate'] = startDate!.toUtc().toIso8601String();
    }
    if (endDate != null) {
      params['endDate'] = endDate!.toUtc().toIso8601String();
    }
    if (productId != null) {
      params['productId'] = productId;
    }
    if (productSearch != null && productSearch!.isNotEmpty) {
      params['productSearch'] = productSearch;
    }
    if (category != null) {
      params['category'] = category!.toApiString();
    }
    if (priceType != null) {
      params['priceType'] = priceType!.toApiString();
    }
    if (sackType != null) {
      params['sackType'] = sackType!.toApiString();
    }

    return params;
  }
}
