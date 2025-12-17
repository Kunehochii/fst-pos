// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_profit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupedProfitItem {
  double get quantity => throw _privateConstructorUsedError;
  double get profitPerUnit => throw _privateConstructorUsedError;
  double get totalProfit => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  bool get isSpecialPrice => throw _privateConstructorUsedError;
  DateTime get saleDate => throw _privateConstructorUsedError;
  String get formattedProfit => throw _privateConstructorUsedError;

  /// Create a copy of GroupedProfitItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupedProfitItemCopyWith<GroupedProfitItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedProfitItemCopyWith<$Res> {
  factory $GroupedProfitItemCopyWith(
          GroupedProfitItem value, $Res Function(GroupedProfitItem) then) =
      _$GroupedProfitItemCopyWithImpl<$Res, GroupedProfitItem>;
  @useResult
  $Res call(
      {double quantity,
      double profitPerUnit,
      double totalProfit,
      PaymentMethod paymentMethod,
      bool isSpecialPrice,
      DateTime saleDate,
      String formattedProfit});
}

/// @nodoc
class _$GroupedProfitItemCopyWithImpl<$Res, $Val extends GroupedProfitItem>
    implements $GroupedProfitItemCopyWith<$Res> {
  _$GroupedProfitItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupedProfitItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? profitPerUnit = null,
    Object? totalProfit = null,
    Object? paymentMethod = null,
    Object? isSpecialPrice = null,
    Object? saleDate = null,
    Object? formattedProfit = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      profitPerUnit: null == profitPerUnit
          ? _value.profitPerUnit
          : profitPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      isSpecialPrice: null == isSpecialPrice
          ? _value.isSpecialPrice
          : isSpecialPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      formattedProfit: null == formattedProfit
          ? _value.formattedProfit
          : formattedProfit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupedProfitItemImplCopyWith<$Res>
    implements $GroupedProfitItemCopyWith<$Res> {
  factory _$$GroupedProfitItemImplCopyWith(_$GroupedProfitItemImpl value,
          $Res Function(_$GroupedProfitItemImpl) then) =
      __$$GroupedProfitItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double quantity,
      double profitPerUnit,
      double totalProfit,
      PaymentMethod paymentMethod,
      bool isSpecialPrice,
      DateTime saleDate,
      String formattedProfit});
}

/// @nodoc
class __$$GroupedProfitItemImplCopyWithImpl<$Res>
    extends _$GroupedProfitItemCopyWithImpl<$Res, _$GroupedProfitItemImpl>
    implements _$$GroupedProfitItemImplCopyWith<$Res> {
  __$$GroupedProfitItemImplCopyWithImpl(_$GroupedProfitItemImpl _value,
      $Res Function(_$GroupedProfitItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupedProfitItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? profitPerUnit = null,
    Object? totalProfit = null,
    Object? paymentMethod = null,
    Object? isSpecialPrice = null,
    Object? saleDate = null,
    Object? formattedProfit = null,
  }) {
    return _then(_$GroupedProfitItemImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      profitPerUnit: null == profitPerUnit
          ? _value.profitPerUnit
          : profitPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      isSpecialPrice: null == isSpecialPrice
          ? _value.isSpecialPrice
          : isSpecialPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      formattedProfit: null == formattedProfit
          ? _value.formattedProfit
          : formattedProfit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GroupedProfitItemImpl extends _GroupedProfitItem {
  const _$GroupedProfitItemImpl(
      {required this.quantity,
      required this.profitPerUnit,
      required this.totalProfit,
      required this.paymentMethod,
      required this.isSpecialPrice,
      required this.saleDate,
      required this.formattedProfit})
      : super._();

  @override
  final double quantity;
  @override
  final double profitPerUnit;
  @override
  final double totalProfit;
  @override
  final PaymentMethod paymentMethod;
  @override
  final bool isSpecialPrice;
  @override
  final DateTime saleDate;
  @override
  final String formattedProfit;

  @override
  String toString() {
    return 'GroupedProfitItem(quantity: $quantity, profitPerUnit: $profitPerUnit, totalProfit: $totalProfit, paymentMethod: $paymentMethod, isSpecialPrice: $isSpecialPrice, saleDate: $saleDate, formattedProfit: $formattedProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedProfitItemImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.profitPerUnit, profitPerUnit) ||
                other.profitPerUnit == profitPerUnit) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.isSpecialPrice, isSpecialPrice) ||
                other.isSpecialPrice == isSpecialPrice) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.formattedProfit, formattedProfit) ||
                other.formattedProfit == formattedProfit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity, profitPerUnit,
      totalProfit, paymentMethod, isSpecialPrice, saleDate, formattedProfit);

  /// Create a copy of GroupedProfitItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedProfitItemImplCopyWith<_$GroupedProfitItemImpl> get copyWith =>
      __$$GroupedProfitItemImplCopyWithImpl<_$GroupedProfitItemImpl>(
          this, _$identity);
}

abstract class _GroupedProfitItem extends GroupedProfitItem {
  const factory _GroupedProfitItem(
      {required final double quantity,
      required final double profitPerUnit,
      required final double totalProfit,
      required final PaymentMethod paymentMethod,
      required final bool isSpecialPrice,
      required final DateTime saleDate,
      required final String formattedProfit}) = _$GroupedProfitItemImpl;
  const _GroupedProfitItem._() : super._();

  @override
  double get quantity;
  @override
  double get profitPerUnit;
  @override
  double get totalProfit;
  @override
  PaymentMethod get paymentMethod;
  @override
  bool get isSpecialPrice;
  @override
  DateTime get saleDate;
  @override
  String get formattedProfit;

  /// Create a copy of GroupedProfitItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedProfitItemImplCopyWith<_$GroupedProfitItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfitPaymentTotals {
  double get cash => throw _privateConstructorUsedError;
  double get check => throw _privateConstructorUsedError;
  double get bankTransfer => throw _privateConstructorUsedError;

  /// Create a copy of ProfitPaymentTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitPaymentTotalsCopyWith<ProfitPaymentTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitPaymentTotalsCopyWith<$Res> {
  factory $ProfitPaymentTotalsCopyWith(
          ProfitPaymentTotals value, $Res Function(ProfitPaymentTotals) then) =
      _$ProfitPaymentTotalsCopyWithImpl<$Res, ProfitPaymentTotals>;
  @useResult
  $Res call({double cash, double check, double bankTransfer});
}

/// @nodoc
class _$ProfitPaymentTotalsCopyWithImpl<$Res, $Val extends ProfitPaymentTotals>
    implements $ProfitPaymentTotalsCopyWith<$Res> {
  _$ProfitPaymentTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitPaymentTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cash = null,
    Object? check = null,
    Object? bankTransfer = null,
  }) {
    return _then(_value.copyWith(
      cash: null == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as double,
      check: null == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as double,
      bankTransfer: null == bankTransfer
          ? _value.bankTransfer
          : bankTransfer // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitPaymentTotalsImplCopyWith<$Res>
    implements $ProfitPaymentTotalsCopyWith<$Res> {
  factory _$$ProfitPaymentTotalsImplCopyWith(_$ProfitPaymentTotalsImpl value,
          $Res Function(_$ProfitPaymentTotalsImpl) then) =
      __$$ProfitPaymentTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double cash, double check, double bankTransfer});
}

/// @nodoc
class __$$ProfitPaymentTotalsImplCopyWithImpl<$Res>
    extends _$ProfitPaymentTotalsCopyWithImpl<$Res, _$ProfitPaymentTotalsImpl>
    implements _$$ProfitPaymentTotalsImplCopyWith<$Res> {
  __$$ProfitPaymentTotalsImplCopyWithImpl(_$ProfitPaymentTotalsImpl _value,
      $Res Function(_$ProfitPaymentTotalsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitPaymentTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cash = null,
    Object? check = null,
    Object? bankTransfer = null,
  }) {
    return _then(_$ProfitPaymentTotalsImpl(
      cash: null == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as double,
      check: null == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as double,
      bankTransfer: null == bankTransfer
          ? _value.bankTransfer
          : bankTransfer // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ProfitPaymentTotalsImpl extends _ProfitPaymentTotals {
  const _$ProfitPaymentTotalsImpl(
      {required this.cash, required this.check, required this.bankTransfer})
      : super._();

  @override
  final double cash;
  @override
  final double check;
  @override
  final double bankTransfer;

  @override
  String toString() {
    return 'ProfitPaymentTotals(cash: $cash, check: $check, bankTransfer: $bankTransfer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitPaymentTotalsImpl &&
            (identical(other.cash, cash) || other.cash == cash) &&
            (identical(other.check, check) || other.check == check) &&
            (identical(other.bankTransfer, bankTransfer) ||
                other.bankTransfer == bankTransfer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cash, check, bankTransfer);

  /// Create a copy of ProfitPaymentTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitPaymentTotalsImplCopyWith<_$ProfitPaymentTotalsImpl> get copyWith =>
      __$$ProfitPaymentTotalsImplCopyWithImpl<_$ProfitPaymentTotalsImpl>(
          this, _$identity);
}

abstract class _ProfitPaymentTotals extends ProfitPaymentTotals {
  const factory _ProfitPaymentTotals(
      {required final double cash,
      required final double check,
      required final double bankTransfer}) = _$ProfitPaymentTotalsImpl;
  const _ProfitPaymentTotals._() : super._();

  @override
  double get cash;
  @override
  double get check;
  @override
  double get bankTransfer;

  /// Create a copy of ProfitPaymentTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitPaymentTotalsImplCopyWith<_$ProfitPaymentTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GroupedProfit {
  /// Display name for the group (e.g., "Rice 50 KG")
  String get productName => throw _privateConstructorUsedError;

  /// Price type display (e.g., "50 KG", "Per Kilo")
  String get priceType => throw _privateConstructorUsedError;

  /// Profit per unit for this group
  double get profitPerUnit => throw _privateConstructorUsedError;

  /// Total quantity sold
  double get totalQuantity => throw _privateConstructorUsedError;

  /// Total profit for this group
  double get totalProfit => throw _privateConstructorUsedError;

  /// Number of orders/transactions
  int get orderCount => throw _privateConstructorUsedError;

  /// Create a copy of GroupedProfit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupedProfitCopyWith<GroupedProfit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedProfitCopyWith<$Res> {
  factory $GroupedProfitCopyWith(
          GroupedProfit value, $Res Function(GroupedProfit) then) =
      _$GroupedProfitCopyWithImpl<$Res, GroupedProfit>;
  @useResult
  $Res call(
      {String productName,
      String priceType,
      double profitPerUnit,
      double totalQuantity,
      double totalProfit,
      int orderCount});
}

/// @nodoc
class _$GroupedProfitCopyWithImpl<$Res, $Val extends GroupedProfit>
    implements $GroupedProfitCopyWith<$Res> {
  _$GroupedProfitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupedProfit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? priceType = null,
    Object? profitPerUnit = null,
    Object? totalQuantity = null,
    Object? totalProfit = null,
    Object? orderCount = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      profitPerUnit: null == profitPerUnit
          ? _value.profitPerUnit
          : profitPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupedProfitImplCopyWith<$Res>
    implements $GroupedProfitCopyWith<$Res> {
  factory _$$GroupedProfitImplCopyWith(
          _$GroupedProfitImpl value, $Res Function(_$GroupedProfitImpl) then) =
      __$$GroupedProfitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      String priceType,
      double profitPerUnit,
      double totalQuantity,
      double totalProfit,
      int orderCount});
}

/// @nodoc
class __$$GroupedProfitImplCopyWithImpl<$Res>
    extends _$GroupedProfitCopyWithImpl<$Res, _$GroupedProfitImpl>
    implements _$$GroupedProfitImplCopyWith<$Res> {
  __$$GroupedProfitImplCopyWithImpl(
      _$GroupedProfitImpl _value, $Res Function(_$GroupedProfitImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupedProfit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? priceType = null,
    Object? profitPerUnit = null,
    Object? totalQuantity = null,
    Object? totalProfit = null,
    Object? orderCount = null,
  }) {
    return _then(_$GroupedProfitImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      profitPerUnit: null == profitPerUnit
          ? _value.profitPerUnit
          : profitPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GroupedProfitImpl extends _GroupedProfit {
  const _$GroupedProfitImpl(
      {required this.productName,
      required this.priceType,
      required this.profitPerUnit,
      required this.totalQuantity,
      required this.totalProfit,
      required this.orderCount})
      : super._();

  /// Display name for the group (e.g., "Rice 50 KG")
  @override
  final String productName;

  /// Price type display (e.g., "50 KG", "Per Kilo")
  @override
  final String priceType;

  /// Profit per unit for this group
  @override
  final double profitPerUnit;

  /// Total quantity sold
  @override
  final double totalQuantity;

  /// Total profit for this group
  @override
  final double totalProfit;

  /// Number of orders/transactions
  @override
  final int orderCount;

  @override
  String toString() {
    return 'GroupedProfit(productName: $productName, priceType: $priceType, profitPerUnit: $profitPerUnit, totalQuantity: $totalQuantity, totalProfit: $totalProfit, orderCount: $orderCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedProfitImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.profitPerUnit, profitPerUnit) ||
                other.profitPerUnit == profitPerUnit) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productName, priceType,
      profitPerUnit, totalQuantity, totalProfit, orderCount);

  /// Create a copy of GroupedProfit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedProfitImplCopyWith<_$GroupedProfitImpl> get copyWith =>
      __$$GroupedProfitImplCopyWithImpl<_$GroupedProfitImpl>(this, _$identity);
}

abstract class _GroupedProfit extends GroupedProfit {
  const factory _GroupedProfit(
      {required final String productName,
      required final String priceType,
      required final double profitPerUnit,
      required final double totalQuantity,
      required final double totalProfit,
      required final int orderCount}) = _$GroupedProfitImpl;
  const _GroupedProfit._() : super._();

  /// Display name for the group (e.g., "Rice 50 KG")
  @override
  String get productName;

  /// Price type display (e.g., "50 KG", "Per Kilo")
  @override
  String get priceType;

  /// Profit per unit for this group
  @override
  double get profitPerUnit;

  /// Total quantity sold
  @override
  double get totalQuantity;

  /// Total profit for this group
  @override
  double get totalProfit;

  /// Number of orders/transactions
  @override
  int get orderCount;

  /// Create a copy of GroupedProfit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedProfitImplCopyWith<_$GroupedProfitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
