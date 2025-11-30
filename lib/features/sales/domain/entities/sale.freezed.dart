// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaleItem {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountedPrice => throw _privateConstructorUsedError;
  bool get isDiscounted => throw _privateConstructorUsedError;
  bool get isGantang => throw _privateConstructorUsedError;
  bool get isSpecialPrice => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get sackPriceId => throw _privateConstructorUsedError;
  SackType? get sackType => throw _privateConstructorUsedError;
  String? get perKiloPriceId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// The product details (optional, for display purposes).
  Product? get product => throw _privateConstructorUsedError;

  /// Sack price details (optional, for display).
  SackPrice? get sackPrice => throw _privateConstructorUsedError;

  /// Per kilo price details (optional, for display).
  PerKiloPrice? get perKiloPrice => throw _privateConstructorUsedError;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleItemCopyWith<SaleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleItemCopyWith<$Res> {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) then) =
      _$SaleItemCopyWithImpl<$Res, SaleItem>;
  @useResult
  $Res call(
      {String id,
      double quantity,
      double price,
      double? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      bool isSpecialPrice,
      String productId,
      String? sackPriceId,
      SackType? sackType,
      String? perKiloPriceId,
      DateTime createdAt,
      DateTime updatedAt,
      Product? product,
      SackPrice? sackPrice,
      PerKiloPrice? perKiloPrice});

  $ProductCopyWith<$Res>? get product;
  $SackPriceCopyWith<$Res>? get sackPrice;
  $PerKiloPriceCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class _$SaleItemCopyWithImpl<$Res, $Val extends SaleItem>
    implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? isDiscounted = null,
    Object? isGantang = null,
    Object? isSpecialPrice = null,
    Object? productId = null,
    Object? sackPriceId = freezed,
    Object? sackType = freezed,
    Object? perKiloPriceId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? product = freezed,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isDiscounted: null == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGantang: null == isGantang
          ? _value.isGantang
          : isGantang // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpecialPrice: null == isSpecialPrice
          ? _value.isSpecialPrice
          : isSpecialPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPriceId: freezed == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
      perKiloPriceId: freezed == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPrice?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPrice?,
    ) as $Val);
  }

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SackPriceCopyWith<$Res>? get sackPrice {
    if (_value.sackPrice == null) {
      return null;
    }

    return $SackPriceCopyWith<$Res>(_value.sackPrice!, (value) {
      return _then(_value.copyWith(sackPrice: value) as $Val);
    });
  }

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerKiloPriceCopyWith<$Res>? get perKiloPrice {
    if (_value.perKiloPrice == null) {
      return null;
    }

    return $PerKiloPriceCopyWith<$Res>(_value.perKiloPrice!, (value) {
      return _then(_value.copyWith(perKiloPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SaleItemImplCopyWith<$Res>
    implements $SaleItemCopyWith<$Res> {
  factory _$$SaleItemImplCopyWith(
          _$SaleItemImpl value, $Res Function(_$SaleItemImpl) then) =
      __$$SaleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double quantity,
      double price,
      double? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      bool isSpecialPrice,
      String productId,
      String? sackPriceId,
      SackType? sackType,
      String? perKiloPriceId,
      DateTime createdAt,
      DateTime updatedAt,
      Product? product,
      SackPrice? sackPrice,
      PerKiloPrice? perKiloPrice});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $SackPriceCopyWith<$Res>? get sackPrice;
  @override
  $PerKiloPriceCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class __$$SaleItemImplCopyWithImpl<$Res>
    extends _$SaleItemCopyWithImpl<$Res, _$SaleItemImpl>
    implements _$$SaleItemImplCopyWith<$Res> {
  __$$SaleItemImplCopyWithImpl(
      _$SaleItemImpl _value, $Res Function(_$SaleItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? isDiscounted = null,
    Object? isGantang = null,
    Object? isSpecialPrice = null,
    Object? productId = null,
    Object? sackPriceId = freezed,
    Object? sackType = freezed,
    Object? perKiloPriceId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? product = freezed,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
  }) {
    return _then(_$SaleItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isDiscounted: null == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGantang: null == isGantang
          ? _value.isGantang
          : isGantang // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpecialPrice: null == isSpecialPrice
          ? _value.isSpecialPrice
          : isSpecialPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPriceId: freezed == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
      perKiloPriceId: freezed == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPrice?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPrice?,
    ));
  }
}

/// @nodoc

class _$SaleItemImpl extends _SaleItem {
  const _$SaleItemImpl(
      {required this.id,
      required this.quantity,
      required this.price,
      this.discountedPrice,
      this.isDiscounted = false,
      this.isGantang = false,
      this.isSpecialPrice = false,
      required this.productId,
      this.sackPriceId,
      this.sackType,
      this.perKiloPriceId,
      required this.createdAt,
      required this.updatedAt,
      this.product,
      this.sackPrice,
      this.perKiloPrice})
      : super._();

  @override
  final String id;
  @override
  final double quantity;
  @override
  final double price;
  @override
  final double? discountedPrice;
  @override
  @JsonKey()
  final bool isDiscounted;
  @override
  @JsonKey()
  final bool isGantang;
  @override
  @JsonKey()
  final bool isSpecialPrice;
  @override
  final String productId;
  @override
  final String? sackPriceId;
  @override
  final SackType? sackType;
  @override
  final String? perKiloPriceId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// The product details (optional, for display purposes).
  @override
  final Product? product;

  /// Sack price details (optional, for display).
  @override
  final SackPrice? sackPrice;

  /// Per kilo price details (optional, for display).
  @override
  final PerKiloPrice? perKiloPrice;

  @override
  String toString() {
    return 'SaleItem(id: $id, quantity: $quantity, price: $price, discountedPrice: $discountedPrice, isDiscounted: $isDiscounted, isGantang: $isGantang, isSpecialPrice: $isSpecialPrice, productId: $productId, sackPriceId: $sackPriceId, sackType: $sackType, perKiloPriceId: $perKiloPriceId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.isDiscounted, isDiscounted) ||
                other.isDiscounted == isDiscounted) &&
            (identical(other.isGantang, isGantang) ||
                other.isGantang == isGantang) &&
            (identical(other.isSpecialPrice, isSpecialPrice) ||
                other.isSpecialPrice == isSpecialPrice) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sackPriceId, sackPriceId) ||
                other.sackPriceId == sackPriceId) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType) &&
            (identical(other.perKiloPriceId, perKiloPriceId) ||
                other.perKiloPriceId == perKiloPriceId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.sackPrice, sackPrice) ||
                other.sackPrice == sackPrice) &&
            (identical(other.perKiloPrice, perKiloPrice) ||
                other.perKiloPrice == perKiloPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      price,
      discountedPrice,
      isDiscounted,
      isGantang,
      isSpecialPrice,
      productId,
      sackPriceId,
      sackType,
      perKiloPriceId,
      createdAt,
      updatedAt,
      product,
      sackPrice,
      perKiloPrice);

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleItemImplCopyWith<_$SaleItemImpl> get copyWith =>
      __$$SaleItemImplCopyWithImpl<_$SaleItemImpl>(this, _$identity);
}

abstract class _SaleItem extends SaleItem {
  const factory _SaleItem(
      {required final String id,
      required final double quantity,
      required final double price,
      final double? discountedPrice,
      final bool isDiscounted,
      final bool isGantang,
      final bool isSpecialPrice,
      required final String productId,
      final String? sackPriceId,
      final SackType? sackType,
      final String? perKiloPriceId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final Product? product,
      final SackPrice? sackPrice,
      final PerKiloPrice? perKiloPrice}) = _$SaleItemImpl;
  const _SaleItem._() : super._();

  @override
  String get id;
  @override
  double get quantity;
  @override
  double get price;
  @override
  double? get discountedPrice;
  @override
  bool get isDiscounted;
  @override
  bool get isGantang;
  @override
  bool get isSpecialPrice;
  @override
  String get productId;
  @override
  String? get sackPriceId;
  @override
  SackType? get sackType;
  @override
  String? get perKiloPriceId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// The product details (optional, for display purposes).
  @override
  Product? get product;

  /// Sack price details (optional, for display).
  @override
  SackPrice? get sackPrice;

  /// Per kilo price details (optional, for display).
  @override
  PerKiloPrice? get perKiloPrice;

  /// Create a copy of SaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleItemImplCopyWith<_$SaleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Sale {
  String get id => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  bool get isVoid => throw _privateConstructorUsedError;
  DateTime? get voidedAt => throw _privateConstructorUsedError;
  String get cashierId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  List<SaleItem> get saleItems => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Whether this sale has been synced to the server.
  bool get isSynced => throw _privateConstructorUsedError;

  /// Local-only ID for sync tracking before server assignment.
  String? get localId => throw _privateConstructorUsedError;

  /// Metadata for frontend use (e.g., cash tendered, change).
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Create a copy of Sale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleCopyWith<Sale> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleCopyWith<$Res> {
  factory $SaleCopyWith(Sale value, $Res Function(Sale) then) =
      _$SaleCopyWithImpl<$Res, Sale>;
  @useResult
  $Res call(
      {String id,
      double totalAmount,
      PaymentMethod paymentMethod,
      bool isVoid,
      DateTime? voidedAt,
      String cashierId,
      String? orderId,
      List<SaleItem> saleItems,
      DateTime createdAt,
      DateTime updatedAt,
      bool isSynced,
      String? localId,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SaleCopyWithImpl<$Res, $Val extends Sale>
    implements $SaleCopyWith<$Res> {
  _$SaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? isVoid = null,
    Object? voidedAt = freezed,
    Object? cashierId = null,
    Object? orderId = freezed,
    Object? saleItems = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
    Object? localId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      isVoid: null == isVoid
          ? _value.isVoid
          : isVoid // ignore: cast_nullable_to_non_nullable
              as bool,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      saleItems: null == saleItems
          ? _value.saleItems
          : saleItems // ignore: cast_nullable_to_non_nullable
              as List<SaleItem>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleImplCopyWith<$Res> implements $SaleCopyWith<$Res> {
  factory _$$SaleImplCopyWith(
          _$SaleImpl value, $Res Function(_$SaleImpl) then) =
      __$$SaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double totalAmount,
      PaymentMethod paymentMethod,
      bool isVoid,
      DateTime? voidedAt,
      String cashierId,
      String? orderId,
      List<SaleItem> saleItems,
      DateTime createdAt,
      DateTime updatedAt,
      bool isSynced,
      String? localId,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SaleImplCopyWithImpl<$Res>
    extends _$SaleCopyWithImpl<$Res, _$SaleImpl>
    implements _$$SaleImplCopyWith<$Res> {
  __$$SaleImplCopyWithImpl(_$SaleImpl _value, $Res Function(_$SaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? isVoid = null,
    Object? voidedAt = freezed,
    Object? cashierId = null,
    Object? orderId = freezed,
    Object? saleItems = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
    Object? localId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$SaleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      isVoid: null == isVoid
          ? _value.isVoid
          : isVoid // ignore: cast_nullable_to_non_nullable
              as bool,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      saleItems: null == saleItems
          ? _value._saleItems
          : saleItems // ignore: cast_nullable_to_non_nullable
              as List<SaleItem>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$SaleImpl extends _Sale {
  const _$SaleImpl(
      {required this.id,
      required this.totalAmount,
      required this.paymentMethod,
      this.isVoid = false,
      this.voidedAt,
      required this.cashierId,
      this.orderId,
      required final List<SaleItem> saleItems,
      required this.createdAt,
      required this.updatedAt,
      this.isSynced = false,
      this.localId,
      final Map<String, dynamic>? metadata})
      : _saleItems = saleItems,
        _metadata = metadata,
        super._();

  @override
  final String id;
  @override
  final double totalAmount;
  @override
  final PaymentMethod paymentMethod;
  @override
  @JsonKey()
  final bool isVoid;
  @override
  final DateTime? voidedAt;
  @override
  final String cashierId;
  @override
  final String? orderId;
  final List<SaleItem> _saleItems;
  @override
  List<SaleItem> get saleItems {
    if (_saleItems is EqualUnmodifiableListView) return _saleItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saleItems);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Whether this sale has been synced to the server.
  @override
  @JsonKey()
  final bool isSynced;

  /// Local-only ID for sync tracking before server assignment.
  @override
  final String? localId;

  /// Metadata for frontend use (e.g., cash tendered, change).
  final Map<String, dynamic>? _metadata;

  /// Metadata for frontend use (e.g., cash tendered, change).
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Sale(id: $id, totalAmount: $totalAmount, paymentMethod: $paymentMethod, isVoid: $isVoid, voidedAt: $voidedAt, cashierId: $cashierId, orderId: $orderId, saleItems: $saleItems, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, localId: $localId, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.isVoid, isVoid) || other.isVoid == isVoid) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality()
                .equals(other._saleItems, _saleItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      totalAmount,
      paymentMethod,
      isVoid,
      voidedAt,
      cashierId,
      orderId,
      const DeepCollectionEquality().hash(_saleItems),
      createdAt,
      updatedAt,
      isSynced,
      localId,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of Sale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleImplCopyWith<_$SaleImpl> get copyWith =>
      __$$SaleImplCopyWithImpl<_$SaleImpl>(this, _$identity);
}

abstract class _Sale extends Sale {
  const factory _Sale(
      {required final String id,
      required final double totalAmount,
      required final PaymentMethod paymentMethod,
      final bool isVoid,
      final DateTime? voidedAt,
      required final String cashierId,
      final String? orderId,
      required final List<SaleItem> saleItems,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isSynced,
      final String? localId,
      final Map<String, dynamic>? metadata}) = _$SaleImpl;
  const _Sale._() : super._();

  @override
  String get id;
  @override
  double get totalAmount;
  @override
  PaymentMethod get paymentMethod;
  @override
  bool get isVoid;
  @override
  DateTime? get voidedAt;
  @override
  String get cashierId;
  @override
  String? get orderId;
  @override
  List<SaleItem> get saleItems;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Whether this sale has been synced to the server.
  @override
  bool get isSynced;

  /// Local-only ID for sync tracking before server assignment.
  @override
  String? get localId;

  /// Metadata for frontend use (e.g., cash tendered, change).
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of Sale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleImplCopyWith<_$SaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SaleSummary {
  String get id => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isVoid => throw _privateConstructorUsedError;
  DateTime? get voidedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Create a copy of SaleSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleSummaryCopyWith<SaleSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleSummaryCopyWith<$Res> {
  factory $SaleSummaryCopyWith(
          SaleSummary value, $Res Function(SaleSummary) then) =
      _$SaleSummaryCopyWithImpl<$Res, SaleSummary>;
  @useResult
  $Res call(
      {String id,
      double totalAmount,
      PaymentMethod paymentMethod,
      int itemCount,
      DateTime createdAt,
      bool isVoid,
      DateTime? voidedAt,
      bool isSynced});
}

/// @nodoc
class _$SaleSummaryCopyWithImpl<$Res, $Val extends SaleSummary>
    implements $SaleSummaryCopyWith<$Res> {
  _$SaleSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? itemCount = null,
    Object? createdAt = null,
    Object? isVoid = null,
    Object? voidedAt = freezed,
    Object? isSynced = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVoid: null == isVoid
          ? _value.isVoid
          : isVoid // ignore: cast_nullable_to_non_nullable
              as bool,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleSummaryImplCopyWith<$Res>
    implements $SaleSummaryCopyWith<$Res> {
  factory _$$SaleSummaryImplCopyWith(
          _$SaleSummaryImpl value, $Res Function(_$SaleSummaryImpl) then) =
      __$$SaleSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double totalAmount,
      PaymentMethod paymentMethod,
      int itemCount,
      DateTime createdAt,
      bool isVoid,
      DateTime? voidedAt,
      bool isSynced});
}

/// @nodoc
class __$$SaleSummaryImplCopyWithImpl<$Res>
    extends _$SaleSummaryCopyWithImpl<$Res, _$SaleSummaryImpl>
    implements _$$SaleSummaryImplCopyWith<$Res> {
  __$$SaleSummaryImplCopyWithImpl(
      _$SaleSummaryImpl _value, $Res Function(_$SaleSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? itemCount = null,
    Object? createdAt = null,
    Object? isVoid = null,
    Object? voidedAt = freezed,
    Object? isSynced = null,
  }) {
    return _then(_$SaleSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVoid: null == isVoid
          ? _value.isVoid
          : isVoid // ignore: cast_nullable_to_non_nullable
              as bool,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SaleSummaryImpl implements _SaleSummary {
  const _$SaleSummaryImpl(
      {required this.id,
      required this.totalAmount,
      required this.paymentMethod,
      required this.itemCount,
      required this.createdAt,
      this.isVoid = false,
      this.voidedAt,
      this.isSynced = false});

  @override
  final String id;
  @override
  final double totalAmount;
  @override
  final PaymentMethod paymentMethod;
  @override
  final int itemCount;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isVoid;
  @override
  final DateTime? voidedAt;
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'SaleSummary(id: $id, totalAmount: $totalAmount, paymentMethod: $paymentMethod, itemCount: $itemCount, createdAt: $createdAt, isVoid: $isVoid, voidedAt: $voidedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isVoid, isVoid) || other.isVoid == isVoid) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, totalAmount, paymentMethod,
      itemCount, createdAt, isVoid, voidedAt, isSynced);

  /// Create a copy of SaleSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleSummaryImplCopyWith<_$SaleSummaryImpl> get copyWith =>
      __$$SaleSummaryImplCopyWithImpl<_$SaleSummaryImpl>(this, _$identity);
}

abstract class _SaleSummary implements SaleSummary {
  const factory _SaleSummary(
      {required final String id,
      required final double totalAmount,
      required final PaymentMethod paymentMethod,
      required final int itemCount,
      required final DateTime createdAt,
      final bool isVoid,
      final DateTime? voidedAt,
      final bool isSynced}) = _$SaleSummaryImpl;

  @override
  String get id;
  @override
  double get totalAmount;
  @override
  PaymentMethod get paymentMethod;
  @override
  int get itemCount;
  @override
  DateTime get createdAt;
  @override
  bool get isVoid;
  @override
  DateTime? get voidedAt;
  @override
  bool get isSynced;

  /// Create a copy of SaleSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleSummaryImplCopyWith<_$SaleSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
