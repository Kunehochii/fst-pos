// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_check_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupedSaleItemModel _$GroupedSaleItemModelFromJson(Map<String, dynamic> json) {
  return _GroupedSaleItemModel.fromJson(json);
}

/// @nodoc
mixin _$GroupedSaleItemModel {
  String get quantity => throw _privateConstructorUsedError;
  String get unitPrice => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  bool get isSpecialPrice => throw _privateConstructorUsedError;
  bool get isDiscounted => throw _privateConstructorUsedError;
  String? get discountedPrice => throw _privateConstructorUsedError;
  DateTime get saleDate => throw _privateConstructorUsedError;
  String get formattedSale => throw _privateConstructorUsedError;

  /// Serializes this GroupedSaleItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupedSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupedSaleItemModelCopyWith<GroupedSaleItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedSaleItemModelCopyWith<$Res> {
  factory $GroupedSaleItemModelCopyWith(GroupedSaleItemModel value,
          $Res Function(GroupedSaleItemModel) then) =
      _$GroupedSaleItemModelCopyWithImpl<$Res, GroupedSaleItemModel>;
  @useResult
  $Res call(
      {String quantity,
      String unitPrice,
      String totalAmount,
      String paymentMethod,
      bool isSpecialPrice,
      bool isDiscounted,
      String? discountedPrice,
      DateTime saleDate,
      String formattedSale});
}

/// @nodoc
class _$GroupedSaleItemModelCopyWithImpl<$Res,
        $Val extends GroupedSaleItemModel>
    implements $GroupedSaleItemModelCopyWith<$Res> {
  _$GroupedSaleItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupedSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? isSpecialPrice = null,
    Object? isDiscounted = null,
    Object? discountedPrice = freezed,
    Object? saleDate = null,
    Object? formattedSale = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      isSpecialPrice: null == isSpecialPrice
          ? _value.isSpecialPrice
          : isSpecialPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isDiscounted: null == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as bool,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      formattedSale: null == formattedSale
          ? _value.formattedSale
          : formattedSale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupedSaleItemModelImplCopyWith<$Res>
    implements $GroupedSaleItemModelCopyWith<$Res> {
  factory _$$GroupedSaleItemModelImplCopyWith(_$GroupedSaleItemModelImpl value,
          $Res Function(_$GroupedSaleItemModelImpl) then) =
      __$$GroupedSaleItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quantity,
      String unitPrice,
      String totalAmount,
      String paymentMethod,
      bool isSpecialPrice,
      bool isDiscounted,
      String? discountedPrice,
      DateTime saleDate,
      String formattedSale});
}

/// @nodoc
class __$$GroupedSaleItemModelImplCopyWithImpl<$Res>
    extends _$GroupedSaleItemModelCopyWithImpl<$Res, _$GroupedSaleItemModelImpl>
    implements _$$GroupedSaleItemModelImplCopyWith<$Res> {
  __$$GroupedSaleItemModelImplCopyWithImpl(_$GroupedSaleItemModelImpl _value,
      $Res Function(_$GroupedSaleItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupedSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? isSpecialPrice = null,
    Object? isDiscounted = null,
    Object? discountedPrice = freezed,
    Object? saleDate = null,
    Object? formattedSale = null,
  }) {
    return _then(_$GroupedSaleItemModelImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      isSpecialPrice: null == isSpecialPrice
          ? _value.isSpecialPrice
          : isSpecialPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isDiscounted: null == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as bool,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      formattedSale: null == formattedSale
          ? _value.formattedSale
          : formattedSale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupedSaleItemModelImpl extends _GroupedSaleItemModel {
  const _$GroupedSaleItemModelImpl(
      {required this.quantity,
      required this.unitPrice,
      required this.totalAmount,
      required this.paymentMethod,
      required this.isSpecialPrice,
      required this.isDiscounted,
      this.discountedPrice,
      required this.saleDate,
      required this.formattedSale})
      : super._();

  factory _$GroupedSaleItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupedSaleItemModelImplFromJson(json);

  @override
  final String quantity;
  @override
  final String unitPrice;
  @override
  final String totalAmount;
  @override
  final String paymentMethod;
  @override
  final bool isSpecialPrice;
  @override
  final bool isDiscounted;
  @override
  final String? discountedPrice;
  @override
  final DateTime saleDate;
  @override
  final String formattedSale;

  @override
  String toString() {
    return 'GroupedSaleItemModel(quantity: $quantity, unitPrice: $unitPrice, totalAmount: $totalAmount, paymentMethod: $paymentMethod, isSpecialPrice: $isSpecialPrice, isDiscounted: $isDiscounted, discountedPrice: $discountedPrice, saleDate: $saleDate, formattedSale: $formattedSale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedSaleItemModelImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.isSpecialPrice, isSpecialPrice) ||
                other.isSpecialPrice == isSpecialPrice) &&
            (identical(other.isDiscounted, isDiscounted) ||
                other.isDiscounted == isDiscounted) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.formattedSale, formattedSale) ||
                other.formattedSale == formattedSale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quantity,
      unitPrice,
      totalAmount,
      paymentMethod,
      isSpecialPrice,
      isDiscounted,
      discountedPrice,
      saleDate,
      formattedSale);

  /// Create a copy of GroupedSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedSaleItemModelImplCopyWith<_$GroupedSaleItemModelImpl>
      get copyWith =>
          __$$GroupedSaleItemModelImplCopyWithImpl<_$GroupedSaleItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupedSaleItemModelImplToJson(
      this,
    );
  }
}

abstract class _GroupedSaleItemModel extends GroupedSaleItemModel {
  const factory _GroupedSaleItemModel(
      {required final String quantity,
      required final String unitPrice,
      required final String totalAmount,
      required final String paymentMethod,
      required final bool isSpecialPrice,
      required final bool isDiscounted,
      final String? discountedPrice,
      required final DateTime saleDate,
      required final String formattedSale}) = _$GroupedSaleItemModelImpl;
  const _GroupedSaleItemModel._() : super._();

  factory _GroupedSaleItemModel.fromJson(Map<String, dynamic> json) =
      _$GroupedSaleItemModelImpl.fromJson;

  @override
  String get quantity;
  @override
  String get unitPrice;
  @override
  String get totalAmount;
  @override
  String get paymentMethod;
  @override
  bool get isSpecialPrice;
  @override
  bool get isDiscounted;
  @override
  String? get discountedPrice;
  @override
  DateTime get saleDate;
  @override
  String get formattedSale;

  /// Create a copy of GroupedSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedSaleItemModelImplCopyWith<_$GroupedSaleItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentTotalsModel _$PaymentTotalsModelFromJson(Map<String, dynamic> json) {
  return _PaymentTotalsModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentTotalsModel {
  String get cash => throw _privateConstructorUsedError;
  @JsonKey(name: 'check')
  String get checkAmount => throw _privateConstructorUsedError;
  String get bankTransfer => throw _privateConstructorUsedError;

  /// Serializes this PaymentTotalsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentTotalsModelCopyWith<PaymentTotalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTotalsModelCopyWith<$Res> {
  factory $PaymentTotalsModelCopyWith(
          PaymentTotalsModel value, $Res Function(PaymentTotalsModel) then) =
      _$PaymentTotalsModelCopyWithImpl<$Res, PaymentTotalsModel>;
  @useResult
  $Res call(
      {String cash,
      @JsonKey(name: 'check') String checkAmount,
      String bankTransfer});
}

/// @nodoc
class _$PaymentTotalsModelCopyWithImpl<$Res, $Val extends PaymentTotalsModel>
    implements $PaymentTotalsModelCopyWith<$Res> {
  _$PaymentTotalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cash = null,
    Object? checkAmount = null,
    Object? bankTransfer = null,
  }) {
    return _then(_value.copyWith(
      cash: null == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as String,
      checkAmount: null == checkAmount
          ? _value.checkAmount
          : checkAmount // ignore: cast_nullable_to_non_nullable
              as String,
      bankTransfer: null == bankTransfer
          ? _value.bankTransfer
          : bankTransfer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTotalsModelImplCopyWith<$Res>
    implements $PaymentTotalsModelCopyWith<$Res> {
  factory _$$PaymentTotalsModelImplCopyWith(_$PaymentTotalsModelImpl value,
          $Res Function(_$PaymentTotalsModelImpl) then) =
      __$$PaymentTotalsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cash,
      @JsonKey(name: 'check') String checkAmount,
      String bankTransfer});
}

/// @nodoc
class __$$PaymentTotalsModelImplCopyWithImpl<$Res>
    extends _$PaymentTotalsModelCopyWithImpl<$Res, _$PaymentTotalsModelImpl>
    implements _$$PaymentTotalsModelImplCopyWith<$Res> {
  __$$PaymentTotalsModelImplCopyWithImpl(_$PaymentTotalsModelImpl _value,
      $Res Function(_$PaymentTotalsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cash = null,
    Object? checkAmount = null,
    Object? bankTransfer = null,
  }) {
    return _then(_$PaymentTotalsModelImpl(
      cash: null == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as String,
      checkAmount: null == checkAmount
          ? _value.checkAmount
          : checkAmount // ignore: cast_nullable_to_non_nullable
              as String,
      bankTransfer: null == bankTransfer
          ? _value.bankTransfer
          : bankTransfer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentTotalsModelImpl extends _PaymentTotalsModel {
  const _$PaymentTotalsModelImpl(
      {required this.cash,
      @JsonKey(name: 'check') required this.checkAmount,
      required this.bankTransfer})
      : super._();

  factory _$PaymentTotalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentTotalsModelImplFromJson(json);

  @override
  final String cash;
  @override
  @JsonKey(name: 'check')
  final String checkAmount;
  @override
  final String bankTransfer;

  @override
  String toString() {
    return 'PaymentTotalsModel(cash: $cash, checkAmount: $checkAmount, bankTransfer: $bankTransfer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTotalsModelImpl &&
            (identical(other.cash, cash) || other.cash == cash) &&
            (identical(other.checkAmount, checkAmount) ||
                other.checkAmount == checkAmount) &&
            (identical(other.bankTransfer, bankTransfer) ||
                other.bankTransfer == bankTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cash, checkAmount, bankTransfer);

  /// Create a copy of PaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTotalsModelImplCopyWith<_$PaymentTotalsModelImpl> get copyWith =>
      __$$PaymentTotalsModelImplCopyWithImpl<_$PaymentTotalsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentTotalsModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentTotalsModel extends PaymentTotalsModel {
  const factory _PaymentTotalsModel(
      {required final String cash,
      @JsonKey(name: 'check') required final String checkAmount,
      required final String bankTransfer}) = _$PaymentTotalsModelImpl;
  const _PaymentTotalsModel._() : super._();

  factory _PaymentTotalsModel.fromJson(Map<String, dynamic> json) =
      _$PaymentTotalsModelImpl.fromJson;

  @override
  String get cash;
  @override
  @JsonKey(name: 'check')
  String get checkAmount;
  @override
  String get bankTransfer;

  /// Create a copy of PaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentTotalsModelImplCopyWith<_$PaymentTotalsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupedSaleModel _$GroupedSaleModelFromJson(Map<String, dynamic> json) {
  return _GroupedSaleModel.fromJson(json);
}

/// @nodoc
mixin _$GroupedSaleModel {
  String get productName => throw _privateConstructorUsedError;
  List<GroupedSaleItemModel> get items => throw _privateConstructorUsedError;
  String get totalQuantity => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  PaymentTotalsModel get paymentTotals => throw _privateConstructorUsedError;

  /// Serializes this GroupedSaleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupedSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupedSaleModelCopyWith<GroupedSaleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedSaleModelCopyWith<$Res> {
  factory $GroupedSaleModelCopyWith(
          GroupedSaleModel value, $Res Function(GroupedSaleModel) then) =
      _$GroupedSaleModelCopyWithImpl<$Res, GroupedSaleModel>;
  @useResult
  $Res call(
      {String productName,
      List<GroupedSaleItemModel> items,
      String totalQuantity,
      String totalAmount,
      PaymentTotalsModel paymentTotals});

  $PaymentTotalsModelCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class _$GroupedSaleModelCopyWithImpl<$Res, $Val extends GroupedSaleModel>
    implements $GroupedSaleModelCopyWith<$Res> {
  _$GroupedSaleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupedSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? items = null,
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? paymentTotals = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GroupedSaleItemModel>,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as PaymentTotalsModel,
    ) as $Val);
  }

  /// Create a copy of GroupedSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentTotalsModelCopyWith<$Res> get paymentTotals {
    return $PaymentTotalsModelCopyWith<$Res>(_value.paymentTotals, (value) {
      return _then(_value.copyWith(paymentTotals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupedSaleModelImplCopyWith<$Res>
    implements $GroupedSaleModelCopyWith<$Res> {
  factory _$$GroupedSaleModelImplCopyWith(_$GroupedSaleModelImpl value,
          $Res Function(_$GroupedSaleModelImpl) then) =
      __$$GroupedSaleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      List<GroupedSaleItemModel> items,
      String totalQuantity,
      String totalAmount,
      PaymentTotalsModel paymentTotals});

  @override
  $PaymentTotalsModelCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class __$$GroupedSaleModelImplCopyWithImpl<$Res>
    extends _$GroupedSaleModelCopyWithImpl<$Res, _$GroupedSaleModelImpl>
    implements _$$GroupedSaleModelImplCopyWith<$Res> {
  __$$GroupedSaleModelImplCopyWithImpl(_$GroupedSaleModelImpl _value,
      $Res Function(_$GroupedSaleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupedSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? items = null,
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? paymentTotals = null,
  }) {
    return _then(_$GroupedSaleModelImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GroupedSaleItemModel>,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as PaymentTotalsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupedSaleModelImpl extends _GroupedSaleModel {
  const _$GroupedSaleModelImpl(
      {required this.productName,
      required final List<GroupedSaleItemModel> items,
      required this.totalQuantity,
      required this.totalAmount,
      required this.paymentTotals})
      : _items = items,
        super._();

  factory _$GroupedSaleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupedSaleModelImplFromJson(json);

  @override
  final String productName;
  final List<GroupedSaleItemModel> _items;
  @override
  List<GroupedSaleItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String totalQuantity;
  @override
  final String totalAmount;
  @override
  final PaymentTotalsModel paymentTotals;

  @override
  String toString() {
    return 'GroupedSaleModel(productName: $productName, items: $items, totalQuantity: $totalQuantity, totalAmount: $totalAmount, paymentTotals: $paymentTotals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedSaleModelImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentTotals, paymentTotals) ||
                other.paymentTotals == paymentTotals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productName,
      const DeepCollectionEquality().hash(_items),
      totalQuantity,
      totalAmount,
      paymentTotals);

  /// Create a copy of GroupedSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedSaleModelImplCopyWith<_$GroupedSaleModelImpl> get copyWith =>
      __$$GroupedSaleModelImplCopyWithImpl<_$GroupedSaleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupedSaleModelImplToJson(
      this,
    );
  }
}

abstract class _GroupedSaleModel extends GroupedSaleModel {
  const factory _GroupedSaleModel(
          {required final String productName,
          required final List<GroupedSaleItemModel> items,
          required final String totalQuantity,
          required final String totalAmount,
          required final PaymentTotalsModel paymentTotals}) =
      _$GroupedSaleModelImpl;
  const _GroupedSaleModel._() : super._();

  factory _GroupedSaleModel.fromJson(Map<String, dynamic> json) =
      _$GroupedSaleModelImpl.fromJson;

  @override
  String get productName;
  @override
  List<GroupedSaleItemModel> get items;
  @override
  String get totalQuantity;
  @override
  String get totalAmount;
  @override
  PaymentTotalsModel get paymentTotals;

  /// Create a copy of GroupedSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedSaleModelImplCopyWith<_$GroupedSaleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalesSummaryModel _$SalesSummaryModelFromJson(Map<String, dynamic> json) {
  return _SalesSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$SalesSummaryModel {
  String get totalQuantity => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  PaymentTotalsModel get paymentTotals => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this SalesSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesSummaryModelCopyWith<SalesSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesSummaryModelCopyWith<$Res> {
  factory $SalesSummaryModelCopyWith(
          SalesSummaryModel value, $Res Function(SalesSummaryModel) then) =
      _$SalesSummaryModelCopyWithImpl<$Res, SalesSummaryModel>;
  @useResult
  $Res call(
      {String totalQuantity,
      String totalAmount,
      PaymentTotalsModel paymentTotals,
      int transactionCount});

  $PaymentTotalsModelCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class _$SalesSummaryModelCopyWithImpl<$Res, $Val extends SalesSummaryModel>
    implements $SalesSummaryModelCopyWith<$Res> {
  _$SalesSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
  }) {
    return _then(_value.copyWith(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as PaymentTotalsModel,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of SalesSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentTotalsModelCopyWith<$Res> get paymentTotals {
    return $PaymentTotalsModelCopyWith<$Res>(_value.paymentTotals, (value) {
      return _then(_value.copyWith(paymentTotals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesSummaryModelImplCopyWith<$Res>
    implements $SalesSummaryModelCopyWith<$Res> {
  factory _$$SalesSummaryModelImplCopyWith(_$SalesSummaryModelImpl value,
          $Res Function(_$SalesSummaryModelImpl) then) =
      __$$SalesSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String totalQuantity,
      String totalAmount,
      PaymentTotalsModel paymentTotals,
      int transactionCount});

  @override
  $PaymentTotalsModelCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class __$$SalesSummaryModelImplCopyWithImpl<$Res>
    extends _$SalesSummaryModelCopyWithImpl<$Res, _$SalesSummaryModelImpl>
    implements _$$SalesSummaryModelImplCopyWith<$Res> {
  __$$SalesSummaryModelImplCopyWithImpl(_$SalesSummaryModelImpl _value,
      $Res Function(_$SalesSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
  }) {
    return _then(_$SalesSummaryModelImpl(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as PaymentTotalsModel,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesSummaryModelImpl extends _SalesSummaryModel {
  const _$SalesSummaryModelImpl(
      {required this.totalQuantity,
      required this.totalAmount,
      required this.paymentTotals,
      required this.transactionCount})
      : super._();

  factory _$SalesSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesSummaryModelImplFromJson(json);

  @override
  final String totalQuantity;
  @override
  final String totalAmount;
  @override
  final PaymentTotalsModel paymentTotals;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'SalesSummaryModel(totalQuantity: $totalQuantity, totalAmount: $totalAmount, paymentTotals: $paymentTotals, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesSummaryModelImpl &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentTotals, paymentTotals) ||
                other.paymentTotals == paymentTotals) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalQuantity, totalAmount, paymentTotals, transactionCount);

  /// Create a copy of SalesSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesSummaryModelImplCopyWith<_$SalesSummaryModelImpl> get copyWith =>
      __$$SalesSummaryModelImplCopyWithImpl<_$SalesSummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesSummaryModelImplToJson(
      this,
    );
  }
}

abstract class _SalesSummaryModel extends SalesSummaryModel {
  const factory _SalesSummaryModel(
      {required final String totalQuantity,
      required final String totalAmount,
      required final PaymentTotalsModel paymentTotals,
      required final int transactionCount}) = _$SalesSummaryModelImpl;
  const _SalesSummaryModel._() : super._();

  factory _SalesSummaryModel.fromJson(Map<String, dynamic> json) =
      _$SalesSummaryModelImpl.fromJson;

  @override
  String get totalQuantity;
  @override
  String get totalAmount;
  @override
  PaymentTotalsModel get paymentTotals;
  @override
  int get transactionCount;

  /// Create a copy of SalesSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesSummaryModelImplCopyWith<_$SalesSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
