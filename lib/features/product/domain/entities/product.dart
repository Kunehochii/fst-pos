import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

/// Product category types matching the backend enum.
enum ProductCategory {
  normal,
  asin,
  plastic;

  /// Convert from API string to enum.
  static ProductCategory fromString(String value) {
    switch (value.toUpperCase()) {
      case 'ASIN':
        return ProductCategory.asin;
      case 'PLASTIC':
        return ProductCategory.plastic;
      default:
        return ProductCategory.normal;
    }
  }

  /// Convert to API string format.
  String toApiString() => name.toUpperCase();
}

/// Sack type for product pricing.
enum SackType {
  fiftyKg,
  twentyFiveKg,
  fiveKg;

  /// Convert from API string to enum.
  static SackType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'TWENTY_FIVE_KG':
        return SackType.twentyFiveKg;
      case 'FIVE_KG':
        return SackType.fiveKg;
      default:
        return SackType.fiftyKg;
    }
  }

  /// Convert to API string format.
  String toApiString() {
    switch (this) {
      case SackType.fiftyKg:
        return 'FIFTY_KG';
      case SackType.twentyFiveKg:
        return 'TWENTY_FIVE_KG';
      case SackType.fiveKg:
        return 'FIVE_KG';
    }
  }

  /// Get display name.
  String get displayName {
    switch (this) {
      case SackType.fiftyKg:
        return '50 KG';
      case SackType.twentyFiveKg:
        return '25 KG';
      case SackType.fiveKg:
        return '5 KG';
    }
  }
}

/// Special price entity for bulk discounts.
@freezed
class SpecialPrice with _$SpecialPrice {
  const factory SpecialPrice({
    required String id,
    required double price,
    required double minimumQty,
    double? profit,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SpecialPrice;
}

/// Sack price entity for product pricing by sack size.
@freezed
class SackPrice with _$SackPrice {
  const factory SackPrice({
    required String id,
    required double price,
    required double stock,
    required SackType type,
    double? profit,
    SpecialPrice? specialPrice,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SackPrice;
}

/// Per kilo price entity.
@freezed
class PerKiloPrice with _$PerKiloPrice {
  const factory PerKiloPrice({
    required String id,
    required double price,
    required double stock,
    double? profit,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PerKiloPrice;
}

/// Cashier info embedded in product (lightweight).
@freezed
class ProductCashier with _$ProductCashier {
  const factory ProductCashier({
    required String id,
    required String username,
    required String branchName,
    required String businessId,
  }) = _ProductCashier;
}

/// Main product entity.
///
/// Represents a product in the POS system with all pricing information.
@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required String id,
    required String name,
    required String picture,
    required ProductCategory category,
    required String cashierId,
    required List<SackPrice> sackPrices,
    PerKiloPrice? perKiloPrice,
    ProductCashier? cashier,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Product;

  /// Get the lowest price available for this product.
  double? get lowestPrice {
    final prices = <double>[];

    for (final sackPrice in sackPrices) {
      prices.add(sackPrice.price);
      if (sackPrice.specialPrice != null) {
        prices.add(sackPrice.specialPrice!.price);
      }
    }

    if (perKiloPrice != null) {
      prices.add(perKiloPrice!.price);
    }

    if (prices.isEmpty) return null;
    return prices.reduce((a, b) => a < b ? a : b);
  }

  /// Get total stock across all pricing options.
  double get totalStock {
    double total = 0;

    for (final sackPrice in sackPrices) {
      total += sackPrice.stock;
    }

    if (perKiloPrice != null) {
      total += perKiloPrice!.stock;
    }

    return total;
  }

  /// Check if product has stock.
  bool get hasStock => totalStock > 0;
}

/// Filter parameters for product queries.
@freezed
class ProductFilter with _$ProductFilter {
  const factory ProductFilter({
    ProductCategory? category,
    String? searchQuery,
  }) = _ProductFilter;
}
