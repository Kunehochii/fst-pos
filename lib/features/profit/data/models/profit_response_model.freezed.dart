// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupedProfitModel _$GroupedProfitModelFromJson(Map<String, dynamic> json) {
  return _GroupedProfitModel.fromJson(json);
}

/// @nodoc
mixin _$GroupedProfitModel {
  String get productName => throw _privateConstructorUsedError;
  String get priceType => throw _privateConstructorUsedError;
  String get profitPerUnit => throw _privateConstructorUsedError;
  String get totalQuantity => throw _privateConstructorUsedError;
  String get totalProfit => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;

  /// Serializes this GroupedProfitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupedProfitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupedProfitModelCopyWith<GroupedProfitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedProfitModelCopyWith<$Res> {
  factory $GroupedProfitModelCopyWith(
          GroupedProfitModel value, $Res Function(GroupedProfitModel) then) =
      _$GroupedProfitModelCopyWithImpl<$Res, GroupedProfitModel>;
  @useResult
  $Res call(
      {String productName,
      String priceType,
      String profitPerUnit,
      String totalQuantity,
      String totalProfit,
      int orderCount});
}

/// @nodoc
class _$GroupedProfitModelCopyWithImpl<$Res, $Val extends GroupedProfitModel>
    implements $GroupedProfitModelCopyWith<$Res> {
  _$GroupedProfitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupedProfitModel
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
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupedProfitModelImplCopyWith<$Res>
    implements $GroupedProfitModelCopyWith<$Res> {
  factory _$$GroupedProfitModelImplCopyWith(_$GroupedProfitModelImpl value,
          $Res Function(_$GroupedProfitModelImpl) then) =
      __$$GroupedProfitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      String priceType,
      String profitPerUnit,
      String totalQuantity,
      String totalProfit,
      int orderCount});
}

/// @nodoc
class __$$GroupedProfitModelImplCopyWithImpl<$Res>
    extends _$GroupedProfitModelCopyWithImpl<$Res, _$GroupedProfitModelImpl>
    implements _$$GroupedProfitModelImplCopyWith<$Res> {
  __$$GroupedProfitModelImplCopyWithImpl(_$GroupedProfitModelImpl _value,
      $Res Function(_$GroupedProfitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupedProfitModel
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
    return _then(_$GroupedProfitModelImpl(
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
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as String,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupedProfitModelImpl extends _GroupedProfitModel {
  const _$GroupedProfitModelImpl(
      {required this.productName,
      required this.priceType,
      required this.profitPerUnit,
      required this.totalQuantity,
      required this.totalProfit,
      required this.orderCount})
      : super._();

  factory _$GroupedProfitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupedProfitModelImplFromJson(json);

  @override
  final String productName;
  @override
  final String priceType;
  @override
  final String profitPerUnit;
  @override
  final String totalQuantity;
  @override
  final String totalProfit;
  @override
  final int orderCount;

  @override
  String toString() {
    return 'GroupedProfitModel(productName: $productName, priceType: $priceType, profitPerUnit: $profitPerUnit, totalQuantity: $totalQuantity, totalProfit: $totalProfit, orderCount: $orderCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedProfitModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productName, priceType,
      profitPerUnit, totalQuantity, totalProfit, orderCount);

  /// Create a copy of GroupedProfitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedProfitModelImplCopyWith<_$GroupedProfitModelImpl> get copyWith =>
      __$$GroupedProfitModelImplCopyWithImpl<_$GroupedProfitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupedProfitModelImplToJson(
      this,
    );
  }
}

abstract class _GroupedProfitModel extends GroupedProfitModel {
  const factory _GroupedProfitModel(
      {required final String productName,
      required final String priceType,
      required final String profitPerUnit,
      required final String totalQuantity,
      required final String totalProfit,
      required final int orderCount}) = _$GroupedProfitModelImpl;
  const _GroupedProfitModel._() : super._();

  factory _GroupedProfitModel.fromJson(Map<String, dynamic> json) =
      _$GroupedProfitModelImpl.fromJson;

  @override
  String get productName;
  @override
  String get priceType;
  @override
  String get profitPerUnit;
  @override
  String get totalQuantity;
  @override
  String get totalProfit;
  @override
  int get orderCount;

  /// Create a copy of GroupedProfitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedProfitModelImplCopyWith<_$GroupedProfitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfitPaymentTotalsModel _$ProfitPaymentTotalsModelFromJson(
    Map<String, dynamic> json) {
  return _ProfitPaymentTotalsModel.fromJson(json);
}

/// @nodoc
mixin _$ProfitPaymentTotalsModel {
  String get cash => throw _privateConstructorUsedError;
  @JsonKey(name: 'check')
  String get checkAmount => throw _privateConstructorUsedError;
  String get bankTransfer => throw _privateConstructorUsedError;

  /// Serializes this ProfitPaymentTotalsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfitPaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitPaymentTotalsModelCopyWith<ProfitPaymentTotalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitPaymentTotalsModelCopyWith<$Res> {
  factory $ProfitPaymentTotalsModelCopyWith(ProfitPaymentTotalsModel value,
          $Res Function(ProfitPaymentTotalsModel) then) =
      _$ProfitPaymentTotalsModelCopyWithImpl<$Res, ProfitPaymentTotalsModel>;
  @useResult
  $Res call(
      {String cash,
      @JsonKey(name: 'check') String checkAmount,
      String bankTransfer});
}

/// @nodoc
class _$ProfitPaymentTotalsModelCopyWithImpl<$Res,
        $Val extends ProfitPaymentTotalsModel>
    implements $ProfitPaymentTotalsModelCopyWith<$Res> {
  _$ProfitPaymentTotalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitPaymentTotalsModel
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
abstract class _$$ProfitPaymentTotalsModelImplCopyWith<$Res>
    implements $ProfitPaymentTotalsModelCopyWith<$Res> {
  factory _$$ProfitPaymentTotalsModelImplCopyWith(
          _$ProfitPaymentTotalsModelImpl value,
          $Res Function(_$ProfitPaymentTotalsModelImpl) then) =
      __$$ProfitPaymentTotalsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cash,
      @JsonKey(name: 'check') String checkAmount,
      String bankTransfer});
}

/// @nodoc
class __$$ProfitPaymentTotalsModelImplCopyWithImpl<$Res>
    extends _$ProfitPaymentTotalsModelCopyWithImpl<$Res,
        _$ProfitPaymentTotalsModelImpl>
    implements _$$ProfitPaymentTotalsModelImplCopyWith<$Res> {
  __$$ProfitPaymentTotalsModelImplCopyWithImpl(
      _$ProfitPaymentTotalsModelImpl _value,
      $Res Function(_$ProfitPaymentTotalsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitPaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cash = null,
    Object? checkAmount = null,
    Object? bankTransfer = null,
  }) {
    return _then(_$ProfitPaymentTotalsModelImpl(
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
class _$ProfitPaymentTotalsModelImpl extends _ProfitPaymentTotalsModel {
  const _$ProfitPaymentTotalsModelImpl(
      {required this.cash,
      @JsonKey(name: 'check') required this.checkAmount,
      required this.bankTransfer})
      : super._();

  factory _$ProfitPaymentTotalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitPaymentTotalsModelImplFromJson(json);

  @override
  final String cash;
  @override
  @JsonKey(name: 'check')
  final String checkAmount;
  @override
  final String bankTransfer;

  @override
  String toString() {
    return 'ProfitPaymentTotalsModel(cash: $cash, checkAmount: $checkAmount, bankTransfer: $bankTransfer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitPaymentTotalsModelImpl &&
            (identical(other.cash, cash) || other.cash == cash) &&
            (identical(other.checkAmount, checkAmount) ||
                other.checkAmount == checkAmount) &&
            (identical(other.bankTransfer, bankTransfer) ||
                other.bankTransfer == bankTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cash, checkAmount, bankTransfer);

  /// Create a copy of ProfitPaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitPaymentTotalsModelImplCopyWith<_$ProfitPaymentTotalsModelImpl>
      get copyWith => __$$ProfitPaymentTotalsModelImplCopyWithImpl<
          _$ProfitPaymentTotalsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitPaymentTotalsModelImplToJson(
      this,
    );
  }
}

abstract class _ProfitPaymentTotalsModel extends ProfitPaymentTotalsModel {
  const factory _ProfitPaymentTotalsModel(
      {required final String cash,
      @JsonKey(name: 'check') required final String checkAmount,
      required final String bankTransfer}) = _$ProfitPaymentTotalsModelImpl;
  const _ProfitPaymentTotalsModel._() : super._();

  factory _ProfitPaymentTotalsModel.fromJson(Map<String, dynamic> json) =
      _$ProfitPaymentTotalsModelImpl.fromJson;

  @override
  String get cash;
  @override
  @JsonKey(name: 'check')
  String get checkAmount;
  @override
  String get bankTransfer;

  /// Create a copy of ProfitPaymentTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitPaymentTotalsModelImplCopyWith<_$ProfitPaymentTotalsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProfitSummaryModel _$ProfitSummaryModelFromJson(Map<String, dynamic> json) {
  return _ProfitSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ProfitSummaryModel {
  String get totalQuantity => throw _privateConstructorUsedError;
  String get totalProfit => throw _privateConstructorUsedError;
  ProfitPaymentTotalsModel get paymentTotals =>
      throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this ProfitSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitSummaryModelCopyWith<ProfitSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitSummaryModelCopyWith<$Res> {
  factory $ProfitSummaryModelCopyWith(
          ProfitSummaryModel value, $Res Function(ProfitSummaryModel) then) =
      _$ProfitSummaryModelCopyWithImpl<$Res, ProfitSummaryModel>;
  @useResult
  $Res call(
      {String totalQuantity,
      String totalProfit,
      ProfitPaymentTotalsModel paymentTotals,
      int transactionCount});

  $ProfitPaymentTotalsModelCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class _$ProfitSummaryModelCopyWithImpl<$Res, $Val extends ProfitSummaryModel>
    implements $ProfitSummaryModelCopyWith<$Res> {
  _$ProfitSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalProfit = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
  }) {
    return _then(_value.copyWith(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as ProfitPaymentTotalsModel,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ProfitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfitPaymentTotalsModelCopyWith<$Res> get paymentTotals {
    return $ProfitPaymentTotalsModelCopyWith<$Res>(_value.paymentTotals,
        (value) {
      return _then(_value.copyWith(paymentTotals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfitSummaryModelImplCopyWith<$Res>
    implements $ProfitSummaryModelCopyWith<$Res> {
  factory _$$ProfitSummaryModelImplCopyWith(_$ProfitSummaryModelImpl value,
          $Res Function(_$ProfitSummaryModelImpl) then) =
      __$$ProfitSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String totalQuantity,
      String totalProfit,
      ProfitPaymentTotalsModel paymentTotals,
      int transactionCount});

  @override
  $ProfitPaymentTotalsModelCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class __$$ProfitSummaryModelImplCopyWithImpl<$Res>
    extends _$ProfitSummaryModelCopyWithImpl<$Res, _$ProfitSummaryModelImpl>
    implements _$$ProfitSummaryModelImplCopyWith<$Res> {
  __$$ProfitSummaryModelImplCopyWithImpl(_$ProfitSummaryModelImpl _value,
      $Res Function(_$ProfitSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalProfit = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
  }) {
    return _then(_$ProfitSummaryModelImpl(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as ProfitPaymentTotalsModel,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitSummaryModelImpl extends _ProfitSummaryModel {
  const _$ProfitSummaryModelImpl(
      {required this.totalQuantity,
      required this.totalProfit,
      required this.paymentTotals,
      required this.transactionCount})
      : super._();

  factory _$ProfitSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitSummaryModelImplFromJson(json);

  @override
  final String totalQuantity;
  @override
  final String totalProfit;
  @override
  final ProfitPaymentTotalsModel paymentTotals;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'ProfitSummaryModel(totalQuantity: $totalQuantity, totalProfit: $totalProfit, paymentTotals: $paymentTotals, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitSummaryModelImpl &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.paymentTotals, paymentTotals) ||
                other.paymentTotals == paymentTotals) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalQuantity, totalProfit, paymentTotals, transactionCount);

  /// Create a copy of ProfitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitSummaryModelImplCopyWith<_$ProfitSummaryModelImpl> get copyWith =>
      __$$ProfitSummaryModelImplCopyWithImpl<_$ProfitSummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitSummaryModelImplToJson(
      this,
    );
  }
}

abstract class _ProfitSummaryModel extends ProfitSummaryModel {
  const factory _ProfitSummaryModel(
      {required final String totalQuantity,
      required final String totalProfit,
      required final ProfitPaymentTotalsModel paymentTotals,
      required final int transactionCount}) = _$ProfitSummaryModelImpl;
  const _ProfitSummaryModel._() : super._();

  factory _ProfitSummaryModel.fromJson(Map<String, dynamic> json) =
      _$ProfitSummaryModelImpl.fromJson;

  @override
  String get totalQuantity;
  @override
  String get totalProfit;
  @override
  ProfitPaymentTotalsModel get paymentTotals;
  @override
  int get transactionCount;

  /// Create a copy of ProfitSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitSummaryModelImplCopyWith<_$ProfitSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
