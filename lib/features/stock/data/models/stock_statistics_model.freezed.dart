// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockModel _$ProductStockModelFromJson(Map<String, dynamic> json) {
  return _ProductStockModel.fromJson(json);
}

/// @nodoc
mixin _$ProductStockModel {
  @JsonKey(name: 'productName')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockSold')
  double get stockSold => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockTransferredKahon')
  double get stockTransferredKahon => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockOtherTransfers')
  double get stockOtherTransfers => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductStockModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductStockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStockModelCopyWith<ProductStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockModelCopyWith<$Res> {
  factory $ProductStockModelCopyWith(
          ProductStockModel value, $Res Function(ProductStockModel) then) =
      _$ProductStockModelCopyWithImpl<$Res, ProductStockModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productName') String productName,
      @JsonKey(name: 'stockSold') double stockSold,
      @JsonKey(name: 'stockTransferredKahon') double stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers') double stockOtherTransfers,
      double total,
      double? totalPrice});
}

/// @nodoc
class _$ProductStockModelCopyWithImpl<$Res, $Val extends ProductStockModel>
    implements $ProductStockModelCopyWith<$Res> {
  _$ProductStockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? stockSold = null,
    Object? stockTransferredKahon = null,
    Object? stockOtherTransfers = null,
    Object? total = null,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      stockSold: null == stockSold
          ? _value.stockSold
          : stockSold // ignore: cast_nullable_to_non_nullable
              as double,
      stockTransferredKahon: null == stockTransferredKahon
          ? _value.stockTransferredKahon
          : stockTransferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      stockOtherTransfers: null == stockOtherTransfers
          ? _value.stockOtherTransfers
          : stockOtherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStockModelImplCopyWith<$Res>
    implements $ProductStockModelCopyWith<$Res> {
  factory _$$ProductStockModelImplCopyWith(_$ProductStockModelImpl value,
          $Res Function(_$ProductStockModelImpl) then) =
      __$$ProductStockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productName') String productName,
      @JsonKey(name: 'stockSold') double stockSold,
      @JsonKey(name: 'stockTransferredKahon') double stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers') double stockOtherTransfers,
      double total,
      double? totalPrice});
}

/// @nodoc
class __$$ProductStockModelImplCopyWithImpl<$Res>
    extends _$ProductStockModelCopyWithImpl<$Res, _$ProductStockModelImpl>
    implements _$$ProductStockModelImplCopyWith<$Res> {
  __$$ProductStockModelImplCopyWithImpl(_$ProductStockModelImpl _value,
      $Res Function(_$ProductStockModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? stockSold = null,
    Object? stockTransferredKahon = null,
    Object? stockOtherTransfers = null,
    Object? total = null,
    Object? totalPrice = freezed,
  }) {
    return _then(_$ProductStockModelImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      stockSold: null == stockSold
          ? _value.stockSold
          : stockSold // ignore: cast_nullable_to_non_nullable
              as double,
      stockTransferredKahon: null == stockTransferredKahon
          ? _value.stockTransferredKahon
          : stockTransferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      stockOtherTransfers: null == stockOtherTransfers
          ? _value.stockOtherTransfers
          : stockOtherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockModelImpl extends _ProductStockModel {
  const _$ProductStockModelImpl(
      {@JsonKey(name: 'productName') required this.productName,
      @JsonKey(name: 'stockSold') required this.stockSold,
      @JsonKey(name: 'stockTransferredKahon')
      required this.stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers') required this.stockOtherTransfers,
      required this.total,
      this.totalPrice})
      : super._();

  factory _$ProductStockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockModelImplFromJson(json);

  @override
  @JsonKey(name: 'productName')
  final String productName;
  @override
  @JsonKey(name: 'stockSold')
  final double stockSold;
  @override
  @JsonKey(name: 'stockTransferredKahon')
  final double stockTransferredKahon;
  @override
  @JsonKey(name: 'stockOtherTransfers')
  final double stockOtherTransfers;
  @override
  final double total;
  @override
  final double? totalPrice;

  @override
  String toString() {
    return 'ProductStockModel(productName: $productName, stockSold: $stockSold, stockTransferredKahon: $stockTransferredKahon, stockOtherTransfers: $stockOtherTransfers, total: $total, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockModelImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.stockSold, stockSold) ||
                other.stockSold == stockSold) &&
            (identical(other.stockTransferredKahon, stockTransferredKahon) ||
                other.stockTransferredKahon == stockTransferredKahon) &&
            (identical(other.stockOtherTransfers, stockOtherTransfers) ||
                other.stockOtherTransfers == stockOtherTransfers) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productName, stockSold,
      stockTransferredKahon, stockOtherTransfers, total, totalPrice);

  /// Create a copy of ProductStockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockModelImplCopyWith<_$ProductStockModelImpl> get copyWith =>
      __$$ProductStockModelImplCopyWithImpl<_$ProductStockModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockModelImplToJson(
      this,
    );
  }
}

abstract class _ProductStockModel extends ProductStockModel {
  const factory _ProductStockModel(
      {@JsonKey(name: 'productName') required final String productName,
      @JsonKey(name: 'stockSold') required final double stockSold,
      @JsonKey(name: 'stockTransferredKahon')
      required final double stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers')
      required final double stockOtherTransfers,
      required final double total,
      final double? totalPrice}) = _$ProductStockModelImpl;
  const _ProductStockModel._() : super._();

  factory _ProductStockModel.fromJson(Map<String, dynamic> json) =
      _$ProductStockModelImpl.fromJson;

  @override
  @JsonKey(name: 'productName')
  String get productName;
  @override
  @JsonKey(name: 'stockSold')
  double get stockSold;
  @override
  @JsonKey(name: 'stockTransferredKahon')
  double get stockTransferredKahon;
  @override
  @JsonKey(name: 'stockOtherTransfers')
  double get stockOtherTransfers;
  @override
  double get total;
  @override
  double? get totalPrice;

  /// Create a copy of ProductStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStockModelImplCopyWith<_$ProductStockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockTotalsModel _$StockTotalsModelFromJson(Map<String, dynamic> json) {
  return _StockTotalsModel.fromJson(json);
}

/// @nodoc
mixin _$StockTotalsModel {
  double get sold => throw _privateConstructorUsedError;
  @JsonKey(name: 'transferredKahon')
  double get transferredKahon => throw _privateConstructorUsedError;
  @JsonKey(name: 'otherTransfers')
  double get otherTransfers => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Serializes this StockTotalsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTotalsModelCopyWith<StockTotalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTotalsModelCopyWith<$Res> {
  factory $StockTotalsModelCopyWith(
          StockTotalsModel value, $Res Function(StockTotalsModel) then) =
      _$StockTotalsModelCopyWithImpl<$Res, StockTotalsModel>;
  @useResult
  $Res call(
      {double sold,
      @JsonKey(name: 'transferredKahon') double transferredKahon,
      @JsonKey(name: 'otherTransfers') double otherTransfers,
      double total});
}

/// @nodoc
class _$StockTotalsModelCopyWithImpl<$Res, $Val extends StockTotalsModel>
    implements $StockTotalsModelCopyWith<$Res> {
  _$StockTotalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTotalsModel
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
abstract class _$$StockTotalsModelImplCopyWith<$Res>
    implements $StockTotalsModelCopyWith<$Res> {
  factory _$$StockTotalsModelImplCopyWith(_$StockTotalsModelImpl value,
          $Res Function(_$StockTotalsModelImpl) then) =
      __$$StockTotalsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double sold,
      @JsonKey(name: 'transferredKahon') double transferredKahon,
      @JsonKey(name: 'otherTransfers') double otherTransfers,
      double total});
}

/// @nodoc
class __$$StockTotalsModelImplCopyWithImpl<$Res>
    extends _$StockTotalsModelCopyWithImpl<$Res, _$StockTotalsModelImpl>
    implements _$$StockTotalsModelImplCopyWith<$Res> {
  __$$StockTotalsModelImplCopyWithImpl(_$StockTotalsModelImpl _value,
      $Res Function(_$StockTotalsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sold = null,
    Object? transferredKahon = null,
    Object? otherTransfers = null,
    Object? total = null,
  }) {
    return _then(_$StockTotalsModelImpl(
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
@JsonSerializable()
class _$StockTotalsModelImpl extends _StockTotalsModel {
  const _$StockTotalsModelImpl(
      {required this.sold,
      @JsonKey(name: 'transferredKahon') required this.transferredKahon,
      @JsonKey(name: 'otherTransfers') required this.otherTransfers,
      required this.total})
      : super._();

  factory _$StockTotalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockTotalsModelImplFromJson(json);

  @override
  final double sold;
  @override
  @JsonKey(name: 'transferredKahon')
  final double transferredKahon;
  @override
  @JsonKey(name: 'otherTransfers')
  final double otherTransfers;
  @override
  final double total;

  @override
  String toString() {
    return 'StockTotalsModel(sold: $sold, transferredKahon: $transferredKahon, otherTransfers: $otherTransfers, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTotalsModelImpl &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.transferredKahon, transferredKahon) ||
                other.transferredKahon == transferredKahon) &&
            (identical(other.otherTransfers, otherTransfers) ||
                other.otherTransfers == otherTransfers) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sold, transferredKahon, otherTransfers, total);

  /// Create a copy of StockTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTotalsModelImplCopyWith<_$StockTotalsModelImpl> get copyWith =>
      __$$StockTotalsModelImplCopyWithImpl<_$StockTotalsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockTotalsModelImplToJson(
      this,
    );
  }
}

abstract class _StockTotalsModel extends StockTotalsModel {
  const factory _StockTotalsModel(
      {required final double sold,
      @JsonKey(name: 'transferredKahon') required final double transferredKahon,
      @JsonKey(name: 'otherTransfers') required final double otherTransfers,
      required final double total}) = _$StockTotalsModelImpl;
  const _StockTotalsModel._() : super._();

  factory _StockTotalsModel.fromJson(Map<String, dynamic> json) =
      _$StockTotalsModelImpl.fromJson;

  @override
  double get sold;
  @override
  @JsonKey(name: 'transferredKahon')
  double get transferredKahon;
  @override
  @JsonKey(name: 'otherTransfers')
  double get otherTransfers;
  @override
  double get total;

  /// Create a copy of StockTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTotalsModelImplCopyWith<_$StockTotalsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SummaryTotalsModel _$SummaryTotalsModelFromJson(Map<String, dynamic> json) {
  return _SummaryTotalsModel.fromJson(json);
}

/// @nodoc
mixin _$SummaryTotalsModel {
  @JsonKey(name: 'stockSold')
  double get stockSold => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockTransferredKahon')
  double get stockTransferredKahon => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockOtherTransfers')
  double get stockOtherTransfers => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Serializes this SummaryTotalsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryTotalsModelCopyWith<SummaryTotalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryTotalsModelCopyWith<$Res> {
  factory $SummaryTotalsModelCopyWith(
          SummaryTotalsModel value, $Res Function(SummaryTotalsModel) then) =
      _$SummaryTotalsModelCopyWithImpl<$Res, SummaryTotalsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stockSold') double stockSold,
      @JsonKey(name: 'stockTransferredKahon') double stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers') double stockOtherTransfers,
      double total});
}

/// @nodoc
class _$SummaryTotalsModelCopyWithImpl<$Res, $Val extends SummaryTotalsModel>
    implements $SummaryTotalsModelCopyWith<$Res> {
  _$SummaryTotalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockSold = null,
    Object? stockTransferredKahon = null,
    Object? stockOtherTransfers = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      stockSold: null == stockSold
          ? _value.stockSold
          : stockSold // ignore: cast_nullable_to_non_nullable
              as double,
      stockTransferredKahon: null == stockTransferredKahon
          ? _value.stockTransferredKahon
          : stockTransferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      stockOtherTransfers: null == stockOtherTransfers
          ? _value.stockOtherTransfers
          : stockOtherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryTotalsModelImplCopyWith<$Res>
    implements $SummaryTotalsModelCopyWith<$Res> {
  factory _$$SummaryTotalsModelImplCopyWith(_$SummaryTotalsModelImpl value,
          $Res Function(_$SummaryTotalsModelImpl) then) =
      __$$SummaryTotalsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stockSold') double stockSold,
      @JsonKey(name: 'stockTransferredKahon') double stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers') double stockOtherTransfers,
      double total});
}

/// @nodoc
class __$$SummaryTotalsModelImplCopyWithImpl<$Res>
    extends _$SummaryTotalsModelCopyWithImpl<$Res, _$SummaryTotalsModelImpl>
    implements _$$SummaryTotalsModelImplCopyWith<$Res> {
  __$$SummaryTotalsModelImplCopyWithImpl(_$SummaryTotalsModelImpl _value,
      $Res Function(_$SummaryTotalsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockSold = null,
    Object? stockTransferredKahon = null,
    Object? stockOtherTransfers = null,
    Object? total = null,
  }) {
    return _then(_$SummaryTotalsModelImpl(
      stockSold: null == stockSold
          ? _value.stockSold
          : stockSold // ignore: cast_nullable_to_non_nullable
              as double,
      stockTransferredKahon: null == stockTransferredKahon
          ? _value.stockTransferredKahon
          : stockTransferredKahon // ignore: cast_nullable_to_non_nullable
              as double,
      stockOtherTransfers: null == stockOtherTransfers
          ? _value.stockOtherTransfers
          : stockOtherTransfers // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryTotalsModelImpl extends _SummaryTotalsModel {
  const _$SummaryTotalsModelImpl(
      {@JsonKey(name: 'stockSold') required this.stockSold,
      @JsonKey(name: 'stockTransferredKahon')
      required this.stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers') required this.stockOtherTransfers,
      required this.total})
      : super._();

  factory _$SummaryTotalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryTotalsModelImplFromJson(json);

  @override
  @JsonKey(name: 'stockSold')
  final double stockSold;
  @override
  @JsonKey(name: 'stockTransferredKahon')
  final double stockTransferredKahon;
  @override
  @JsonKey(name: 'stockOtherTransfers')
  final double stockOtherTransfers;
  @override
  final double total;

  @override
  String toString() {
    return 'SummaryTotalsModel(stockSold: $stockSold, stockTransferredKahon: $stockTransferredKahon, stockOtherTransfers: $stockOtherTransfers, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryTotalsModelImpl &&
            (identical(other.stockSold, stockSold) ||
                other.stockSold == stockSold) &&
            (identical(other.stockTransferredKahon, stockTransferredKahon) ||
                other.stockTransferredKahon == stockTransferredKahon) &&
            (identical(other.stockOtherTransfers, stockOtherTransfers) ||
                other.stockOtherTransfers == stockOtherTransfers) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stockSold, stockTransferredKahon,
      stockOtherTransfers, total);

  /// Create a copy of SummaryTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryTotalsModelImplCopyWith<_$SummaryTotalsModelImpl> get copyWith =>
      __$$SummaryTotalsModelImplCopyWithImpl<_$SummaryTotalsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryTotalsModelImplToJson(
      this,
    );
  }
}

abstract class _SummaryTotalsModel extends SummaryTotalsModel {
  const factory _SummaryTotalsModel(
      {@JsonKey(name: 'stockSold') required final double stockSold,
      @JsonKey(name: 'stockTransferredKahon')
      required final double stockTransferredKahon,
      @JsonKey(name: 'stockOtherTransfers')
      required final double stockOtherTransfers,
      required final double total}) = _$SummaryTotalsModelImpl;
  const _SummaryTotalsModel._() : super._();

  factory _SummaryTotalsModel.fromJson(Map<String, dynamic> json) =
      _$SummaryTotalsModelImpl.fromJson;

  @override
  @JsonKey(name: 'stockSold')
  double get stockSold;
  @override
  @JsonKey(name: 'stockTransferredKahon')
  double get stockTransferredKahon;
  @override
  @JsonKey(name: 'stockOtherTransfers')
  double get stockOtherTransfers;
  @override
  double get total;

  /// Create a copy of SummaryTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryTotalsModelImplCopyWith<_$SummaryTotalsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrinterCategoryModel _$PrinterCategoryModelFromJson(Map<String, dynamic> json) {
  return _PrinterCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$PrinterCategoryModel {
  List<String> get lines => throw _privateConstructorUsedError;
  StockTotalsModel get totals => throw _privateConstructorUsedError;

  /// Serializes this PrinterCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrinterCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterCategoryModelCopyWith<PrinterCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterCategoryModelCopyWith<$Res> {
  factory $PrinterCategoryModelCopyWith(PrinterCategoryModel value,
          $Res Function(PrinterCategoryModel) then) =
      _$PrinterCategoryModelCopyWithImpl<$Res, PrinterCategoryModel>;
  @useResult
  $Res call({List<String> lines, StockTotalsModel totals});

  $StockTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class _$PrinterCategoryModelCopyWithImpl<$Res,
        $Val extends PrinterCategoryModel>
    implements $PrinterCategoryModelCopyWith<$Res> {
  _$PrinterCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
    Object? totals = null,
  }) {
    return _then(_value.copyWith(
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as StockTotalsModel,
    ) as $Val);
  }

  /// Create a copy of PrinterCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockTotalsModelCopyWith<$Res> get totals {
    return $StockTotalsModelCopyWith<$Res>(_value.totals, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrinterCategoryModelImplCopyWith<$Res>
    implements $PrinterCategoryModelCopyWith<$Res> {
  factory _$$PrinterCategoryModelImplCopyWith(_$PrinterCategoryModelImpl value,
          $Res Function(_$PrinterCategoryModelImpl) then) =
      __$$PrinterCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> lines, StockTotalsModel totals});

  @override
  $StockTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class __$$PrinterCategoryModelImplCopyWithImpl<$Res>
    extends _$PrinterCategoryModelCopyWithImpl<$Res, _$PrinterCategoryModelImpl>
    implements _$$PrinterCategoryModelImplCopyWith<$Res> {
  __$$PrinterCategoryModelImplCopyWithImpl(_$PrinterCategoryModelImpl _value,
      $Res Function(_$PrinterCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
    Object? totals = null,
  }) {
    return _then(_$PrinterCategoryModelImpl(
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as StockTotalsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrinterCategoryModelImpl extends _PrinterCategoryModel {
  const _$PrinterCategoryModelImpl(
      {required final List<String> lines, required this.totals})
      : _lines = lines,
        super._();

  factory _$PrinterCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrinterCategoryModelImplFromJson(json);

  final List<String> _lines;
  @override
  List<String> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  final StockTotalsModel totals;

  @override
  String toString() {
    return 'PrinterCategoryModel(lines: $lines, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterCategoryModelImpl &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lines), totals);

  /// Create a copy of PrinterCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterCategoryModelImplCopyWith<_$PrinterCategoryModelImpl>
      get copyWith =>
          __$$PrinterCategoryModelImplCopyWithImpl<_$PrinterCategoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrinterCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _PrinterCategoryModel extends PrinterCategoryModel {
  const factory _PrinterCategoryModel(
      {required final List<String> lines,
      required final StockTotalsModel totals}) = _$PrinterCategoryModelImpl;
  const _PrinterCategoryModel._() : super._();

  factory _PrinterCategoryModel.fromJson(Map<String, dynamic> json) =
      _$PrinterCategoryModelImpl.fromJson;

  @override
  List<String> get lines;
  @override
  StockTotalsModel get totals;

  /// Create a copy of PrinterCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterCategoryModelImplCopyWith<_$PrinterCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SummaryCategoryModel _$SummaryCategoryModelFromJson(Map<String, dynamic> json) {
  return _SummaryCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SummaryCategoryModel {
  List<ProductStockModel> get products => throw _privateConstructorUsedError;
  SummaryTotalsModel get totals => throw _privateConstructorUsedError;

  /// Serializes this SummaryCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCategoryModelCopyWith<SummaryCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCategoryModelCopyWith<$Res> {
  factory $SummaryCategoryModelCopyWith(SummaryCategoryModel value,
          $Res Function(SummaryCategoryModel) then) =
      _$SummaryCategoryModelCopyWithImpl<$Res, SummaryCategoryModel>;
  @useResult
  $Res call({List<ProductStockModel> products, SummaryTotalsModel totals});

  $SummaryTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class _$SummaryCategoryModelCopyWithImpl<$Res,
        $Val extends SummaryCategoryModel>
    implements $SummaryCategoryModelCopyWith<$Res> {
  _$SummaryCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totals = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductStockModel>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as SummaryTotalsModel,
    ) as $Val);
  }

  /// Create a copy of SummaryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryTotalsModelCopyWith<$Res> get totals {
    return $SummaryTotalsModelCopyWith<$Res>(_value.totals, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SummaryCategoryModelImplCopyWith<$Res>
    implements $SummaryCategoryModelCopyWith<$Res> {
  factory _$$SummaryCategoryModelImplCopyWith(_$SummaryCategoryModelImpl value,
          $Res Function(_$SummaryCategoryModelImpl) then) =
      __$$SummaryCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductStockModel> products, SummaryTotalsModel totals});

  @override
  $SummaryTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class __$$SummaryCategoryModelImplCopyWithImpl<$Res>
    extends _$SummaryCategoryModelCopyWithImpl<$Res, _$SummaryCategoryModelImpl>
    implements _$$SummaryCategoryModelImplCopyWith<$Res> {
  __$$SummaryCategoryModelImplCopyWithImpl(_$SummaryCategoryModelImpl _value,
      $Res Function(_$SummaryCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totals = null,
  }) {
    return _then(_$SummaryCategoryModelImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductStockModel>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as SummaryTotalsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryCategoryModelImpl extends _SummaryCategoryModel {
  const _$SummaryCategoryModelImpl(
      {required final List<ProductStockModel> products, required this.totals})
      : _products = products,
        super._();

  factory _$SummaryCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryCategoryModelImplFromJson(json);

  final List<ProductStockModel> _products;
  @override
  List<ProductStockModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final SummaryTotalsModel totals;

  @override
  String toString() {
    return 'SummaryCategoryModel(products: $products, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryCategoryModelImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), totals);

  /// Create a copy of SummaryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryCategoryModelImplCopyWith<_$SummaryCategoryModelImpl>
      get copyWith =>
          __$$SummaryCategoryModelImplCopyWithImpl<_$SummaryCategoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _SummaryCategoryModel extends SummaryCategoryModel {
  const factory _SummaryCategoryModel(
      {required final List<ProductStockModel> products,
      required final SummaryTotalsModel totals}) = _$SummaryCategoryModelImpl;
  const _SummaryCategoryModel._() : super._();

  factory _SummaryCategoryModel.fromJson(Map<String, dynamic> json) =
      _$SummaryCategoryModelImpl.fromJson;

  @override
  List<ProductStockModel> get products;
  @override
  SummaryTotalsModel get totals;

  /// Create a copy of SummaryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryCategoryModelImplCopyWith<_$SummaryCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StockSummaryModel _$StockSummaryModelFromJson(Map<String, dynamic> json) {
  return _StockSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$StockSummaryModel {
  SummaryCategoryModel get regular => throw _privateConstructorUsedError;
  SummaryCategoryModel get asin => throw _privateConstructorUsedError;
  SummaryCategoryModel get plastic => throw _privateConstructorUsedError;
  String get dateRange => throw _privateConstructorUsedError;

  /// Serializes this StockSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockSummaryModelCopyWith<StockSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockSummaryModelCopyWith<$Res> {
  factory $StockSummaryModelCopyWith(
          StockSummaryModel value, $Res Function(StockSummaryModel) then) =
      _$StockSummaryModelCopyWithImpl<$Res, StockSummaryModel>;
  @useResult
  $Res call(
      {SummaryCategoryModel regular,
      SummaryCategoryModel asin,
      SummaryCategoryModel plastic,
      String dateRange});

  $SummaryCategoryModelCopyWith<$Res> get regular;
  $SummaryCategoryModelCopyWith<$Res> get asin;
  $SummaryCategoryModelCopyWith<$Res> get plastic;
}

/// @nodoc
class _$StockSummaryModelCopyWithImpl<$Res, $Val extends StockSummaryModel>
    implements $StockSummaryModelCopyWith<$Res> {
  _$StockSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? asin = null,
    Object? plastic = null,
    Object? dateRange = null,
  }) {
    return _then(_value.copyWith(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as SummaryCategoryModel,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as SummaryCategoryModel,
      plastic: null == plastic
          ? _value.plastic
          : plastic // ignore: cast_nullable_to_non_nullable
              as SummaryCategoryModel,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCategoryModelCopyWith<$Res> get regular {
    return $SummaryCategoryModelCopyWith<$Res>(_value.regular, (value) {
      return _then(_value.copyWith(regular: value) as $Val);
    });
  }

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCategoryModelCopyWith<$Res> get asin {
    return $SummaryCategoryModelCopyWith<$Res>(_value.asin, (value) {
      return _then(_value.copyWith(asin: value) as $Val);
    });
  }

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCategoryModelCopyWith<$Res> get plastic {
    return $SummaryCategoryModelCopyWith<$Res>(_value.plastic, (value) {
      return _then(_value.copyWith(plastic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StockSummaryModelImplCopyWith<$Res>
    implements $StockSummaryModelCopyWith<$Res> {
  factory _$$StockSummaryModelImplCopyWith(_$StockSummaryModelImpl value,
          $Res Function(_$StockSummaryModelImpl) then) =
      __$$StockSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SummaryCategoryModel regular,
      SummaryCategoryModel asin,
      SummaryCategoryModel plastic,
      String dateRange});

  @override
  $SummaryCategoryModelCopyWith<$Res> get regular;
  @override
  $SummaryCategoryModelCopyWith<$Res> get asin;
  @override
  $SummaryCategoryModelCopyWith<$Res> get plastic;
}

/// @nodoc
class __$$StockSummaryModelImplCopyWithImpl<$Res>
    extends _$StockSummaryModelCopyWithImpl<$Res, _$StockSummaryModelImpl>
    implements _$$StockSummaryModelImplCopyWith<$Res> {
  __$$StockSummaryModelImplCopyWithImpl(_$StockSummaryModelImpl _value,
      $Res Function(_$StockSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? asin = null,
    Object? plastic = null,
    Object? dateRange = null,
  }) {
    return _then(_$StockSummaryModelImpl(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as SummaryCategoryModel,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as SummaryCategoryModel,
      plastic: null == plastic
          ? _value.plastic
          : plastic // ignore: cast_nullable_to_non_nullable
              as SummaryCategoryModel,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockSummaryModelImpl extends _StockSummaryModel {
  const _$StockSummaryModelImpl(
      {required this.regular,
      required this.asin,
      required this.plastic,
      required this.dateRange})
      : super._();

  factory _$StockSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockSummaryModelImplFromJson(json);

  @override
  final SummaryCategoryModel regular;
  @override
  final SummaryCategoryModel asin;
  @override
  final SummaryCategoryModel plastic;
  @override
  final String dateRange;

  @override
  String toString() {
    return 'StockSummaryModel(regular: $regular, asin: $asin, plastic: $plastic, dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockSummaryModelImpl &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.plastic, plastic) || other.plastic == plastic) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, regular, asin, plastic, dateRange);

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockSummaryModelImplCopyWith<_$StockSummaryModelImpl> get copyWith =>
      __$$StockSummaryModelImplCopyWithImpl<_$StockSummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockSummaryModelImplToJson(
      this,
    );
  }
}

abstract class _StockSummaryModel extends StockSummaryModel {
  const factory _StockSummaryModel(
      {required final SummaryCategoryModel regular,
      required final SummaryCategoryModel asin,
      required final SummaryCategoryModel plastic,
      required final String dateRange}) = _$StockSummaryModelImpl;
  const _StockSummaryModel._() : super._();

  factory _StockSummaryModel.fromJson(Map<String, dynamic> json) =
      _$StockSummaryModelImpl.fromJson;

  @override
  SummaryCategoryModel get regular;
  @override
  SummaryCategoryModel get asin;
  @override
  SummaryCategoryModel get plastic;
  @override
  String get dateRange;

  /// Create a copy of StockSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockSummaryModelImplCopyWith<_$StockSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockStatisticsModel _$StockStatisticsModelFromJson(Map<String, dynamic> json) {
  return _StockStatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StockStatisticsModel {
  PrinterCategoryModel get regular => throw _privateConstructorUsedError;
  PrinterCategoryModel get asin => throw _privateConstructorUsedError;
  PrinterCategoryModel get plastic => throw _privateConstructorUsedError;
  StockSummaryModel get summary => throw _privateConstructorUsedError;

  /// Serializes this StockStatisticsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockStatisticsModelCopyWith<StockStatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockStatisticsModelCopyWith<$Res> {
  factory $StockStatisticsModelCopyWith(StockStatisticsModel value,
          $Res Function(StockStatisticsModel) then) =
      _$StockStatisticsModelCopyWithImpl<$Res, StockStatisticsModel>;
  @useResult
  $Res call(
      {PrinterCategoryModel regular,
      PrinterCategoryModel asin,
      PrinterCategoryModel plastic,
      StockSummaryModel summary});

  $PrinterCategoryModelCopyWith<$Res> get regular;
  $PrinterCategoryModelCopyWith<$Res> get asin;
  $PrinterCategoryModelCopyWith<$Res> get plastic;
  $StockSummaryModelCopyWith<$Res> get summary;
}

/// @nodoc
class _$StockStatisticsModelCopyWithImpl<$Res,
        $Val extends StockStatisticsModel>
    implements $StockStatisticsModelCopyWith<$Res> {
  _$StockStatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? asin = null,
    Object? plastic = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as PrinterCategoryModel,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as PrinterCategoryModel,
      plastic: null == plastic
          ? _value.plastic
          : plastic // ignore: cast_nullable_to_non_nullable
              as PrinterCategoryModel,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as StockSummaryModel,
    ) as $Val);
  }

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrinterCategoryModelCopyWith<$Res> get regular {
    return $PrinterCategoryModelCopyWith<$Res>(_value.regular, (value) {
      return _then(_value.copyWith(regular: value) as $Val);
    });
  }

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrinterCategoryModelCopyWith<$Res> get asin {
    return $PrinterCategoryModelCopyWith<$Res>(_value.asin, (value) {
      return _then(_value.copyWith(asin: value) as $Val);
    });
  }

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrinterCategoryModelCopyWith<$Res> get plastic {
    return $PrinterCategoryModelCopyWith<$Res>(_value.plastic, (value) {
      return _then(_value.copyWith(plastic: value) as $Val);
    });
  }

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockSummaryModelCopyWith<$Res> get summary {
    return $StockSummaryModelCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StockStatisticsModelImplCopyWith<$Res>
    implements $StockStatisticsModelCopyWith<$Res> {
  factory _$$StockStatisticsModelImplCopyWith(_$StockStatisticsModelImpl value,
          $Res Function(_$StockStatisticsModelImpl) then) =
      __$$StockStatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PrinterCategoryModel regular,
      PrinterCategoryModel asin,
      PrinterCategoryModel plastic,
      StockSummaryModel summary});

  @override
  $PrinterCategoryModelCopyWith<$Res> get regular;
  @override
  $PrinterCategoryModelCopyWith<$Res> get asin;
  @override
  $PrinterCategoryModelCopyWith<$Res> get plastic;
  @override
  $StockSummaryModelCopyWith<$Res> get summary;
}

/// @nodoc
class __$$StockStatisticsModelImplCopyWithImpl<$Res>
    extends _$StockStatisticsModelCopyWithImpl<$Res, _$StockStatisticsModelImpl>
    implements _$$StockStatisticsModelImplCopyWith<$Res> {
  __$$StockStatisticsModelImplCopyWithImpl(_$StockStatisticsModelImpl _value,
      $Res Function(_$StockStatisticsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? asin = null,
    Object? plastic = null,
    Object? summary = null,
  }) {
    return _then(_$StockStatisticsModelImpl(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as PrinterCategoryModel,
      asin: null == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as PrinterCategoryModel,
      plastic: null == plastic
          ? _value.plastic
          : plastic // ignore: cast_nullable_to_non_nullable
              as PrinterCategoryModel,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as StockSummaryModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockStatisticsModelImpl extends _StockStatisticsModel {
  const _$StockStatisticsModelImpl(
      {required this.regular,
      required this.asin,
      required this.plastic,
      required this.summary})
      : super._();

  factory _$StockStatisticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockStatisticsModelImplFromJson(json);

  @override
  final PrinterCategoryModel regular;
  @override
  final PrinterCategoryModel asin;
  @override
  final PrinterCategoryModel plastic;
  @override
  final StockSummaryModel summary;

  @override
  String toString() {
    return 'StockStatisticsModel(regular: $regular, asin: $asin, plastic: $plastic, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockStatisticsModelImpl &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.plastic, plastic) || other.plastic == plastic) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regular, asin, plastic, summary);

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockStatisticsModelImplCopyWith<_$StockStatisticsModelImpl>
      get copyWith =>
          __$$StockStatisticsModelImplCopyWithImpl<_$StockStatisticsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockStatisticsModelImplToJson(
      this,
    );
  }
}

abstract class _StockStatisticsModel extends StockStatisticsModel {
  const factory _StockStatisticsModel(
      {required final PrinterCategoryModel regular,
      required final PrinterCategoryModel asin,
      required final PrinterCategoryModel plastic,
      required final StockSummaryModel summary}) = _$StockStatisticsModelImpl;
  const _StockStatisticsModel._() : super._();

  factory _StockStatisticsModel.fromJson(Map<String, dynamic> json) =
      _$StockStatisticsModelImpl.fromJson;

  @override
  PrinterCategoryModel get regular;
  @override
  PrinterCategoryModel get asin;
  @override
  PrinterCategoryModel get plastic;
  @override
  StockSummaryModel get summary;

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockStatisticsModelImplCopyWith<_$StockStatisticsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StockCategoryModel _$StockCategoryModelFromJson(Map<String, dynamic> json) {
  return _StockCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$StockCategoryModel {
  List<ProductStockModel> get products => throw _privateConstructorUsedError;
  StockTotalsModel get totals => throw _privateConstructorUsedError;
  @JsonKey(name: 'printerLines')
  List<String> get printerLines => throw _privateConstructorUsedError;

  /// Serializes this StockCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockCategoryModelCopyWith<StockCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCategoryModelCopyWith<$Res> {
  factory $StockCategoryModelCopyWith(
          StockCategoryModel value, $Res Function(StockCategoryModel) then) =
      _$StockCategoryModelCopyWithImpl<$Res, StockCategoryModel>;
  @useResult
  $Res call(
      {List<ProductStockModel> products,
      StockTotalsModel totals,
      @JsonKey(name: 'printerLines') List<String> printerLines});

  $StockTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class _$StockCategoryModelCopyWithImpl<$Res, $Val extends StockCategoryModel>
    implements $StockCategoryModelCopyWith<$Res> {
  _$StockCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totals = null,
    Object? printerLines = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductStockModel>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as StockTotalsModel,
      printerLines: null == printerLines
          ? _value.printerLines
          : printerLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of StockCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockTotalsModelCopyWith<$Res> get totals {
    return $StockTotalsModelCopyWith<$Res>(_value.totals, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StockCategoryModelImplCopyWith<$Res>
    implements $StockCategoryModelCopyWith<$Res> {
  factory _$$StockCategoryModelImplCopyWith(_$StockCategoryModelImpl value,
          $Res Function(_$StockCategoryModelImpl) then) =
      __$$StockCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductStockModel> products,
      StockTotalsModel totals,
      @JsonKey(name: 'printerLines') List<String> printerLines});

  @override
  $StockTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class __$$StockCategoryModelImplCopyWithImpl<$Res>
    extends _$StockCategoryModelCopyWithImpl<$Res, _$StockCategoryModelImpl>
    implements _$$StockCategoryModelImplCopyWith<$Res> {
  __$$StockCategoryModelImplCopyWithImpl(_$StockCategoryModelImpl _value,
      $Res Function(_$StockCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totals = null,
    Object? printerLines = null,
  }) {
    return _then(_$StockCategoryModelImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductStockModel>,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as StockTotalsModel,
      printerLines: null == printerLines
          ? _value._printerLines
          : printerLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockCategoryModelImpl extends _StockCategoryModel {
  const _$StockCategoryModelImpl(
      {required final List<ProductStockModel> products,
      required this.totals,
      @JsonKey(name: 'printerLines') required final List<String> printerLines})
      : _products = products,
        _printerLines = printerLines,
        super._();

  factory _$StockCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockCategoryModelImplFromJson(json);

  final List<ProductStockModel> _products;
  @override
  List<ProductStockModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final StockTotalsModel totals;
  final List<String> _printerLines;
  @override
  @JsonKey(name: 'printerLines')
  List<String> get printerLines {
    if (_printerLines is EqualUnmodifiableListView) return _printerLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_printerLines);
  }

  @override
  String toString() {
    return 'StockCategoryModel(products: $products, totals: $totals, printerLines: $printerLines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockCategoryModelImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totals, totals) || other.totals == totals) &&
            const DeepCollectionEquality()
                .equals(other._printerLines, _printerLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      totals,
      const DeepCollectionEquality().hash(_printerLines));

  /// Create a copy of StockCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockCategoryModelImplCopyWith<_$StockCategoryModelImpl> get copyWith =>
      __$$StockCategoryModelImplCopyWithImpl<_$StockCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _StockCategoryModel extends StockCategoryModel {
  const factory _StockCategoryModel(
      {required final List<ProductStockModel> products,
      required final StockTotalsModel totals,
      @JsonKey(name: 'printerLines')
      required final List<String> printerLines}) = _$StockCategoryModelImpl;
  const _StockCategoryModel._() : super._();

  factory _StockCategoryModel.fromJson(Map<String, dynamic> json) =
      _$StockCategoryModelImpl.fromJson;

  @override
  List<ProductStockModel> get products;
  @override
  StockTotalsModel get totals;
  @override
  @JsonKey(name: 'printerLines')
  List<String> get printerLines;

  /// Create a copy of StockCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockCategoryModelImplCopyWith<_$StockCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
