// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductStock {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  double get sold => throw _privateConstructorUsedError;
  double get transferredKahon => throw _privateConstructorUsedError;
  double get otherTransfers => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Create a copy of ProductStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStockCopyWith<ProductStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockCopyWith<$Res> {
  factory $ProductStockCopyWith(
          ProductStock value, $Res Function(ProductStock) then) =
      _$ProductStockCopyWithImpl<$Res, ProductStock>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      double sold,
      double transferredKahon,
      double otherTransfers,
      double total});
}

/// @nodoc
class _$ProductStockCopyWithImpl<$Res, $Val extends ProductStock>
    implements $ProductStockCopyWith<$Res> {
  _$ProductStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? sold = null,
    Object? transferredKahon = null,
    Object? otherTransfers = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as double,
      transferredKahon: null == transferredKahon
          ? _value.transferredKahon
          : transferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      otherTransfers: null == otherTransfers
          ? _value.otherTransfers
          : otherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStockImplCopyWith<$Res>
    implements $ProductStockCopyWith<$Res> {
  factory _$$ProductStockImplCopyWith(
          _$ProductStockImpl value, $Res Function(_$ProductStockImpl) then) =
      __$$ProductStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      double sold,
      double transferredKahon,
      double otherTransfers,
      double total});
}

/// @nodoc
class __$$ProductStockImplCopyWithImpl<$Res>
    extends _$ProductStockCopyWithImpl<$Res, _$ProductStockImpl>
    implements _$$ProductStockImplCopyWith<$Res> {
  __$$ProductStockImplCopyWithImpl(
      _$ProductStockImpl _value, $Res Function(_$ProductStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? sold = null,
    Object? transferredKahon = null,
    Object? otherTransfers = null,
    Object? total = null,
  }) {
    return _then(_$ProductStockImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as double,
      transferredKahon: null == transferredKahon
          ? _value.transferredKahon
          : transferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      otherTransfers: null == otherTransfers
          ? _value.otherTransfers
          : otherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ProductStockImpl extends _ProductStock {
  const _$ProductStockImpl(
      {required this.productId,
      required this.productName,
      required this.sold,
      required this.transferredKahon,
      required this.otherTransfers,
      required this.total})
      : super._();

  @override
  final String productId;
  @override
  final String productName;
  @override
  final double sold;
  @override
  final double transferredKahon;
  @override
  final double otherTransfers;
  @override
  final double total;

  @override
  String toString() {
    return 'ProductStock(productId: $productId, productName: $productName, sold: $sold, transferredKahon: $transferredKahon, otherTransfers: $otherTransfers, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.transferredKahon, transferredKahon) ||
                other.transferredKahon == transferredKahon) &&
            (identical(other.otherTransfers, otherTransfers) ||
                other.otherTransfers == otherTransfers) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, productName, sold,
      transferredKahon, otherTransfers, total);

  /// Create a copy of ProductStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockImplCopyWith<_$ProductStockImpl> get copyWith =>
      __$$ProductStockImplCopyWithImpl<_$ProductStockImpl>(this, _$identity);
}

abstract class _ProductStock extends ProductStock {
  const factory _ProductStock(
      {required final String productId,
      required final String productName,
      required final double sold,
      required final double transferredKahon,
      required final double otherTransfers,
      required final double total}) = _$ProductStockImpl;
  const _ProductStock._() : super._();

  @override
  String get productId;
  @override
  String get productName;
  @override
  double get sold;
  @override
  double get transferredKahon;
  @override
  double get otherTransfers;
  @override
  double get total;

  /// Create a copy of ProductStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStockImplCopyWith<_$ProductStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockStatistics {
  /// Date range string for display
  String get dateRange => throw _privateConstructorUsedError;

  /// Regular products (rice, etc.)
  List<ProductStock> get regularProducts => throw _privateConstructorUsedError;
  StockTotals get regularTotals => throw _privateConstructorUsedError;
  List<String> get regularPrinterLines => throw _privateConstructorUsedError;

  /// Plastic products
  List<ProductStock> get plasticProducts => throw _privateConstructorUsedError;
  StockTotals get plasticTotals => throw _privateConstructorUsedError;
  List<String> get plasticPrinterLines => throw _privateConstructorUsedError;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockStatisticsCopyWith<StockStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockStatisticsCopyWith<$Res> {
  factory $StockStatisticsCopyWith(
          StockStatistics value, $Res Function(StockStatistics) then) =
      _$StockStatisticsCopyWithImpl<$Res, StockStatistics>;
  @useResult
  $Res call(
      {String dateRange,
      List<ProductStock> regularProducts,
      StockTotals regularTotals,
      List<String> regularPrinterLines,
      List<ProductStock> plasticProducts,
      StockTotals plasticTotals,
      List<String> plasticPrinterLines});

  $StockTotalsCopyWith<$Res> get regularTotals;
  $StockTotalsCopyWith<$Res> get plasticTotals;
}

/// @nodoc
class _$StockStatisticsCopyWithImpl<$Res, $Val extends StockStatistics>
    implements $StockStatisticsCopyWith<$Res> {
  _$StockStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? regularProducts = null,
    Object? regularTotals = null,
    Object? regularPrinterLines = null,
    Object? plasticProducts = null,
    Object? plasticTotals = null,
    Object? plasticPrinterLines = null,
  }) {
    return _then(_value.copyWith(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String,
      regularProducts: null == regularProducts
          ? _value.regularProducts
          : regularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductStock>,
      regularTotals: null == regularTotals
          ? _value.regularTotals
          : regularTotals // ignore: cast_nullable_to_non_nullable
              as StockTotals,
      regularPrinterLines: null == regularPrinterLines
          ? _value.regularPrinterLines
          : regularPrinterLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      plasticProducts: null == plasticProducts
          ? _value.plasticProducts
          : plasticProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductStock>,
      plasticTotals: null == plasticTotals
          ? _value.plasticTotals
          : plasticTotals // ignore: cast_nullable_to_non_nullable
              as StockTotals,
      plasticPrinterLines: null == plasticPrinterLines
          ? _value.plasticPrinterLines
          : plasticPrinterLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockTotalsCopyWith<$Res> get regularTotals {
    return $StockTotalsCopyWith<$Res>(_value.regularTotals, (value) {
      return _then(_value.copyWith(regularTotals: value) as $Val);
    });
  }

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockTotalsCopyWith<$Res> get plasticTotals {
    return $StockTotalsCopyWith<$Res>(_value.plasticTotals, (value) {
      return _then(_value.copyWith(plasticTotals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StockStatisticsImplCopyWith<$Res>
    implements $StockStatisticsCopyWith<$Res> {
  factory _$$StockStatisticsImplCopyWith(_$StockStatisticsImpl value,
          $Res Function(_$StockStatisticsImpl) then) =
      __$$StockStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateRange,
      List<ProductStock> regularProducts,
      StockTotals regularTotals,
      List<String> regularPrinterLines,
      List<ProductStock> plasticProducts,
      StockTotals plasticTotals,
      List<String> plasticPrinterLines});

  @override
  $StockTotalsCopyWith<$Res> get regularTotals;
  @override
  $StockTotalsCopyWith<$Res> get plasticTotals;
}

/// @nodoc
class __$$StockStatisticsImplCopyWithImpl<$Res>
    extends _$StockStatisticsCopyWithImpl<$Res, _$StockStatisticsImpl>
    implements _$$StockStatisticsImplCopyWith<$Res> {
  __$$StockStatisticsImplCopyWithImpl(
      _$StockStatisticsImpl _value, $Res Function(_$StockStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? regularProducts = null,
    Object? regularTotals = null,
    Object? regularPrinterLines = null,
    Object? plasticProducts = null,
    Object? plasticTotals = null,
    Object? plasticPrinterLines = null,
  }) {
    return _then(_$StockStatisticsImpl(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String,
      regularProducts: null == regularProducts
          ? _value._regularProducts
          : regularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductStock>,
      regularTotals: null == regularTotals
          ? _value.regularTotals
          : regularTotals // ignore: cast_nullable_to_non_nullable
              as StockTotals,
      regularPrinterLines: null == regularPrinterLines
          ? _value._regularPrinterLines
          : regularPrinterLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      plasticProducts: null == plasticProducts
          ? _value._plasticProducts
          : plasticProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductStock>,
      plasticTotals: null == plasticTotals
          ? _value.plasticTotals
          : plasticTotals // ignore: cast_nullable_to_non_nullable
              as StockTotals,
      plasticPrinterLines: null == plasticPrinterLines
          ? _value._plasticPrinterLines
          : plasticPrinterLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$StockStatisticsImpl extends _StockStatistics {
  const _$StockStatisticsImpl(
      {required this.dateRange,
      required final List<ProductStock> regularProducts,
      required this.regularTotals,
      required final List<String> regularPrinterLines,
      required final List<ProductStock> plasticProducts,
      required this.plasticTotals,
      required final List<String> plasticPrinterLines})
      : _regularProducts = regularProducts,
        _regularPrinterLines = regularPrinterLines,
        _plasticProducts = plasticProducts,
        _plasticPrinterLines = plasticPrinterLines,
        super._();

  /// Date range string for display
  @override
  final String dateRange;

  /// Regular products (rice, etc.)
  final List<ProductStock> _regularProducts;

  /// Regular products (rice, etc.)
  @override
  List<ProductStock> get regularProducts {
    if (_regularProducts is EqualUnmodifiableListView) return _regularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regularProducts);
  }

  @override
  final StockTotals regularTotals;
  final List<String> _regularPrinterLines;
  @override
  List<String> get regularPrinterLines {
    if (_regularPrinterLines is EqualUnmodifiableListView)
      return _regularPrinterLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regularPrinterLines);
  }

  /// Plastic products
  final List<ProductStock> _plasticProducts;

  /// Plastic products
  @override
  List<ProductStock> get plasticProducts {
    if (_plasticProducts is EqualUnmodifiableListView) return _plasticProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plasticProducts);
  }

  @override
  final StockTotals plasticTotals;
  final List<String> _plasticPrinterLines;
  @override
  List<String> get plasticPrinterLines {
    if (_plasticPrinterLines is EqualUnmodifiableListView)
      return _plasticPrinterLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plasticPrinterLines);
  }

  @override
  String toString() {
    return 'StockStatistics(dateRange: $dateRange, regularProducts: $regularProducts, regularTotals: $regularTotals, regularPrinterLines: $regularPrinterLines, plasticProducts: $plasticProducts, plasticTotals: $plasticTotals, plasticPrinterLines: $plasticPrinterLines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockStatisticsImpl &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            const DeepCollectionEquality()
                .equals(other._regularProducts, _regularProducts) &&
            (identical(other.regularTotals, regularTotals) ||
                other.regularTotals == regularTotals) &&
            const DeepCollectionEquality()
                .equals(other._regularPrinterLines, _regularPrinterLines) &&
            const DeepCollectionEquality()
                .equals(other._plasticProducts, _plasticProducts) &&
            (identical(other.plasticTotals, plasticTotals) ||
                other.plasticTotals == plasticTotals) &&
            const DeepCollectionEquality()
                .equals(other._plasticPrinterLines, _plasticPrinterLines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateRange,
      const DeepCollectionEquality().hash(_regularProducts),
      regularTotals,
      const DeepCollectionEquality().hash(_regularPrinterLines),
      const DeepCollectionEquality().hash(_plasticProducts),
      plasticTotals,
      const DeepCollectionEquality().hash(_plasticPrinterLines));

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockStatisticsImplCopyWith<_$StockStatisticsImpl> get copyWith =>
      __$$StockStatisticsImplCopyWithImpl<_$StockStatisticsImpl>(
          this, _$identity);
}

abstract class _StockStatistics extends StockStatistics {
  const factory _StockStatistics(
      {required final String dateRange,
      required final List<ProductStock> regularProducts,
      required final StockTotals regularTotals,
      required final List<String> regularPrinterLines,
      required final List<ProductStock> plasticProducts,
      required final StockTotals plasticTotals,
      required final List<String> plasticPrinterLines}) = _$StockStatisticsImpl;
  const _StockStatistics._() : super._();

  /// Date range string for display
  @override
  String get dateRange;

  /// Regular products (rice, etc.)
  @override
  List<ProductStock> get regularProducts;
  @override
  StockTotals get regularTotals;
  @override
  List<String> get regularPrinterLines;

  /// Plastic products
  @override
  List<ProductStock> get plasticProducts;
  @override
  StockTotals get plasticTotals;
  @override
  List<String> get plasticPrinterLines;

  /// Create a copy of StockStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockStatisticsImplCopyWith<_$StockStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockTotals {
  double get sold => throw _privateConstructorUsedError;
  double get transferredKahon => throw _privateConstructorUsedError;
  double get otherTransfers => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Create a copy of StockTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTotalsCopyWith<StockTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTotalsCopyWith<$Res> {
  factory $StockTotalsCopyWith(
          StockTotals value, $Res Function(StockTotals) then) =
      _$StockTotalsCopyWithImpl<$Res, StockTotals>;
  @useResult
  $Res call(
      {double sold,
      double transferredKahon,
      double otherTransfers,
      double total});
}

/// @nodoc
class _$StockTotalsCopyWithImpl<$Res, $Val extends StockTotals>
    implements $StockTotalsCopyWith<$Res> {
  _$StockTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sold = null,
    Object? transferredKahon = null,
    Object? otherTransfers = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as double,
      transferredKahon: null == transferredKahon
          ? _value.transferredKahon
          : transferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      otherTransfers: null == otherTransfers
          ? _value.otherTransfers
          : otherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockTotalsImplCopyWith<$Res>
    implements $StockTotalsCopyWith<$Res> {
  factory _$$StockTotalsImplCopyWith(
          _$StockTotalsImpl value, $Res Function(_$StockTotalsImpl) then) =
      __$$StockTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double sold,
      double transferredKahon,
      double otherTransfers,
      double total});
}

/// @nodoc
class __$$StockTotalsImplCopyWithImpl<$Res>
    extends _$StockTotalsCopyWithImpl<$Res, _$StockTotalsImpl>
    implements _$$StockTotalsImplCopyWith<$Res> {
  __$$StockTotalsImplCopyWithImpl(
      _$StockTotalsImpl _value, $Res Function(_$StockTotalsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sold = null,
    Object? transferredKahon = null,
    Object? otherTransfers = null,
    Object? total = null,
  }) {
    return _then(_$StockTotalsImpl(
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as double,
      transferredKahon: null == transferredKahon
          ? _value.transferredKahon
          : transferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      otherTransfers: null == otherTransfers
          ? _value.otherTransfers
          : otherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StockTotalsImpl implements _StockTotals {
  const _$StockTotalsImpl(
      {required this.sold,
      required this.transferredKahon,
      required this.otherTransfers,
      required this.total});

  @override
  final double sold;
  @override
  final double transferredKahon;
  @override
  final double otherTransfers;
  @override
  final double total;

  @override
  String toString() {
    return 'StockTotals(sold: $sold, transferredKahon: $transferredKahon, otherTransfers: $otherTransfers, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTotalsImpl &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.transferredKahon, transferredKahon) ||
                other.transferredKahon == transferredKahon) &&
            (identical(other.otherTransfers, otherTransfers) ||
                other.otherTransfers == otherTransfers) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sold, transferredKahon, otherTransfers, total);

  /// Create a copy of StockTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTotalsImplCopyWith<_$StockTotalsImpl> get copyWith =>
      __$$StockTotalsImplCopyWithImpl<_$StockTotalsImpl>(this, _$identity);
}

abstract class _StockTotals implements StockTotals {
  const factory _StockTotals(
      {required final double sold,
      required final double transferredKahon,
      required final double otherTransfers,
      required final double total}) = _$StockTotalsImpl;

  @override
  double get sold;
  @override
  double get transferredKahon;
  @override
  double get otherTransfers;
  @override
  double get total;

  /// Create a copy of StockTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTotalsImplCopyWith<_$StockTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockFilter {
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Create a copy of StockFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockFilterCopyWith<StockFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockFilterCopyWith<$Res> {
  factory $StockFilterCopyWith(
          StockFilter value, $Res Function(StockFilter) then) =
      _$StockFilterCopyWithImpl<$Res, StockFilter>;
  @useResult
  $Res call({DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class _$StockFilterCopyWithImpl<$Res, $Val extends StockFilter>
    implements $StockFilterCopyWith<$Res> {
  _$StockFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockFilterImplCopyWith<$Res>
    implements $StockFilterCopyWith<$Res> {
  factory _$$StockFilterImplCopyWith(
          _$StockFilterImpl value, $Res Function(_$StockFilterImpl) then) =
      __$$StockFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class __$$StockFilterImplCopyWithImpl<$Res>
    extends _$StockFilterCopyWithImpl<$Res, _$StockFilterImpl>
    implements _$$StockFilterImplCopyWith<$Res> {
  __$$StockFilterImplCopyWithImpl(
      _$StockFilterImpl _value, $Res Function(_$StockFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$StockFilterImpl(
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

class _$StockFilterImpl implements _StockFilter {
  const _$StockFilterImpl({this.startDate, this.endDate});

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'StockFilter(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockFilterImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of StockFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockFilterImplCopyWith<_$StockFilterImpl> get copyWith =>
      __$$StockFilterImplCopyWithImpl<_$StockFilterImpl>(this, _$identity);
}

abstract class _StockFilter implements StockFilter {
  const factory _StockFilter(
      {final DateTime? startDate, final DateTime? endDate}) = _$StockFilterImpl;

  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of StockFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockFilterImplCopyWith<_$StockFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
