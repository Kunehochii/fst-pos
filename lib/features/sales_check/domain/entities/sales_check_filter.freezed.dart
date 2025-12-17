// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_check_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesCheckFilter {
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

  /// Filter by discounted items only
  bool? get isDiscounted => throw _privateConstructorUsedError;

  /// Create a copy of SalesCheckFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesCheckFilterCopyWith<SalesCheckFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesCheckFilterCopyWith<$Res> {
  factory $SalesCheckFilterCopyWith(
          SalesCheckFilter value, $Res Function(SalesCheckFilter) then) =
      _$SalesCheckFilterCopyWithImpl<$Res, SalesCheckFilter>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? productId,
      String? productSearch,
      ProductCategory? category,
      PriceTypeFilter? priceType,
      SackType? sackType,
      bool? isDiscounted});
}

/// @nodoc
class _$SalesCheckFilterCopyWithImpl<$Res, $Val extends SalesCheckFilter>
    implements $SalesCheckFilterCopyWith<$Res> {
  _$SalesCheckFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesCheckFilter
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
    Object? isDiscounted = freezed,
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
      isDiscounted: freezed == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesCheckFilterImplCopyWith<$Res>
    implements $SalesCheckFilterCopyWith<$Res> {
  factory _$$SalesCheckFilterImplCopyWith(_$SalesCheckFilterImpl value,
          $Res Function(_$SalesCheckFilterImpl) then) =
      __$$SalesCheckFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      String? productId,
      String? productSearch,
      ProductCategory? category,
      PriceTypeFilter? priceType,
      SackType? sackType,
      bool? isDiscounted});
}

/// @nodoc
class __$$SalesCheckFilterImplCopyWithImpl<$Res>
    extends _$SalesCheckFilterCopyWithImpl<$Res, _$SalesCheckFilterImpl>
    implements _$$SalesCheckFilterImplCopyWith<$Res> {
  __$$SalesCheckFilterImplCopyWithImpl(_$SalesCheckFilterImpl _value,
      $Res Function(_$SalesCheckFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesCheckFilter
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
    Object? isDiscounted = freezed,
  }) {
    return _then(_$SalesCheckFilterImpl(
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
      isDiscounted: freezed == isDiscounted
          ? _value.isDiscounted
          : isDiscounted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SalesCheckFilterImpl extends _SalesCheckFilter {
  const _$SalesCheckFilterImpl(
      {this.startDate,
      this.endDate,
      this.productId,
      this.productSearch,
      this.category,
      this.priceType,
      this.sackType,
      this.isDiscounted})
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

  /// Filter by discounted items only
  @override
  final bool? isDiscounted;

  @override
  String toString() {
    return 'SalesCheckFilter(startDate: $startDate, endDate: $endDate, productId: $productId, productSearch: $productSearch, category: $category, priceType: $priceType, sackType: $sackType, isDiscounted: $isDiscounted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesCheckFilterImpl &&
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
                other.sackType == sackType) &&
            (identical(other.isDiscounted, isDiscounted) ||
                other.isDiscounted == isDiscounted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, productId,
      productSearch, category, priceType, sackType, isDiscounted);

  /// Create a copy of SalesCheckFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesCheckFilterImplCopyWith<_$SalesCheckFilterImpl> get copyWith =>
      __$$SalesCheckFilterImplCopyWithImpl<_$SalesCheckFilterImpl>(
          this, _$identity);
}

abstract class _SalesCheckFilter extends SalesCheckFilter {
  const factory _SalesCheckFilter(
      {final DateTime? startDate,
      final DateTime? endDate,
      final String? productId,
      final String? productSearch,
      final ProductCategory? category,
      final PriceTypeFilter? priceType,
      final SackType? sackType,
      final bool? isDiscounted}) = _$SalesCheckFilterImpl;
  const _SalesCheckFilter._() : super._();

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

  /// Filter by discounted items only
  @override
  bool? get isDiscounted;

  /// Create a copy of SalesCheckFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesCheckFilterImplCopyWith<_$SalesCheckFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
