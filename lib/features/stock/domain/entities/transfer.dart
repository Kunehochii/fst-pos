import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';

part 'transfer.freezed.dart';

/// Transfer types matching the backend enum.
enum TransferType {
  kahon,
  butas,
  salesMaid,
  manualAdjust;

  /// Convert from API string to enum.
  static TransferType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'KAHON':
        return TransferType.kahon;
      case 'BUTAS':
        return TransferType.butas;
      case 'SALES_MAID':
        return TransferType.salesMaid;
      case 'MANUAL_ADJUST':
        return TransferType.manualAdjust;
      default:
        return TransferType.kahon;
    }
  }

  /// Convert to API string format.
  String toApiString() {
    switch (this) {
      case TransferType.kahon:
        return 'KAHON';
      case TransferType.butas:
        return 'BUTAS';
      case TransferType.salesMaid:
        return 'SALES_MAID';
      case TransferType.manualAdjust:
        return 'MANUAL_ADJUST';
    }
  }

  /// Get display name.
  String get displayName {
    switch (this) {
      case TransferType.kahon:
        return 'Kahon';
      case TransferType.butas:
        return 'Butas';
      case TransferType.salesMaid:
        return 'Sales Maid';
      case TransferType.manualAdjust:
        return 'Manual Adjust';
    }
  }

  /// Get description.
  String get description {
    switch (this) {
      case TransferType.kahon:
        return 'Transfer to kahon (box storage)';
      case TransferType.butas:
        return 'Damaged/spoiled items';
      case TransferType.salesMaid:
        return 'Items given to sales maid';
      case TransferType.manualAdjust:
        return 'Manual stock adjustment';
    }
  }
}

/// Transfer cashier info (lightweight).
@freezed
class TransferCashier with _$TransferCashier {
  const factory TransferCashier({
    required String id,
    required String username,
    required String branchName,
  }) = _TransferCashier;
}

/// Main transfer entity representing stock movement.
///
/// Transfers are OUTGOING stock - products being moved out of inventory.
@freezed
class Transfer with _$Transfer {
  const Transfer._();

  const factory Transfer({
    required String id,
    required double quantity,
    required TransferType type,
    SackType? sackType,
    required String productId,
    String? sackPriceId,
    String? perKiloPriceId,
    required String cashierId,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Nested entities
    Product? product,
    SackPrice? sackPrice,
    PerKiloPrice? perKiloPrice,
    TransferCashier? cashier,
  }) = _Transfer;

  /// Check if this is a sack price transfer.
  bool get isSackPrice => sackPriceId != null;

  /// Check if this is a per kilo price transfer.
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

/// DTO for creating a transfer with sack price.
@freezed
class CreateTransferSackDto with _$CreateTransferSackDto {
  const factory CreateTransferSackDto({
    required String productId,
    required String sackPriceId,
    required SackType sackType,
    required double quantity,
    required TransferType transferType,
  }) = _CreateTransferSackDto;
}

/// DTO for creating a transfer with per kilo price.
@freezed
class CreateTransferPerKiloDto with _$CreateTransferPerKiloDto {
  const factory CreateTransferPerKiloDto({
    required String productId,
    required String perKiloPriceId,
    required double quantity,
    required TransferType transferType,
  }) = _CreateTransferPerKiloDto;
}

/// DTO for updating a transfer.
@freezed
class UpdateTransferDto with _$UpdateTransferDto {
  const factory UpdateTransferDto({
    double? quantity,
    TransferType? transferType,
    SackType? sackType,
  }) = _UpdateTransferDto;
}

/// Filter parameters for transfer queries.
@freezed
class TransferFilter with _$TransferFilter {
  const factory TransferFilter({
    DateTime? startDate,
    DateTime? endDate,
    TransferType? type,
  }) = _TransferFilter;
}
