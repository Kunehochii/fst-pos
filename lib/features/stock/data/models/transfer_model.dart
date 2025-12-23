// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';
import '../../domain/entities/transfer.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

/// Lightweight product model for transfer API responses.
/// Only contains the fields returned by the transfer endpoints.
@freezed
class TransferProductModel with _$TransferProductModel {
  const TransferProductModel._();

  const factory TransferProductModel({
    required String id,
    required String name,
    required String category,
  }) = _TransferProductModel;

  factory TransferProductModel.fromJson(Map<String, dynamic> json) =>
      _$TransferProductModelFromJson(json);

  /// Convert to domain entity with default values for missing fields.
  Product toEntity() => Product(
        id: id,
        name: name,
        picture: 'https://placehold.co/800x800?text=Product',
        category: ProductCategory.fromString(category),
        cashierId: '', // Not provided by transfer API
        sackPrices: [],
        perKiloPrice: null,
        cashier: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}

/// Lightweight sack price model for transfer API responses.
/// Only contains id, type, and price (no stock, dates, etc.).
@freezed
class TransferSackPriceModel with _$TransferSackPriceModel {
  const TransferSackPriceModel._();

  const factory TransferSackPriceModel({
    required String id,
    required String type,
    required String price,
  }) = _TransferSackPriceModel;

  factory TransferSackPriceModel.fromJson(Map<String, dynamic> json) =>
      _$TransferSackPriceModelFromJson(json);

  /// Convert to domain entity with default values for missing fields.
  SackPrice toEntity() => SackPrice(
        id: id,
        price: double.parse(price),
        stock: 0, // Not provided by transfer API
        type: SackType.fromString(type),
        profit: null,
        specialPrice: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}

/// Lightweight per kilo price model for transfer API responses.
/// Only contains id and price (no stock, dates, etc.).
@freezed
class TransferPerKiloPriceModel with _$TransferPerKiloPriceModel {
  const TransferPerKiloPriceModel._();

  const factory TransferPerKiloPriceModel({
    required String id,
    required String price,
  }) = _TransferPerKiloPriceModel;

  factory TransferPerKiloPriceModel.fromJson(Map<String, dynamic> json) =>
      _$TransferPerKiloPriceModelFromJson(json);

  /// Convert to domain entity with default values for missing fields.
  PerKiloPrice toEntity() => PerKiloPrice(
        id: id,
        price: double.parse(price),
        stock: 0, // Not provided by transfer API
        profit: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}

/// Transfer cashier model for API serialization.
@freezed
class TransferCashierModel with _$TransferCashierModel {
  const TransferCashierModel._();

  const factory TransferCashierModel({
    required String id,
    required String username,
    @JsonKey(name: 'branchName') required String branchName,
  }) = _TransferCashierModel;

  factory TransferCashierModel.fromJson(Map<String, dynamic> json) =>
      _$TransferCashierModelFromJson(json);

  /// Convert to domain entity.
  TransferCashier toEntity() => TransferCashier(
        id: id,
        username: username,
        branchName: branchName,
      );

  /// Create from domain entity.
  factory TransferCashierModel.fromEntity(TransferCashier entity) =>
      TransferCashierModel(
        id: entity.id,
        username: entity.username,
        branchName: entity.branchName,
      );
}

/// Main transfer model for API serialization.
@freezed
class TransferModel with _$TransferModel {
  const TransferModel._();

  const factory TransferModel({
    required String id,
    required String quantity,
    required String type,
    @JsonKey(name: 'sackType') String? sackType,
    @JsonKey(name: 'productId') required String productId,
    @JsonKey(name: 'sackPriceId') String? sackPriceId,
    @JsonKey(name: 'perKiloPriceId') String? perKiloPriceId,
    @JsonKey(name: 'cashierId') required String cashierId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    TransferProductModel? product,
    TransferSackPriceModel? sackPrice,
    TransferPerKiloPriceModel? perKiloPrice,
    TransferCashierModel? cashier,
  }) = _TransferModel;

  factory TransferModel.fromJson(Map<String, dynamic> json) =>
      _$TransferModelFromJson(json);

  /// Convert to domain entity.
  Transfer toEntity() => Transfer(
        id: id,
        quantity: double.parse(quantity),
        type: TransferType.fromString(type),
        sackType: sackType != null ? SackType.fromString(sackType!) : null,
        productId: productId,
        sackPriceId: sackPriceId,
        perKiloPriceId: perKiloPriceId,
        cashierId: cashierId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        product: product?.toEntity(),
        sackPrice: sackPrice?.toEntity(),
        perKiloPrice: perKiloPrice?.toEntity(),
        cashier: cashier?.toEntity(),
      );

  /// Create from domain entity.
  factory TransferModel.fromEntity(Transfer entity) => TransferModel(
        id: entity.id,
        quantity: entity.quantity.toString(),
        type: entity.type.toApiString(),
        sackType: entity.sackType?.toApiString(),
        productId: entity.productId,
        sackPriceId: entity.sackPriceId,
        perKiloPriceId: entity.perKiloPriceId,
        cashierId: entity.cashierId,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        product: entity.product != null
            ? TransferProductModel(
                id: entity.product!.id,
                name: entity.product!.name,
                category: entity.product!.category.toApiString(),
              )
            : null,
        sackPrice: entity.sackPrice != null
            ? TransferSackPriceModel(
                id: entity.sackPrice!.id,
                type: entity.sackPrice!.type.toApiString(),
                price: entity.sackPrice!.price.toString(),
              )
            : null,
        perKiloPrice: entity.perKiloPrice != null
            ? TransferPerKiloPriceModel(
                id: entity.perKiloPrice!.id,
                price: entity.perKiloPrice!.price.toString(),
              )
            : null,
        cashier: entity.cashier != null
            ? TransferCashierModel.fromEntity(entity.cashier!)
            : null,
      );
}

/// DTO for creating a transfer with sack price.
@freezed
class CreateTransferSackModel with _$CreateTransferSackModel {
  const CreateTransferSackModel._();

  const factory CreateTransferSackModel({
    required String productId,
    required String sackPriceId,
    required String sackType,
    required double quantity,
    required String transferType,
  }) = _CreateTransferSackModel;

  factory CreateTransferSackModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferSackModelFromJson(json);

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'sackPriceId': sackPriceId,
        'sackType': sackType,
        'quantity': quantity,
        'transferType': transferType,
      };

  /// Create from DTO.
  factory CreateTransferSackModel.fromDto(CreateTransferSackDto dto) =>
      CreateTransferSackModel(
        productId: dto.productId,
        sackPriceId: dto.sackPriceId,
        sackType: dto.sackType.toApiString(),
        quantity: dto.quantity,
        transferType: dto.transferType.toApiString(),
      );
}

/// DTO for creating a transfer with per kilo price.
@freezed
class CreateTransferPerKiloModel with _$CreateTransferPerKiloModel {
  const CreateTransferPerKiloModel._();

  const factory CreateTransferPerKiloModel({
    required String productId,
    required String perKiloPriceId,
    required double quantity,
    required String transferType,
  }) = _CreateTransferPerKiloModel;

  factory CreateTransferPerKiloModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferPerKiloModelFromJson(json);

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'perKiloPriceId': perKiloPriceId,
        'quantity': quantity,
        'transferType': transferType,
      };

  /// Create from DTO.
  factory CreateTransferPerKiloModel.fromDto(CreateTransferPerKiloDto dto) =>
      CreateTransferPerKiloModel(
        productId: dto.productId,
        perKiloPriceId: dto.perKiloPriceId,
        quantity: dto.quantity,
        transferType: dto.transferType.toApiString(),
      );
}
