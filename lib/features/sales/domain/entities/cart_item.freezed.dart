// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartItem {
  /// Unique identifier for this cart entry (not the product ID).
  /// Allows same product with different variants as separate items.
  String get cartItemId => throw _privateConstructorUsedError;

  /// The product being purchased.
  Product get product => throw _privateConstructorUsedError;

  /// The type of pricing (per kilo or sack).
  CartPriceType get priceType => throw _privateConstructorUsedError;

  /// Sack type if applicable (50kg, 25kg, 5kg).
  SackType? get sackType => throw _privateConstructorUsedError;

  /// The quantity being purchased.
  /// For per kilo: weight in kg (e.g., 2.5)
  /// For sack: number of sacks (e.g., 3)
  double get quantity => throw _privateConstructorUsedError;

  /// The unit price for this item.
  /// For per kilo: price per kg
  /// For sack: price per sack
  double get unitPrice => throw _privateConstructorUsedError;

  /// Optional discounted price per unit.
  double? get discountedPrice => throw _privateConstructorUsedError;

  /// Whether this item is discounted.
  bool get isDiscounted => throw _privateConstructorUsedError;

  /// Whether gantang pricing is applied (per kilo only).
  /// Multiplies the price by 2.25.
  bool get isGantang => throw _privateConstructorUsedError;

  /// The sack price ID if sack type.
  String? get sackPriceId => throw _privateConstructorUsedError;

  /// The per kilo price ID if per kilo type.
  String? get perKiloPriceId => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {String cartItemId,
      Product product,
      CartPriceType priceType,
      SackType? sackType,
      double quantity,
      double unitPrice,
      double? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      String? sackPriceId,
      String? perKiloPriceId});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? product = null,
    Object? priceType = null,
    Object? sackType = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? discountedPrice = freezed,
    Object? isDiscounted = null,
    Object? isGantang = null,
    Object? sackPriceId = freezed,
    Object? perKiloPriceId = freezed,
  }) {
    return _then(_value.copyWith(
      cartItemId: null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as CartPriceType,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
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
      sackPriceId: freezed == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      perKiloPriceId: freezed == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cartItemId,
      Product product,
      CartPriceType priceType,
      SackType? sackType,
      double quantity,
      double unitPrice,
      double? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      String? sackPriceId,
      String? perKiloPriceId});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? product = null,
    Object? priceType = null,
    Object? sackType = freezed,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? discountedPrice = freezed,
    Object? isDiscounted = null,
    Object? isGantang = null,
    Object? sackPriceId = freezed,
    Object? perKiloPriceId = freezed,
  }) {
    return _then(_$CartItemImpl(
      cartItemId: null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as CartPriceType,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
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
      sackPriceId: freezed == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      perKiloPriceId: freezed == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CartItemImpl extends _CartItem {
  const _$CartItemImpl(
      {required this.cartItemId,
      required this.product,
      required this.priceType,
      this.sackType,
      required this.quantity,
      required this.unitPrice,
      this.discountedPrice,
      this.isDiscounted = false,
      this.isGantang = false,
      this.sackPriceId,
      this.perKiloPriceId})
      : super._();

  /// Unique identifier for this cart entry (not the product ID).
  /// Allows same product with different variants as separate items.
  @override
  final String cartItemId;

  /// The product being purchased.
  @override
  final Product product;

  /// The type of pricing (per kilo or sack).
  @override
  final CartPriceType priceType;

  /// Sack type if applicable (50kg, 25kg, 5kg).
  @override
  final SackType? sackType;

  /// The quantity being purchased.
  /// For per kilo: weight in kg (e.g., 2.5)
  /// For sack: number of sacks (e.g., 3)
  @override
  final double quantity;

  /// The unit price for this item.
  /// For per kilo: price per kg
  /// For sack: price per sack
  @override
  final double unitPrice;

  /// Optional discounted price per unit.
  @override
  final double? discountedPrice;

  /// Whether this item is discounted.
  @override
  @JsonKey()
  final bool isDiscounted;

  /// Whether gantang pricing is applied (per kilo only).
  /// Multiplies the price by 2.25.
  @override
  @JsonKey()
  final bool isGantang;

  /// The sack price ID if sack type.
  @override
  final String? sackPriceId;

  /// The per kilo price ID if per kilo type.
  @override
  final String? perKiloPriceId;

  @override
  String toString() {
    return 'CartItem(cartItemId: $cartItemId, product: $product, priceType: $priceType, sackType: $sackType, quantity: $quantity, unitPrice: $unitPrice, discountedPrice: $discountedPrice, isDiscounted: $isDiscounted, isGantang: $isGantang, sackPriceId: $sackPriceId, perKiloPriceId: $perKiloPriceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.isDiscounted, isDiscounted) ||
                other.isDiscounted == isDiscounted) &&
            (identical(other.isGantang, isGantang) ||
                other.isGantang == isGantang) &&
            (identical(other.sackPriceId, sackPriceId) ||
                other.sackPriceId == sackPriceId) &&
            (identical(other.perKiloPriceId, perKiloPriceId) ||
                other.perKiloPriceId == perKiloPriceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartItemId,
      product,
      priceType,
      sackType,
      quantity,
      unitPrice,
      discountedPrice,
      isDiscounted,
      isGantang,
      sackPriceId,
      perKiloPriceId);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);
}

abstract class _CartItem extends CartItem {
  const factory _CartItem(
      {required final String cartItemId,
      required final Product product,
      required final CartPriceType priceType,
      final SackType? sackType,
      required final double quantity,
      required final double unitPrice,
      final double? discountedPrice,
      final bool isDiscounted,
      final bool isGantang,
      final String? sackPriceId,
      final String? perKiloPriceId}) = _$CartItemImpl;
  const _CartItem._() : super._();

  /// Unique identifier for this cart entry (not the product ID).
  /// Allows same product with different variants as separate items.
  @override
  String get cartItemId;

  /// The product being purchased.
  @override
  Product get product;

  /// The type of pricing (per kilo or sack).
  @override
  CartPriceType get priceType;

  /// Sack type if applicable (50kg, 25kg, 5kg).
  @override
  SackType? get sackType;

  /// The quantity being purchased.
  /// For per kilo: weight in kg (e.g., 2.5)
  /// For sack: number of sacks (e.g., 3)
  @override
  double get quantity;

  /// The unit price for this item.
  /// For per kilo: price per kg
  /// For sack: price per sack
  @override
  double get unitPrice;

  /// Optional discounted price per unit.
  @override
  double? get discountedPrice;

  /// Whether this item is discounted.
  @override
  bool get isDiscounted;

  /// Whether gantang pricing is applied (per kilo only).
  /// Multiplies the price by 2.25.
  @override
  bool get isGantang;

  /// The sack price ID if sack type.
  @override
  String? get sackPriceId;

  /// The per kilo price ID if per kilo type.
  @override
  String? get perKiloPriceId;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
