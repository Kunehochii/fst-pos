import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/data/models/product_model.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/transfer.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

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
    ProductModel? product,
    SackPriceModel? sackPrice,
    PerKiloPriceModel? perKiloPrice,
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
            ? ProductModel.fromEntity(entity.product!)
            : null,
        sackPrice: entity.sackPrice != null
            ? SackPriceModel.fromEntity(entity.sackPrice!)
            : null,
        perKiloPrice: entity.perKiloPrice != null
            ? PerKiloPriceModel.fromEntity(entity.perKiloPrice!)
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
