import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';

part 'sales_check_filter.freezed.dart';

/// Filter options for sales check queries.
@freezed
class SalesCheckFilter with _$SalesCheckFilter {
  const SalesCheckFilter._();

  const factory SalesCheckFilter({
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

    /// Filter by discounted items only
    bool? isDiscounted,
  }) = _SalesCheckFilter;

  /// Check if any filter is applied
  bool get hasFilters =>
      startDate != null ||
      endDate != null ||
      productId != null ||
      productSearch != null ||
      category != null ||
      priceType != null ||
      sackType != null ||
      isDiscounted != null;

  /// Create filter for today's sales
  factory SalesCheckFilter.today() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay
        .add(const Duration(days: 1))
        .subtract(const Duration(milliseconds: 1));

    return SalesCheckFilter(
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
    if (isDiscounted != null) {
      params['isDiscounted'] = isDiscounted.toString();
    }

    return params;
  }
}

/// Price type filter options
enum PriceTypeFilter {
  sack,
  kilo;

  String toApiString() {
    switch (this) {
      case PriceTypeFilter.sack:
        return 'SACK';
      case PriceTypeFilter.kilo:
        return 'KILO';
    }
  }

  static PriceTypeFilter? fromString(String? value) {
    if (value == null) return null;
    switch (value.toUpperCase()) {
      case 'SACK':
        return PriceTypeFilter.sack;
      case 'KILO':
        return PriceTypeFilter.kilo;
      default:
        return null;
    }
  }

  String get displayName {
    switch (this) {
      case PriceTypeFilter.sack:
        return 'Sack';
      case PriceTypeFilter.kilo:
        return 'Per Kilo';
    }
  }
}
