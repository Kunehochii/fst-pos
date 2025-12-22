// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryCartItem {
  /// Unique identifier for this cart entry (not the product ID).
  /// Allows same product with different variants as separate items.
  String get cartItemId => throw _privateConstructorUsedError;

  /// The product being delivered.
  Product get product => throw _privateConstructorUsedError;

  /// The type of pricing (per kilo or sack).
  DeliveryPriceType get priceType => throw _privateConstructorUsedError;

  /// Sack type if applicable (50kg, 25kg, 5kg).
  SackType? get sackType => throw _privateConstructorUsedError;

  /// The quantity being delivered.
  /// For per kilo: weight in kg (e.g., 2.5)
  /// For sack: number of sacks (e.g., 3)
  double get quantity => throw _privateConstructorUsedError;

  /// The sack price ID if sack type.
  String? get sackPriceId => throw _privateConstructorUsedError;

  /// The per kilo price ID if per kilo type.
  String? get perKiloPriceId => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCartItemCopyWith<DeliveryCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCartItemCopyWith<$Res> {
  factory $DeliveryCartItemCopyWith(
          DeliveryCartItem value, $Res Function(DeliveryCartItem) then) =
      _$DeliveryCartItemCopyWithImpl<$Res, DeliveryCartItem>;
  @useResult
  $Res call(
      {String cartItemId,
      Product product,
      DeliveryPriceType priceType,
      SackType? sackType,
      double quantity,
      String? sackPriceId,
      String? perKiloPriceId});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$DeliveryCartItemCopyWithImpl<$Res, $Val extends DeliveryCartItem>
    implements $DeliveryCartItemCopyWith<$Res> {
  _$DeliveryCartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? product = null,
    Object? priceType = null,
    Object? sackType = freezed,
    Object? quantity = null,
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
              as DeliveryPriceType,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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

  /// Create a copy of DeliveryCartItem
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
abstract class _$$DeliveryCartItemImplCopyWith<$Res>
    implements $DeliveryCartItemCopyWith<$Res> {
  factory _$$DeliveryCartItemImplCopyWith(_$DeliveryCartItemImpl value,
          $Res Function(_$DeliveryCartItemImpl) then) =
      __$$DeliveryCartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cartItemId,
      Product product,
      DeliveryPriceType priceType,
      SackType? sackType,
      double quantity,
      String? sackPriceId,
      String? perKiloPriceId});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$DeliveryCartItemImplCopyWithImpl<$Res>
    extends _$DeliveryCartItemCopyWithImpl<$Res, _$DeliveryCartItemImpl>
    implements _$$DeliveryCartItemImplCopyWith<$Res> {
  __$$DeliveryCartItemImplCopyWithImpl(_$DeliveryCartItemImpl _value,
      $Res Function(_$DeliveryCartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? product = null,
    Object? priceType = null,
    Object? sackType = freezed,
    Object? quantity = null,
    Object? sackPriceId = freezed,
    Object? perKiloPriceId = freezed,
  }) {
    return _then(_$DeliveryCartItemImpl(
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
              as DeliveryPriceType,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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

class _$DeliveryCartItemImpl extends _DeliveryCartItem {
  const _$DeliveryCartItemImpl(
      {required this.cartItemId,
      required this.product,
      required this.priceType,
      this.sackType,
      required this.quantity,
      this.sackPriceId,
      this.perKiloPriceId})
      : super._();

  /// Unique identifier for this cart entry (not the product ID).
  /// Allows same product with different variants as separate items.
  @override
  final String cartItemId;

  /// The product being delivered.
  @override
  final Product product;

  /// The type of pricing (per kilo or sack).
  @override
  final DeliveryPriceType priceType;

  /// Sack type if applicable (50kg, 25kg, 5kg).
  @override
  final SackType? sackType;

  /// The quantity being delivered.
  /// For per kilo: weight in kg (e.g., 2.5)
  /// For sack: number of sacks (e.g., 3)
  @override
  final double quantity;

  /// The sack price ID if sack type.
  @override
  final String? sackPriceId;

  /// The per kilo price ID if per kilo type.
  @override
  final String? perKiloPriceId;

  @override
  String toString() {
    return 'DeliveryCartItem(cartItemId: $cartItemId, product: $product, priceType: $priceType, sackType: $sackType, quantity: $quantity, sackPriceId: $sackPriceId, perKiloPriceId: $perKiloPriceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryCartItemImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.sackPriceId, sackPriceId) ||
                other.sackPriceId == sackPriceId) &&
            (identical(other.perKiloPriceId, perKiloPriceId) ||
                other.perKiloPriceId == perKiloPriceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemId, product, priceType,
      sackType, quantity, sackPriceId, perKiloPriceId);

  /// Create a copy of DeliveryCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryCartItemImplCopyWith<_$DeliveryCartItemImpl> get copyWith =>
      __$$DeliveryCartItemImplCopyWithImpl<_$DeliveryCartItemImpl>(
          this, _$identity);
}

abstract class _DeliveryCartItem extends DeliveryCartItem {
  const factory _DeliveryCartItem(
      {required final String cartItemId,
      required final Product product,
      required final DeliveryPriceType priceType,
      final SackType? sackType,
      required final double quantity,
      final String? sackPriceId,
      final String? perKiloPriceId}) = _$DeliveryCartItemImpl;
  const _DeliveryCartItem._() : super._();

  /// Unique identifier for this cart entry (not the product ID).
  /// Allows same product with different variants as separate items.
  @override
  String get cartItemId;

  /// The product being delivered.
  @override
  Product get product;

  /// The type of pricing (per kilo or sack).
  @override
  DeliveryPriceType get priceType;

  /// Sack type if applicable (50kg, 25kg, 5kg).
  @override
  SackType? get sackType;

  /// The quantity being delivered.
  /// For per kilo: weight in kg (e.g., 2.5)
  /// For sack: number of sacks (e.g., 3)
  @override
  double get quantity;

  /// The sack price ID if sack type.
  @override
  String? get sackPriceId;

  /// The per kilo price ID if per kilo type.
  @override
  String? get perKiloPriceId;

  /// Create a copy of DeliveryCartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryCartItemImplCopyWith<_$DeliveryCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
