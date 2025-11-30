import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// Special price model for API serialization.
@freezed
class SpecialPriceModel with _$SpecialPriceModel {
  const SpecialPriceModel._();

  const factory SpecialPriceModel({
    required String id,
    required String price,
    @JsonKey(name: 'minimumQty') required String minimumQty,
    String? profit,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _SpecialPriceModel;

  factory SpecialPriceModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialPriceModelFromJson(json);

  /// Convert to domain entity.
  SpecialPrice toEntity() => SpecialPrice(
        id: id,
        price: double.parse(price),
        minimumQty: double.parse(minimumQty),
        profit: profit != null ? double.parse(profit!) : null,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory SpecialPriceModel.fromEntity(SpecialPrice entity) =>
      SpecialPriceModel(
        id: entity.id,
        price: entity.price.toString(),
        minimumQty: entity.minimumQty.toString(),
        profit: entity.profit?.toString(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Sack price model for API serialization.
@freezed
class SackPriceModel with _$SackPriceModel {
  const SackPriceModel._();

  const factory SackPriceModel({
    required String id,
    required String price,
    required String stock,
    required String type,
    String? profit,
    SpecialPriceModel? specialPrice,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _SackPriceModel;

  factory SackPriceModel.fromJson(Map<String, dynamic> json) =>
      _$SackPriceModelFromJson(json);

  /// Convert to domain entity.
  SackPrice toEntity() => SackPrice(
        id: id,
        price: double.parse(price),
        stock: double.parse(stock),
        type: SackType.fromString(type),
        profit: profit != null ? double.parse(profit!) : null,
        specialPrice: specialPrice?.toEntity(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory SackPriceModel.fromEntity(SackPrice entity) => SackPriceModel(
        id: entity.id,
        price: entity.price.toString(),
        stock: entity.stock.toString(),
        type: entity.type.toApiString(),
        profit: entity.profit?.toString(),
        specialPrice: entity.specialPrice != null
            ? SpecialPriceModel.fromEntity(entity.specialPrice!)
            : null,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Per kilo price model for API serialization.
@freezed
class PerKiloPriceModel with _$PerKiloPriceModel {
  const PerKiloPriceModel._();

  const factory PerKiloPriceModel({
    required String id,
    required String price,
    required String stock,
    String? profit,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _PerKiloPriceModel;

  factory PerKiloPriceModel.fromJson(Map<String, dynamic> json) =>
      _$PerKiloPriceModelFromJson(json);

  /// Convert to domain entity.
  PerKiloPrice toEntity() => PerKiloPrice(
        id: id,
        price: double.parse(price),
        stock: double.parse(stock),
        profit: profit != null ? double.parse(profit!) : null,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory PerKiloPriceModel.fromEntity(PerKiloPrice entity) =>
      PerKiloPriceModel(
        id: entity.id,
        price: entity.price.toString(),
        stock: entity.stock.toString(),
        profit: entity.profit?.toString(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Cashier info model (embedded in product response).
@freezed
class ProductCashierModel with _$ProductCashierModel {
  const ProductCashierModel._();

  const factory ProductCashierModel({
    required String id,
    required String username,
    @JsonKey(name: 'branchName') required String branchName,
    @JsonKey(name: 'businessId') required String businessId,
  }) = _ProductCashierModel;

  factory ProductCashierModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCashierModelFromJson(json);

  /// Convert to domain entity.
  ProductCashier toEntity() => ProductCashier(
        id: id,
        username: username,
        branchName: branchName,
        businessId: businessId,
      );

  /// Create from domain entity.
  factory ProductCashierModel.fromEntity(ProductCashier entity) =>
      ProductCashierModel(
        id: entity.id,
        username: entity.username,
        branchName: entity.branchName,
        businessId: entity.businessId,
      );
}

/// Main product model for API serialization.
@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String name,
    required String picture,
    required String category,
    @JsonKey(name: 'cashierId') required String cashierId,
    @Default([]) List<SackPriceModel> sackPrices,
    PerKiloPriceModel? perKiloPrice,
    ProductCashierModel? cashier,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Convert to domain entity.
  Product toEntity() => Product(
        id: id,
        name: name,
        picture: picture,
        category: ProductCategory.fromString(category),
        cashierId: cashierId,
        sackPrices: sackPrices.map((sp) => sp.toEntity()).toList(),
        perKiloPrice: perKiloPrice?.toEntity(),
        cashier: cashier?.toEntity(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory ProductModel.fromEntity(Product entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        picture: entity.picture,
        category: entity.category.toApiString(),
        cashierId: entity.cashierId,
        sackPrices: entity.sackPrices
            .map((sp) => SackPriceModel.fromEntity(sp))
            .toList(),
        perKiloPrice: entity.perKiloPrice != null
            ? PerKiloPriceModel.fromEntity(entity.perKiloPrice!)
            : null,
        cashier: entity.cashier != null
            ? ProductCashierModel.fromEntity(entity.cashier!)
            : null,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
