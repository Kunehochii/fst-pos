import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../product/domain/entities/product.dart';

part 'delivery_cart_item.freezed.dart';

/// Represents the type of pricing for a delivery cart item.
enum DeliveryPriceType {
  /// Per kilo pricing.
  perKilo,

  /// Sack pricing (50kg, 25kg, 5kg).
  sack;

  String get displayName {
    switch (this) {
      case DeliveryPriceType.perKilo:
        return 'Per Kilo';
      case DeliveryPriceType.sack:
        return 'Sack';
    }
  }
}

/// Represents an item in the delivery cart.
///
/// Each cart item has a unique [cartItemId] to allow multiple entries
/// of the same product with different configurations.
@freezed
class DeliveryCartItem with _$DeliveryCartItem {
  const DeliveryCartItem._();

  const factory DeliveryCartItem({
    /// Unique identifier for this cart entry (not the product ID).
    /// Allows same product with different variants as separate items.
    required String cartItemId,

    /// The product being delivered.
    required Product product,

    /// The type of pricing (per kilo or sack).
    required DeliveryPriceType priceType,

    /// Sack type if applicable (50kg, 25kg, 5kg).
    SackType? sackType,

    /// The quantity being delivered.
    /// For per kilo: weight in kg (e.g., 2.5)
    /// For sack: number of sacks (e.g., 3)
    required double quantity,

    /// The sack price ID if sack type.
    String? sackPriceId,

    /// The per kilo price ID if per kilo type.
    String? perKiloPriceId,
  }) = _DeliveryCartItem;

  /// Generate a unique cart item ID.
  static String generateId() => const Uuid().v4();

  /// Get variant display name.
  String get variantDisplayName {
    switch (priceType) {
      case DeliveryPriceType.perKilo:
        return 'Per Kilo';
      case DeliveryPriceType.sack:
        return sackType?.displayName ?? 'Sack';
    }
  }

  /// Get quantity display with unit.
  String get quantityDisplay {
    switch (priceType) {
      case DeliveryPriceType.perKilo:
        // Format quantity nicely
        if (quantity == quantity.roundToDouble()) {
          return '${quantity.toInt()} kg';
        }
        return '${quantity.toStringAsFixed(2)} kg';
      case DeliveryPriceType.sack:
        if (quantity == quantity.roundToDouble()) {
          return '${quantity.toInt()} ${quantity == 1 ? 'sack' : 'sacks'}';
        }
        return '${quantity.toStringAsFixed(2)} sacks';
    }
  }
}
