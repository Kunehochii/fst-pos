// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryCashier {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCashierCopyWith<DeliveryCashier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCashierCopyWith<$Res> {
  factory $DeliveryCashierCopyWith(
          DeliveryCashier value, $Res Function(DeliveryCashier) then) =
      _$DeliveryCashierCopyWithImpl<$Res, DeliveryCashier>;
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class _$DeliveryCashierCopyWithImpl<$Res, $Val extends DeliveryCashier>
    implements $DeliveryCashierCopyWith<$Res> {
  _$DeliveryCashierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryCashier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryCashierImplCopyWith<$Res>
    implements $DeliveryCashierCopyWith<$Res> {
  factory _$$DeliveryCashierImplCopyWith(_$DeliveryCashierImpl value,
          $Res Function(_$DeliveryCashierImpl) then) =
      __$$DeliveryCashierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class __$$DeliveryCashierImplCopyWithImpl<$Res>
    extends _$DeliveryCashierCopyWithImpl<$Res, _$DeliveryCashierImpl>
    implements _$$DeliveryCashierImplCopyWith<$Res> {
  __$$DeliveryCashierImplCopyWithImpl(
      _$DeliveryCashierImpl _value, $Res Function(_$DeliveryCashierImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryCashier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_$DeliveryCashierImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeliveryCashierImpl implements _DeliveryCashier {
  const _$DeliveryCashierImpl(
      {required this.id, required this.username, required this.branchName});

  @override
  final String id;
  @override
  final String username;
  @override
  final String branchName;

  @override
  String toString() {
    return 'DeliveryCashier(id: $id, username: $username, branchName: $branchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryCashierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, username, branchName);

  /// Create a copy of DeliveryCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryCashierImplCopyWith<_$DeliveryCashierImpl> get copyWith =>
      __$$DeliveryCashierImplCopyWithImpl<_$DeliveryCashierImpl>(
          this, _$identity);
}

abstract class _DeliveryCashier implements DeliveryCashier {
  const factory _DeliveryCashier(
      {required final String id,
      required final String username,
      required final String branchName}) = _$DeliveryCashierImpl;

  @override
  String get id;
  @override
  String get username;
  @override
  String get branchName;

  /// Create a copy of DeliveryCashier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryCashierImplCopyWith<_$DeliveryCashierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeliveryItem {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get sackPriceId => throw _privateConstructorUsedError;
  SackType? get sackType => throw _privateConstructorUsedError;
  String? get perKiloPriceId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt =>
      throw _privateConstructorUsedError; // Nested entities
  Product? get product => throw _privateConstructorUsedError;
  SackPrice? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPrice? get perKiloPrice => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryItemCopyWith<DeliveryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryItemCopyWith<$Res> {
  factory $DeliveryItemCopyWith(
          DeliveryItem value, $Res Function(DeliveryItem) then) =
      _$DeliveryItemCopyWithImpl<$Res, DeliveryItem>;
  @useResult
  $Res call(
      {String id,
      double quantity,
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
class _$DeliveryItemCopyWithImpl<$Res, $Val extends DeliveryItem>
    implements $DeliveryItemCopyWith<$Res> {
  _$DeliveryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
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

  /// Create a copy of DeliveryItem
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

  /// Create a copy of DeliveryItem
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

  /// Create a copy of DeliveryItem
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
abstract class _$$DeliveryItemImplCopyWith<$Res>
    implements $DeliveryItemCopyWith<$Res> {
  factory _$$DeliveryItemImplCopyWith(
          _$DeliveryItemImpl value, $Res Function(_$DeliveryItemImpl) then) =
      __$$DeliveryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double quantity,
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
class __$$DeliveryItemImplCopyWithImpl<$Res>
    extends _$DeliveryItemCopyWithImpl<$Res, _$DeliveryItemImpl>
    implements _$$DeliveryItemImplCopyWith<$Res> {
  __$$DeliveryItemImplCopyWithImpl(
      _$DeliveryItemImpl _value, $Res Function(_$DeliveryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
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
    return _then(_$DeliveryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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

class _$DeliveryItemImpl extends _DeliveryItem {
  const _$DeliveryItemImpl(
      {required this.id,
      required this.quantity,
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
// Nested entities
  @override
  final Product? product;
  @override
  final SackPrice? sackPrice;
  @override
  final PerKiloPrice? perKiloPrice;

  @override
  String toString() {
    return 'DeliveryItem(id: $id, quantity: $quantity, productId: $productId, sackPriceId: $sackPriceId, sackType: $sackType, perKiloPriceId: $perKiloPriceId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
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
      productId,
      sackPriceId,
      sackType,
      perKiloPriceId,
      createdAt,
      updatedAt,
      product,
      sackPrice,
      perKiloPrice);

  /// Create a copy of DeliveryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryItemImplCopyWith<_$DeliveryItemImpl> get copyWith =>
      __$$DeliveryItemImplCopyWithImpl<_$DeliveryItemImpl>(this, _$identity);
}

abstract class _DeliveryItem extends DeliveryItem {
  const factory _DeliveryItem(
      {required final String id,
      required final double quantity,
      required final String productId,
      final String? sackPriceId,
      final SackType? sackType,
      final String? perKiloPriceId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final Product? product,
      final SackPrice? sackPrice,
      final PerKiloPrice? perKiloPrice}) = _$DeliveryItemImpl;
  const _DeliveryItem._() : super._();

  @override
  String get id;
  @override
  double get quantity;
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
  DateTime get updatedAt; // Nested entities
  @override
  Product? get product;
  @override
  SackPrice? get sackPrice;
  @override
  PerKiloPrice? get perKiloPrice;

  /// Create a copy of DeliveryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryItemImplCopyWith<_$DeliveryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Delivery {
  String get id => throw _privateConstructorUsedError;
  String get driverName => throw _privateConstructorUsedError;
  DateTime get deliveryTimeStart => throw _privateConstructorUsedError;
  String get cashierId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<DeliveryItem> get deliveryItems => throw _privateConstructorUsedError;
  DeliveryCashier? get cashier => throw _privateConstructorUsedError;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCopyWith<Delivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) then) =
      _$DeliveryCopyWithImpl<$Res, Delivery>;
  @useResult
  $Res call(
      {String id,
      String driverName,
      DateTime deliveryTimeStart,
      String cashierId,
      DateTime createdAt,
      DateTime updatedAt,
      List<DeliveryItem> deliveryItems,
      DeliveryCashier? cashier});

  $DeliveryCashierCopyWith<$Res>? get cashier;
}

/// @nodoc
class _$DeliveryCopyWithImpl<$Res, $Val extends Delivery>
    implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverName = null,
    Object? deliveryTimeStart = null,
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryItems = null,
    Object? cashier = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTimeStart: null == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryItems: null == deliveryItems
          ? _value.deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<DeliveryItem>,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as DeliveryCashier?,
    ) as $Val);
  }

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryCashierCopyWith<$Res>? get cashier {
    if (_value.cashier == null) {
      return null;
    }

    return $DeliveryCashierCopyWith<$Res>(_value.cashier!, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryImplCopyWith<$Res>
    implements $DeliveryCopyWith<$Res> {
  factory _$$DeliveryImplCopyWith(
          _$DeliveryImpl value, $Res Function(_$DeliveryImpl) then) =
      __$$DeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String driverName,
      DateTime deliveryTimeStart,
      String cashierId,
      DateTime createdAt,
      DateTime updatedAt,
      List<DeliveryItem> deliveryItems,
      DeliveryCashier? cashier});

  @override
  $DeliveryCashierCopyWith<$Res>? get cashier;
}

/// @nodoc
class __$$DeliveryImplCopyWithImpl<$Res>
    extends _$DeliveryCopyWithImpl<$Res, _$DeliveryImpl>
    implements _$$DeliveryImplCopyWith<$Res> {
  __$$DeliveryImplCopyWithImpl(
      _$DeliveryImpl _value, $Res Function(_$DeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverName = null,
    Object? deliveryTimeStart = null,
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryItems = null,
    Object? cashier = freezed,
  }) {
    return _then(_$DeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTimeStart: null == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryItems: null == deliveryItems
          ? _value._deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<DeliveryItem>,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as DeliveryCashier?,
    ));
  }
}

/// @nodoc

class _$DeliveryImpl extends _Delivery {
  const _$DeliveryImpl(
      {required this.id,
      required this.driverName,
      required this.deliveryTimeStart,
      required this.cashierId,
      required this.createdAt,
      required this.updatedAt,
      required final List<DeliveryItem> deliveryItems,
      this.cashier})
      : _deliveryItems = deliveryItems,
        super._();

  @override
  final String id;
  @override
  final String driverName;
  @override
  final DateTime deliveryTimeStart;
  @override
  final String cashierId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<DeliveryItem> _deliveryItems;
  @override
  List<DeliveryItem> get deliveryItems {
    if (_deliveryItems is EqualUnmodifiableListView) return _deliveryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryItems);
  }

  @override
  final DeliveryCashier? cashier;

  @override
  String toString() {
    return 'Delivery(id: $id, driverName: $driverName, deliveryTimeStart: $deliveryTimeStart, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt, deliveryItems: $deliveryItems, cashier: $cashier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.deliveryTimeStart, deliveryTimeStart) ||
                other.deliveryTimeStart == deliveryTimeStart) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._deliveryItems, _deliveryItems) &&
            (identical(other.cashier, cashier) || other.cashier == cashier));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      driverName,
      deliveryTimeStart,
      cashierId,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_deliveryItems),
      cashier);

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      __$$DeliveryImplCopyWithImpl<_$DeliveryImpl>(this, _$identity);
}

abstract class _Delivery extends Delivery {
  const factory _Delivery(
      {required final String id,
      required final String driverName,
      required final DateTime deliveryTimeStart,
      required final String cashierId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<DeliveryItem> deliveryItems,
      final DeliveryCashier? cashier}) = _$DeliveryImpl;
  const _Delivery._() : super._();

  @override
  String get id;
  @override
  String get driverName;
  @override
  DateTime get deliveryTimeStart;
  @override
  String get cashierId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<DeliveryItem> get deliveryItems;
  @override
  DeliveryCashier? get cashier;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateDeliveryItemDto {
  String get productId => throw _privateConstructorUsedError;
  SackPriceDto? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPriceDto? get perKiloPrice => throw _privateConstructorUsedError;

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDeliveryItemDtoCopyWith<CreateDeliveryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDeliveryItemDtoCopyWith<$Res> {
  factory $CreateDeliveryItemDtoCopyWith(CreateDeliveryItemDto value,
          $Res Function(CreateDeliveryItemDto) then) =
      _$CreateDeliveryItemDtoCopyWithImpl<$Res, CreateDeliveryItemDto>;
  @useResult
  $Res call(
      {String productId,
      SackPriceDto? sackPrice,
      PerKiloPriceDto? perKiloPrice});

  $SackPriceDtoCopyWith<$Res>? get sackPrice;
  $PerKiloPriceDtoCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class _$CreateDeliveryItemDtoCopyWithImpl<$Res,
        $Val extends CreateDeliveryItemDto>
    implements $CreateDeliveryItemDtoCopyWith<$Res> {
  _$CreateDeliveryItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceDto?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceDto?,
    ) as $Val);
  }

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SackPriceDtoCopyWith<$Res>? get sackPrice {
    if (_value.sackPrice == null) {
      return null;
    }

    return $SackPriceDtoCopyWith<$Res>(_value.sackPrice!, (value) {
      return _then(_value.copyWith(sackPrice: value) as $Val);
    });
  }

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerKiloPriceDtoCopyWith<$Res>? get perKiloPrice {
    if (_value.perKiloPrice == null) {
      return null;
    }

    return $PerKiloPriceDtoCopyWith<$Res>(_value.perKiloPrice!, (value) {
      return _then(_value.copyWith(perKiloPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateDeliveryItemDtoImplCopyWith<$Res>
    implements $CreateDeliveryItemDtoCopyWith<$Res> {
  factory _$$CreateDeliveryItemDtoImplCopyWith(
          _$CreateDeliveryItemDtoImpl value,
          $Res Function(_$CreateDeliveryItemDtoImpl) then) =
      __$$CreateDeliveryItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      SackPriceDto? sackPrice,
      PerKiloPriceDto? perKiloPrice});

  @override
  $SackPriceDtoCopyWith<$Res>? get sackPrice;
  @override
  $PerKiloPriceDtoCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class __$$CreateDeliveryItemDtoImplCopyWithImpl<$Res>
    extends _$CreateDeliveryItemDtoCopyWithImpl<$Res,
        _$CreateDeliveryItemDtoImpl>
    implements _$$CreateDeliveryItemDtoImplCopyWith<$Res> {
  __$$CreateDeliveryItemDtoImplCopyWithImpl(_$CreateDeliveryItemDtoImpl _value,
      $Res Function(_$CreateDeliveryItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
  }) {
    return _then(_$CreateDeliveryItemDtoImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceDto?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceDto?,
    ));
  }
}

/// @nodoc

class _$CreateDeliveryItemDtoImpl implements _CreateDeliveryItemDto {
  const _$CreateDeliveryItemDtoImpl(
      {required this.productId, this.sackPrice, this.perKiloPrice});

  @override
  final String productId;
  @override
  final SackPriceDto? sackPrice;
  @override
  final PerKiloPriceDto? perKiloPrice;

  @override
  String toString() {
    return 'CreateDeliveryItemDto(productId: $productId, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDeliveryItemDtoImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sackPrice, sackPrice) ||
                other.sackPrice == sackPrice) &&
            (identical(other.perKiloPrice, perKiloPrice) ||
                other.perKiloPrice == perKiloPrice));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, sackPrice, perKiloPrice);

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDeliveryItemDtoImplCopyWith<_$CreateDeliveryItemDtoImpl>
      get copyWith => __$$CreateDeliveryItemDtoImplCopyWithImpl<
          _$CreateDeliveryItemDtoImpl>(this, _$identity);
}

abstract class _CreateDeliveryItemDto implements CreateDeliveryItemDto {
  const factory _CreateDeliveryItemDto(
      {required final String productId,
      final SackPriceDto? sackPrice,
      final PerKiloPriceDto? perKiloPrice}) = _$CreateDeliveryItemDtoImpl;

  @override
  String get productId;
  @override
  SackPriceDto? get sackPrice;
  @override
  PerKiloPriceDto? get perKiloPrice;

  /// Create a copy of CreateDeliveryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDeliveryItemDtoImplCopyWith<_$CreateDeliveryItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SackPriceDto {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  SackType get type => throw _privateConstructorUsedError;

  /// Create a copy of SackPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SackPriceDtoCopyWith<SackPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SackPriceDtoCopyWith<$Res> {
  factory $SackPriceDtoCopyWith(
          SackPriceDto value, $Res Function(SackPriceDto) then) =
      _$SackPriceDtoCopyWithImpl<$Res, SackPriceDto>;
  @useResult
  $Res call({String id, double quantity, SackType type});
}

/// @nodoc
class _$SackPriceDtoCopyWithImpl<$Res, $Val extends SackPriceDto>
    implements $SackPriceDtoCopyWith<$Res> {
  _$SackPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SackPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? type = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SackType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SackPriceDtoImplCopyWith<$Res>
    implements $SackPriceDtoCopyWith<$Res> {
  factory _$$SackPriceDtoImplCopyWith(
          _$SackPriceDtoImpl value, $Res Function(_$SackPriceDtoImpl) then) =
      __$$SackPriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double quantity, SackType type});
}

/// @nodoc
class __$$SackPriceDtoImplCopyWithImpl<$Res>
    extends _$SackPriceDtoCopyWithImpl<$Res, _$SackPriceDtoImpl>
    implements _$$SackPriceDtoImplCopyWith<$Res> {
  __$$SackPriceDtoImplCopyWithImpl(
      _$SackPriceDtoImpl _value, $Res Function(_$SackPriceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SackPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? type = null,
  }) {
    return _then(_$SackPriceDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SackType,
    ));
  }
}

/// @nodoc

class _$SackPriceDtoImpl implements _SackPriceDto {
  const _$SackPriceDtoImpl(
      {required this.id, required this.quantity, required this.type});

  @override
  final String id;
  @override
  final double quantity;
  @override
  final SackType type;

  @override
  String toString() {
    return 'SackPriceDto(id: $id, quantity: $quantity, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SackPriceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, type);

  /// Create a copy of SackPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SackPriceDtoImplCopyWith<_$SackPriceDtoImpl> get copyWith =>
      __$$SackPriceDtoImplCopyWithImpl<_$SackPriceDtoImpl>(this, _$identity);
}

abstract class _SackPriceDto implements SackPriceDto {
  const factory _SackPriceDto(
      {required final String id,
      required final double quantity,
      required final SackType type}) = _$SackPriceDtoImpl;

  @override
  String get id;
  @override
  double get quantity;
  @override
  SackType get type;

  /// Create a copy of SackPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SackPriceDtoImplCopyWith<_$SackPriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PerKiloPriceDto {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  /// Create a copy of PerKiloPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerKiloPriceDtoCopyWith<PerKiloPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerKiloPriceDtoCopyWith<$Res> {
  factory $PerKiloPriceDtoCopyWith(
          PerKiloPriceDto value, $Res Function(PerKiloPriceDto) then) =
      _$PerKiloPriceDtoCopyWithImpl<$Res, PerKiloPriceDto>;
  @useResult
  $Res call({String id, double quantity});
}

/// @nodoc
class _$PerKiloPriceDtoCopyWithImpl<$Res, $Val extends PerKiloPriceDto>
    implements $PerKiloPriceDtoCopyWith<$Res> {
  _$PerKiloPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerKiloPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerKiloPriceDtoImplCopyWith<$Res>
    implements $PerKiloPriceDtoCopyWith<$Res> {
  factory _$$PerKiloPriceDtoImplCopyWith(_$PerKiloPriceDtoImpl value,
          $Res Function(_$PerKiloPriceDtoImpl) then) =
      __$$PerKiloPriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double quantity});
}

/// @nodoc
class __$$PerKiloPriceDtoImplCopyWithImpl<$Res>
    extends _$PerKiloPriceDtoCopyWithImpl<$Res, _$PerKiloPriceDtoImpl>
    implements _$$PerKiloPriceDtoImplCopyWith<$Res> {
  __$$PerKiloPriceDtoImplCopyWithImpl(
      _$PerKiloPriceDtoImpl _value, $Res Function(_$PerKiloPriceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerKiloPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
  }) {
    return _then(_$PerKiloPriceDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PerKiloPriceDtoImpl implements _PerKiloPriceDto {
  const _$PerKiloPriceDtoImpl({required this.id, required this.quantity});

  @override
  final String id;
  @override
  final double quantity;

  @override
  String toString() {
    return 'PerKiloPriceDto(id: $id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerKiloPriceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, quantity);

  /// Create a copy of PerKiloPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerKiloPriceDtoImplCopyWith<_$PerKiloPriceDtoImpl> get copyWith =>
      __$$PerKiloPriceDtoImplCopyWithImpl<_$PerKiloPriceDtoImpl>(
          this, _$identity);
}

abstract class _PerKiloPriceDto implements PerKiloPriceDto {
  const factory _PerKiloPriceDto(
      {required final String id,
      required final double quantity}) = _$PerKiloPriceDtoImpl;

  @override
  String get id;
  @override
  double get quantity;

  /// Create a copy of PerKiloPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerKiloPriceDtoImplCopyWith<_$PerKiloPriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateDeliveryDto {
  String get driverName => throw _privateConstructorUsedError;
  DateTime get deliveryTimeStart => throw _privateConstructorUsedError;
  List<CreateDeliveryItemDto> get deliveryItems =>
      throw _privateConstructorUsedError;

  /// Create a copy of CreateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDeliveryDtoCopyWith<CreateDeliveryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDeliveryDtoCopyWith<$Res> {
  factory $CreateDeliveryDtoCopyWith(
          CreateDeliveryDto value, $Res Function(CreateDeliveryDto) then) =
      _$CreateDeliveryDtoCopyWithImpl<$Res, CreateDeliveryDto>;
  @useResult
  $Res call(
      {String driverName,
      DateTime deliveryTimeStart,
      List<CreateDeliveryItemDto> deliveryItems});
}

/// @nodoc
class _$CreateDeliveryDtoCopyWithImpl<$Res, $Val extends CreateDeliveryDto>
    implements $CreateDeliveryDtoCopyWith<$Res> {
  _$CreateDeliveryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = null,
    Object? deliveryTimeStart = null,
    Object? deliveryItems = null,
  }) {
    return _then(_value.copyWith(
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTimeStart: null == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryItems: null == deliveryItems
          ? _value.deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateDeliveryDtoImplCopyWith<$Res>
    implements $CreateDeliveryDtoCopyWith<$Res> {
  factory _$$CreateDeliveryDtoImplCopyWith(_$CreateDeliveryDtoImpl value,
          $Res Function(_$CreateDeliveryDtoImpl) then) =
      __$$CreateDeliveryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String driverName,
      DateTime deliveryTimeStart,
      List<CreateDeliveryItemDto> deliveryItems});
}

/// @nodoc
class __$$CreateDeliveryDtoImplCopyWithImpl<$Res>
    extends _$CreateDeliveryDtoCopyWithImpl<$Res, _$CreateDeliveryDtoImpl>
    implements _$$CreateDeliveryDtoImplCopyWith<$Res> {
  __$$CreateDeliveryDtoImplCopyWithImpl(_$CreateDeliveryDtoImpl _value,
      $Res Function(_$CreateDeliveryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = null,
    Object? deliveryTimeStart = null,
    Object? deliveryItems = null,
  }) {
    return _then(_$CreateDeliveryDtoImpl(
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTimeStart: null == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryItems: null == deliveryItems
          ? _value._deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemDto>,
    ));
  }
}

/// @nodoc

class _$CreateDeliveryDtoImpl implements _CreateDeliveryDto {
  const _$CreateDeliveryDtoImpl(
      {required this.driverName,
      required this.deliveryTimeStart,
      required final List<CreateDeliveryItemDto> deliveryItems})
      : _deliveryItems = deliveryItems;

  @override
  final String driverName;
  @override
  final DateTime deliveryTimeStart;
  final List<CreateDeliveryItemDto> _deliveryItems;
  @override
  List<CreateDeliveryItemDto> get deliveryItems {
    if (_deliveryItems is EqualUnmodifiableListView) return _deliveryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryItems);
  }

  @override
  String toString() {
    return 'CreateDeliveryDto(driverName: $driverName, deliveryTimeStart: $deliveryTimeStart, deliveryItems: $deliveryItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDeliveryDtoImpl &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.deliveryTimeStart, deliveryTimeStart) ||
                other.deliveryTimeStart == deliveryTimeStart) &&
            const DeepCollectionEquality()
                .equals(other._deliveryItems, _deliveryItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, driverName, deliveryTimeStart,
      const DeepCollectionEquality().hash(_deliveryItems));

  /// Create a copy of CreateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDeliveryDtoImplCopyWith<_$CreateDeliveryDtoImpl> get copyWith =>
      __$$CreateDeliveryDtoImplCopyWithImpl<_$CreateDeliveryDtoImpl>(
          this, _$identity);
}

abstract class _CreateDeliveryDto implements CreateDeliveryDto {
  const factory _CreateDeliveryDto(
          {required final String driverName,
          required final DateTime deliveryTimeStart,
          required final List<CreateDeliveryItemDto> deliveryItems}) =
      _$CreateDeliveryDtoImpl;

  @override
  String get driverName;
  @override
  DateTime get deliveryTimeStart;
  @override
  List<CreateDeliveryItemDto> get deliveryItems;

  /// Create a copy of CreateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDeliveryDtoImplCopyWith<_$CreateDeliveryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateDeliveryDto {
  String? get driverName => throw _privateConstructorUsedError;
  DateTime? get deliveryTimeStart => throw _privateConstructorUsedError;
  List<CreateDeliveryItemDto>? get deliveryItems =>
      throw _privateConstructorUsedError;

  /// Create a copy of UpdateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateDeliveryDtoCopyWith<UpdateDeliveryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDeliveryDtoCopyWith<$Res> {
  factory $UpdateDeliveryDtoCopyWith(
          UpdateDeliveryDto value, $Res Function(UpdateDeliveryDto) then) =
      _$UpdateDeliveryDtoCopyWithImpl<$Res, UpdateDeliveryDto>;
  @useResult
  $Res call(
      {String? driverName,
      DateTime? deliveryTimeStart,
      List<CreateDeliveryItemDto>? deliveryItems});
}

/// @nodoc
class _$UpdateDeliveryDtoCopyWithImpl<$Res, $Val extends UpdateDeliveryDto>
    implements $UpdateDeliveryDtoCopyWith<$Res> {
  _$UpdateDeliveryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = freezed,
    Object? deliveryTimeStart = freezed,
    Object? deliveryItems = freezed,
  }) {
    return _then(_value.copyWith(
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTimeStart: freezed == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryItems: freezed == deliveryItems
          ? _value.deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateDeliveryDtoImplCopyWith<$Res>
    implements $UpdateDeliveryDtoCopyWith<$Res> {
  factory _$$UpdateDeliveryDtoImplCopyWith(_$UpdateDeliveryDtoImpl value,
          $Res Function(_$UpdateDeliveryDtoImpl) then) =
      __$$UpdateDeliveryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? driverName,
      DateTime? deliveryTimeStart,
      List<CreateDeliveryItemDto>? deliveryItems});
}

/// @nodoc
class __$$UpdateDeliveryDtoImplCopyWithImpl<$Res>
    extends _$UpdateDeliveryDtoCopyWithImpl<$Res, _$UpdateDeliveryDtoImpl>
    implements _$$UpdateDeliveryDtoImplCopyWith<$Res> {
  __$$UpdateDeliveryDtoImplCopyWithImpl(_$UpdateDeliveryDtoImpl _value,
      $Res Function(_$UpdateDeliveryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = freezed,
    Object? deliveryTimeStart = freezed,
    Object? deliveryItems = freezed,
  }) {
    return _then(_$UpdateDeliveryDtoImpl(
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTimeStart: freezed == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryItems: freezed == deliveryItems
          ? _value._deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemDto>?,
    ));
  }
}

/// @nodoc

class _$UpdateDeliveryDtoImpl implements _UpdateDeliveryDto {
  const _$UpdateDeliveryDtoImpl(
      {this.driverName,
      this.deliveryTimeStart,
      final List<CreateDeliveryItemDto>? deliveryItems})
      : _deliveryItems = deliveryItems;

  @override
  final String? driverName;
  @override
  final DateTime? deliveryTimeStart;
  final List<CreateDeliveryItemDto>? _deliveryItems;
  @override
  List<CreateDeliveryItemDto>? get deliveryItems {
    final value = _deliveryItems;
    if (value == null) return null;
    if (_deliveryItems is EqualUnmodifiableListView) return _deliveryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpdateDeliveryDto(driverName: $driverName, deliveryTimeStart: $deliveryTimeStart, deliveryItems: $deliveryItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeliveryDtoImpl &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.deliveryTimeStart, deliveryTimeStart) ||
                other.deliveryTimeStart == deliveryTimeStart) &&
            const DeepCollectionEquality()
                .equals(other._deliveryItems, _deliveryItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, driverName, deliveryTimeStart,
      const DeepCollectionEquality().hash(_deliveryItems));

  /// Create a copy of UpdateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDeliveryDtoImplCopyWith<_$UpdateDeliveryDtoImpl> get copyWith =>
      __$$UpdateDeliveryDtoImplCopyWithImpl<_$UpdateDeliveryDtoImpl>(
          this, _$identity);
}

abstract class _UpdateDeliveryDto implements UpdateDeliveryDto {
  const factory _UpdateDeliveryDto(
          {final String? driverName,
          final DateTime? deliveryTimeStart,
          final List<CreateDeliveryItemDto>? deliveryItems}) =
      _$UpdateDeliveryDtoImpl;

  @override
  String? get driverName;
  @override
  DateTime? get deliveryTimeStart;
  @override
  List<CreateDeliveryItemDto>? get deliveryItems;

  /// Create a copy of UpdateDeliveryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDeliveryDtoImplCopyWith<_$UpdateDeliveryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeliveryFilter {
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  String? get productSearch => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryFilterCopyWith<DeliveryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryFilterCopyWith<$Res> {
  factory $DeliveryFilterCopyWith(
          DeliveryFilter value, $Res Function(DeliveryFilter) then) =
      _$DeliveryFilterCopyWithImpl<$Res, DeliveryFilter>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? productId,
      String? productSearch});
}

/// @nodoc
class _$DeliveryFilterCopyWithImpl<$Res, $Val extends DeliveryFilter>
    implements $DeliveryFilterCopyWith<$Res> {
  _$DeliveryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? productId = freezed,
    Object? productSearch = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productSearch: freezed == productSearch
          ? _value.productSearch
          : productSearch // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryFilterImplCopyWith<$Res>
    implements $DeliveryFilterCopyWith<$Res> {
  factory _$$DeliveryFilterImplCopyWith(_$DeliveryFilterImpl value,
          $Res Function(_$DeliveryFilterImpl) then) =
      __$$DeliveryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? productId,
      String? productSearch});
}

/// @nodoc
class __$$DeliveryFilterImplCopyWithImpl<$Res>
    extends _$DeliveryFilterCopyWithImpl<$Res, _$DeliveryFilterImpl>
    implements _$$DeliveryFilterImplCopyWith<$Res> {
  __$$DeliveryFilterImplCopyWithImpl(
      _$DeliveryFilterImpl _value, $Res Function(_$DeliveryFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? productId = freezed,
    Object? productSearch = freezed,
  }) {
    return _then(_$DeliveryFilterImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productSearch: freezed == productSearch
          ? _value.productSearch
          : productSearch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeliveryFilterImpl implements _DeliveryFilter {
  const _$DeliveryFilterImpl(
      {this.startDate, this.endDate, this.productId, this.productSearch});

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? productId;
  @override
  final String? productSearch;

  @override
  String toString() {
    return 'DeliveryFilter(startDate: $startDate, endDate: $endDate, productId: $productId, productSearch: $productSearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryFilterImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productSearch, productSearch) ||
                other.productSearch == productSearch));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startDate, endDate, productId, productSearch);

  /// Create a copy of DeliveryFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryFilterImplCopyWith<_$DeliveryFilterImpl> get copyWith =>
      __$$DeliveryFilterImplCopyWithImpl<_$DeliveryFilterImpl>(
          this, _$identity);
}

abstract class _DeliveryFilter implements DeliveryFilter {
  const factory _DeliveryFilter(
      {final DateTime? startDate,
      final DateTime? endDate,
      final String? productId,
      final String? productSearch}) = _$DeliveryFilterImpl;

  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get productId;
  @override
  String? get productSearch;

  /// Create a copy of DeliveryFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryFilterImplCopyWith<_$DeliveryFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
