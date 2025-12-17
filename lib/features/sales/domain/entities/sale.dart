import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';
import 'payment_method.dart';

part 'sale.freezed.dart';

/// Represents a sale item with quantity and pricing.
@freezed
class SaleItem with _$SaleItem {
  const SaleItem._();

  const factory SaleItem({
    required String id,
    required double quantity,
    required double price,
    double? discountedPrice,
    @Default(false) bool isDiscounted,
    @Default(false) bool isGantang,
    @Default(false) bool isSpecialPrice,
    required String productId,
    String? sackPriceId,
    SackType? sackType,
    String? perKiloPriceId,
    required DateTime createdAt,
    required DateTime updatedAt,

    /// The product details (optional, for display purposes).
    Product? product,

    /// Sack price details (optional, for display).
    SackPrice? sackPrice,

    /// Per kilo price details (optional, for display).
    PerKiloPrice? perKiloPrice,
  }) = _SaleItem;

  /// Calculate total price for this item.
  double get totalPrice {
    final effectivePrice =
        isDiscounted && discountedPrice != null ? discountedPrice! : price;
    return (effectivePrice * quantity).ceilToDouble();
  }

  /// Get variant display name.
  String get variantDisplayName {
    if (perKiloPriceId != null) {
      return isGantang ? 'Per Kilo (Gantang)' : 'Per Kilo';
    }
    if (sackType != null) {
      return sackType!.displayName;
    }
    return 'Unknown';
  }

  /// Get quantity display with unit.
  String get quantityDisplay {
    if (perKiloPriceId != null) {
      if (quantity == quantity.roundToDouble()) {
        return '${quantity.toInt()} kg';
      }
      return '${quantity.toStringAsFixed(2)} kg';
    }
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} ${quantity == 1 ? 'sack' : 'sacks'}';
    }
    return '${quantity.toStringAsFixed(2)} sacks';
  }
}

/// Represents a complete sale transaction.
@freezed
class Sale with _$Sale {
  const Sale._();

  const factory Sale({
    required String id,
    required double totalAmount,
    required PaymentMethod paymentMethod,
    @Default(false) bool isVoid,
    DateTime? voidedAt,
    required String cashierId,
    String? orderId,
    required List<SaleItem> saleItems,
    required DateTime createdAt,
    required DateTime updatedAt,

    /// Whether this sale has been synced to the server.
    @Default(false) bool isSynced,

    /// Local-only ID for sync tracking before server assignment.
    String? localId,

    /// Metadata for frontend use (e.g., cash tendered, change).
    Map<String, dynamic>? metadata,
  }) = _Sale;

  /// Get the total number of items.
  int get totalItems => saleItems.length;

  /// Get cash tendered from metadata.
  double? get cashTendered {
    if (metadata != null && metadata!['cashTendered'] != null) {
      return (metadata!['cashTendered'] as num).toDouble();
    }
    return null;
  }

  /// Get change from metadata.
  double? get change {
    if (cashTendered != null) {
      return cashTendered! - totalAmount;
    }
    return null;
  }
}

/// Summary of a sale for list views.
@freezed
class SaleSummary with _$SaleSummary {
  const factory SaleSummary({
    required String id,
    required double totalAmount,
    required PaymentMethod paymentMethod,
    required int itemCount,
    required DateTime createdAt,
    @Default(false) bool isVoid,
    DateTime? voidedAt,
    @Default(false) bool isSynced,
  }) = _SaleSummary;
}
