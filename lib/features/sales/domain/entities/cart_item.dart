import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../product/domain/entities/product.dart';

part 'cart_item.freezed.dart';

/// Represents the type of pricing for a cart item.
enum CartPriceType {
  /// Per kilo pricing.
  perKilo,

  /// Sack pricing (50kg, 25kg, 5kg).
  sack;

  String get displayName {
    switch (this) {
      case CartPriceType.perKilo:
        return 'Per Kilo';
      case CartPriceType.sack:
        return 'Sack';
    }
  }
}

/// Represents an item in the shopping cart.
///
/// Each cart item has a unique [cartItemId] to allow multiple entries
/// of the same product with different configurations.
@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    /// Unique identifier for this cart entry (not the product ID).
    /// Allows same product with different variants as separate items.
    required String cartItemId,

    /// The product being purchased.
    required Product product,

    /// The type of pricing (per kilo or sack).
    required CartPriceType priceType,

    /// Sack type if applicable (50kg, 25kg, 5kg).
    SackType? sackType,

    /// The quantity being purchased.
    /// For per kilo: weight in kg (e.g., 2.5)
    /// For sack: number of sacks (e.g., 3)
    required double quantity,

    /// The unit price for this item.
    /// For per kilo: price per kg
    /// For sack: price per sack
    required double unitPrice,

    /// Optional discounted price per unit.
    double? discountedPrice,

    /// Whether this item is discounted.
    @Default(false) bool isDiscounted,

    /// Whether gantang pricing is applied (per kilo only).
    /// Multiplies the price by 2.25.
    @Default(false) bool isGantang,

    /// The sack price ID if sack type.
    String? sackPriceId,

    /// The per kilo price ID if per kilo type.
    String? perKiloPriceId,
  }) = _CartItem;

  /// Generate a unique cart item ID.
  static String generateId() => const Uuid().v4();

  /// Calculate the total price for this cart item.
  double get totalPrice {
    final effectivePrice =
        isDiscounted && discountedPrice != null ? discountedPrice! : unitPrice;

    // For gantang, the unit price is already multiplied by 2.25
    // So we just multiply by quantity
    return (effectivePrice * quantity).ceilToDouble();
  }

  /// Get the effective unit price (considering gantang).
  double get effectiveUnitPrice {
    if (isGantang) {
      return (unitPrice * 2.25).ceilToDouble();
    }
    return unitPrice;
  }

  /// Get the display price (discounted or regular).
  double get displayUnitPrice {
    if (isDiscounted && discountedPrice != null) {
      return discountedPrice!;
    }
    return effectiveUnitPrice;
  }

  /// Get variant display name.
  String get variantDisplayName {
    switch (priceType) {
      case CartPriceType.perKilo:
        if (isGantang) {
          return 'Per Kilo (Gantang)';
        }
        return 'Per Kilo';
      case CartPriceType.sack:
        return sackType?.displayName ?? 'Sack';
    }
  }

  /// Get quantity display with unit.
  String get quantityDisplay {
    switch (priceType) {
      case CartPriceType.perKilo:
        // Format quantity nicely
        if (quantity == quantity.roundToDouble()) {
          return '${quantity.toInt()} kg';
        }
        return '${quantity.toStringAsFixed(2)} kg';
      case CartPriceType.sack:
        if (quantity == quantity.roundToDouble()) {
          return '${quantity.toInt()} ${quantity == 1 ? 'sack' : 'sacks'}';
        }
        return '${quantity.toStringAsFixed(2)} sacks';
    }
  }

  /// Check if there's enough stock for this item.
  bool hasEnoughStock() {
    switch (priceType) {
      case CartPriceType.perKilo:
        final perKiloPrice = product.perKiloPrice;
        if (perKiloPrice == null) return false;
        return perKiloPrice.stock >= quantity;
      case CartPriceType.sack:
        final sackPrice = product.sackPrices.firstWhere(
          (sp) => sp.type == sackType,
          orElse: () => throw StateError('Sack type not found'),
        );
        return sackPrice.stock >= quantity;
    }
  }

  /// Get available stock for this variant.
  double get availableStock {
    switch (priceType) {
      case CartPriceType.perKilo:
        return product.perKiloPrice?.stock ?? 0;
      case CartPriceType.sack:
        final sackPrice = product.sackPrices.firstWhere(
          (sp) => sp.type == sackType,
          orElse: () => throw StateError('Sack type not found'),
        );
        return sackPrice.stock;
    }
  }
}
