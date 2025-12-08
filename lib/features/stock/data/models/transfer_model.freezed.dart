// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferCashierModel _$TransferCashierModelFromJson(Map<String, dynamic> json) {
  return _TransferCashierModel.fromJson(json);
}

/// @nodoc
mixin _$TransferCashierModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'branchName')
  String get branchName => throw _privateConstructorUsedError;

  /// Serializes this TransferCashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferCashierModelCopyWith<TransferCashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCashierModelCopyWith<$Res> {
  factory $TransferCashierModelCopyWith(TransferCashierModel value,
          $Res Function(TransferCashierModel) then) =
      _$TransferCashierModelCopyWithImpl<$Res, TransferCashierModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'branchName') String branchName});
}

/// @nodoc
class _$TransferCashierModelCopyWithImpl<$Res,
        $Val extends TransferCashierModel>
    implements $TransferCashierModelCopyWith<$Res> {
  _$TransferCashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferCashierModel
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
abstract class _$$TransferCashierModelImplCopyWith<$Res>
    implements $TransferCashierModelCopyWith<$Res> {
  factory _$$TransferCashierModelImplCopyWith(_$TransferCashierModelImpl value,
          $Res Function(_$TransferCashierModelImpl) then) =
      __$$TransferCashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'branchName') String branchName});
}

/// @nodoc
class __$$TransferCashierModelImplCopyWithImpl<$Res>
    extends _$TransferCashierModelCopyWithImpl<$Res, _$TransferCashierModelImpl>
    implements _$$TransferCashierModelImplCopyWith<$Res> {
  __$$TransferCashierModelImplCopyWithImpl(_$TransferCashierModelImpl _value,
      $Res Function(_$TransferCashierModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_$TransferCashierModelImpl(
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
class _$TransferCashierModelImpl extends _TransferCashierModel {
  const _$TransferCashierModelImpl(
      {required this.id,
      required this.username,
      @JsonKey(name: 'branchName') required this.branchName})
      : super._();

  factory _$TransferCashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferCashierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'branchName')
  final String branchName;

  @override
  String toString() {
    return 'TransferCashierModel(id: $id, username: $username, branchName: $branchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferCashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, branchName);

  /// Create a copy of TransferCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferCashierModelImplCopyWith<_$TransferCashierModelImpl>
      get copyWith =>
          __$$TransferCashierModelImplCopyWithImpl<_$TransferCashierModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferCashierModelImplToJson(
      this,
    );
  }
}

abstract class _TransferCashierModel extends TransferCashierModel {
  const factory _TransferCashierModel(
          {required final String id,
          required final String username,
          @JsonKey(name: 'branchName') required final String branchName}) =
      _$TransferCashierModelImpl;
  const _TransferCashierModel._() : super._();

  factory _TransferCashierModel.fromJson(Map<String, dynamic> json) =
      _$TransferCashierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'branchName')
  String get branchName;

  /// Create a copy of TransferCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferCashierModelImplCopyWith<_$TransferCashierModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) {
  return _TransferModel.fromJson(json);
}

/// @nodoc
mixin _$TransferModel {
  String get id => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'sackType')
  String? get sackType => throw _privateConstructorUsedError;
  @JsonKey(name: 'productId')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sackPriceId')
  String? get sackPriceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'perKiloPriceId')
  String? get perKiloPriceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashierId')
  String get cashierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  SackPriceModel? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPriceModel? get perKiloPrice => throw _privateConstructorUsedError;
  TransferCashierModel? get cashier => throw _privateConstructorUsedError;

  /// Serializes this TransferModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferModelCopyWith<TransferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferModelCopyWith<$Res> {
  factory $TransferModelCopyWith(
          TransferModel value, $Res Function(TransferModel) then) =
      _$TransferModelCopyWithImpl<$Res, TransferModel>;
  @useResult
  $Res call(
      {String id,
      String quantity,
      String type,
      @JsonKey(name: 'sackType') String? sackType,
      @JsonKey(name: 'productId') String productId,
      @JsonKey(name: 'sackPriceId') String? sackPriceId,
      @JsonKey(name: 'perKiloPriceId') String? perKiloPriceId,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      ProductModel? product,
      SackPriceModel? sackPrice,
      PerKiloPriceModel? perKiloPrice,
      TransferCashierModel? cashier});

  $ProductModelCopyWith<$Res>? get product;
  $SackPriceModelCopyWith<$Res>? get sackPrice;
  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice;
  $TransferCashierModelCopyWith<$Res>? get cashier;
}

/// @nodoc
class _$TransferModelCopyWithImpl<$Res, $Val extends TransferModel>
    implements $TransferModelCopyWith<$Res> {
  _$TransferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? type = null,
    Object? sackType = freezed,
    Object? productId = null,
    Object? sackPriceId = freezed,
    Object? perKiloPriceId = freezed,
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? product = freezed,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
    Object? cashier = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPriceId: freezed == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      perKiloPriceId: freezed == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as TransferCashierModel?,
    ) as $Val);
  }

  /// Create a copy of TransferModel
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

  /// Create a copy of TransferModel
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

  /// Create a copy of TransferModel
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

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransferCashierModelCopyWith<$Res>? get cashier {
    if (_value.cashier == null) {
      return null;
    }

    return $TransferCashierModelCopyWith<$Res>(_value.cashier!, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferModelImplCopyWith<$Res>
    implements $TransferModelCopyWith<$Res> {
  factory _$$TransferModelImplCopyWith(
          _$TransferModelImpl value, $Res Function(_$TransferModelImpl) then) =
      __$$TransferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String quantity,
      String type,
      @JsonKey(name: 'sackType') String? sackType,
      @JsonKey(name: 'productId') String productId,
      @JsonKey(name: 'sackPriceId') String? sackPriceId,
      @JsonKey(name: 'perKiloPriceId') String? perKiloPriceId,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      ProductModel? product,
      SackPriceModel? sackPrice,
      PerKiloPriceModel? perKiloPrice,
      TransferCashierModel? cashier});

  @override
  $ProductModelCopyWith<$Res>? get product;
  @override
  $SackPriceModelCopyWith<$Res>? get sackPrice;
  @override
  $PerKiloPriceModelCopyWith<$Res>? get perKiloPrice;
  @override
  $TransferCashierModelCopyWith<$Res>? get cashier;
}

/// @nodoc
class __$$TransferModelImplCopyWithImpl<$Res>
    extends _$TransferModelCopyWithImpl<$Res, _$TransferModelImpl>
    implements _$$TransferModelImplCopyWith<$Res> {
  __$$TransferModelImplCopyWithImpl(
      _$TransferModelImpl _value, $Res Function(_$TransferModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? type = null,
    Object? sackType = freezed,
    Object? productId = null,
    Object? sackPriceId = freezed,
    Object? perKiloPriceId = freezed,
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? product = freezed,
    Object? sackPrice = freezed,
    Object? perKiloPrice = freezed,
    Object? cashier = freezed,
  }) {
    return _then(_$TransferModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPriceId: freezed == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
      perKiloPriceId: freezed == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as TransferCashierModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferModelImpl extends _TransferModel {
  const _$TransferModelImpl(
      {required this.id,
      required this.quantity,
      required this.type,
      @JsonKey(name: 'sackType') this.sackType,
      @JsonKey(name: 'productId') required this.productId,
      @JsonKey(name: 'sackPriceId') this.sackPriceId,
      @JsonKey(name: 'perKiloPriceId') this.perKiloPriceId,
      @JsonKey(name: 'cashierId') required this.cashierId,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      this.product,
      this.sackPrice,
      this.perKiloPrice,
      this.cashier})
      : super._();

  factory _$TransferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferModelImplFromJson(json);

  @override
  final String id;
  @override
  final String quantity;
  @override
  final String type;
  @override
  @JsonKey(name: 'sackType')
  final String? sackType;
  @override
  @JsonKey(name: 'productId')
  final String productId;
  @override
  @JsonKey(name: 'sackPriceId')
  final String? sackPriceId;
  @override
  @JsonKey(name: 'perKiloPriceId')
  final String? perKiloPriceId;
  @override
  @JsonKey(name: 'cashierId')
  final String cashierId;
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
  final TransferCashierModel? cashier;

  @override
  String toString() {
    return 'TransferModel(id: $id, quantity: $quantity, type: $type, sackType: $sackType, productId: $productId, sackPriceId: $sackPriceId, perKiloPriceId: $perKiloPriceId, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice, cashier: $cashier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sackPriceId, sackPriceId) ||
                other.sackPriceId == sackPriceId) &&
            (identical(other.perKiloPriceId, perKiloPriceId) ||
                other.perKiloPriceId == perKiloPriceId) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.sackPrice, sackPrice) ||
                other.sackPrice == sackPrice) &&
            (identical(other.perKiloPrice, perKiloPrice) ||
                other.perKiloPrice == perKiloPrice) &&
            (identical(other.cashier, cashier) || other.cashier == cashier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      type,
      sackType,
      productId,
      sackPriceId,
      perKiloPriceId,
      cashierId,
      createdAt,
      updatedAt,
      product,
      sackPrice,
      perKiloPrice,
      cashier);

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferModelImplCopyWith<_$TransferModelImpl> get copyWith =>
      __$$TransferModelImplCopyWithImpl<_$TransferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferModelImplToJson(
      this,
    );
  }
}

abstract class _TransferModel extends TransferModel {
  const factory _TransferModel(
      {required final String id,
      required final String quantity,
      required final String type,
      @JsonKey(name: 'sackType') final String? sackType,
      @JsonKey(name: 'productId') required final String productId,
      @JsonKey(name: 'sackPriceId') final String? sackPriceId,
      @JsonKey(name: 'perKiloPriceId') final String? perKiloPriceId,
      @JsonKey(name: 'cashierId') required final String cashierId,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
      final ProductModel? product,
      final SackPriceModel? sackPrice,
      final PerKiloPriceModel? perKiloPrice,
      final TransferCashierModel? cashier}) = _$TransferModelImpl;
  const _TransferModel._() : super._();

  factory _TransferModel.fromJson(Map<String, dynamic> json) =
      _$TransferModelImpl.fromJson;

  @override
  String get id;
  @override
  String get quantity;
  @override
  String get type;
  @override
  @JsonKey(name: 'sackType')
  String? get sackType;
  @override
  @JsonKey(name: 'productId')
  String get productId;
  @override
  @JsonKey(name: 'sackPriceId')
  String? get sackPriceId;
  @override
  @JsonKey(name: 'perKiloPriceId')
  String? get perKiloPriceId;
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
  ProductModel? get product;
  @override
  SackPriceModel? get sackPrice;
  @override
  PerKiloPriceModel? get perKiloPrice;
  @override
  TransferCashierModel? get cashier;

  /// Create a copy of TransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferModelImplCopyWith<_$TransferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTransferSackModel _$CreateTransferSackModelFromJson(
    Map<String, dynamic> json) {
  return _CreateTransferSackModel.fromJson(json);
}

/// @nodoc
mixin _$CreateTransferSackModel {
  String get productId => throw _privateConstructorUsedError;
  String get sackPriceId => throw _privateConstructorUsedError;
  String get sackType => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get transferType => throw _privateConstructorUsedError;

  /// Serializes this CreateTransferSackModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTransferSackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTransferSackModelCopyWith<CreateTransferSackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransferSackModelCopyWith<$Res> {
  factory $CreateTransferSackModelCopyWith(CreateTransferSackModel value,
          $Res Function(CreateTransferSackModel) then) =
      _$CreateTransferSackModelCopyWithImpl<$Res, CreateTransferSackModel>;
  @useResult
  $Res call(
      {String productId,
      String sackPriceId,
      String sackType,
      double quantity,
      String transferType});
}

/// @nodoc
class _$CreateTransferSackModelCopyWithImpl<$Res,
        $Val extends CreateTransferSackModel>
    implements $CreateTransferSackModelCopyWith<$Res> {
  _$CreateTransferSackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTransferSackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? sackPriceId = null,
    Object? sackType = null,
    Object? quantity = null,
    Object? transferType = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPriceId: null == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String,
      sackType: null == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTransferSackModelImplCopyWith<$Res>
    implements $CreateTransferSackModelCopyWith<$Res> {
  factory _$$CreateTransferSackModelImplCopyWith(
          _$CreateTransferSackModelImpl value,
          $Res Function(_$CreateTransferSackModelImpl) then) =
      __$$CreateTransferSackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String sackPriceId,
      String sackType,
      double quantity,
      String transferType});
}

/// @nodoc
class __$$CreateTransferSackModelImplCopyWithImpl<$Res>
    extends _$CreateTransferSackModelCopyWithImpl<$Res,
        _$CreateTransferSackModelImpl>
    implements _$$CreateTransferSackModelImplCopyWith<$Res> {
  __$$CreateTransferSackModelImplCopyWithImpl(
      _$CreateTransferSackModelImpl _value,
      $Res Function(_$CreateTransferSackModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTransferSackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? sackPriceId = null,
    Object? sackType = null,
    Object? quantity = null,
    Object? transferType = null,
  }) {
    return _then(_$CreateTransferSackModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sackPriceId: null == sackPriceId
          ? _value.sackPriceId
          : sackPriceId // ignore: cast_nullable_to_non_nullable
              as String,
      sackType: null == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTransferSackModelImpl extends _CreateTransferSackModel {
  const _$CreateTransferSackModelImpl(
      {required this.productId,
      required this.sackPriceId,
      required this.sackType,
      required this.quantity,
      required this.transferType})
      : super._();

  factory _$CreateTransferSackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTransferSackModelImplFromJson(json);

  @override
  final String productId;
  @override
  final String sackPriceId;
  @override
  final String sackType;
  @override
  final double quantity;
  @override
  final String transferType;

  @override
  String toString() {
    return 'CreateTransferSackModel(productId: $productId, sackPriceId: $sackPriceId, sackType: $sackType, quantity: $quantity, transferType: $transferType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransferSackModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sackPriceId, sackPriceId) ||
                other.sackPriceId == sackPriceId) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, sackPriceId, sackType, quantity, transferType);

  /// Create a copy of CreateTransferSackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransferSackModelImplCopyWith<_$CreateTransferSackModelImpl>
      get copyWith => __$$CreateTransferSackModelImplCopyWithImpl<
          _$CreateTransferSackModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTransferSackModelImplToJson(
      this,
    );
  }
}

abstract class _CreateTransferSackModel extends CreateTransferSackModel {
  const factory _CreateTransferSackModel(
      {required final String productId,
      required final String sackPriceId,
      required final String sackType,
      required final double quantity,
      required final String transferType}) = _$CreateTransferSackModelImpl;
  const _CreateTransferSackModel._() : super._();

  factory _CreateTransferSackModel.fromJson(Map<String, dynamic> json) =
      _$CreateTransferSackModelImpl.fromJson;

  @override
  String get productId;
  @override
  String get sackPriceId;
  @override
  String get sackType;
  @override
  double get quantity;
  @override
  String get transferType;

  /// Create a copy of CreateTransferSackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransferSackModelImplCopyWith<_$CreateTransferSackModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateTransferPerKiloModel _$CreateTransferPerKiloModelFromJson(
    Map<String, dynamic> json) {
  return _CreateTransferPerKiloModel.fromJson(json);
}

/// @nodoc
mixin _$CreateTransferPerKiloModel {
  String get productId => throw _privateConstructorUsedError;
  String get perKiloPriceId => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get transferType => throw _privateConstructorUsedError;

  /// Serializes this CreateTransferPerKiloModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTransferPerKiloModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTransferPerKiloModelCopyWith<CreateTransferPerKiloModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransferPerKiloModelCopyWith<$Res> {
  factory $CreateTransferPerKiloModelCopyWith(CreateTransferPerKiloModel value,
          $Res Function(CreateTransferPerKiloModel) then) =
      _$CreateTransferPerKiloModelCopyWithImpl<$Res,
          CreateTransferPerKiloModel>;
  @useResult
  $Res call(
      {String productId,
      String perKiloPriceId,
      double quantity,
      String transferType});
}

/// @nodoc
class _$CreateTransferPerKiloModelCopyWithImpl<$Res,
        $Val extends CreateTransferPerKiloModel>
    implements $CreateTransferPerKiloModelCopyWith<$Res> {
  _$CreateTransferPerKiloModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTransferPerKiloModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? perKiloPriceId = null,
    Object? quantity = null,
    Object? transferType = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      perKiloPriceId: null == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTransferPerKiloModelImplCopyWith<$Res>
    implements $CreateTransferPerKiloModelCopyWith<$Res> {
  factory _$$CreateTransferPerKiloModelImplCopyWith(
          _$CreateTransferPerKiloModelImpl value,
          $Res Function(_$CreateTransferPerKiloModelImpl) then) =
      __$$CreateTransferPerKiloModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String perKiloPriceId,
      double quantity,
      String transferType});
}

/// @nodoc
class __$$CreateTransferPerKiloModelImplCopyWithImpl<$Res>
    extends _$CreateTransferPerKiloModelCopyWithImpl<$Res,
        _$CreateTransferPerKiloModelImpl>
    implements _$$CreateTransferPerKiloModelImplCopyWith<$Res> {
  __$$CreateTransferPerKiloModelImplCopyWithImpl(
      _$CreateTransferPerKiloModelImpl _value,
      $Res Function(_$CreateTransferPerKiloModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTransferPerKiloModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? perKiloPriceId = null,
    Object? quantity = null,
    Object? transferType = null,
  }) {
    return _then(_$CreateTransferPerKiloModelImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      perKiloPriceId: null == perKiloPriceId
          ? _value.perKiloPriceId
          : perKiloPriceId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTransferPerKiloModelImpl extends _CreateTransferPerKiloModel {
  const _$CreateTransferPerKiloModelImpl(
      {required this.productId,
      required this.perKiloPriceId,
      required this.quantity,
      required this.transferType})
      : super._();

  factory _$CreateTransferPerKiloModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateTransferPerKiloModelImplFromJson(json);

  @override
  final String productId;
  @override
  final String perKiloPriceId;
  @override
  final double quantity;
  @override
  final String transferType;

  @override
  String toString() {
    return 'CreateTransferPerKiloModel(productId: $productId, perKiloPriceId: $perKiloPriceId, quantity: $quantity, transferType: $transferType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransferPerKiloModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.perKiloPriceId, perKiloPriceId) ||
                other.perKiloPriceId == perKiloPriceId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, perKiloPriceId, quantity, transferType);

  /// Create a copy of CreateTransferPerKiloModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransferPerKiloModelImplCopyWith<_$CreateTransferPerKiloModelImpl>
      get copyWith => __$$CreateTransferPerKiloModelImplCopyWithImpl<
          _$CreateTransferPerKiloModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTransferPerKiloModelImplToJson(
      this,
    );
  }
}

abstract class _CreateTransferPerKiloModel extends CreateTransferPerKiloModel {
  const factory _CreateTransferPerKiloModel(
      {required final String productId,
      required final String perKiloPriceId,
      required final double quantity,
      required final String transferType}) = _$CreateTransferPerKiloModelImpl;
  const _CreateTransferPerKiloModel._() : super._();

  factory _CreateTransferPerKiloModel.fromJson(Map<String, dynamic> json) =
      _$CreateTransferPerKiloModelImpl.fromJson;

  @override
  String get productId;
  @override
  String get perKiloPriceId;
  @override
  double get quantity;
  @override
  String get transferType;

  /// Create a copy of CreateTransferPerKiloModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransferPerKiloModelImplCopyWith<_$CreateTransferPerKiloModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
