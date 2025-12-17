import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';

part 'delivery.freezed.dart';

/// Cashier info embedded in delivery (lightweight).
@freezed
class DeliveryCashier with _$DeliveryCashier {
  const factory DeliveryCashier({
    required String id,
    required String username,
    required String branchName,
  }) = _DeliveryCashier;
}

/// Delivery item entity representing a single item in a delivery.
@freezed
class DeliveryItem with _$DeliveryItem {
  const DeliveryItem._();

  const factory DeliveryItem({
    required String id,
    required double quantity,
    required String productId,
    String? sackPriceId,
    SackType? sackType,
    String? perKiloPriceId,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Nested entities
    Product? product,
    SackPrice? sackPrice,
    PerKiloPrice? perKiloPrice,
  }) = _DeliveryItem;

  /// Check if this is a sack price delivery item.
  bool get isSackPrice => sackPriceId != null;

  /// Check if this is a per kilo price delivery item.
  bool get isPerKiloPrice => perKiloPriceId != null;

  /// Get display name for the price type.
  String get priceTypeDisplay {
    if (isSackPrice && sackType != null) {
      return sackType!.displayName;
    }
    if (isPerKiloPrice) {
      return 'Per Kilo';
    }
    return 'Unknown';
  }
}

/// Main delivery entity representing stock replenishment.
///
/// Deliveries are INCOMING stock - products being received from suppliers.
@freezed
class Delivery with _$Delivery {
  const Delivery._();

  const factory Delivery({
    required String id,
    required String driverName,
    required DateTime deliveryTimeStart,
    required String cashierId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<DeliveryItem> deliveryItems,
    DeliveryCashier? cashier,
  }) = _Delivery;

  /// Get total items count in this delivery.
  int get totalItems => deliveryItems.length;

  /// Get total quantity across all items.
  double get totalQuantity {
    return deliveryItems.fold(0, (sum, item) => sum + item.quantity);
  }
}

/// DTO for creating a delivery item.
@freezed
class CreateDeliveryItemDto with _$CreateDeliveryItemDto {
  const factory CreateDeliveryItemDto({
    required String productId,
    SackPriceDto? sackPrice,
    PerKiloPriceDto? perKiloPrice,
  }) = _CreateDeliveryItemDto;
}

/// DTO for sack price in delivery item creation.
@freezed
class SackPriceDto with _$SackPriceDto {
  const factory SackPriceDto({
    required String id,
    required double quantity,
    required SackType type,
  }) = _SackPriceDto;
}

/// DTO for per kilo price in delivery item creation.
@freezed
class PerKiloPriceDto with _$PerKiloPriceDto {
  const factory PerKiloPriceDto({
    required String id,
    required double quantity,
  }) = _PerKiloPriceDto;
}

/// DTO for creating a new delivery.
@freezed
class CreateDeliveryDto with _$CreateDeliveryDto {
  const factory CreateDeliveryDto({
    required String driverName,
    required DateTime deliveryTimeStart,
    required List<CreateDeliveryItemDto> deliveryItems,
  }) = _CreateDeliveryDto;
}

/// DTO for updating an existing delivery.
@freezed
class UpdateDeliveryDto with _$UpdateDeliveryDto {
  const factory UpdateDeliveryDto({
    String? driverName,
    DateTime? deliveryTimeStart,
    List<CreateDeliveryItemDto>? deliveryItems,
  }) = _UpdateDeliveryDto;
}

/// Filter parameters for delivery queries.
@freezed
class DeliveryFilter with _$DeliveryFilter {
  const factory DeliveryFilter({
    DateTime? startDate,
    DateTime? endDate,
    String? productId,
    String? productSearch,
  }) = _DeliveryFilter;
}
