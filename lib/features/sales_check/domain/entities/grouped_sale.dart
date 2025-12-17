import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../sales/domain/entities/payment_method.dart';

part 'grouped_sale.freezed.dart';

/// Represents a single sale item within a group.
@freezed
class GroupedSaleItem with _$GroupedSaleItem {
  const GroupedSaleItem._();

  const factory GroupedSaleItem({
    required double quantity,
    required double unitPrice,
    required double totalAmount,
    required PaymentMethod paymentMethod,
    required bool isSpecialPrice,
    required bool isDiscounted,
    double? discountedPrice,
    required DateTime saleDate,
    required String formattedSale,
  }) = _GroupedSaleItem;

  /// Get effective price display
  String get priceDisplay {
    if (isDiscounted && discountedPrice != null) {
      return '₱${discountedPrice!.toStringAsFixed(2)} (discounted)';
    }
    return '₱${unitPrice.toStringAsFixed(2)}';
  }
}

/// Payment totals breakdown by method.
@freezed
class PaymentTotals with _$PaymentTotals {
  const PaymentTotals._();

  const factory PaymentTotals({
    required double cash,
    required double check,
    required double bankTransfer,
  }) = _PaymentTotals;

  double get total => cash + check + bankTransfer;

  bool get hasCash => cash > 0;
  bool get hasCheck => check > 0;
  bool get hasBankTransfer => bankTransfer > 0;
}

/// Represents a group of sales for a specific product/variant combination.
@freezed
class GroupedSale with _$GroupedSale {
  const GroupedSale._();

  const factory GroupedSale({
    /// Display name for the group (e.g., "Rice 50 KG")
    required String productName,

    /// Individual sale items in this group
    required List<GroupedSaleItem> items,

    /// Total quantity sold
    required double totalQuantity,

    /// Total amount for this group
    required double totalAmount,

    /// Payment method breakdown
    required PaymentTotals paymentTotals,
  }) = _GroupedSale;

  /// Number of transactions in this group
  int get transactionCount => items.length;
}

/// Display view types for the sales check
enum SalesCheckViewType {
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
      case SalesCheckViewType.chronological:
        return 'Chronological';
      case SalesCheckViewType.normalGrouped:
        return 'By Product';
      case SalesCheckViewType.asin:
        return 'Asin';
      case SalesCheckViewType.plastic:
        return 'Plastic';
    }
  }

  String get description {
    switch (this) {
      case SalesCheckViewType.chronological:
        return 'All normal products in chronological order';
      case SalesCheckViewType.normalGrouped:
        return 'Normal products grouped by name and variant';
      case SalesCheckViewType.asin:
        return 'Asin category products';
      case SalesCheckViewType.plastic:
        return 'Plastic category products';
    }
  }
}
