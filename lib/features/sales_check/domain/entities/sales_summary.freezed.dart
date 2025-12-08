// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesSummary {
  /// Total quantity sold
  double get totalQuantity => throw _privateConstructorUsedError;

  /// Total sales amount
  double get totalAmount => throw _privateConstructorUsedError;

  /// Payment method breakdown
  PaymentTotals get paymentTotals => throw _privateConstructorUsedError;

  /// Number of transactions
  int get transactionCount => throw _privateConstructorUsedError;

  /// Start date of the summary period
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// End date of the summary period
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesSummaryCopyWith<SalesSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesSummaryCopyWith<$Res> {
  factory $SalesSummaryCopyWith(
          SalesSummary value, $Res Function(SalesSummary) then) =
      _$SalesSummaryCopyWithImpl<$Res, SalesSummary>;
  @useResult
  $Res call(
      {double totalQuantity,
      double totalAmount,
      PaymentTotals paymentTotals,
      int transactionCount,
      DateTime? startDate,
      DateTime? endDate});

  $PaymentTotalsCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class _$SalesSummaryCopyWithImpl<$Res, $Val extends SalesSummary>
    implements $SalesSummaryCopyWith<$Res> {
  _$SalesSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalAmount = null,
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
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as PaymentTotals,
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

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentTotalsCopyWith<$Res> get paymentTotals {
    return $PaymentTotalsCopyWith<$Res>(_value.paymentTotals, (value) {
      return _then(_value.copyWith(paymentTotals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesSummaryImplCopyWith<$Res>
    implements $SalesSummaryCopyWith<$Res> {
  factory _$$SalesSummaryImplCopyWith(
          _$SalesSummaryImpl value, $Res Function(_$SalesSummaryImpl) then) =
      __$$SalesSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalQuantity,
      double totalAmount,
      PaymentTotals paymentTotals,
      int transactionCount,
      DateTime? startDate,
      DateTime? endDate});

  @override
  $PaymentTotalsCopyWith<$Res> get paymentTotals;
}

/// @nodoc
class __$$SalesSummaryImplCopyWithImpl<$Res>
    extends _$SalesSummaryCopyWithImpl<$Res, _$SalesSummaryImpl>
    implements _$$SalesSummaryImplCopyWith<$Res> {
  __$$SalesSummaryImplCopyWithImpl(
      _$SalesSummaryImpl _value, $Res Function(_$SalesSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? paymentTotals = null,
    Object? transactionCount = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$SalesSummaryImpl(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTotals: null == paymentTotals
          ? _value.paymentTotals
          : paymentTotals // ignore: cast_nullable_to_non_nullable
              as PaymentTotals,
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

class _$SalesSummaryImpl extends _SalesSummary {
  const _$SalesSummaryImpl(
      {required this.totalQuantity,
      required this.totalAmount,
      required this.paymentTotals,
      required this.transactionCount,
      this.startDate,
      this.endDate})
      : super._();

  /// Total quantity sold
  @override
  final double totalQuantity;

  /// Total sales amount
  @override
  final double totalAmount;

  /// Payment method breakdown
  @override
  final PaymentTotals paymentTotals;

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
    return 'SalesSummary(totalQuantity: $totalQuantity, totalAmount: $totalAmount, paymentTotals: $paymentTotals, transactionCount: $transactionCount, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesSummaryImpl &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentTotals, paymentTotals) ||
                other.paymentTotals == paymentTotals) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalQuantity, totalAmount,
      paymentTotals, transactionCount, startDate, endDate);

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesSummaryImplCopyWith<_$SalesSummaryImpl> get copyWith =>
      __$$SalesSummaryImplCopyWithImpl<_$SalesSummaryImpl>(this, _$identity);
}

abstract class _SalesSummary extends SalesSummary {
  const factory _SalesSummary(
      {required final double totalQuantity,
      required final double totalAmount,
      required final PaymentTotals paymentTotals,
      required final int transactionCount,
      final DateTime? startDate,
      final DateTime? endDate}) = _$SalesSummaryImpl;
  const _SalesSummary._() : super._();

  /// Total quantity sold
  @override
  double get totalQuantity;

  /// Total sales amount
  @override
  double get totalAmount;

  /// Payment method breakdown
  @override
  PaymentTotals get paymentTotals;

  /// Number of transactions
  @override
  int get transactionCount;

  /// Start date of the summary period
  @override
  DateTime? get startDate;

  /// End date of the summary period
  @override
  DateTime? get endDate;

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesSummaryImplCopyWith<_$SalesSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
