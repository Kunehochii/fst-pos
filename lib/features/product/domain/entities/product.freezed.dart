// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpecialPrice {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get minimumQty => throw _privateConstructorUsedError;
  double? get profit => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of SpecialPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialPriceCopyWith<SpecialPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialPriceCopyWith<$Res> {
  factory $SpecialPriceCopyWith(
          SpecialPrice value, $Res Function(SpecialPrice) then) =
      _$SpecialPriceCopyWithImpl<$Res, SpecialPrice>;
  @useResult
  $Res call(
      {String id,
      double price,
      double minimumQty,
      double? profit,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SpecialPriceCopyWithImpl<$Res, $Val extends SpecialPrice>
    implements $SpecialPriceCopyWith<$Res> {
  _$SpecialPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? minimumQty = null,
    Object? profit = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQty: null == minimumQty
          ? _value.minimumQty
          : minimumQty // ignore: cast_nullable_to_non_nullable
              as double,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialPriceImplCopyWith<$Res>
    implements $SpecialPriceCopyWith<$Res> {
  factory _$$SpecialPriceImplCopyWith(
          _$SpecialPriceImpl value, $Res Function(_$SpecialPriceImpl) then) =
      __$$SpecialPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      double minimumQty,
      double? profit,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SpecialPriceImplCopyWithImpl<$Res>
    extends _$SpecialPriceCopyWithImpl<$Res, _$SpecialPriceImpl>
    implements _$$SpecialPriceImplCopyWith<$Res> {
  __$$SpecialPriceImplCopyWithImpl(
      _$SpecialPriceImpl _value, $Res Function(_$SpecialPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? minimumQty = null,
    Object? profit = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SpecialPriceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQty: null == minimumQty
          ? _value.minimumQty
          : minimumQty // ignore: cast_nullable_to_non_nullable
              as double,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SpecialPriceImpl implements _SpecialPrice {
  const _$SpecialPriceImpl(
      {required this.id,
      required this.price,
      required this.minimumQty,
      this.profit,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final double price;
  @override
  final double minimumQty;
  @override
  final double? profit;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SpecialPrice(id: $id, price: $price, minimumQty: $minimumQty, profit: $profit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.minimumQty, minimumQty) ||
                other.minimumQty == minimumQty) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, price, minimumQty, profit, createdAt, updatedAt);

  /// Create a copy of SpecialPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialPriceImplCopyWith<_$SpecialPriceImpl> get copyWith =>
      __$$SpecialPriceImplCopyWithImpl<_$SpecialPriceImpl>(this, _$identity);
}

abstract class _SpecialPrice implements SpecialPrice {
  const factory _SpecialPrice(
      {required final String id,
      required final double price,
      required final double minimumQty,
      final double? profit,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SpecialPriceImpl;

  @override
  String get id;
  @override
  double get price;
  @override
  double get minimumQty;
  @override
  double? get profit;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of SpecialPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialPriceImplCopyWith<_$SpecialPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SackPrice {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;
  SackType get type => throw _privateConstructorUsedError;
  double? get profit => throw _privateConstructorUsedError;
  SpecialPrice? get specialPrice => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of SackPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SackPriceCopyWith<SackPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SackPriceCopyWith<$Res> {
  factory $SackPriceCopyWith(SackPrice value, $Res Function(SackPrice) then) =
      _$SackPriceCopyWithImpl<$Res, SackPrice>;
  @useResult
  $Res call(
      {String id,
      double price,
      double stock,
      SackType type,
      double? profit,
      SpecialPrice? specialPrice,
      DateTime createdAt,
      DateTime updatedAt});

  $SpecialPriceCopyWith<$Res>? get specialPrice;
}

/// @nodoc
class _$SackPriceCopyWithImpl<$Res, $Val extends SackPrice>
    implements $SackPriceCopyWith<$Res> {
  _$SackPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SackPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? stock = null,
    Object? type = null,
    Object? profit = freezed,
    Object? specialPrice = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SackType,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double?,
      specialPrice: freezed == specialPrice
          ? _value.specialPrice
          : specialPrice // ignore: cast_nullable_to_non_nullable
              as SpecialPrice?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of SackPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialPriceCopyWith<$Res>? get specialPrice {
    if (_value.specialPrice == null) {
      return null;
    }

    return $SpecialPriceCopyWith<$Res>(_value.specialPrice!, (value) {
      return _then(_value.copyWith(specialPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SackPriceImplCopyWith<$Res>
    implements $SackPriceCopyWith<$Res> {
  factory _$$SackPriceImplCopyWith(
          _$SackPriceImpl value, $Res Function(_$SackPriceImpl) then) =
      __$$SackPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      double stock,
      SackType type,
      double? profit,
      SpecialPrice? specialPrice,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $SpecialPriceCopyWith<$Res>? get specialPrice;
}

/// @nodoc
class __$$SackPriceImplCopyWithImpl<$Res>
    extends _$SackPriceCopyWithImpl<$Res, _$SackPriceImpl>
    implements _$$SackPriceImplCopyWith<$Res> {
  __$$SackPriceImplCopyWithImpl(
      _$SackPriceImpl _value, $Res Function(_$SackPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SackPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? stock = null,
    Object? type = null,
    Object? profit = freezed,
    Object? specialPrice = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SackPriceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SackType,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double?,
      specialPrice: freezed == specialPrice
          ? _value.specialPrice
          : specialPrice // ignore: cast_nullable_to_non_nullable
              as SpecialPrice?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SackPriceImpl implements _SackPrice {
  const _$SackPriceImpl(
      {required this.id,
      required this.price,
      required this.stock,
      required this.type,
      this.profit,
      this.specialPrice,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final double price;
  @override
  final double stock;
  @override
  final SackType type;
  @override
  final double? profit;
  @override
  final SpecialPrice? specialPrice;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SackPrice(id: $id, price: $price, stock: $stock, type: $type, profit: $profit, specialPrice: $specialPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SackPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.specialPrice, specialPrice) ||
                other.specialPrice == specialPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, price, stock, type, profit,
      specialPrice, createdAt, updatedAt);

  /// Create a copy of SackPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SackPriceImplCopyWith<_$SackPriceImpl> get copyWith =>
      __$$SackPriceImplCopyWithImpl<_$SackPriceImpl>(this, _$identity);
}

abstract class _SackPrice implements SackPrice {
  const factory _SackPrice(
      {required final String id,
      required final double price,
      required final double stock,
      required final SackType type,
      final double? profit,
      final SpecialPrice? specialPrice,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SackPriceImpl;

  @override
  String get id;
  @override
  double get price;
  @override
  double get stock;
  @override
  SackType get type;
  @override
  double? get profit;
  @override
  SpecialPrice? get specialPrice;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of SackPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SackPriceImplCopyWith<_$SackPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PerKiloPrice {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get stock => throw _privateConstructorUsedError;
  double? get profit => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of PerKiloPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerKiloPriceCopyWith<PerKiloPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerKiloPriceCopyWith<$Res> {
  factory $PerKiloPriceCopyWith(
          PerKiloPrice value, $Res Function(PerKiloPrice) then) =
      _$PerKiloPriceCopyWithImpl<$Res, PerKiloPrice>;
  @useResult
  $Res call(
      {String id,
      double price,
      double stock,
      double? profit,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PerKiloPriceCopyWithImpl<$Res, $Val extends PerKiloPrice>
    implements $PerKiloPriceCopyWith<$Res> {
  _$PerKiloPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerKiloPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? stock = null,
    Object? profit = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerKiloPriceImplCopyWith<$Res>
    implements $PerKiloPriceCopyWith<$Res> {
  factory _$$PerKiloPriceImplCopyWith(
          _$PerKiloPriceImpl value, $Res Function(_$PerKiloPriceImpl) then) =
      __$$PerKiloPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      double stock,
      double? profit,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PerKiloPriceImplCopyWithImpl<$Res>
    extends _$PerKiloPriceCopyWithImpl<$Res, _$PerKiloPriceImpl>
    implements _$$PerKiloPriceImplCopyWith<$Res> {
  __$$PerKiloPriceImplCopyWithImpl(
      _$PerKiloPriceImpl _value, $Res Function(_$PerKiloPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerKiloPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? stock = null,
    Object? profit = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PerKiloPriceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as double,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PerKiloPriceImpl implements _PerKiloPrice {
  const _$PerKiloPriceImpl(
      {required this.id,
      required this.price,
      required this.stock,
      this.profit,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final double price;
  @override
  final double stock;
  @override
  final double? profit;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PerKiloPrice(id: $id, price: $price, stock: $stock, profit: $profit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerKiloPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, stock, profit, createdAt, updatedAt);

  /// Create a copy of PerKiloPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerKiloPriceImplCopyWith<_$PerKiloPriceImpl> get copyWith =>
      __$$PerKiloPriceImplCopyWithImpl<_$PerKiloPriceImpl>(this, _$identity);
}

abstract class _PerKiloPrice implements PerKiloPrice {
  const factory _PerKiloPrice(
      {required final String id,
      required final double price,
      required final double stock,
      final double? profit,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PerKiloPriceImpl;

  @override
  String get id;
  @override
  double get price;
  @override
  double get stock;
  @override
  double? get profit;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of PerKiloPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerKiloPriceImplCopyWith<_$PerKiloPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductCashier {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;
  String get businessId => throw _privateConstructorUsedError;

  /// Create a copy of ProductCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCashierCopyWith<ProductCashier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCashierCopyWith<$Res> {
  factory $ProductCashierCopyWith(
          ProductCashier value, $Res Function(ProductCashier) then) =
      _$ProductCashierCopyWithImpl<$Res, ProductCashier>;
  @useResult
  $Res call({String id, String username, String branchName, String businessId});
}

/// @nodoc
class _$ProductCashierCopyWithImpl<$Res, $Val extends ProductCashier>
    implements $ProductCashierCopyWith<$Res> {
  _$ProductCashierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCashier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
    Object? businessId = null,
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
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCashierImplCopyWith<$Res>
    implements $ProductCashierCopyWith<$Res> {
  factory _$$ProductCashierImplCopyWith(_$ProductCashierImpl value,
          $Res Function(_$ProductCashierImpl) then) =
      __$$ProductCashierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String branchName, String businessId});
}

/// @nodoc
class __$$ProductCashierImplCopyWithImpl<$Res>
    extends _$ProductCashierCopyWithImpl<$Res, _$ProductCashierImpl>
    implements _$$ProductCashierImplCopyWith<$Res> {
  __$$ProductCashierImplCopyWithImpl(
      _$ProductCashierImpl _value, $Res Function(_$ProductCashierImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductCashier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
    Object? businessId = null,
  }) {
    return _then(_$ProductCashierImpl(
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
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductCashierImpl implements _ProductCashier {
  const _$ProductCashierImpl(
      {required this.id,
      required this.username,
      required this.branchName,
      required this.businessId});

  @override
  final String id;
  @override
  final String username;
  @override
  final String branchName;
  @override
  final String businessId;

  @override
  String toString() {
    return 'ProductCashier(id: $id, username: $username, branchName: $branchName, businessId: $businessId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCashierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, branchName, businessId);

  /// Create a copy of ProductCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCashierImplCopyWith<_$ProductCashierImpl> get copyWith =>
      __$$ProductCashierImplCopyWithImpl<_$ProductCashierImpl>(
          this, _$identity);
}

abstract class _ProductCashier implements ProductCashier {
  const factory _ProductCashier(
      {required final String id,
      required final String username,
      required final String branchName,
      required final String businessId}) = _$ProductCashierImpl;

  @override
  String get id;
  @override
  String get username;
  @override
  String get branchName;
  @override
  String get businessId;

  /// Create a copy of ProductCashier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCashierImplCopyWith<_$ProductCashierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  ProductCategory get category => throw _privateConstructorUsedError;
  String get cashierId => throw _privateConstructorUsedError;
  List<SackPrice> get sackPrices => throw _privateConstructorUsedError;
  PerKiloPrice? get perKiloPrice => throw _privateConstructorUsedError;
  ProductCashier? get cashier => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String id,
      String name,
      String picture,
      ProductCategory category,
      String cashierId,
      List<SackPrice> sackPrices,
      PerKiloPrice? perKiloPrice,
      ProductCashier? cashier,
      DateTime createdAt,
      DateTime updatedAt});

  $PerKiloPriceCopyWith<$Res>? get perKiloPrice;
  $ProductCashierCopyWith<$Res>? get cashier;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? picture = null,
    Object? category = null,
    Object? cashierId = null,
    Object? sackPrices = null,
    Object? perKiloPrice = freezed,
    Object? cashier = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrices: null == sackPrices
          ? _value.sackPrices
          : sackPrices // ignore: cast_nullable_to_non_nullable
              as List<SackPrice>,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPrice?,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as ProductCashier?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Product
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

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCashierCopyWith<$Res>? get cashier {
    if (_value.cashier == null) {
      return null;
    }

    return $ProductCashierCopyWith<$Res>(_value.cashier!, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String picture,
      ProductCategory category,
      String cashierId,
      List<SackPrice> sackPrices,
      PerKiloPrice? perKiloPrice,
      ProductCashier? cashier,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $PerKiloPriceCopyWith<$Res>? get perKiloPrice;
  @override
  $ProductCashierCopyWith<$Res>? get cashier;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? picture = null,
    Object? category = null,
    Object? cashierId = null,
    Object? sackPrices = null,
    Object? perKiloPrice = freezed,
    Object? cashier = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrices: null == sackPrices
          ? _value._sackPrices
          : sackPrices // ignore: cast_nullable_to_non_nullable
              as List<SackPrice>,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPrice?,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as ProductCashier?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {required this.id,
      required this.name,
      required this.picture,
      required this.category,
      required this.cashierId,
      required final List<SackPrice> sackPrices,
      this.perKiloPrice,
      this.cashier,
      required this.createdAt,
      required this.updatedAt})
      : _sackPrices = sackPrices,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String picture;
  @override
  final ProductCategory category;
  @override
  final String cashierId;
  final List<SackPrice> _sackPrices;
  @override
  List<SackPrice> get sackPrices {
    if (_sackPrices is EqualUnmodifiableListView) return _sackPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sackPrices);
  }

  @override
  final PerKiloPrice? perKiloPrice;
  @override
  final ProductCashier? cashier;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, picture: $picture, category: $category, cashierId: $cashierId, sackPrices: $sackPrices, perKiloPrice: $perKiloPrice, cashier: $cashier, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            const DeepCollectionEquality()
                .equals(other._sackPrices, _sackPrices) &&
            (identical(other.perKiloPrice, perKiloPrice) ||
                other.perKiloPrice == perKiloPrice) &&
            (identical(other.cashier, cashier) || other.cashier == cashier) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      picture,
      category,
      cashierId,
      const DeepCollectionEquality().hash(_sackPrices),
      perKiloPrice,
      cashier,
      createdAt,
      updatedAt);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);
}

abstract class _Product extends Product {
  const factory _Product(
      {required final String id,
      required final String name,
      required final String picture,
      required final ProductCategory category,
      required final String cashierId,
      required final List<SackPrice> sackPrices,
      final PerKiloPrice? perKiloPrice,
      final ProductCashier? cashier,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ProductImpl;
  const _Product._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get picture;
  @override
  ProductCategory get category;
  @override
  String get cashierId;
  @override
  List<SackPrice> get sackPrices;
  @override
  PerKiloPrice? get perKiloPrice;
  @override
  ProductCashier? get cashier;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductFilter {
  ProductCategory? get category => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductFilterCopyWith<ProductFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterCopyWith<$Res> {
  factory $ProductFilterCopyWith(
          ProductFilter value, $Res Function(ProductFilter) then) =
      _$ProductFilterCopyWithImpl<$Res, ProductFilter>;
  @useResult
  $Res call({ProductCategory? category, String? searchQuery});
}

/// @nodoc
class _$ProductFilterCopyWithImpl<$Res, $Val extends ProductFilter>
    implements $ProductFilterCopyWith<$Res> {
  _$ProductFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFilterImplCopyWith<$Res>
    implements $ProductFilterCopyWith<$Res> {
  factory _$$ProductFilterImplCopyWith(
          _$ProductFilterImpl value, $Res Function(_$ProductFilterImpl) then) =
      __$$ProductFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductCategory? category, String? searchQuery});
}

/// @nodoc
class __$$ProductFilterImplCopyWithImpl<$Res>
    extends _$ProductFilterCopyWithImpl<$Res, _$ProductFilterImpl>
    implements _$$ProductFilterImplCopyWith<$Res> {
  __$$ProductFilterImplCopyWithImpl(
      _$ProductFilterImpl _value, $Res Function(_$ProductFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$ProductFilterImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProductFilterImpl implements _ProductFilter {
  const _$ProductFilterImpl({this.category, this.searchQuery});

  @override
  final ProductCategory? category;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'ProductFilter(category: $category, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFilterImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, searchQuery);

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFilterImplCopyWith<_$ProductFilterImpl> get copyWith =>
      __$$ProductFilterImplCopyWithImpl<_$ProductFilterImpl>(this, _$identity);
}

abstract class _ProductFilter implements ProductFilter {
  const factory _ProductFilter(
      {final ProductCategory? category,
      final String? searchQuery}) = _$ProductFilterImpl;

  @override
  ProductCategory? get category;
  @override
  String? get searchQuery;

  /// Create a copy of ProductFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductFilterImplCopyWith<_$ProductFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
