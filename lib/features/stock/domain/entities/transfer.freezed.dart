// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferCashier {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;

  /// Create a copy of TransferCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferCashierCopyWith<TransferCashier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCashierCopyWith<$Res> {
  factory $TransferCashierCopyWith(
          TransferCashier value, $Res Function(TransferCashier) then) =
      _$TransferCashierCopyWithImpl<$Res, TransferCashier>;
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class _$TransferCashierCopyWithImpl<$Res, $Val extends TransferCashier>
    implements $TransferCashierCopyWith<$Res> {
  _$TransferCashierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferCashier
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
abstract class _$$TransferCashierImplCopyWith<$Res>
    implements $TransferCashierCopyWith<$Res> {
  factory _$$TransferCashierImplCopyWith(_$TransferCashierImpl value,
          $Res Function(_$TransferCashierImpl) then) =
      __$$TransferCashierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class __$$TransferCashierImplCopyWithImpl<$Res>
    extends _$TransferCashierCopyWithImpl<$Res, _$TransferCashierImpl>
    implements _$$TransferCashierImplCopyWith<$Res> {
  __$$TransferCashierImplCopyWithImpl(
      _$TransferCashierImpl _value, $Res Function(_$TransferCashierImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferCashier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_$TransferCashierImpl(
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

class _$TransferCashierImpl implements _TransferCashier {
  const _$TransferCashierImpl(
      {required this.id, required this.username, required this.branchName});

  @override
  final String id;
  @override
  final String username;
  @override
  final String branchName;

  @override
  String toString() {
    return 'TransferCashier(id: $id, username: $username, branchName: $branchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferCashierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, username, branchName);

  /// Create a copy of TransferCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferCashierImplCopyWith<_$TransferCashierImpl> get copyWith =>
      __$$TransferCashierImplCopyWithImpl<_$TransferCashierImpl>(
          this, _$identity);
}

abstract class _TransferCashier implements TransferCashier {
  const factory _TransferCashier(
      {required final String id,
      required final String username,
      required final String branchName}) = _$TransferCashierImpl;

  @override
  String get id;
  @override
  String get username;
  @override
  String get branchName;

  /// Create a copy of TransferCashier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferCashierImplCopyWith<_$TransferCashierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Transfer {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  TransferType get type => throw _privateConstructorUsedError;
  SackType? get sackType => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get sackPriceId => throw _privateConstructorUsedError;
  String? get perKiloPriceId => throw _privateConstructorUsedError;
  String get cashierId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt =>
      throw _privateConstructorUsedError; // Nested entities
  Product? get product => throw _privateConstructorUsedError;
  SackPrice? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPrice? get perKiloPrice => throw _privateConstructorUsedError;
  TransferCashier? get cashier => throw _privateConstructorUsedError;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferCopyWith<Transfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) then) =
      _$TransferCopyWithImpl<$Res, Transfer>;
  @useResult
  $Res call(
      {String id,
      double quantity,
      TransferType type,
      SackType? sackType,
      String productId,
      String? sackPriceId,
      String? perKiloPriceId,
      String cashierId,
      DateTime createdAt,
      DateTime updatedAt,
      Product? product,
      SackPrice? sackPrice,
      PerKiloPrice? perKiloPrice,
      TransferCashier? cashier});

  $ProductCopyWith<$Res>? get product;
  $SackPriceCopyWith<$Res>? get sackPrice;
  $PerKiloPriceCopyWith<$Res>? get perKiloPrice;
  $TransferCashierCopyWith<$Res>? get cashier;
}

/// @nodoc
class _$TransferCopyWithImpl<$Res, $Val extends Transfer>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transfer
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
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransferType,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
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
              as Product?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPrice?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPrice?,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as TransferCashier?,
    ) as $Val);
  }

  /// Create a copy of Transfer
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

  /// Create a copy of Transfer
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

  /// Create a copy of Transfer
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

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransferCashierCopyWith<$Res>? get cashier {
    if (_value.cashier == null) {
      return null;
    }

    return $TransferCashierCopyWith<$Res>(_value.cashier!, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferImplCopyWith<$Res>
    implements $TransferCopyWith<$Res> {
  factory _$$TransferImplCopyWith(
          _$TransferImpl value, $Res Function(_$TransferImpl) then) =
      __$$TransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double quantity,
      TransferType type,
      SackType? sackType,
      String productId,
      String? sackPriceId,
      String? perKiloPriceId,
      String cashierId,
      DateTime createdAt,
      DateTime updatedAt,
      Product? product,
      SackPrice? sackPrice,
      PerKiloPrice? perKiloPrice,
      TransferCashier? cashier});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $SackPriceCopyWith<$Res>? get sackPrice;
  @override
  $PerKiloPriceCopyWith<$Res>? get perKiloPrice;
  @override
  $TransferCashierCopyWith<$Res>? get cashier;
}

/// @nodoc
class __$$TransferImplCopyWithImpl<$Res>
    extends _$TransferCopyWithImpl<$Res, _$TransferImpl>
    implements _$$TransferImplCopyWith<$Res> {
  __$$TransferImplCopyWithImpl(
      _$TransferImpl _value, $Res Function(_$TransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transfer
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
    return _then(_$TransferImpl(
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
              as TransferType,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
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
              as Product?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPrice?,
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPrice?,
      cashier: freezed == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as TransferCashier?,
    ));
  }
}

/// @nodoc

class _$TransferImpl extends _Transfer {
  const _$TransferImpl(
      {required this.id,
      required this.quantity,
      required this.type,
      this.sackType,
      required this.productId,
      this.sackPriceId,
      this.perKiloPriceId,
      required this.cashierId,
      required this.createdAt,
      required this.updatedAt,
      this.product,
      this.sackPrice,
      this.perKiloPrice,
      this.cashier})
      : super._();

  @override
  final String id;
  @override
  final double quantity;
  @override
  final TransferType type;
  @override
  final SackType? sackType;
  @override
  final String productId;
  @override
  final String? sackPriceId;
  @override
  final String? perKiloPriceId;
  @override
  final String cashierId;
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
  final TransferCashier? cashier;

  @override
  String toString() {
    return 'Transfer(id: $id, quantity: $quantity, type: $type, sackType: $sackType, productId: $productId, sackPriceId: $sackPriceId, perKiloPriceId: $perKiloPriceId, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice, cashier: $cashier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferImpl &&
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

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      __$$TransferImplCopyWithImpl<_$TransferImpl>(this, _$identity);
}

abstract class _Transfer extends Transfer {
  const factory _Transfer(
      {required final String id,
      required final double quantity,
      required final TransferType type,
      final SackType? sackType,
      required final String productId,
      final String? sackPriceId,
      final String? perKiloPriceId,
      required final String cashierId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final Product? product,
      final SackPrice? sackPrice,
      final PerKiloPrice? perKiloPrice,
      final TransferCashier? cashier}) = _$TransferImpl;
  const _Transfer._() : super._();

  @override
  String get id;
  @override
  double get quantity;
  @override
  TransferType get type;
  @override
  SackType? get sackType;
  @override
  String get productId;
  @override
  String? get sackPriceId;
  @override
  String? get perKiloPriceId;
  @override
  String get cashierId;
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
  @override
  TransferCashier? get cashier;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateTransferSackDto {
  String get productId => throw _privateConstructorUsedError;
  String get sackPriceId => throw _privateConstructorUsedError;
  SackType get sackType => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  TransferType get transferType => throw _privateConstructorUsedError;

  /// Create a copy of CreateTransferSackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTransferSackDtoCopyWith<CreateTransferSackDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransferSackDtoCopyWith<$Res> {
  factory $CreateTransferSackDtoCopyWith(CreateTransferSackDto value,
          $Res Function(CreateTransferSackDto) then) =
      _$CreateTransferSackDtoCopyWithImpl<$Res, CreateTransferSackDto>;
  @useResult
  $Res call(
      {String productId,
      String sackPriceId,
      SackType sackType,
      double quantity,
      TransferType transferType});
}

/// @nodoc
class _$CreateTransferSackDtoCopyWithImpl<$Res,
        $Val extends CreateTransferSackDto>
    implements $CreateTransferSackDtoCopyWith<$Res> {
  _$CreateTransferSackDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTransferSackDto
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
              as SackType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTransferSackDtoImplCopyWith<$Res>
    implements $CreateTransferSackDtoCopyWith<$Res> {
  factory _$$CreateTransferSackDtoImplCopyWith(
          _$CreateTransferSackDtoImpl value,
          $Res Function(_$CreateTransferSackDtoImpl) then) =
      __$$CreateTransferSackDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String sackPriceId,
      SackType sackType,
      double quantity,
      TransferType transferType});
}

/// @nodoc
class __$$CreateTransferSackDtoImplCopyWithImpl<$Res>
    extends _$CreateTransferSackDtoCopyWithImpl<$Res,
        _$CreateTransferSackDtoImpl>
    implements _$$CreateTransferSackDtoImplCopyWith<$Res> {
  __$$CreateTransferSackDtoImplCopyWithImpl(_$CreateTransferSackDtoImpl _value,
      $Res Function(_$CreateTransferSackDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTransferSackDto
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
    return _then(_$CreateTransferSackDtoImpl(
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
              as SackType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType,
    ));
  }
}

/// @nodoc

class _$CreateTransferSackDtoImpl implements _CreateTransferSackDto {
  const _$CreateTransferSackDtoImpl(
      {required this.productId,
      required this.sackPriceId,
      required this.sackType,
      required this.quantity,
      required this.transferType});

  @override
  final String productId;
  @override
  final String sackPriceId;
  @override
  final SackType sackType;
  @override
  final double quantity;
  @override
  final TransferType transferType;

  @override
  String toString() {
    return 'CreateTransferSackDto(productId: $productId, sackPriceId: $sackPriceId, sackType: $sackType, quantity: $quantity, transferType: $transferType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransferSackDtoImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, productId, sackPriceId, sackType, quantity, transferType);

  /// Create a copy of CreateTransferSackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransferSackDtoImplCopyWith<_$CreateTransferSackDtoImpl>
      get copyWith => __$$CreateTransferSackDtoImplCopyWithImpl<
          _$CreateTransferSackDtoImpl>(this, _$identity);
}

abstract class _CreateTransferSackDto implements CreateTransferSackDto {
  const factory _CreateTransferSackDto(
      {required final String productId,
      required final String sackPriceId,
      required final SackType sackType,
      required final double quantity,
      required final TransferType transferType}) = _$CreateTransferSackDtoImpl;

  @override
  String get productId;
  @override
  String get sackPriceId;
  @override
  SackType get sackType;
  @override
  double get quantity;
  @override
  TransferType get transferType;

  /// Create a copy of CreateTransferSackDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransferSackDtoImplCopyWith<_$CreateTransferSackDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateTransferPerKiloDto {
  String get productId => throw _privateConstructorUsedError;
  String get perKiloPriceId => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  TransferType get transferType => throw _privateConstructorUsedError;

  /// Create a copy of CreateTransferPerKiloDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTransferPerKiloDtoCopyWith<CreateTransferPerKiloDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransferPerKiloDtoCopyWith<$Res> {
  factory $CreateTransferPerKiloDtoCopyWith(CreateTransferPerKiloDto value,
          $Res Function(CreateTransferPerKiloDto) then) =
      _$CreateTransferPerKiloDtoCopyWithImpl<$Res, CreateTransferPerKiloDto>;
  @useResult
  $Res call(
      {String productId,
      String perKiloPriceId,
      double quantity,
      TransferType transferType});
}

/// @nodoc
class _$CreateTransferPerKiloDtoCopyWithImpl<$Res,
        $Val extends CreateTransferPerKiloDto>
    implements $CreateTransferPerKiloDtoCopyWith<$Res> {
  _$CreateTransferPerKiloDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTransferPerKiloDto
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
              as TransferType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTransferPerKiloDtoImplCopyWith<$Res>
    implements $CreateTransferPerKiloDtoCopyWith<$Res> {
  factory _$$CreateTransferPerKiloDtoImplCopyWith(
          _$CreateTransferPerKiloDtoImpl value,
          $Res Function(_$CreateTransferPerKiloDtoImpl) then) =
      __$$CreateTransferPerKiloDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String perKiloPriceId,
      double quantity,
      TransferType transferType});
}

/// @nodoc
class __$$CreateTransferPerKiloDtoImplCopyWithImpl<$Res>
    extends _$CreateTransferPerKiloDtoCopyWithImpl<$Res,
        _$CreateTransferPerKiloDtoImpl>
    implements _$$CreateTransferPerKiloDtoImplCopyWith<$Res> {
  __$$CreateTransferPerKiloDtoImplCopyWithImpl(
      _$CreateTransferPerKiloDtoImpl _value,
      $Res Function(_$CreateTransferPerKiloDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTransferPerKiloDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? perKiloPriceId = null,
    Object? quantity = null,
    Object? transferType = null,
  }) {
    return _then(_$CreateTransferPerKiloDtoImpl(
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
              as TransferType,
    ));
  }
}

/// @nodoc

class _$CreateTransferPerKiloDtoImpl implements _CreateTransferPerKiloDto {
  const _$CreateTransferPerKiloDtoImpl(
      {required this.productId,
      required this.perKiloPriceId,
      required this.quantity,
      required this.transferType});

  @override
  final String productId;
  @override
  final String perKiloPriceId;
  @override
  final double quantity;
  @override
  final TransferType transferType;

  @override
  String toString() {
    return 'CreateTransferPerKiloDto(productId: $productId, perKiloPriceId: $perKiloPriceId, quantity: $quantity, transferType: $transferType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransferPerKiloDtoImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.perKiloPriceId, perKiloPriceId) ||
                other.perKiloPriceId == perKiloPriceId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productId, perKiloPriceId, quantity, transferType);

  /// Create a copy of CreateTransferPerKiloDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransferPerKiloDtoImplCopyWith<_$CreateTransferPerKiloDtoImpl>
      get copyWith => __$$CreateTransferPerKiloDtoImplCopyWithImpl<
          _$CreateTransferPerKiloDtoImpl>(this, _$identity);
}

abstract class _CreateTransferPerKiloDto implements CreateTransferPerKiloDto {
  const factory _CreateTransferPerKiloDto(
          {required final String productId,
          required final String perKiloPriceId,
          required final double quantity,
          required final TransferType transferType}) =
      _$CreateTransferPerKiloDtoImpl;

  @override
  String get productId;
  @override
  String get perKiloPriceId;
  @override
  double get quantity;
  @override
  TransferType get transferType;

  /// Create a copy of CreateTransferPerKiloDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransferPerKiloDtoImplCopyWith<_$CreateTransferPerKiloDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateTransferDto {
  double? get quantity => throw _privateConstructorUsedError;
  TransferType? get transferType => throw _privateConstructorUsedError;
  SackType? get sackType => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTransferDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTransferDtoCopyWith<UpdateTransferDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTransferDtoCopyWith<$Res> {
  factory $UpdateTransferDtoCopyWith(
          UpdateTransferDto value, $Res Function(UpdateTransferDto) then) =
      _$UpdateTransferDtoCopyWithImpl<$Res, UpdateTransferDto>;
  @useResult
  $Res call({double? quantity, TransferType? transferType, SackType? sackType});
}

/// @nodoc
class _$UpdateTransferDtoCopyWithImpl<$Res, $Val extends UpdateTransferDto>
    implements $UpdateTransferDtoCopyWith<$Res> {
  _$UpdateTransferDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTransferDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? transferType = freezed,
    Object? sackType = freezed,
  }) {
    return _then(_value.copyWith(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      transferType: freezed == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType?,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTransferDtoImplCopyWith<$Res>
    implements $UpdateTransferDtoCopyWith<$Res> {
  factory _$$UpdateTransferDtoImplCopyWith(_$UpdateTransferDtoImpl value,
          $Res Function(_$UpdateTransferDtoImpl) then) =
      __$$UpdateTransferDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? quantity, TransferType? transferType, SackType? sackType});
}

/// @nodoc
class __$$UpdateTransferDtoImplCopyWithImpl<$Res>
    extends _$UpdateTransferDtoCopyWithImpl<$Res, _$UpdateTransferDtoImpl>
    implements _$$UpdateTransferDtoImplCopyWith<$Res> {
  __$$UpdateTransferDtoImplCopyWithImpl(_$UpdateTransferDtoImpl _value,
      $Res Function(_$UpdateTransferDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTransferDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? transferType = freezed,
    Object? sackType = freezed,
  }) {
    return _then(_$UpdateTransferDtoImpl(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      transferType: freezed == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType?,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
    ));
  }
}

/// @nodoc

class _$UpdateTransferDtoImpl implements _UpdateTransferDto {
  const _$UpdateTransferDtoImpl(
      {this.quantity, this.transferType, this.sackType});

  @override
  final double? quantity;
  @override
  final TransferType? transferType;
  @override
  final SackType? sackType;

  @override
  String toString() {
    return 'UpdateTransferDto(quantity: $quantity, transferType: $transferType, sackType: $sackType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransferDtoImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, transferType, sackType);

  /// Create a copy of UpdateTransferDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransferDtoImplCopyWith<_$UpdateTransferDtoImpl> get copyWith =>
      __$$UpdateTransferDtoImplCopyWithImpl<_$UpdateTransferDtoImpl>(
          this, _$identity);
}

abstract class _UpdateTransferDto implements UpdateTransferDto {
  const factory _UpdateTransferDto(
      {final double? quantity,
      final TransferType? transferType,
      final SackType? sackType}) = _$UpdateTransferDtoImpl;

  @override
  double? get quantity;
  @override
  TransferType? get transferType;
  @override
  SackType? get sackType;

  /// Create a copy of UpdateTransferDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTransferDtoImplCopyWith<_$UpdateTransferDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransferFilter {
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  TransferType? get type => throw _privateConstructorUsedError;

  /// Create a copy of TransferFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferFilterCopyWith<TransferFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferFilterCopyWith<$Res> {
  factory $TransferFilterCopyWith(
          TransferFilter value, $Res Function(TransferFilter) then) =
      _$TransferFilterCopyWithImpl<$Res, TransferFilter>;
  @useResult
  $Res call({DateTime? startDate, DateTime? endDate, TransferType? type});
}

/// @nodoc
class _$TransferFilterCopyWithImpl<$Res, $Val extends TransferFilter>
    implements $TransferFilterCopyWith<$Res> {
  _$TransferFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? type = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransferType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferFilterImplCopyWith<$Res>
    implements $TransferFilterCopyWith<$Res> {
  factory _$$TransferFilterImplCopyWith(_$TransferFilterImpl value,
          $Res Function(_$TransferFilterImpl) then) =
      __$$TransferFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? startDate, DateTime? endDate, TransferType? type});
}

/// @nodoc
class __$$TransferFilterImplCopyWithImpl<$Res>
    extends _$TransferFilterCopyWithImpl<$Res, _$TransferFilterImpl>
    implements _$$TransferFilterImplCopyWith<$Res> {
  __$$TransferFilterImplCopyWithImpl(
      _$TransferFilterImpl _value, $Res Function(_$TransferFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? type = freezed,
  }) {
    return _then(_$TransferFilterImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransferType?,
    ));
  }
}

/// @nodoc

class _$TransferFilterImpl implements _TransferFilter {
  const _$TransferFilterImpl({this.startDate, this.endDate, this.type});

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final TransferType? type;

  @override
  String toString() {
    return 'TransferFilter(startDate: $startDate, endDate: $endDate, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferFilterImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, type);

  /// Create a copy of TransferFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferFilterImplCopyWith<_$TransferFilterImpl> get copyWith =>
      __$$TransferFilterImplCopyWithImpl<_$TransferFilterImpl>(
          this, _$identity);
}

abstract class _TransferFilter implements TransferFilter {
  const factory _TransferFilter(
      {final DateTime? startDate,
      final DateTime? endDate,
      final TransferType? type}) = _$TransferFilterImpl;

  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  TransferType? get type;

  /// Create a copy of TransferFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferFilterImplCopyWith<_$TransferFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
