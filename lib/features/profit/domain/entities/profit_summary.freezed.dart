// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfitSummary {
  /// Total quantity sold
  double get totalQuantity => throw _privateConstructorUsedError;

  /// Total profit amount
  double get totalProfit => throw _privateConstructorUsedError;

  /// Payment method breakdown
  ProfitPaymentTotals get paymentTotals => throw _privateConstructorUsedError;

  /// Number of transactions
  int get transactionCount => throw _privateConstructorUsedError;

  /// Start date of the summary period
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// End date of the summary period
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Create a copy of ProfitSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitSummaryCopyWith<ProfitSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitSummaryCopyWith<$Res> {
  factory $ProfitSummaryCopyWith(
          ProfitSummary value, $Res Function(ProfitSummary) then) =
      _$ProfitSummaryCopyWithImpl<$Res, ProfitSummary>;
  @useResult
  $Res call(
      {double totalQuantity,
      double totalProfit,
      ProfitPaymentTotals paymentTotals,
      int transactionCount,
      DateTime? startDate,
      DateTime? endDate});

  $ProfitPaymentTotalsCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class _$ProfitSummaryCopyWithImpl<$Res, $Val extends ProfitSummary>
    implements $ProfitSummaryCopyWith<$Res> {
  _$ProfitSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalProfit = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as ProfitPaymentTotals,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProfitSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfitPaymentTotalsCopyWith<$Res> get paymentTotals {
    return $ProfitPaymentTotalsCopyWith<$Res>(_value.paymentTotals, (value) {
      return _then(_value.copyWith(paymentTotals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfitSummaryImplCopyWith<$Res>
    implements $ProfitSummaryCopyWith<$Res> {
  factory _$$ProfitSummaryImplCopyWith(
          _$ProfitSummaryImpl value, $Res Function(_$ProfitSummaryImpl) then) =
      __$$ProfitSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalQuantity,
      double totalProfit,
      ProfitPaymentTotals paymentTotals,
      int transactionCount,
      DateTime? startDate,
      DateTime? endDate});

  @override
  $ProfitPaymentTotalsCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class __$$ProfitSummaryImplCopyWithImpl<$Res>
    extends _$ProfitSummaryCopyWithImpl<$Res, _$ProfitSummaryImpl>
    implements _$$ProfitSummaryImplCopyWith<$Res> {
  __$$ProfitSummaryImplCopyWithImpl(
      _$ProfitSummaryImpl _value, $Res Function(_$ProfitSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalProfit = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$ProfitSummaryImpl(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as ProfitPaymentTotals,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ProfitSummaryImpl extends _ProfitSummary {
  const _$ProfitSummaryImpl(
      {required this.totalQuantity,
      required this.totalProfit,
      required this.paymentTotals,
      required this.transactionCount,
      this.startDate,
      this.endDate})
      : super._();

  /// Total quantity sold
  @override
  final double totalQuantity;

  /// Total profit amount
  @override
  final double totalProfit;

  /// Payment method breakdown
  @override
  final ProfitPaymentTotals paymentTotals;

  /// Number of transactions
  @override
  final int transactionCount;

  /// Start date of the summary period
  @override
  final DateTime? startDate;

  /// End date of the summary period
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'ProfitSummary(totalQuantity: $totalQuantity, totalProfit: $totalProfit, paymentTotals: $paymentTotals, transactionCount: $transactionCount, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitSummaryImpl &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.paymentTotals, paymentTotals) ||
                other.paymentTotals == paymentTotals) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalQuantity, totalProfit,
      paymentTotals, transactionCount, startDate, endDate);

  /// Create a copy of ProfitSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitSummaryImplCopyWith<_$ProfitSummaryImpl> get copyWith =>
      __$$ProfitSummaryImplCopyWithImpl<_$ProfitSummaryImpl>(this, _$identity);
}

abstract class _ProfitSummary extends ProfitSummary {
  const factory _ProfitSummary(
      {required final double totalQuantity,
      required final double totalProfit,
      required final ProfitPaymentTotals paymentTotals,
      required final int transactionCount,
      final DateTime? startDate,
      final DateTime? endDate}) = _$ProfitSummaryImpl;
  const _ProfitSummary._() : super._();

  /// Total quantity sold
  @override
  double get totalQuantity;

  /// Total profit amount
  @override
  double get totalProfit;

  /// Payment method breakdown
  @override
  ProfitPaymentTotals get paymentTotals;

  /// Number of transactions
  @override
  int get transactionCount;

  /// Start date of the summary period
  @override
  DateTime? get startDate;

  /// End date of the summary period
  @override
  DateTime? get endDate;

  /// Create a copy of ProfitSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitSummaryImplCopyWith<_$ProfitSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
