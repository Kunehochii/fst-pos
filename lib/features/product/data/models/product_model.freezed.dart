// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpecialPriceModel _$SpecialPriceModelFromJson(Map<String, dynamic> json) {
  return _SpecialPriceModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialPriceModel {
  String get id => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimumQty')
  String get minimumQty => throw _privateConstructorUsedError;
  String? get profit => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SpecialPriceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialPriceModelCopyWith<SpecialPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialPriceModelCopyWith<$Res> {
  factory $SpecialPriceModelCopyWith(
          SpecialPriceModel value, $Res Function(SpecialPriceModel) then) =
      _$SpecialPriceModelCopyWithImpl<$Res, SpecialPriceModel>;
  @useResult
  $Res call(
      {String id,
      String price,
      @JsonKey(name: 'minimumQty') String minimumQty,
      String? profit,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$SpecialPriceModelCopyWithImpl<$Res, $Val extends SpecialPriceModel>
    implements $SpecialPriceModelCopyWith<$Res> {
  _$SpecialPriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialPriceModel
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
              as String,
      minimumQty: null == minimumQty
          ? _value.minimumQty
          : minimumQty // ignore: cast_nullable_to_non_nullable
              as String,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$SpecialPriceModelImplCopyWith<$Res>
    implements $SpecialPriceModelCopyWith<$Res> {
  factory _$$SpecialPriceModelImplCopyWith(_$SpecialPriceModelImpl value,
          $Res Function(_$SpecialPriceModelImpl) then) =
      __$$SpecialPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String price,
      @JsonKey(name: 'minimumQty') String minimumQty,
      String? profit,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$SpecialPriceModelImplCopyWithImpl<$Res>
    extends _$SpecialPriceModelCopyWithImpl<$Res, _$SpecialPriceModelImpl>
    implements _$$SpecialPriceModelImplCopyWith<$Res> {
  __$$SpecialPriceModelImplCopyWithImpl(_$SpecialPriceModelImpl _value,
      $Res Function(_$SpecialPriceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialPriceModel
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
    return _then(_$SpecialPriceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      minimumQty: null == minimumQty
          ? _value.minimumQty
          : minimumQty // ignore: cast_nullable_to_non_nullable
              as String,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$SpecialPriceModelImpl extends _SpecialPriceModel {
  const _$SpecialPriceModelImpl(
      {required this.id,
      required this.price,
      @JsonKey(name: 'minimumQty') required this.minimumQty,
      this.profit,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : super._();

  factory _$SpecialPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialPriceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String price;
  @override
  @JsonKey(name: 'minimumQty')
  final String minimumQty;
  @override
  final String? profit;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SpecialPriceModel(id: $id, price: $price, minimumQty: $minimumQty, profit: $profit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialPriceModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, price, minimumQty, profit, createdAt, updatedAt);

  /// Create a copy of SpecialPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialPriceModelImplCopyWith<_$SpecialPriceModelImpl> get copyWith =>
      __$$SpecialPriceModelImplCopyWithImpl<_$SpecialPriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialPriceModelImplToJson(
      this,
    );
  }
}

abstract class _SpecialPriceModel extends SpecialPriceModel {
  const factory _SpecialPriceModel(
          {required final String id,
          required final String price,
          @JsonKey(name: 'minimumQty') required final String minimumQty,
          final String? profit,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$SpecialPriceModelImpl;
  const _SpecialPriceModel._() : super._();

  factory _SpecialPriceModel.fromJson(Map<String, dynamic> json) =
      _$SpecialPriceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get price;
  @override
  @JsonKey(name: 'minimumQty')
  String get minimumQty;
  @override
  String? get profit;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of SpecialPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialPriceModelImplCopyWith<_$SpecialPriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SackPriceModel _$SackPriceModelFromJson(Map<String, dynamic> json) {
  return _SackPriceModel.fromJson(json);
}

/// @nodoc
mixin _$SackPriceModel {
  String get id => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get stock => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get profit => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialPrice')
  SpecialPriceModel? get specialPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SackPriceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SackPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SackPriceModelCopyWith<SackPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SackPriceModelCopyWith<$Res> {
  factory $SackPriceModelCopyWith(
          SackPriceModel value, $Res Function(SackPriceModel) then) =
      _$SackPriceModelCopyWithImpl<$Res, SackPriceModel>;
  @useResult
  $Res call(
      {String id,
      String price,
      String stock,
      String type,
      String? profit,
      @JsonKey(name: 'specialPrice') SpecialPriceModel? specialPrice,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});

  $SpecialPriceModelCopyWith<$Res>? get specialPrice;
}

/// @nodoc
class _$SackPriceModelCopyWithImpl<$Res, $Val extends SackPriceModel>
    implements $SackPriceModelCopyWith<$Res> {
  _$SackPriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SackPriceModel
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
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String?,
      specialPrice: freezed == specialPrice
          ? _value.specialPrice
          : specialPrice // ignore: cast_nullable_to_non_nullable
              as SpecialPriceModel?,
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

  /// Create a copy of SackPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialPriceModelCopyWith<$Res>? get specialPrice {
    if (_value.specialPrice == null) {
      return null;
    }

    return $SpecialPriceModelCopyWith<$Res>(_value.specialPrice!, (value) {
      return _then(_value.copyWith(specialPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SackPriceModelImplCopyWith<$Res>
    implements $SackPriceModelCopyWith<$Res> {
  factory _$$SackPriceModelImplCopyWith(_$SackPriceModelImpl value,
          $Res Function(_$SackPriceModelImpl) then) =
      __$$SackPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String price,
      String stock,
      String type,
      String? profit,
      @JsonKey(name: 'specialPrice') SpecialPriceModel? specialPrice,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});

  @override
  $SpecialPriceModelCopyWith<$Res>? get specialPrice;
}

/// @nodoc
class __$$SackPriceModelImplCopyWithImpl<$Res>
    extends _$SackPriceModelCopyWithImpl<$Res, _$SackPriceModelImpl>
    implements _$$SackPriceModelImplCopyWith<$Res> {
  __$$SackPriceModelImplCopyWithImpl(
      _$SackPriceModelImpl _value, $Res Function(_$SackPriceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SackPriceModel
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
    return _then(_$SackPriceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String?,
      specialPrice: freezed == specialPrice
          ? _value.specialPrice
          : specialPrice // ignore: cast_nullable_to_non_nullable
              as SpecialPriceModel?,
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
@JsonSerializable()
class _$SackPriceModelImpl extends _SackPriceModel {
  const _$SackPriceModelImpl(
      {required this.id,
      required this.price,
      required this.stock,
      required this.type,
      this.profit,
      @JsonKey(name: 'specialPrice') this.specialPrice,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : super._();

  factory _$SackPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SackPriceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String price;
  @override
  final String stock;
  @override
  final String type;
  @override
  final String? profit;
  @override
  @JsonKey(name: 'specialPrice')
  final SpecialPriceModel? specialPrice;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SackPriceModel(id: $id, price: $price, stock: $stock, type: $type, profit: $profit, specialPrice: $specialPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SackPriceModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, stock, type, profit,
      specialPrice, createdAt, updatedAt);

  /// Create a copy of SackPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SackPriceModelImplCopyWith<_$SackPriceModelImpl> get copyWith =>
      __$$SackPriceModelImplCopyWithImpl<_$SackPriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SackPriceModelImplToJson(
      this,
    );
  }
}

abstract class _SackPriceModel extends SackPriceModel {
  const factory _SackPriceModel(
          {required final String id,
          required final String price,
          required final String stock,
          required final String type,
          final String? profit,
          @JsonKey(name: 'specialPrice') final SpecialPriceModel? specialPrice,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$SackPriceModelImpl;
  const _SackPriceModel._() : super._();

  factory _SackPriceModel.fromJson(Map<String, dynamic> json) =
      _$SackPriceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get price;
  @override
  String get stock;
  @override
  String get type;
  @override
  String? get profit;
  @override
  @JsonKey(name: 'specialPrice')
  SpecialPriceModel? get specialPrice;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of SackPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SackPriceModelImplCopyWith<_$SackPriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerKiloPriceModel _$PerKiloPriceModelFromJson(Map<String, dynamic> json) {
  return _PerKiloPriceModel.fromJson(json);
}

/// @nodoc
mixin _$PerKiloPriceModel {
  String get id => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get stock => throw _privateConstructorUsedError;
  String? get profit => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PerKiloPriceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerKiloPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerKiloPriceModelCopyWith<PerKiloPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerKiloPriceModelCopyWith<$Res> {
  factory $PerKiloPriceModelCopyWith(
          PerKiloPriceModel value, $Res Function(PerKiloPriceModel) then) =
      _$PerKiloPriceModelCopyWithImpl<$Res, PerKiloPriceModel>;
  @useResult
  $Res call(
      {String id,
      String price,
      String stock,
      String? profit,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$PerKiloPriceModelCopyWithImpl<$Res, $Val extends PerKiloPriceModel>
    implements $PerKiloPriceModelCopyWith<$Res> {
  _$PerKiloPriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerKiloPriceModel
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
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$PerKiloPriceModelImplCopyWith<$Res>
    implements $PerKiloPriceModelCopyWith<$Res> {
  factory _$$PerKiloPriceModelImplCopyWith(_$PerKiloPriceModelImpl value,
          $Res Function(_$PerKiloPriceModelImpl) then) =
      __$$PerKiloPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String price,
      String stock,
      String? profit,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$PerKiloPriceModelImplCopyWithImpl<$Res>
    extends _$PerKiloPriceModelCopyWithImpl<$Res, _$PerKiloPriceModelImpl>
    implements _$$PerKiloPriceModelImplCopyWith<$Res> {
  __$$PerKiloPriceModelImplCopyWithImpl(_$PerKiloPriceModelImpl _value,
      $Res Function(_$PerKiloPriceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerKiloPriceModel
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
    return _then(_$PerKiloPriceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      profit: freezed == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$PerKiloPriceModelImpl extends _PerKiloPriceModel {
  const _$PerKiloPriceModelImpl(
      {required this.id,
      required this.price,
      required this.stock,
      this.profit,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : super._();

  factory _$PerKiloPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerKiloPriceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String price;
  @override
  final String stock;
  @override
  final String? profit;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PerKiloPriceModel(id: $id, price: $price, stock: $stock, profit: $profit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerKiloPriceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, stock, profit, createdAt, updatedAt);

  /// Create a copy of PerKiloPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerKiloPriceModelImplCopyWith<_$PerKiloPriceModelImpl> get copyWith =>
      __$$PerKiloPriceModelImplCopyWithImpl<_$PerKiloPriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerKiloPriceModelImplToJson(
      this,
    );
  }
}

abstract class _PerKiloPriceModel extends PerKiloPriceModel {
  const factory _PerKiloPriceModel(
          {required final String id,
          required final String price,
          required final String stock,
          final String? profit,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$PerKiloPriceModelImpl;
  const _PerKiloPriceModel._() : super._();

  factory _PerKiloPriceModel.fromJson(Map<String, dynamic> json) =
      _$PerKiloPriceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get price;
  @override
  String get stock;
  @override
  String? get profit;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of PerKiloPriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerKiloPriceModelImplCopyWith<_$PerKiloPriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductCashierModel _$ProductCashierModelFromJson(Map<String, dynamic> json) {
  return _ProductCashierModel.fromJson(json);
}

/// @nodoc
mixin _$ProductCashierModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'branchName')
  String get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessId')
  String get businessId => throw _privateConstructorUsedError;

  /// Serializes this ProductCashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCashierModelCopyWith<ProductCashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCashierModelCopyWith<$Res> {
  factory $ProductCashierModelCopyWith(
          ProductCashierModel value, $Res Function(ProductCashierModel) then) =
      _$ProductCashierModelCopyWithImpl<$Res, ProductCashierModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'branchName') String branchName,
      @JsonKey(name: 'businessId') String businessId});
}

/// @nodoc
class _$ProductCashierModelCopyWithImpl<$Res, $Val extends ProductCashierModel>
    implements $ProductCashierModelCopyWith<$Res> {
  _$ProductCashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCashierModel
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
abstract class _$$ProductCashierModelImplCopyWith<$Res>
    implements $ProductCashierModelCopyWith<$Res> {
  factory _$$ProductCashierModelImplCopyWith(_$ProductCashierModelImpl value,
          $Res Function(_$ProductCashierModelImpl) then) =
      __$$ProductCashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'branchName') String branchName,
      @JsonKey(name: 'businessId') String businessId});
}

/// @nodoc
class __$$ProductCashierModelImplCopyWithImpl<$Res>
    extends _$ProductCashierModelCopyWithImpl<$Res, _$ProductCashierModelImpl>
    implements _$$ProductCashierModelImplCopyWith<$Res> {
  __$$ProductCashierModelImplCopyWithImpl(_$ProductCashierModelImpl _value,
      $Res Function(_$ProductCashierModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
    Object? businessId = null,
  }) {
    return _then(_$ProductCashierModelImpl(
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
@JsonSerializable()
class _$ProductCashierModelImpl extends _ProductCashierModel {
  const _$ProductCashierModelImpl(
      {required this.id,
      required this.username,
      @JsonKey(name: 'branchName') required this.branchName,
      @JsonKey(name: 'businessId') required this.businessId})
      : super._();

  factory _$ProductCashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCashierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'branchName')
  final String branchName;
  @override
  @JsonKey(name: 'businessId')
  final String businessId;

  @override
  String toString() {
    return 'ProductCashierModel(id: $id, username: $username, branchName: $branchName, businessId: $businessId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, branchName, businessId);

  /// Create a copy of ProductCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCashierModelImplCopyWith<_$ProductCashierModelImpl> get copyWith =>
      __$$ProductCashierModelImplCopyWithImpl<_$ProductCashierModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCashierModelImplToJson(
      this,
    );
  }
}

abstract class _ProductCashierModel extends ProductCashierModel {
  const factory _ProductCashierModel(
          {required final String id,
          required final String username,
          @JsonKey(name: 'branchName') required final String branchName,
          @JsonKey(name: 'businessId') required final String businessId}) =
      _$ProductCashierModelImpl;
  const _ProductCashierModel._() : super._();

  factory _ProductCashierModel.fromJson(Map<String, dynamic> json) =
      _$ProductCashierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'branchName')
  String get branchName;
  @override
  @JsonKey(name: 'businessId')
  String get businessId;

  /// Create a copy of ProductCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCashierModelImplCopyWith<_$ProductCashierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashierId')
  String get cashierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sackPrices')
  List<SackPriceModel> get sackPrices => throw _privateConstructorUsedError;
  @JsonKey(name: 'perKiloPrice')
  PerKiloPriceModel? get perKiloPrice => throw _privateConstructorUsedError;
  ProductCashierModel? get cashier => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String picture,
      String category,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'sackPrices') List<SackPriceModel> sackPrices,
      @JsonKey(name: 'perKiloPrice') PerKiloPriceModel? perKiloPrice,
      ProductCashierModel? cashier,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});

  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice;
  $ProductCashierModelCopyWith<$Res>? get cashier;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
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
              as String,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrices: null == sackPrices
          ? _value.sackPrices
          : sackPrices // ignore: cast_nullable_to_non_nullable
              as List<SackPriceModel>,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceModel?,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as ProductCashierModel?,
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

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice {
    if (_value.perKiloPrice == null) {
      return null;
    }

    return $PerKiloPriceModelCopyWith<$Res>(_value.perKiloPrice!, (value) {
      return _then(_value.copyWith(perKiloPrice: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCashierModelCopyWith<$Res>? get cashier {
    if (_value.cashier == null) {
      return null;
    }

    return $ProductCashierModelCopyWith<$Res>(_value.cashier!, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String picture,
      String category,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'sackPrices') List<SackPriceModel> sackPrices,
      @JsonKey(name: 'perKiloPrice') PerKiloPriceModel? perKiloPrice,
      ProductCashierModel? cashier,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});

  @override
  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice;
  @override
  $ProductCashierModelCopyWith<$Res>? get cashier;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
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
    return _then(_$ProductModelImpl(
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
              as String,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrices: null == sackPrices
          ? _value._sackPrices
          : sackPrices // ignore: cast_nullable_to_non_nullable
              as List<SackPriceModel>,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceModel?,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as ProductCashierModel?,
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
@JsonSerializable()
class _$ProductModelImpl extends _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      required this.name,
      required this.picture,
      required this.category,
      @JsonKey(name: 'cashierId') required this.cashierId,
      @JsonKey(name: 'sackPrices')
      final List<SackPriceModel> sackPrices = const [],
      @JsonKey(name: 'perKiloPrice') this.perKiloPrice,
      this.cashier,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : _sackPrices = sackPrices,
        super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String picture;
  @override
  final String category;
  @override
  @JsonKey(name: 'cashierId')
  final String cashierId;
  final List<SackPriceModel> _sackPrices;
  @override
  @JsonKey(name: 'sackPrices')
  List<SackPriceModel> get sackPrices {
    if (_sackPrices is EqualUnmodifiableListView) return _sackPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sackPrices);
  }

  @override
  @JsonKey(name: 'perKiloPrice')
  final PerKiloPriceModel? perKiloPrice;
  @override
  final ProductCashierModel? cashier;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, picture: $picture, category: $category, cashierId: $cashierId, sackPrices: $sackPrices, perKiloPrice: $perKiloPrice, cashier: $cashier, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
          {required final String id,
          required final String name,
          required final String picture,
          required final String category,
          @JsonKey(name: 'cashierId') required final String cashierId,
          @JsonKey(name: 'sackPrices') final List<SackPriceModel> sackPrices,
          @JsonKey(name: 'perKiloPrice') final PerKiloPriceModel? perKiloPrice,
          final ProductCashierModel? cashier,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$ProductModelImpl;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get picture;
  @override
  String get category;
  @override
  @JsonKey(name: 'cashierId')
  String get cashierId;
  @override
  @JsonKey(name: 'sackPrices')
  List<SackPriceModel> get sackPrices;
  @override
  @JsonKey(name: 'perKiloPrice')
  PerKiloPriceModel? get perKiloPrice;
  @override
  ProductCashierModel? get cashier;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
