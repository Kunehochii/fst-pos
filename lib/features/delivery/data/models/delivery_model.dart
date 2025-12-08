import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/data/models/product_model.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/delivery.dart';

part 'delivery_model.freezed.dart';
part 'delivery_model.g.dart';

/// Cashier model embedded in delivery response.
@freezed
class DeliveryCashierModel with _$DeliveryCashierModel {
  const DeliveryCashierModel._();

  const factory DeliveryCashierModel({
    required String id,
    required String username,
    @JsonKey(name: 'branchName') required String branchName,
  }) = _DeliveryCashierModel;

  factory DeliveryCashierModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCashierModelFromJson(json);

  /// Convert to domain entity.
  DeliveryCashier toEntity() => DeliveryCashier(
        id: id,
        username: username,
        branchName: branchName,
      );

  /// Create from domain entity.
  factory DeliveryCashierModel.fromEntity(DeliveryCashier entity) =>
      DeliveryCashierModel(
        id: entity.id,
        username: entity.username,
        branchName: entity.branchName,
      );
}

/// Delivery item model for API serialization.
@freezed
class DeliveryItemModel with _$DeliveryItemModel {
  const DeliveryItemModel._();

  const factory DeliveryItemModel({
    required String id,
    required String quantity,
    @JsonKey(name: 'productId') required String productId,
    @JsonKey(name: 'sackPriceId') String? sackPriceId,
    @JsonKey(name: 'sackType') String? sackType,
    @JsonKey(name: 'perKiloPriceId') String? perKiloPriceId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    ProductModel? product,
    SackPriceModel? sackPrice,
    PerKiloPriceModel? perKiloPrice,
  }) = _DeliveryItemModel;

  factory DeliveryItemModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryItemModelFromJson(json);

  /// Convert to domain entity.
  DeliveryItem toEntity() => DeliveryItem(
        id: id,
        quantity: double.parse(quantity),
        productId: productId,
        sackPriceId: sackPriceId,
        sackType: sackType != null ? SackType.fromString(sackType!) : null,
        perKiloPriceId: perKiloPriceId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        product: product?.toEntity(),
        sackPrice: sackPrice?.toEntity(),
        perKiloPrice: perKiloPrice?.toEntity(),
      );

  /// Create from domain entity.
  factory DeliveryItemModel.fromEntity(DeliveryItem entity) =>
      DeliveryItemModel(
        id: entity.id,
        quantity: entity.quantity.toString(),
        productId: entity.productId,
        sackPriceId: entity.sackPriceId,
        sackType: entity.sackType?.toApiString(),
        perKiloPriceId: entity.perKiloPriceId,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        product: entity.product != null
            ? ProductModel.fromEntity(entity.product!)
            : null,
        sackPrice: entity.sackPrice != null
            ? SackPriceModel.fromEntity(entity.sackPrice!)
            : null,
        perKiloPrice: entity.perKiloPrice != null
            ? PerKiloPriceModel.fromEntity(entity.perKiloPrice!)
            : null,
      );
}

/// Main delivery model for API serialization.
@freezed
class DeliveryModel with _$DeliveryModel {
  const DeliveryModel._();

  const factory DeliveryModel({
    required String id,
    @JsonKey(name: 'driverName') required String driverName,
    @JsonKey(name: 'deliveryTimeStart') required DateTime deliveryTimeStart,
    @JsonKey(name: 'cashierId') required String cashierId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @Default([])
    @JsonKey(name: 'deliveryItems')
    List<DeliveryItemModel> deliveryItems,
    DeliveryCashierModel? cashier,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);

  /// Convert to domain entity.
  Delivery toEntity() => Delivery(
        id: id,
        driverName: driverName,
        deliveryTimeStart: deliveryTimeStart,
        cashierId: cashierId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deliveryItems: deliveryItems.map((item) => item.toEntity()).toList(),
        cashier: cashier?.toEntity(),
      );

  /// Create from domain entity.
  factory DeliveryModel.fromEntity(Delivery entity) => DeliveryModel(
        id: entity.id,
        driverName: entity.driverName,
        deliveryTimeStart: entity.deliveryTimeStart,
        cashierId: entity.cashierId,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        deliveryItems: entity.deliveryItems
            .map((item) => DeliveryItemModel.fromEntity(item))
            .toList(),
        cashier: entity.cashier != null
            ? DeliveryCashierModel.fromEntity(entity.cashier!)
            : null,
      );
}

/// Model for creating a delivery item (request body).
@freezed
class CreateDeliveryItemModel with _$CreateDeliveryItemModel {
  const CreateDeliveryItemModel._();

  const factory CreateDeliveryItemModel({
    required String productId,
    SackPriceDtoModel? sackPrice,
    PerKiloPriceDtoModel? perKiloPrice,
  }) = _CreateDeliveryItemModel;

  factory CreateDeliveryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryItemModelFromJson(json);

  /// Create from domain DTO.
  factory CreateDeliveryItemModel.fromDto(CreateDeliveryItemDto dto) =>
      CreateDeliveryItemModel(
        productId: dto.productId,
        sackPrice: dto.sackPrice != null
            ? SackPriceDtoModel.fromDto(dto.sackPrice!)
            : null,
        perKiloPrice: dto.perKiloPrice != null
            ? PerKiloPriceDtoModel.fromDto(dto.perKiloPrice!)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        if (sackPrice != null) 'sackPrice': sackPrice!.toJson(),
        if (perKiloPrice != null) 'perKiloPrice': perKiloPrice!.toJson(),
      };
}

/// Model for sack price in delivery item creation.
@freezed
class SackPriceDtoModel with _$SackPriceDtoModel {
  const SackPriceDtoModel._();

  const factory SackPriceDtoModel({
    required String id,
    required double quantity,
    required String type,
  }) = _SackPriceDtoModel;

  factory SackPriceDtoModel.fromJson(Map<String, dynamic> json) =>
      _$SackPriceDtoModelFromJson(json);

  /// Create from domain DTO.
  factory SackPriceDtoModel.fromDto(SackPriceDto dto) => SackPriceDtoModel(
        id: dto.id,
        quantity: dto.quantity,
        type: dto.type.toApiString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'type': type,
      };
}

/// Model for per kilo price in delivery item creation.
@freezed
class PerKiloPriceDtoModel with _$PerKiloPriceDtoModel {
  const PerKiloPriceDtoModel._();

  const factory PerKiloPriceDtoModel({
    required String id,
    required double quantity,
  }) = _PerKiloPriceDtoModel;

  factory PerKiloPriceDtoModel.fromJson(Map<String, dynamic> json) =>
      _$PerKiloPriceDtoModelFromJson(json);

  /// Create from domain DTO.
  factory PerKiloPriceDtoModel.fromDto(PerKiloPriceDto dto) =>
      PerKiloPriceDtoModel(
        id: dto.id,
        quantity: dto.quantity,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
      };
}

/// Model for creating a delivery (request body).
@freezed
class CreateDeliveryModel with _$CreateDeliveryModel {
  const CreateDeliveryModel._();

  const factory CreateDeliveryModel({
    required String driverName,
    @JsonKey(name: 'deliveryTimeStart') required String deliveryTimeStart,
    @JsonKey(name: 'deliveryItems')
    required List<CreateDeliveryItemModel> deliveryItems,
  }) = _CreateDeliveryModel;

  factory CreateDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryModelFromJson(json);

  /// Create from domain DTO.
  /// Converts DateTime to ISO 8601 UTC string as required by the backend.
  factory CreateDeliveryModel.fromDto(CreateDeliveryDto dto) =>
      CreateDeliveryModel(
        driverName: dto.driverName,
        deliveryTimeStart: dto.deliveryTimeStart.toUtc().toIso8601String(),
        deliveryItems: dto.deliveryItems
            .map((item) => CreateDeliveryItemModel.fromDto(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'driverName': driverName,
        'deliveryTimeStart': deliveryTimeStart,
        'deliveryItems': deliveryItems.map((item) => item.toJson()).toList(),
      };
}

/// Model for updating a delivery (request body).
@freezed
class UpdateDeliveryModel with _$UpdateDeliveryModel {
  const UpdateDeliveryModel._();

  const factory UpdateDeliveryModel({
    String? driverName,
    @JsonKey(name: 'deliveryTimeStart') String? deliveryTimeStart,
    @JsonKey(name: 'deliveryItems')
    List<CreateDeliveryItemModel>? deliveryItems,
  }) = _UpdateDeliveryModel;

  factory UpdateDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeliveryModelFromJson(json);

  /// Create from domain DTO.
  /// Converts DateTime to ISO 8601 UTC string as required by the backend.
  factory UpdateDeliveryModel.fromDto(UpdateDeliveryDto dto) =>
      UpdateDeliveryModel(
        driverName: dto.driverName,
        deliveryTimeStart: dto.deliveryTimeStart?.toUtc().toIso8601String(),
        deliveryItems: dto.deliveryItems
            ?.map((item) => CreateDeliveryItemModel.fromDto(item))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (driverName != null) json['driverName'] = driverName;
    if (deliveryTimeStart != null)
      json['deliveryTimeStart'] = deliveryTimeStart;
    if (deliveryItems != null) {
      json['deliveryItems'] =
          deliveryItems!.map((item) => item.toJson()).toList();
    }
    return json;
  }
}
