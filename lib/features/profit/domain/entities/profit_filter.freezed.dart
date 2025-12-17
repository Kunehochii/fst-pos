// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfitFilter {
  /// Start date for filtering (UTC)
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// End date for filtering (UTC)
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Filter by specific product ID
  String? get productId => throw _privateConstructorUsedError;

  /// Search products by name
  String? get productSearch => throw _privateConstructorUsedError;

  /// Filter by product category
  ProductCategory? get category => throw _privateConstructorUsedError;

  /// Filter by price type (SACK or KILO)
  PriceTypeFilter? get priceType => throw _privateConstructorUsedError;

  /// Filter by sack type
  SackType? get sackType => throw _privateConstructorUsedError;

  /// Create a copy of ProfitFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitFilterCopyWith<ProfitFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitFilterCopyWith<$Res> {
  factory $ProfitFilterCopyWith(
          ProfitFilter value, $Res Function(ProfitFilter) then) =
      _$ProfitFilterCopyWithImpl<$Res, ProfitFilter>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? productId,
      String? productSearch,
      ProductCategory? category,
      PriceTypeFilter? priceType,
      SackType? sackType});
}

/// @nodoc
class _$ProfitFilterCopyWithImpl<$Res, $Val extends ProfitFilter>
    implements $ProfitFilterCopyWith<$Res> {
  _$ProfitFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? productId = freezed,
    Object? productSearch = freezed,
    Object? category = freezed,
    Object? priceType = freezed,
    Object? sackType = freezed,
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
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productSearch: freezed == productSearch
          ? _value.productSearch
          : productSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceTypeFilter?,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitFilterImplCopyWith<$Res>
    implements $ProfitFilterCopyWith<$Res> {
  factory _$$ProfitFilterImplCopyWith(
          _$ProfitFilterImpl value, $Res Function(_$ProfitFilterImpl) then) =
      __$$ProfitFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? productId,
      String? productSearch,
      ProductCategory? category,
      PriceTypeFilter? priceType,
      SackType? sackType});
}

/// @nodoc
class __$$ProfitFilterImplCopyWithImpl<$Res>
    extends _$ProfitFilterCopyWithImpl<$Res, _$ProfitFilterImpl>
    implements _$$ProfitFilterImplCopyWith<$Res> {
  __$$ProfitFilterImplCopyWithImpl(
      _$ProfitFilterImpl _value, $Res Function(_$ProfitFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? productId = freezed,
    Object? productSearch = freezed,
    Object? category = freezed,
    Object? priceType = freezed,
    Object? sackType = freezed,
  }) {
    return _then(_$ProfitFilterImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productSearch: freezed == productSearch
          ? _value.productSearch
          : productSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceTypeFilter?,
      sackType: freezed == sackType
          ? _value.sackType
          : sackType // ignore: cast_nullable_to_non_nullable
              as SackType?,
    ));
  }
}

/// @nodoc

class _$ProfitFilterImpl extends _ProfitFilter {
  const _$ProfitFilterImpl(
      {this.startDate,
      this.endDate,
      this.productId,
      this.productSearch,
      this.category,
      this.priceType,
      this.sackType})
      : super._();

  /// Start date for filtering (UTC)
  @override
  final DateTime? startDate;

  /// End date for filtering (UTC)
  @override
  final DateTime? endDate;

  /// Filter by specific product ID
  @override
  final String? productId;

  /// Search products by name
  @override
  final String? productSearch;

  /// Filter by product category
  @override
  final ProductCategory? category;

  /// Filter by price type (SACK or KILO)
  @override
  final PriceTypeFilter? priceType;

  /// Filter by sack type
  @override
  final SackType? sackType;

  @override
  String toString() {
    return 'ProfitFilter(startDate: $startDate, endDate: $endDate, productId: $productId, productSearch: $productSearch, category: $category, priceType: $priceType, sackType: $sackType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitFilterImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productSearch, productSearch) ||
                other.productSearch == productSearch) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.sackType, sackType) ||
                other.sackType == sackType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, productId,
      productSearch, category, priceType, sackType);

  /// Create a copy of ProfitFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitFilterImplCopyWith<_$ProfitFilterImpl> get copyWith =>
      __$$ProfitFilterImplCopyWithImpl<_$ProfitFilterImpl>(this, _$identity);
}

abstract class _ProfitFilter extends ProfitFilter {
  const factory _ProfitFilter(
      {final DateTime? startDate,
      final DateTime? endDate,
      final String? productId,
      final String? productSearch,
      final ProductCategory? category,
      final PriceTypeFilter? priceType,
      final SackType? sackType}) = _$ProfitFilterImpl;
  const _ProfitFilter._() : super._();

  /// Start date for filtering (UTC)
  @override
  DateTime? get startDate;

  /// End date for filtering (UTC)
  @override
  DateTime? get endDate;

  /// Filter by specific product ID
  @override
  String? get productId;

  /// Search products by name
  @override
  String? get productSearch;

  /// Filter by product category
  @override
  ProductCategory? get category;

  /// Filter by price type (SACK or KILO)
  @override
  PriceTypeFilter? get priceType;

  /// Filter by sack type
  @override
  SackType? get sackType;

  /// Create a copy of ProfitFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitFilterImplCopyWith<_$ProfitFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
