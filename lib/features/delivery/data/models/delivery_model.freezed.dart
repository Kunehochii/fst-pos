// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryCashierModel _$DeliveryCashierModelFromJson(Map<String, dynamic> json) {
  return _DeliveryCashierModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryCashierModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'branchName')
  String get branchName => throw _privateConstructorUsedError;

  /// Serializes this DeliveryCashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCashierModelCopyWith<DeliveryCashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCashierModelCopyWith<$Res> {
  factory $DeliveryCashierModelCopyWith(DeliveryCashierModel value,
          $Res Function(DeliveryCashierModel) then) =
      _$DeliveryCashierModelCopyWithImpl<$Res, DeliveryCashierModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'branchName') String branchName});
}

/// @nodoc
class _$DeliveryCashierModelCopyWithImpl<$Res,
        $Val extends DeliveryCashierModel>
    implements $DeliveryCashierModelCopyWith<$Res> {
  _$DeliveryCashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryCashierModel
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
abstract class _$$DeliveryCashierModelImplCopyWith<$Res>
    implements $DeliveryCashierModelCopyWith<$Res> {
  factory _$$DeliveryCashierModelImplCopyWith(_$DeliveryCashierModelImpl value,
          $Res Function(_$DeliveryCashierModelImpl) then) =
      __$$DeliveryCashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'branchName') String branchName});
}

/// @nodoc
class __$$DeliveryCashierModelImplCopyWithImpl<$Res>
    extends _$DeliveryCashierModelCopyWithImpl<$Res, _$DeliveryCashierModelImpl>
    implements _$$DeliveryCashierModelImplCopyWith<$Res> {
  __$$DeliveryCashierModelImplCopyWithImpl(_$DeliveryCashierModelImpl _value,
      $Res Function(_$DeliveryCashierModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_$DeliveryCashierModelImpl(
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
@JsonSerializable()
class _$DeliveryCashierModelImpl extends _DeliveryCashierModel {
  const _$DeliveryCashierModelImpl(
      {required this.id,
      required this.username,
      @JsonKey(name: 'branchName') required this.branchName})
      : super._();

  factory _$DeliveryCashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryCashierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'branchName')
  final String branchName;

  @override
  String toString() {
    return 'DeliveryCashierModel(id: $id, username: $username, branchName: $branchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryCashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, branchName);

  /// Create a copy of DeliveryCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryCashierModelImplCopyWith<_$DeliveryCashierModelImpl>
      get copyWith =>
          __$$DeliveryCashierModelImplCopyWithImpl<_$DeliveryCashierModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryCashierModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryCashierModel extends DeliveryCashierModel {
  const factory _DeliveryCashierModel(
          {required final String id,
          required final String username,
          @JsonKey(name: 'branchName') required final String branchName}) =
      _$DeliveryCashierModelImpl;
  const _DeliveryCashierModel._() : super._();

  factory _DeliveryCashierModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryCashierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'branchName')
  String get branchName;

  /// Create a copy of DeliveryCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryCashierModelImplCopyWith<_$DeliveryCashierModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeliveryItemModel _$DeliveryItemModelFromJson(Map<String, dynamic> json) {
  return _DeliveryItemModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryItemModel {
  String get id => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'productId')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sackPriceId')
  String? get sackPriceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sackType')
  String? get sackType => throw _privateConstructorUsedError;
  @JsonKey(name: 'perKiloPriceId')
  String? get perKiloPriceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  SackPriceModel? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPriceModel? get perKiloPrice => throw _privateConstructorUsedError;

  /// Serializes this DeliveryItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryItemModelCopyWith<DeliveryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryItemModelCopyWith<$Res> {
  factory $DeliveryItemModelCopyWith(
          DeliveryItemModel value, $Res Function(DeliveryItemModel) then) =
      _$DeliveryItemModelCopyWithImpl<$Res, DeliveryItemModel>;
  @useResult
  $Res call(
      {String id,
      String quantity,
      @JsonKey(name: 'productId') String productId,
      @JsonKey(name: 'sackPriceId') String? sackPriceId,
      @JsonKey(name: 'sackType') String? sackType,
      @JsonKey(name: 'perKiloPriceId') String? perKiloPriceId,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      ProductModel? product,
      SackPriceModel? sackPrice,
      PerKiloPriceModel? perKiloPrice});

  $ProductModelCopyWith<$Res>? get product;
  $SackPriceModelCopyWith<$Res>? get sackPrice;
  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class _$DeliveryItemModelCopyWithImpl<$Res, $Val extends DeliveryItemModel>
    implements $DeliveryItemModelCopyWith<$Res> {
  _$DeliveryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryItemModel
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
              as String,
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
              as String?,
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
              as ProductModel?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceModel?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceModel?,
    ) as $Val);
  }

  /// Create a copy of DeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of DeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SackPriceModelCopyWith<$Res>? get sackPrice {
    if (_value.sackPrice == null) {
      return null;
    }

    return $SackPriceModelCopyWith<$Res>(_value.sackPrice!, (value) {
      return _then(_value.copyWith(sackPrice: value) as $Val);
    });
  }

  /// Create a copy of DeliveryItemModel
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
}

/// @nodoc
abstract class _$$DeliveryItemModelImplCopyWith<$Res>
    implements $DeliveryItemModelCopyWith<$Res> {
  factory _$$DeliveryItemModelImplCopyWith(_$DeliveryItemModelImpl value,
          $Res Function(_$DeliveryItemModelImpl) then) =
      __$$DeliveryItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String quantity,
      @JsonKey(name: 'productId') String productId,
      @JsonKey(name: 'sackPriceId') String? sackPriceId,
      @JsonKey(name: 'sackType') String? sackType,
      @JsonKey(name: 'perKiloPriceId') String? perKiloPriceId,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      ProductModel? product,
      SackPriceModel? sackPrice,
      PerKiloPriceModel? perKiloPrice});

  @override
  $ProductModelCopyWith<$Res>? get product;
  @override
  $SackPriceModelCopyWith<$Res>? get sackPrice;
  @override
  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class __$$DeliveryItemModelImplCopyWithImpl<$Res>
    extends _$DeliveryItemModelCopyWithImpl<$Res, _$DeliveryItemModelImpl>
    implements _$$DeliveryItemModelImplCopyWith<$Res> {
  __$$DeliveryItemModelImplCopyWithImpl(_$DeliveryItemModelImpl _value,
      $Res Function(_$DeliveryItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryItemModel
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
    return _then(_$DeliveryItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
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
              as ProductModel?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceModel?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryItemModelImpl extends _DeliveryItemModel {
  const _$DeliveryItemModelImpl(
      {required this.id,
      required this.quantity,
      @JsonKey(name: 'productId') required this.productId,
      @JsonKey(name: 'sackPriceId') this.sackPriceId,
      @JsonKey(name: 'sackType') this.sackType,
      @JsonKey(name: 'perKiloPriceId') this.perKiloPriceId,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      this.product,
      this.sackPrice,
      this.perKiloPrice})
      : super._();

  factory _$DeliveryItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String quantity;
  @override
  @JsonKey(name: 'productId')
  final String productId;
  @override
  @JsonKey(name: 'sackPriceId')
  final String? sackPriceId;
  @override
  @JsonKey(name: 'sackType')
  final String? sackType;
  @override
  @JsonKey(name: 'perKiloPriceId')
  final String? perKiloPriceId;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  @override
  final ProductModel? product;
  @override
  final SackPriceModel? sackPrice;
  @override
  final PerKiloPriceModel? perKiloPrice;

  @override
  String toString() {
    return 'DeliveryItemModel(id: $id, quantity: $quantity, productId: $productId, sackPriceId: $sackPriceId, sackType: $sackType, perKiloPriceId: $perKiloPriceId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryItemModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryItemModelImplCopyWith<_$DeliveryItemModelImpl> get copyWith =>
      __$$DeliveryItemModelImplCopyWithImpl<_$DeliveryItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryItemModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryItemModel extends DeliveryItemModel {
  const factory _DeliveryItemModel(
      {required final String id,
      required final String quantity,
      @JsonKey(name: 'productId') required final String productId,
      @JsonKey(name: 'sackPriceId') final String? sackPriceId,
      @JsonKey(name: 'sackType') final String? sackType,
      @JsonKey(name: 'perKiloPriceId') final String? perKiloPriceId,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
      final ProductModel? product,
      final SackPriceModel? sackPrice,
      final PerKiloPriceModel? perKiloPrice}) = _$DeliveryItemModelImpl;
  const _DeliveryItemModel._() : super._();

  factory _DeliveryItemModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get quantity;
  @override
  @JsonKey(name: 'productId')
  String get productId;
  @override
  @JsonKey(name: 'sackPriceId')
  String? get sackPriceId;
  @override
  @JsonKey(name: 'sackType')
  String? get sackType;
  @override
  @JsonKey(name: 'perKiloPriceId')
  String? get perKiloPriceId;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;
  @override
  ProductModel? get product;
  @override
  SackPriceModel? get sackPrice;
  @override
  PerKiloPriceModel? get perKiloPrice;

  /// Create a copy of DeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryItemModelImplCopyWith<_$DeliveryItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driverName')
  String get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryTimeStart')
  DateTime get deliveryTimeStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashierId')
  String get cashierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryItems')
  List<DeliveryItemModel> get deliveryItems =>
      throw _privateConstructorUsedError;
  DeliveryCashierModel? get cashier => throw _privateConstructorUsedError;

  /// Serializes this DeliveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res, DeliveryModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driverName') String driverName,
      @JsonKey(name: 'deliveryTimeStart') DateTime deliveryTimeStart,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      @JsonKey(name: 'deliveryItems') List<DeliveryItemModel> deliveryItems,
      DeliveryCashierModel? cashier});

  $DeliveryCashierModelCopyWith<$Res>? get cashier;
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res, $Val extends DeliveryModel>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryModel
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
              as List<DeliveryItemModel>,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as DeliveryCashierModel?,
    ) as $Val);
  }

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryCashierModelCopyWith<$Res>? get cashier {
    if (_value.cashier == null) {
      return null;
    }

    return $DeliveryCashierModelCopyWith<$Res>(_value.cashier!, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryModelImplCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$DeliveryModelImplCopyWith(
          _$DeliveryModelImpl value, $Res Function(_$DeliveryModelImpl) then) =
      __$$DeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'driverName') String driverName,
      @JsonKey(name: 'deliveryTimeStart') DateTime deliveryTimeStart,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      @JsonKey(name: 'deliveryItems') List<DeliveryItemModel> deliveryItems,
      DeliveryCashierModel? cashier});

  @override
  $DeliveryCashierModelCopyWith<$Res>? get cashier;
}

/// @nodoc
class __$$DeliveryModelImplCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res, _$DeliveryModelImpl>
    implements _$$DeliveryModelImplCopyWith<$Res> {
  __$$DeliveryModelImplCopyWithImpl(
      _$DeliveryModelImpl _value, $Res Function(_$DeliveryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryModel
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
    return _then(_$DeliveryModelImpl(
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
              as List<DeliveryItemModel>,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as DeliveryCashierModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryModelImpl extends _DeliveryModel {
  const _$DeliveryModelImpl(
      {required this.id,
      @JsonKey(name: 'driverName') required this.driverName,
      @JsonKey(name: 'deliveryTimeStart') required this.deliveryTimeStart,
      @JsonKey(name: 'cashierId') required this.cashierId,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      @JsonKey(name: 'deliveryItems')
      final List<DeliveryItemModel> deliveryItems = const [],
      this.cashier})
      : _deliveryItems = deliveryItems,
        super._();

  factory _$DeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'driverName')
  final String driverName;
  @override
  @JsonKey(name: 'deliveryTimeStart')
  final DateTime deliveryTimeStart;
  @override
  @JsonKey(name: 'cashierId')
  final String cashierId;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  final List<DeliveryItemModel> _deliveryItems;
  @override
  @JsonKey(name: 'deliveryItems')
  List<DeliveryItemModel> get deliveryItems {
    if (_deliveryItems is EqualUnmodifiableListView) return _deliveryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryItems);
  }

  @override
  final DeliveryCashierModel? cashier;

  @override
  String toString() {
    return 'DeliveryModel(id: $id, driverName: $driverName, deliveryTimeStart: $deliveryTimeStart, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt, deliveryItems: $deliveryItems, cashier: $cashier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryModelImplCopyWith<_$DeliveryModelImpl> get copyWith =>
      __$$DeliveryModelImplCopyWithImpl<_$DeliveryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryModel extends DeliveryModel {
  const factory _DeliveryModel(
      {required final String id,
      @JsonKey(name: 'driverName') required final String driverName,
      @JsonKey(name: 'deliveryTimeStart')
      required final DateTime deliveryTimeStart,
      @JsonKey(name: 'cashierId') required final String cashierId,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
      @JsonKey(name: 'deliveryItems')
      final List<DeliveryItemModel> deliveryItems,
      final DeliveryCashierModel? cashier}) = _$DeliveryModelImpl;
  const _DeliveryModel._() : super._();

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'driverName')
  String get driverName;
  @override
  @JsonKey(name: 'deliveryTimeStart')
  DateTime get deliveryTimeStart;
  @override
  @JsonKey(name: 'cashierId')
  String get cashierId;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'deliveryItems')
  List<DeliveryItemModel> get deliveryItems;
  @override
  DeliveryCashierModel? get cashier;

  /// Create a copy of DeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryModelImplCopyWith<_$DeliveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateDeliveryItemModel _$CreateDeliveryItemModelFromJson(
    Map<String, dynamic> json) {
  return _CreateDeliveryItemModel.fromJson(json);
}

/// @nodoc
mixin _$CreateDeliveryItemModel {
  String get productId => throw _privateConstructorUsedError;
  SackPriceDtoModel? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPriceDtoModel? get perKiloPrice => throw _privateConstructorUsedError;

  /// Serializes this CreateDeliveryItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDeliveryItemModelCopyWith<CreateDeliveryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDeliveryItemModelCopyWith<$Res> {
  factory $CreateDeliveryItemModelCopyWith(CreateDeliveryItemModel value,
          $Res Function(CreateDeliveryItemModel) then) =
      _$CreateDeliveryItemModelCopyWithImpl<$Res, CreateDeliveryItemModel>;
  @useResult
  $Res call(
      {String productId,
      SackPriceDtoModel? sackPrice,
      PerKiloPriceDtoModel? perKiloPrice});

  $SackPriceDtoModelCopyWith<$Res>? get sackPrice;
  $PerKiloPriceDtoModelCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class _$CreateDeliveryItemModelCopyWithImpl<$Res,
        $Val extends CreateDeliveryItemModel>
    implements $CreateDeliveryItemModelCopyWith<$Res> {
  _$CreateDeliveryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDeliveryItemModel
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
              as SackPriceDtoModel?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceDtoModel?,
    ) as $Val);
  }

  /// Create a copy of CreateDeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SackPriceDtoModelCopyWith<$Res>? get sackPrice {
    if (_value.sackPrice == null) {
      return null;
    }

    return $SackPriceDtoModelCopyWith<$Res>(_value.sackPrice!, (value) {
      return _then(_value.copyWith(sackPrice: value) as $Val);
    });
  }

  /// Create a copy of CreateDeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerKiloPriceDtoModelCopyWith<$Res>? get perKiloPrice {
    if (_value.perKiloPrice == null) {
      return null;
    }

    return $PerKiloPriceDtoModelCopyWith<$Res>(_value.perKiloPrice!, (value) {
      return _then(_value.copyWith(perKiloPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateDeliveryItemModelImplCopyWith<$Res>
    implements $CreateDeliveryItemModelCopyWith<$Res> {
  factory _$$CreateDeliveryItemModelImplCopyWith(
          _$CreateDeliveryItemModelImpl value,
          $Res Function(_$CreateDeliveryItemModelImpl) then) =
      __$$CreateDeliveryItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      SackPriceDtoModel? sackPrice,
      PerKiloPriceDtoModel? perKiloPrice});

  @override
  $SackPriceDtoModelCopyWith<$Res>? get sackPrice;
  @override
  $PerKiloPriceDtoModelCopyWith<$Res>? get perKiloPrice;
}

/// @nodoc
class __$$CreateDeliveryItemModelImplCopyWithImpl<$Res>
    extends _$CreateDeliveryItemModelCopyWithImpl<$Res,
        _$CreateDeliveryItemModelImpl>
    implements _$$CreateDeliveryItemModelImplCopyWith<$Res> {
  __$$CreateDeliveryItemModelImplCopyWithImpl(
      _$CreateDeliveryItemModelImpl _value,
      $Res Function(_$CreateDeliveryItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateDeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
  }) {
    return _then(_$CreateDeliveryItemModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceDtoModel?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceDtoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDeliveryItemModelImpl extends _CreateDeliveryItemModel {
  const _$CreateDeliveryItemModelImpl(
      {required this.productId, this.sackPrice, this.perKiloPrice})
      : super._();

  factory _$CreateDeliveryItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDeliveryItemModelImplFromJson(json);

  @override
  final String productId;
  @override
  final SackPriceDtoModel? sackPrice;
  @override
  final PerKiloPriceDtoModel? perKiloPrice;

  @override
  String toString() {
    return 'CreateDeliveryItemModel(productId: $productId, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDeliveryItemModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sackPrice, sackPrice) ||
                other.sackPrice == sackPrice) &&
            (identical(other.perKiloPrice, perKiloPrice) ||
                other.perKiloPrice == perKiloPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, sackPrice, perKiloPrice);

  /// Create a copy of CreateDeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDeliveryItemModelImplCopyWith<_$CreateDeliveryItemModelImpl>
      get copyWith => __$$CreateDeliveryItemModelImplCopyWithImpl<
          _$CreateDeliveryItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDeliveryItemModelImplToJson(
      this,
    );
  }
}

abstract class _CreateDeliveryItemModel extends CreateDeliveryItemModel {
  const factory _CreateDeliveryItemModel(
          {required final String productId,
          final SackPriceDtoModel? sackPrice,
          final PerKiloPriceDtoModel? perKiloPrice}) =
      _$CreateDeliveryItemModelImpl;
  const _CreateDeliveryItemModel._() : super._();

  factory _CreateDeliveryItemModel.fromJson(Map<String, dynamic> json) =
      _$CreateDeliveryItemModelImpl.fromJson;

  @override
  String get productId;
  @override
  SackPriceDtoModel? get sackPrice;
  @override
  PerKiloPriceDtoModel? get perKiloPrice;

  /// Create a copy of CreateDeliveryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDeliveryItemModelImplCopyWith<_$CreateDeliveryItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SackPriceDtoModel _$SackPriceDtoModelFromJson(Map<String, dynamic> json) {
  return _SackPriceDtoModel.fromJson(json);
}

/// @nodoc
mixin _$SackPriceDtoModel {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this SackPriceDtoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SackPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SackPriceDtoModelCopyWith<SackPriceDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SackPriceDtoModelCopyWith<$Res> {
  factory $SackPriceDtoModelCopyWith(
          SackPriceDtoModel value, $Res Function(SackPriceDtoModel) then) =
      _$SackPriceDtoModelCopyWithImpl<$Res, SackPriceDtoModel>;
  @useResult
  $Res call({String id, double quantity, String type});
}

/// @nodoc
class _$SackPriceDtoModelCopyWithImpl<$Res, $Val extends SackPriceDtoModel>
    implements $SackPriceDtoModelCopyWith<$Res> {
  _$SackPriceDtoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SackPriceDtoModel
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SackPriceDtoModelImplCopyWith<$Res>
    implements $SackPriceDtoModelCopyWith<$Res> {
  factory _$$SackPriceDtoModelImplCopyWith(_$SackPriceDtoModelImpl value,
          $Res Function(_$SackPriceDtoModelImpl) then) =
      __$$SackPriceDtoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double quantity, String type});
}

/// @nodoc
class __$$SackPriceDtoModelImplCopyWithImpl<$Res>
    extends _$SackPriceDtoModelCopyWithImpl<$Res, _$SackPriceDtoModelImpl>
    implements _$$SackPriceDtoModelImplCopyWith<$Res> {
  __$$SackPriceDtoModelImplCopyWithImpl(_$SackPriceDtoModelImpl _value,
      $Res Function(_$SackPriceDtoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SackPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? type = null,
  }) {
    return _then(_$SackPriceDtoModelImpl(
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SackPriceDtoModelImpl extends _SackPriceDtoModel {
  const _$SackPriceDtoModelImpl(
      {required this.id, required this.quantity, required this.type})
      : super._();

  factory _$SackPriceDtoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SackPriceDtoModelImplFromJson(json);

  @override
  final String id;
  @override
  final double quantity;
  @override
  final String type;

  @override
  String toString() {
    return 'SackPriceDtoModel(id: $id, quantity: $quantity, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SackPriceDtoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, type);

  /// Create a copy of SackPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SackPriceDtoModelImplCopyWith<_$SackPriceDtoModelImpl> get copyWith =>
      __$$SackPriceDtoModelImplCopyWithImpl<_$SackPriceDtoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SackPriceDtoModelImplToJson(
      this,
    );
  }
}

abstract class _SackPriceDtoModel extends SackPriceDtoModel {
  const factory _SackPriceDtoModel(
      {required final String id,
      required final double quantity,
      required final String type}) = _$SackPriceDtoModelImpl;
  const _SackPriceDtoModel._() : super._();

  factory _SackPriceDtoModel.fromJson(Map<String, dynamic> json) =
      _$SackPriceDtoModelImpl.fromJson;

  @override
  String get id;
  @override
  double get quantity;
  @override
  String get type;

  /// Create a copy of SackPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SackPriceDtoModelImplCopyWith<_$SackPriceDtoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerKiloPriceDtoModel _$PerKiloPriceDtoModelFromJson(Map<String, dynamic> json) {
  return _PerKiloPriceDtoModel.fromJson(json);
}

/// @nodoc
mixin _$PerKiloPriceDtoModel {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  /// Serializes this PerKiloPriceDtoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerKiloPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerKiloPriceDtoModelCopyWith<PerKiloPriceDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerKiloPriceDtoModelCopyWith<$Res> {
  factory $PerKiloPriceDtoModelCopyWith(PerKiloPriceDtoModel value,
          $Res Function(PerKiloPriceDtoModel) then) =
      _$PerKiloPriceDtoModelCopyWithImpl<$Res, PerKiloPriceDtoModel>;
  @useResult
  $Res call({String id, double quantity});
}

/// @nodoc
class _$PerKiloPriceDtoModelCopyWithImpl<$Res,
        $Val extends PerKiloPriceDtoModel>
    implements $PerKiloPriceDtoModelCopyWith<$Res> {
  _$PerKiloPriceDtoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerKiloPriceDtoModel
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
abstract class _$$PerKiloPriceDtoModelImplCopyWith<$Res>
    implements $PerKiloPriceDtoModelCopyWith<$Res> {
  factory _$$PerKiloPriceDtoModelImplCopyWith(_$PerKiloPriceDtoModelImpl value,
          $Res Function(_$PerKiloPriceDtoModelImpl) then) =
      __$$PerKiloPriceDtoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double quantity});
}

/// @nodoc
class __$$PerKiloPriceDtoModelImplCopyWithImpl<$Res>
    extends _$PerKiloPriceDtoModelCopyWithImpl<$Res, _$PerKiloPriceDtoModelImpl>
    implements _$$PerKiloPriceDtoModelImplCopyWith<$Res> {
  __$$PerKiloPriceDtoModelImplCopyWithImpl(_$PerKiloPriceDtoModelImpl _value,
      $Res Function(_$PerKiloPriceDtoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerKiloPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
  }) {
    return _then(_$PerKiloPriceDtoModelImpl(
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
@JsonSerializable()
class _$PerKiloPriceDtoModelImpl extends _PerKiloPriceDtoModel {
  const _$PerKiloPriceDtoModelImpl({required this.id, required this.quantity})
      : super._();

  factory _$PerKiloPriceDtoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerKiloPriceDtoModelImplFromJson(json);

  @override
  final String id;
  @override
  final double quantity;

  @override
  String toString() {
    return 'PerKiloPriceDtoModel(id: $id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerKiloPriceDtoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity);

  /// Create a copy of PerKiloPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerKiloPriceDtoModelImplCopyWith<_$PerKiloPriceDtoModelImpl>
      get copyWith =>
          __$$PerKiloPriceDtoModelImplCopyWithImpl<_$PerKiloPriceDtoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerKiloPriceDtoModelImplToJson(
      this,
    );
  }
}

abstract class _PerKiloPriceDtoModel extends PerKiloPriceDtoModel {
  const factory _PerKiloPriceDtoModel(
      {required final String id,
      required final double quantity}) = _$PerKiloPriceDtoModelImpl;
  const _PerKiloPriceDtoModel._() : super._();

  factory _PerKiloPriceDtoModel.fromJson(Map<String, dynamic> json) =
      _$PerKiloPriceDtoModelImpl.fromJson;

  @override
  String get id;
  @override
  double get quantity;

  /// Create a copy of PerKiloPriceDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerKiloPriceDtoModelImplCopyWith<_$PerKiloPriceDtoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateDeliveryModel _$CreateDeliveryModelFromJson(Map<String, dynamic> json) {
  return _CreateDeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$CreateDeliveryModel {
  String get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryTimeStart')
  String get deliveryTimeStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryItems')
  List<CreateDeliveryItemModel> get deliveryItems =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateDeliveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDeliveryModelCopyWith<CreateDeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDeliveryModelCopyWith<$Res> {
  factory $CreateDeliveryModelCopyWith(
          CreateDeliveryModel value, $Res Function(CreateDeliveryModel) then) =
      _$CreateDeliveryModelCopyWithImpl<$Res, CreateDeliveryModel>;
  @useResult
  $Res call(
      {String driverName,
      @JsonKey(name: 'deliveryTimeStart') String deliveryTimeStart,
      @JsonKey(name: 'deliveryItems')
      List<CreateDeliveryItemModel> deliveryItems});
}

/// @nodoc
class _$CreateDeliveryModelCopyWithImpl<$Res, $Val extends CreateDeliveryModel>
    implements $CreateDeliveryModelCopyWith<$Res> {
  _$CreateDeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDeliveryModel
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
              as String,
      deliveryItems: null == deliveryItems
          ? _value.deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateDeliveryModelImplCopyWith<$Res>
    implements $CreateDeliveryModelCopyWith<$Res> {
  factory _$$CreateDeliveryModelImplCopyWith(_$CreateDeliveryModelImpl value,
          $Res Function(_$CreateDeliveryModelImpl) then) =
      __$$CreateDeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String driverName,
      @JsonKey(name: 'deliveryTimeStart') String deliveryTimeStart,
      @JsonKey(name: 'deliveryItems')
      List<CreateDeliveryItemModel> deliveryItems});
}

/// @nodoc
class __$$CreateDeliveryModelImplCopyWithImpl<$Res>
    extends _$CreateDeliveryModelCopyWithImpl<$Res, _$CreateDeliveryModelImpl>
    implements _$$CreateDeliveryModelImplCopyWith<$Res> {
  __$$CreateDeliveryModelImplCopyWithImpl(_$CreateDeliveryModelImpl _value,
      $Res Function(_$CreateDeliveryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = null,
    Object? deliveryTimeStart = null,
    Object? deliveryItems = null,
  }) {
    return _then(_$CreateDeliveryModelImpl(
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTimeStart: null == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryItems: null == deliveryItems
          ? _value._deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDeliveryModelImpl extends _CreateDeliveryModel {
  const _$CreateDeliveryModelImpl(
      {required this.driverName,
      @JsonKey(name: 'deliveryTimeStart') required this.deliveryTimeStart,
      @JsonKey(name: 'deliveryItems')
      required final List<CreateDeliveryItemModel> deliveryItems})
      : _deliveryItems = deliveryItems,
        super._();

  factory _$CreateDeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDeliveryModelImplFromJson(json);

  @override
  final String driverName;
  @override
  @JsonKey(name: 'deliveryTimeStart')
  final String deliveryTimeStart;
  final List<CreateDeliveryItemModel> _deliveryItems;
  @override
  @JsonKey(name: 'deliveryItems')
  List<CreateDeliveryItemModel> get deliveryItems {
    if (_deliveryItems is EqualUnmodifiableListView) return _deliveryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryItems);
  }

  @override
  String toString() {
    return 'CreateDeliveryModel(driverName: $driverName, deliveryTimeStart: $deliveryTimeStart, deliveryItems: $deliveryItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDeliveryModelImpl &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.deliveryTimeStart, deliveryTimeStart) ||
                other.deliveryTimeStart == deliveryTimeStart) &&
            const DeepCollectionEquality()
                .equals(other._deliveryItems, _deliveryItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, driverName, deliveryTimeStart,
      const DeepCollectionEquality().hash(_deliveryItems));

  /// Create a copy of CreateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDeliveryModelImplCopyWith<_$CreateDeliveryModelImpl> get copyWith =>
      __$$CreateDeliveryModelImplCopyWithImpl<_$CreateDeliveryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _CreateDeliveryModel extends CreateDeliveryModel {
  const factory _CreateDeliveryModel(
          {required final String driverName,
          @JsonKey(name: 'deliveryTimeStart')
          required final String deliveryTimeStart,
          @JsonKey(name: 'deliveryItems')
          required final List<CreateDeliveryItemModel> deliveryItems}) =
      _$CreateDeliveryModelImpl;
  const _CreateDeliveryModel._() : super._();

  factory _CreateDeliveryModel.fromJson(Map<String, dynamic> json) =
      _$CreateDeliveryModelImpl.fromJson;

  @override
  String get driverName;
  @override
  @JsonKey(name: 'deliveryTimeStart')
  String get deliveryTimeStart;
  @override
  @JsonKey(name: 'deliveryItems')
  List<CreateDeliveryItemModel> get deliveryItems;

  /// Create a copy of CreateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDeliveryModelImplCopyWith<_$CreateDeliveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateDeliveryModel _$UpdateDeliveryModelFromJson(Map<String, dynamic> json) {
  return _UpdateDeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateDeliveryModel {
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryTimeStart')
  String? get deliveryTimeStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryItems')
  List<CreateDeliveryItemModel>? get deliveryItems =>
      throw _privateConstructorUsedError;

  /// Serializes this UpdateDeliveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateDeliveryModelCopyWith<UpdateDeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDeliveryModelCopyWith<$Res> {
  factory $UpdateDeliveryModelCopyWith(
          UpdateDeliveryModel value, $Res Function(UpdateDeliveryModel) then) =
      _$UpdateDeliveryModelCopyWithImpl<$Res, UpdateDeliveryModel>;
  @useResult
  $Res call(
      {String? driverName,
      @JsonKey(name: 'deliveryTimeStart') String? deliveryTimeStart,
      @JsonKey(name: 'deliveryItems')
      List<CreateDeliveryItemModel>? deliveryItems});
}

/// @nodoc
class _$UpdateDeliveryModelCopyWithImpl<$Res, $Val extends UpdateDeliveryModel>
    implements $UpdateDeliveryModelCopyWith<$Res> {
  _$UpdateDeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateDeliveryModel
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
              as String?,
      deliveryItems: freezed == deliveryItems
          ? _value.deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateDeliveryModelImplCopyWith<$Res>
    implements $UpdateDeliveryModelCopyWith<$Res> {
  factory _$$UpdateDeliveryModelImplCopyWith(_$UpdateDeliveryModelImpl value,
          $Res Function(_$UpdateDeliveryModelImpl) then) =
      __$$UpdateDeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? driverName,
      @JsonKey(name: 'deliveryTimeStart') String? deliveryTimeStart,
      @JsonKey(name: 'deliveryItems')
      List<CreateDeliveryItemModel>? deliveryItems});
}

/// @nodoc
class __$$UpdateDeliveryModelImplCopyWithImpl<$Res>
    extends _$UpdateDeliveryModelCopyWithImpl<$Res, _$UpdateDeliveryModelImpl>
    implements _$$UpdateDeliveryModelImplCopyWith<$Res> {
  __$$UpdateDeliveryModelImplCopyWithImpl(_$UpdateDeliveryModelImpl _value,
      $Res Function(_$UpdateDeliveryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverName = freezed,
    Object? deliveryTimeStart = freezed,
    Object? deliveryItems = freezed,
  }) {
    return _then(_$UpdateDeliveryModelImpl(
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTimeStart: freezed == deliveryTimeStart
          ? _value.deliveryTimeStart
          : deliveryTimeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryItems: freezed == deliveryItems
          ? _value._deliveryItems
          : deliveryItems // ignore: cast_nullable_to_non_nullable
              as List<CreateDeliveryItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateDeliveryModelImpl extends _UpdateDeliveryModel {
  const _$UpdateDeliveryModelImpl(
      {this.driverName,
      @JsonKey(name: 'deliveryTimeStart') this.deliveryTimeStart,
      @JsonKey(name: 'deliveryItems')
      final List<CreateDeliveryItemModel>? deliveryItems})
      : _deliveryItems = deliveryItems,
        super._();

  factory _$UpdateDeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateDeliveryModelImplFromJson(json);

  @override
  final String? driverName;
  @override
  @JsonKey(name: 'deliveryTimeStart')
  final String? deliveryTimeStart;
  final List<CreateDeliveryItemModel>? _deliveryItems;
  @override
  @JsonKey(name: 'deliveryItems')
  List<CreateDeliveryItemModel>? get deliveryItems {
    final value = _deliveryItems;
    if (value == null) return null;
    if (_deliveryItems is EqualUnmodifiableListView) return _deliveryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpdateDeliveryModel(driverName: $driverName, deliveryTimeStart: $deliveryTimeStart, deliveryItems: $deliveryItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeliveryModelImpl &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.deliveryTimeStart, deliveryTimeStart) ||
                other.deliveryTimeStart == deliveryTimeStart) &&
            const DeepCollectionEquality()
                .equals(other._deliveryItems, _deliveryItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, driverName, deliveryTimeStart,
      const DeepCollectionEquality().hash(_deliveryItems));

  /// Create a copy of UpdateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDeliveryModelImplCopyWith<_$UpdateDeliveryModelImpl> get copyWith =>
      __$$UpdateDeliveryModelImplCopyWithImpl<_$UpdateDeliveryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateDeliveryModel extends UpdateDeliveryModel {
  const factory _UpdateDeliveryModel(
          {final String? driverName,
          @JsonKey(name: 'deliveryTimeStart') final String? deliveryTimeStart,
          @JsonKey(name: 'deliveryItems')
          final List<CreateDeliveryItemModel>? deliveryItems}) =
      _$UpdateDeliveryModelImpl;
  const _UpdateDeliveryModel._() : super._();

  factory _UpdateDeliveryModel.fromJson(Map<String, dynamic> json) =
      _$UpdateDeliveryModelImpl.fromJson;

  @override
  String? get driverName;
  @override
  @JsonKey(name: 'deliveryTimeStart')
  String? get deliveryTimeStart;
  @override
  @JsonKey(name: 'deliveryItems')
  List<CreateDeliveryItemModel>? get deliveryItems;

  /// Create a copy of UpdateDeliveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDeliveryModelImplCopyWith<_$UpdateDeliveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
