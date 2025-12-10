// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaleItemModel _$SaleItemModelFromJson(Map<String, dynamic> json) {
  return _SaleItemModel.fromJson(json);
}

/// @nodoc
mixin _$SaleItemModel {
  String get id => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get discountedPrice => throw _privateConstructorUsedError;
  bool get isDiscounted => throw _privateConstructorUsedError;
  bool get isGantang => throw _privateConstructorUsedError;
  bool get isSpecialPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'productId')
  String get productId => throw _privateConstructorUsedError;
  String? get sackPriceId => throw _privateConstructorUsedError;
  String? get sackType => throw _privateConstructorUsedError;
  String? get perKiloPriceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  SackPriceModel? get sackPrice => throw _privateConstructorUsedError;
  PerKiloPriceModel? get perKiloPrice => throw _privateConstructorUsedError;

  /// Serializes this SaleItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleItemModelCopyWith<SaleItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleItemModelCopyWith<$Res> {
  factory $SaleItemModelCopyWith(
          SaleItemModel value, $Res Function(SaleItemModel) then) =
      _$SaleItemModelCopyWithImpl<$Res, SaleItemModel>;
  @useResult
  $Res call(
      {String id,
      String quantity,
      String price,
      String? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      bool isSpecialPrice,
      @JsonKey(name: 'productId') String productId,
      String? sackPriceId,
      String? sackType,
      String? perKiloPriceId,
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
class _$SaleItemModelCopyWithImpl<$Res, $Val extends SaleItemModel>
    implements $SaleItemModelCopyWith<$Res> {
  _$SaleItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleItemModel
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
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of SaleItemModel
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

  /// Create a copy of SaleItemModel
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

  /// Create a copy of SaleItemModel
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
abstract class _$$SaleItemModelImplCopyWith<$Res>
    implements $SaleItemModelCopyWith<$Res> {
  factory _$$SaleItemModelImplCopyWith(
          _$SaleItemModelImpl value, $Res Function(_$SaleItemModelImpl) then) =
      __$$SaleItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String quantity,
      String price,
      String? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      bool isSpecialPrice,
      @JsonKey(name: 'productId') String productId,
      String? sackPriceId,
      String? sackType,
      String? perKiloPriceId,
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
class __$$SaleItemModelImplCopyWithImpl<$Res>
    extends _$SaleItemModelCopyWithImpl<$Res, _$SaleItemModelImpl>
    implements _$$SaleItemModelImplCopyWith<$Res> {
  __$$SaleItemModelImplCopyWithImpl(
      _$SaleItemModelImpl _value, $Res Function(_$SaleItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleItemModel
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
    return _then(_$SaleItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$SaleItemModelImpl extends _SaleItemModel {
  const _$SaleItemModelImpl(
      {required this.id,
      required this.quantity,
      required this.price,
      this.discountedPrice,
      this.isDiscounted = false,
      this.isGantang = false,
      this.isSpecialPrice = false,
      @JsonKey(name: 'productId') required this.productId,
      this.sackPriceId,
      this.sackType,
      this.perKiloPriceId,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      this.product,
      this.sackPrice,
      this.perKiloPrice})
      : super._();

  factory _$SaleItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String quantity;
  @override
  final String price;
  @override
  final String? discountedPrice;
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
  @JsonKey(name: 'productId')
  final String productId;
  @override
  final String? sackPriceId;
  @override
  final String? sackType;
  @override
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
    return 'SaleItemModel(id: $id, quantity: $quantity, price: $price, discountedPrice: $discountedPrice, isDiscounted: $isDiscounted, isGantang: $isGantang, isSpecialPrice: $isSpecialPrice, productId: $productId, sackPriceId: $sackPriceId, sackType: $sackType, perKiloPriceId: $perKiloPriceId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, sackPrice: $sackPrice, perKiloPrice: $perKiloPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleItemModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleItemModelImplCopyWith<_$SaleItemModelImpl> get copyWith =>
      __$$SaleItemModelImplCopyWithImpl<_$SaleItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleItemModelImplToJson(
      this,
    );
  }
}

abstract class _SaleItemModel extends SaleItemModel {
  const factory _SaleItemModel(
      {required final String id,
      required final String quantity,
      required final String price,
      final String? discountedPrice,
      final bool isDiscounted,
      final bool isGantang,
      final bool isSpecialPrice,
      @JsonKey(name: 'productId') required final String productId,
      final String? sackPriceId,
      final String? sackType,
      final String? perKiloPriceId,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
      final ProductModel? product,
      final SackPriceModel? sackPrice,
      final PerKiloPriceModel? perKiloPrice}) = _$SaleItemModelImpl;
  const _SaleItemModel._() : super._();

  factory _SaleItemModel.fromJson(Map<String, dynamic> json) =
      _$SaleItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get quantity;
  @override
  String get price;
  @override
  String? get discountedPrice;
  @override
  bool get isDiscounted;
  @override
  bool get isGantang;
  @override
  bool get isSpecialPrice;
  @override
  @JsonKey(name: 'productId')
  String get productId;
  @override
  String? get sackPriceId;
  @override
  String? get sackType;
  @override
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

  /// Create a copy of SaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleItemModelImplCopyWith<_$SaleItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaleModel _$SaleModelFromJson(Map<String, dynamic> json) {
  return _SaleModel.fromJson(json);
}

/// @nodoc
mixin _$SaleModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalAmount')
  String get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod')
  String get paymentMethod => throw _privateConstructorUsedError;
  bool get isVoid => throw _privateConstructorUsedError;
  DateTime? get voidedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashierId')
  String get cashierId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  List<SaleItemModel> get saleItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SaleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleModelCopyWith<SaleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleModelCopyWith<$Res> {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) then) =
      _$SaleModelCopyWithImpl<$Res, SaleModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'totalAmount') String totalAmount,
      @JsonKey(name: 'paymentMethod') String paymentMethod,
      bool isVoid,
      DateTime? voidedAt,
      @JsonKey(name: 'cashierId') String cashierId,
      String? orderId,
      List<SaleItemModel> saleItems,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SaleModelCopyWithImpl<$Res, $Val extends SaleModel>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleModel
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
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<SaleItemModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleModelImplCopyWith<$Res>
    implements $SaleModelCopyWith<$Res> {
  factory _$$SaleModelImplCopyWith(
          _$SaleModelImpl value, $Res Function(_$SaleModelImpl) then) =
      __$$SaleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'totalAmount') String totalAmount,
      @JsonKey(name: 'paymentMethod') String paymentMethod,
      bool isVoid,
      DateTime? voidedAt,
      @JsonKey(name: 'cashierId') String cashierId,
      String? orderId,
      List<SaleItemModel> saleItems,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SaleModelImplCopyWithImpl<$Res>
    extends _$SaleModelCopyWithImpl<$Res, _$SaleModelImpl>
    implements _$$SaleModelImplCopyWith<$Res> {
  __$$SaleModelImplCopyWithImpl(
      _$SaleModelImpl _value, $Res Function(_$SaleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleModel
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
    Object? metadata = freezed,
  }) {
    return _then(_$SaleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<SaleItemModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleModelImpl extends _SaleModel {
  const _$SaleModelImpl(
      {required this.id,
      @JsonKey(name: 'totalAmount') required this.totalAmount,
      @JsonKey(name: 'paymentMethod') required this.paymentMethod,
      this.isVoid = false,
      this.voidedAt,
      @JsonKey(name: 'cashierId') required this.cashierId,
      this.orderId,
      final List<SaleItemModel> saleItems = const [],
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      final Map<String, dynamic>? metadata})
      : _saleItems = saleItems,
        _metadata = metadata,
        super._();

  factory _$SaleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'totalAmount')
  final String totalAmount;
  @override
  @JsonKey(name: 'paymentMethod')
  final String paymentMethod;
  @override
  @JsonKey()
  final bool isVoid;
  @override
  final DateTime? voidedAt;
  @override
  @JsonKey(name: 'cashierId')
  final String cashierId;
  @override
  final String? orderId;
  final List<SaleItemModel> _saleItems;
  @override
  @JsonKey()
  List<SaleItemModel> get saleItems {
    if (_saleItems is EqualUnmodifiableListView) return _saleItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saleItems);
  }

  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  final Map<String, dynamic>? _metadata;
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
    return 'SaleModel(id: $id, totalAmount: $totalAmount, paymentMethod: $paymentMethod, isVoid: $isVoid, voidedAt: $voidedAt, cashierId: $cashierId, orderId: $orderId, saleItems: $saleItems, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleModelImpl &&
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
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleModelImplCopyWith<_$SaleModelImpl> get copyWith =>
      __$$SaleModelImplCopyWithImpl<_$SaleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleModelImplToJson(
      this,
    );
  }
}

abstract class _SaleModel extends SaleModel {
  const factory _SaleModel(
      {required final String id,
      @JsonKey(name: 'totalAmount') required final String totalAmount,
      @JsonKey(name: 'paymentMethod') required final String paymentMethod,
      final bool isVoid,
      final DateTime? voidedAt,
      @JsonKey(name: 'cashierId') required final String cashierId,
      final String? orderId,
      final List<SaleItemModel> saleItems,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'updatedAt') required final DateTime updatedAt,
      final Map<String, dynamic>? metadata}) = _$SaleModelImpl;
  const _SaleModel._() : super._();

  factory _SaleModel.fromJson(Map<String, dynamic> json) =
      _$SaleModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'totalAmount')
  String get totalAmount;
  @override
  @JsonKey(name: 'paymentMethod')
  String get paymentMethod;
  @override
  bool get isVoid;
  @override
  DateTime? get voidedAt;
  @override
  @JsonKey(name: 'cashierId')
  String get cashierId;
  @override
  String? get orderId;
  @override
  List<SaleItemModel> get saleItems;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleModelImplCopyWith<_$SaleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateSaleRequest _$CreateSaleRequestFromJson(Map<String, dynamic> json) {
  return _CreateSaleRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSaleRequest {
  String get totalAmount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  List<CreateSaleItemRequest> get saleItem =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CreateSaleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSaleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSaleRequestCopyWith<CreateSaleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSaleRequestCopyWith<$Res> {
  factory $CreateSaleRequestCopyWith(
          CreateSaleRequest value, $Res Function(CreateSaleRequest) then) =
      _$CreateSaleRequestCopyWithImpl<$Res, CreateSaleRequest>;
  @useResult
  $Res call(
      {String totalAmount,
      String paymentMethod,
      String? orderId,
      List<CreateSaleItemRequest> saleItem,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CreateSaleRequestCopyWithImpl<$Res, $Val extends CreateSaleRequest>
    implements $CreateSaleRequestCopyWith<$Res> {
  _$CreateSaleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSaleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? orderId = freezed,
    Object? saleItem = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      saleItem: null == saleItem
          ? _value.saleItem
          : saleItem // ignore: cast_nullable_to_non_nullable
              as List<CreateSaleItemRequest>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSaleRequestImplCopyWith<$Res>
    implements $CreateSaleRequestCopyWith<$Res> {
  factory _$$CreateSaleRequestImplCopyWith(_$CreateSaleRequestImpl value,
          $Res Function(_$CreateSaleRequestImpl) then) =
      __$$CreateSaleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String totalAmount,
      String paymentMethod,
      String? orderId,
      List<CreateSaleItemRequest> saleItem,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CreateSaleRequestImplCopyWithImpl<$Res>
    extends _$CreateSaleRequestCopyWithImpl<$Res, _$CreateSaleRequestImpl>
    implements _$$CreateSaleRequestImplCopyWith<$Res> {
  __$$CreateSaleRequestImplCopyWithImpl(_$CreateSaleRequestImpl _value,
      $Res Function(_$CreateSaleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSaleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? orderId = freezed,
    Object? saleItem = null,
    Object? metadata = freezed,
  }) {
    return _then(_$CreateSaleRequestImpl(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      saleItem: null == saleItem
          ? _value._saleItem
          : saleItem // ignore: cast_nullable_to_non_nullable
              as List<CreateSaleItemRequest>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSaleRequestImpl extends _CreateSaleRequest {
  const _$CreateSaleRequestImpl(
      {required this.totalAmount,
      required this.paymentMethod,
      this.orderId,
      required final List<CreateSaleItemRequest> saleItem,
      final Map<String, dynamic>? metadata})
      : _saleItem = saleItem,
        _metadata = metadata,
        super._();

  factory _$CreateSaleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSaleRequestImplFromJson(json);

  @override
  final String totalAmount;
  @override
  final String paymentMethod;
  @override
  final String? orderId;
  final List<CreateSaleItemRequest> _saleItem;
  @override
  List<CreateSaleItemRequest> get saleItem {
    if (_saleItem is EqualUnmodifiableListView) return _saleItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saleItem);
  }

  final Map<String, dynamic>? _metadata;
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
    return 'CreateSaleRequest(totalAmount: $totalAmount, paymentMethod: $paymentMethod, orderId: $orderId, saleItem: $saleItem, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSaleRequestImpl &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality().equals(other._saleItem, _saleItem) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalAmount,
      paymentMethod,
      orderId,
      const DeepCollectionEquality().hash(_saleItem),
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CreateSaleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSaleRequestImplCopyWith<_$CreateSaleRequestImpl> get copyWith =>
      __$$CreateSaleRequestImplCopyWithImpl<_$CreateSaleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSaleRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateSaleRequest extends CreateSaleRequest {
  const factory _CreateSaleRequest(
      {required final String totalAmount,
      required final String paymentMethod,
      final String? orderId,
      required final List<CreateSaleItemRequest> saleItem,
      final Map<String, dynamic>? metadata}) = _$CreateSaleRequestImpl;
  const _CreateSaleRequest._() : super._();

  factory _CreateSaleRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSaleRequestImpl.fromJson;

  @override
  String get totalAmount;
  @override
  String get paymentMethod;
  @override
  String? get orderId;
  @override
  List<CreateSaleItemRequest> get saleItem;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CreateSaleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSaleRequestImplCopyWith<_$CreateSaleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateSaleItemRequest _$CreateSaleItemRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateSaleItemRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSaleItemRequest {
  String get id => throw _privateConstructorUsedError; // Product ID
  String? get price => throw _privateConstructorUsedError; // Override price
  String? get discountedPrice => throw _privateConstructorUsedError;
  bool get isDiscounted => throw _privateConstructorUsedError;
  bool get isGantang => throw _privateConstructorUsedError;
  bool get isSpecialPrice => throw _privateConstructorUsedError;
  PerKiloPriceRequest? get perKiloPrice => throw _privateConstructorUsedError;
  SackPriceRequest? get sackPrice => throw _privateConstructorUsedError;

  /// Serializes this CreateSaleItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSaleItemRequestCopyWith<CreateSaleItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSaleItemRequestCopyWith<$Res> {
  factory $CreateSaleItemRequestCopyWith(CreateSaleItemRequest value,
          $Res Function(CreateSaleItemRequest) then) =
      _$CreateSaleItemRequestCopyWithImpl<$Res, CreateSaleItemRequest>;
  @useResult
  $Res call(
      {String id,
      String? price,
      String? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      bool isSpecialPrice,
      PerKiloPriceRequest? perKiloPrice,
      SackPriceRequest? sackPrice});

  $PerKiloPriceRequestCopyWith<$Res>? get perKiloPrice;
  $SackPriceRequestCopyWith<$Res>? get sackPrice;
}

/// @nodoc
class _$CreateSaleItemRequestCopyWithImpl<$Res,
        $Val extends CreateSaleItemRequest>
    implements $CreateSaleItemRequestCopyWith<$Res> {
  _$CreateSaleItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = freezed,
    Object? discountedPrice = freezed,
    Object? isDiscounted = null,
    Object? isGantang = null,
    Object? isSpecialPrice = null,
    Object? perKiloPrice = freezed,
    Object? sackPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
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
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceRequest?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceRequest?,
    ) as $Val);
  }

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerKiloPriceRequestCopyWith<$Res>? get perKiloPrice {
    if (_value.perKiloPrice == null) {
      return null;
    }

    return $PerKiloPriceRequestCopyWith<$Res>(_value.perKiloPrice!, (value) {
      return _then(_value.copyWith(perKiloPrice: value) as $Val);
    });
  }

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SackPriceRequestCopyWith<$Res>? get sackPrice {
    if (_value.sackPrice == null) {
      return null;
    }

    return $SackPriceRequestCopyWith<$Res>(_value.sackPrice!, (value) {
      return _then(_value.copyWith(sackPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateSaleItemRequestImplCopyWith<$Res>
    implements $CreateSaleItemRequestCopyWith<$Res> {
  factory _$$CreateSaleItemRequestImplCopyWith(
          _$CreateSaleItemRequestImpl value,
          $Res Function(_$CreateSaleItemRequestImpl) then) =
      __$$CreateSaleItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? price,
      String? discountedPrice,
      bool isDiscounted,
      bool isGantang,
      bool isSpecialPrice,
      PerKiloPriceRequest? perKiloPrice,
      SackPriceRequest? sackPrice});

  @override
  $PerKiloPriceRequestCopyWith<$Res>? get perKiloPrice;
  @override
  $SackPriceRequestCopyWith<$Res>? get sackPrice;
}

/// @nodoc
class __$$CreateSaleItemRequestImplCopyWithImpl<$Res>
    extends _$CreateSaleItemRequestCopyWithImpl<$Res,
        _$CreateSaleItemRequestImpl>
    implements _$$CreateSaleItemRequestImplCopyWith<$Res> {
  __$$CreateSaleItemRequestImplCopyWithImpl(_$CreateSaleItemRequestImpl _value,
      $Res Function(_$CreateSaleItemRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = freezed,
    Object? discountedPrice = freezed,
    Object? isDiscounted = null,
    Object? isGantang = null,
    Object? isSpecialPrice = null,
    Object? perKiloPrice = freezed,
    Object? sackPrice = freezed,
  }) {
    return _then(_$CreateSaleItemRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
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
      perKiloPrice: freezed == perKiloPrice
          ? _value.perKiloPrice
          : perKiloPrice // ignore: cast_nullable_to_non_nullable
              as PerKiloPriceRequest?,
      sackPrice: freezed == sackPrice
          ? _value.sackPrice
          : sackPrice // ignore: cast_nullable_to_non_nullable
              as SackPriceRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSaleItemRequestImpl extends _CreateSaleItemRequest {
  const _$CreateSaleItemRequestImpl(
      {required this.id,
      this.price,
      this.discountedPrice,
      this.isDiscounted = false,
      this.isGantang = false,
      this.isSpecialPrice = false,
      this.perKiloPrice,
      this.sackPrice})
      : super._();

  factory _$CreateSaleItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSaleItemRequestImplFromJson(json);

  @override
  final String id;
// Product ID
  @override
  final String? price;
// Override price
  @override
  final String? discountedPrice;
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
  final PerKiloPriceRequest? perKiloPrice;
  @override
  final SackPriceRequest? sackPrice;

  @override
  String toString() {
    return 'CreateSaleItemRequest(id: $id, price: $price, discountedPrice: $discountedPrice, isDiscounted: $isDiscounted, isGantang: $isGantang, isSpecialPrice: $isSpecialPrice, perKiloPrice: $perKiloPrice, sackPrice: $sackPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSaleItemRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.isDiscounted, isDiscounted) ||
                other.isDiscounted == isDiscounted) &&
            (identical(other.isGantang, isGantang) ||
                other.isGantang == isGantang) &&
            (identical(other.isSpecialPrice, isSpecialPrice) ||
                other.isSpecialPrice == isSpecialPrice) &&
            (identical(other.perKiloPrice, perKiloPrice) ||
                other.perKiloPrice == perKiloPrice) &&
            (identical(other.sackPrice, sackPrice) ||
                other.sackPrice == sackPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, discountedPrice,
      isDiscounted, isGantang, isSpecialPrice, perKiloPrice, sackPrice);

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSaleItemRequestImplCopyWith<_$CreateSaleItemRequestImpl>
      get copyWith => __$$CreateSaleItemRequestImplCopyWithImpl<
          _$CreateSaleItemRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSaleItemRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateSaleItemRequest extends CreateSaleItemRequest {
  const factory _CreateSaleItemRequest(
      {required final String id,
      final String? price,
      final String? discountedPrice,
      final bool isDiscounted,
      final bool isGantang,
      final bool isSpecialPrice,
      final PerKiloPriceRequest? perKiloPrice,
      final SackPriceRequest? sackPrice}) = _$CreateSaleItemRequestImpl;
  const _CreateSaleItemRequest._() : super._();

  factory _CreateSaleItemRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSaleItemRequestImpl.fromJson;

  @override
  String get id; // Product ID
  @override
  String? get price; // Override price
  @override
  String? get discountedPrice;
  @override
  bool get isDiscounted;
  @override
  bool get isGantang;
  @override
  bool get isSpecialPrice;
  @override
  PerKiloPriceRequest? get perKiloPrice;
  @override
  SackPriceRequest? get sackPrice;

  /// Create a copy of CreateSaleItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSaleItemRequestImplCopyWith<_$CreateSaleItemRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PerKiloPriceRequest _$PerKiloPriceRequestFromJson(Map<String, dynamic> json) {
  return _PerKiloPriceRequest.fromJson(json);
}

/// @nodoc
mixin _$PerKiloPriceRequest {
  String get id => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;

  /// Serializes this PerKiloPriceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerKiloPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerKiloPriceRequestCopyWith<PerKiloPriceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerKiloPriceRequestCopyWith<$Res> {
  factory $PerKiloPriceRequestCopyWith(
          PerKiloPriceRequest value, $Res Function(PerKiloPriceRequest) then) =
      _$PerKiloPriceRequestCopyWithImpl<$Res, PerKiloPriceRequest>;
  @useResult
  $Res call({String id, String quantity});
}

/// @nodoc
class _$PerKiloPriceRequestCopyWithImpl<$Res, $Val extends PerKiloPriceRequest>
    implements $PerKiloPriceRequestCopyWith<$Res> {
  _$PerKiloPriceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerKiloPriceRequest
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerKiloPriceRequestImplCopyWith<$Res>
    implements $PerKiloPriceRequestCopyWith<$Res> {
  factory _$$PerKiloPriceRequestImplCopyWith(_$PerKiloPriceRequestImpl value,
          $Res Function(_$PerKiloPriceRequestImpl) then) =
      __$$PerKiloPriceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String quantity});
}

/// @nodoc
class __$$PerKiloPriceRequestImplCopyWithImpl<$Res>
    extends _$PerKiloPriceRequestCopyWithImpl<$Res, _$PerKiloPriceRequestImpl>
    implements _$$PerKiloPriceRequestImplCopyWith<$Res> {
  __$$PerKiloPriceRequestImplCopyWithImpl(_$PerKiloPriceRequestImpl _value,
      $Res Function(_$PerKiloPriceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerKiloPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
  }) {
    return _then(_$PerKiloPriceRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerKiloPriceRequestImpl extends _PerKiloPriceRequest {
  const _$PerKiloPriceRequestImpl({required this.id, required this.quantity})
      : super._();

  factory _$PerKiloPriceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerKiloPriceRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String quantity;

  @override
  String toString() {
    return 'PerKiloPriceRequest(id: $id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerKiloPriceRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity);

  /// Create a copy of PerKiloPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerKiloPriceRequestImplCopyWith<_$PerKiloPriceRequestImpl> get copyWith =>
      __$$PerKiloPriceRequestImplCopyWithImpl<_$PerKiloPriceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerKiloPriceRequestImplToJson(
      this,
    );
  }
}

abstract class _PerKiloPriceRequest extends PerKiloPriceRequest {
  const factory _PerKiloPriceRequest(
      {required final String id,
      required final String quantity}) = _$PerKiloPriceRequestImpl;
  const _PerKiloPriceRequest._() : super._();

  factory _PerKiloPriceRequest.fromJson(Map<String, dynamic> json) =
      _$PerKiloPriceRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get quantity;

  /// Create a copy of PerKiloPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerKiloPriceRequestImplCopyWith<_$PerKiloPriceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SackPriceRequest _$SackPriceRequestFromJson(Map<String, dynamic> json) {
  return _SackPriceRequest.fromJson(json);
}

/// @nodoc
mixin _$SackPriceRequest {
  String get id => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this SackPriceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SackPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SackPriceRequestCopyWith<SackPriceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SackPriceRequestCopyWith<$Res> {
  factory $SackPriceRequestCopyWith(
          SackPriceRequest value, $Res Function(SackPriceRequest) then) =
      _$SackPriceRequestCopyWithImpl<$Res, SackPriceRequest>;
  @useResult
  $Res call({String id, String quantity, String type});
}

/// @nodoc
class _$SackPriceRequestCopyWithImpl<$Res, $Val extends SackPriceRequest>
    implements $SackPriceRequestCopyWith<$Res> {
  _$SackPriceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SackPriceRequest
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
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SackPriceRequestImplCopyWith<$Res>
    implements $SackPriceRequestCopyWith<$Res> {
  factory _$$SackPriceRequestImplCopyWith(_$SackPriceRequestImpl value,
          $Res Function(_$SackPriceRequestImpl) then) =
      __$$SackPriceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String quantity, String type});
}

/// @nodoc
class __$$SackPriceRequestImplCopyWithImpl<$Res>
    extends _$SackPriceRequestCopyWithImpl<$Res, _$SackPriceRequestImpl>
    implements _$$SackPriceRequestImplCopyWith<$Res> {
  __$$SackPriceRequestImplCopyWithImpl(_$SackPriceRequestImpl _value,
      $Res Function(_$SackPriceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SackPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? type = null,
  }) {
    return _then(_$SackPriceRequestImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SackPriceRequestImpl extends _SackPriceRequest {
  const _$SackPriceRequestImpl(
      {required this.id, required this.quantity, required this.type})
      : super._();

  factory _$SackPriceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SackPriceRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String quantity;
  @override
  final String type;

  @override
  String toString() {
    return 'SackPriceRequest(id: $id, quantity: $quantity, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SackPriceRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, type);

  /// Create a copy of SackPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SackPriceRequestImplCopyWith<_$SackPriceRequestImpl> get copyWith =>
      __$$SackPriceRequestImplCopyWithImpl<_$SackPriceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SackPriceRequestImplToJson(
      this,
    );
  }
}

abstract class _SackPriceRequest extends SackPriceRequest {
  const factory _SackPriceRequest(
      {required final String id,
      required final String quantity,
      required final String type}) = _$SackPriceRequestImpl;
  const _SackPriceRequest._() : super._();

  factory _SackPriceRequest.fromJson(Map<String, dynamic> json) =
      _$SackPriceRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get quantity;
  @override
  String get type;

  /// Create a copy of SackPriceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SackPriceRequestImplCopyWith<_$SackPriceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
