import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';
import '../../../product/data/models/product_model.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/sale.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

/// Sale item model for API serialization.
@freezed
class SaleItemModel with _$SaleItemModel {
  const SaleItemModel._();

  const factory SaleItemModel({
    required String id,
    required String quantity,
    required String price,
    String? discountedPrice,
    @Default(false) bool isDiscounted,
    @Default(false) bool isGantang,
    @Default(false) bool isSpecialPrice,
    @JsonKey(name: 'productId') required String productId,
    String? sackPriceId,
    String? sackType,
    String? perKiloPriceId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    ProductModel? product,
    SackPriceModel? sackPrice,
    PerKiloPriceModel? perKiloPrice,
  }) = _SaleItemModel;

  factory SaleItemModel.fromJson(Map<String, dynamic> json) =>
      _$SaleItemModelFromJson(json);

  /// Convert to domain entity.
  SaleItem toEntity() => SaleItem(
        id: id,
        quantity: double.parse(quantity),
        price: double.parse(price),
        discountedPrice:
            discountedPrice != null ? double.parse(discountedPrice!) : null,
        isDiscounted: isDiscounted,
        isGantang: isGantang,
        isSpecialPrice: isSpecialPrice,
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
  factory SaleItemModel.fromEntity(SaleItem entity) => SaleItemModel(
        id: entity.id,
        quantity: entity.quantity.toString(),
        price: entity.price.toString(),
        discountedPrice: entity.discountedPrice?.toString(),
        isDiscounted: entity.isDiscounted,
        isGantang: entity.isGantang,
        isSpecialPrice: entity.isSpecialPrice,
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

/// Sale model for API serialization.
@freezed
class SaleModel with _$SaleModel {
  const SaleModel._();

  const factory SaleModel({
    required String id,
    @JsonKey(name: 'totalAmount') required String totalAmount,
    @JsonKey(name: 'paymentMethod') required String paymentMethod,
    @Default(false) bool isVoid,
    DateTime? voidedAt,
    @JsonKey(name: 'cashierId') required String cashierId,
    String? orderId,
    @Default([]) List<SaleItemModel> saleItems,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    Map<String, dynamic>? metadata,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);

  /// Convert to domain entity.
  Sale toEntity({bool isSynced = true, String? localId}) => Sale(
        id: id,
        totalAmount: double.parse(totalAmount),
        paymentMethod: PaymentMethod.fromString(paymentMethod),
        isVoid: isVoid,
        voidedAt: voidedAt,
        cashierId: cashierId,
        orderId: orderId,
        saleItems: saleItems.map((item) => item.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
        isSynced: isSynced,
        localId: localId,
        metadata: metadata,
      );

  /// Create from domain entity.
  factory SaleModel.fromEntity(Sale entity) => SaleModel(
        id: entity.id,
        totalAmount: entity.totalAmount.toString(),
        paymentMethod: entity.paymentMethod.toApiString(),
        isVoid: entity.isVoid,
        voidedAt: entity.voidedAt,
        cashierId: entity.cashierId,
        orderId: entity.orderId,
        saleItems: entity.saleItems
            .map((item) => SaleItemModel.fromEntity(item))
            .toList(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        metadata: entity.metadata,
      );
}

/// Request model for creating a sale.
@freezed
class CreateSaleRequest with _$CreateSaleRequest {
  const CreateSaleRequest._();

  const factory CreateSaleRequest({
    required String totalAmount,
    required String paymentMethod,
    String? orderId,
    required List<CreateSaleItemRequest> saleItem,
    Map<String, dynamic>? metadata,
  }) = _CreateSaleRequest;

  factory CreateSaleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleRequestFromJson(json);
}

/// Request model for a sale item.
@freezed
class CreateSaleItemRequest with _$CreateSaleItemRequest {
  const CreateSaleItemRequest._();

  const factory CreateSaleItemRequest({
    required String id, // Product ID
    String? price, // Override price
    String? discountedPrice,
    @Default(false) bool isDiscounted,
    @Default(false) bool isGantang,
    @Default(false) bool isSpecialPrice,
    PerKiloPriceRequest? perKiloPrice,
    SackPriceRequest? sackPrice,
  }) = _CreateSaleItemRequest;

  factory CreateSaleItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleItemRequestFromJson(json);
}

/// Per kilo price request for creating sale.
@freezed
class PerKiloPriceRequest with _$PerKiloPriceRequest {
  const PerKiloPriceRequest._();

  const factory PerKiloPriceRequest({
    required String id,
    required String quantity,
  }) = _PerKiloPriceRequest;

  factory PerKiloPriceRequest.fromJson(Map<String, dynamic> json) =>
      _$PerKiloPriceRequestFromJson(json);
}

/// Sack price request for creating sale.
@freezed
class SackPriceRequest with _$SackPriceRequest {
  const SackPriceRequest._();

  const factory SackPriceRequest({
    required String id,
    required String quantity,
    required String type,
  }) = _SackPriceRequest;

  factory SackPriceRequest.fromJson(Map<String, dynamic> json) =>
      _$SackPriceRequestFromJson(json);
}
