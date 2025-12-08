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
  @JsonKey(name: 'productId')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'productName')
  String get productName => throw _privateConstructorUsedError;
  double get sold => throw _privateConstructorUsedError;
  @JsonKey(name: 'transferredKahon')
  double get transferredKahon => throw _privateConstructorUsedError;
  @JsonKey(name: 'otherTransfers')
  double get otherTransfers => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'productId') String productId,
      @JsonKey(name: 'productName') String productName,
      double sold,
      @JsonKey(name: 'transferredKahon') double transferredKahon,
      @JsonKey(name: 'otherTransfers') double otherTransfers,
      double total});
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
abstract class _$$ProductStockModelImplCopyWith<$Res>
    implements $ProductStockModelCopyWith<$Res> {
  factory _$$ProductStockModelImplCopyWith(_$ProductStockModelImpl value,
          $Res Function(_$ProductStockModelImpl) then) =
      __$$ProductStockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productId') String productId,
      @JsonKey(name: 'productName') String productName,
      double sold,
      @JsonKey(name: 'transferredKahon') double transferredKahon,
      @JsonKey(name: 'otherTransfers') double otherTransfers,
      double total});
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
    Object? productId = null,
    Object? productName = null,
    Object? sold = null,
    Object? transferredKahon = null,
    Object? otherTransfers = null,
    Object? total = null,
  }) {
    return _then(_$ProductStockModelImpl(
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
@JsonSerializable()
class _$ProductStockModelImpl extends _ProductStockModel {
  const _$ProductStockModelImpl(
      {@JsonKey(name: 'productId') required this.productId,
      @JsonKey(name: 'productName') required this.productName,
      required this.sold,
      @JsonKey(name: 'transferredKahon') required this.transferredKahon,
      @JsonKey(name: 'otherTransfers') required this.otherTransfers,
      required this.total})
      : super._();

  factory _$ProductStockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockModelImplFromJson(json);

  @override
  @JsonKey(name: 'productId')
  final String productId;
  @override
  @JsonKey(name: 'productName')
  final String productName;
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
    return 'ProductStockModel(productId: $productId, productName: $productName, sold: $sold, transferredKahon: $transferredKahon, otherTransfers: $otherTransfers, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName, sold,
      transferredKahon, otherTransfers, total);

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
      {@JsonKey(name: 'productId') required final String productId,
      @JsonKey(name: 'productName') required final String productName,
      required final double sold,
      @JsonKey(name: 'transferredKahon') required final double transferredKahon,
      @JsonKey(name: 'otherTransfers') required final double otherTransfers,
      required final double total}) = _$ProductStockModelImpl;
  const _ProductStockModel._() : super._();

  factory _ProductStockModel.fromJson(Map<String, dynamic> json) =
      _$ProductStockModelImpl.fromJson;

  @override
  @JsonKey(name: 'productId')
  String get productId;
  @override
  @JsonKey(name: 'productName')
  String get productName;
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

StockStatisticsModel _$StockStatisticsModelFromJson(Map<String, dynamic> json) {
  return _StockStatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StockStatisticsModel {
  @JsonKey(name: 'dateRange')
  String get dateRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'regular')
  StockCategoryModel get regular => throw _privateConstructorUsedError;
  @JsonKey(name: 'plastic')
  StockCategoryModel get plastic => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'dateRange') String dateRange,
      @JsonKey(name: 'regular') StockCategoryModel regular,
      @JsonKey(name: 'plastic') StockCategoryModel plastic});

  $StockCategoryModelCopyWith<$Res> get regular;
  $StockCategoryModelCopyWith<$Res> get plastic;
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
    Object? dateRange = null,
    Object? regular = null,
    Object? plastic = null,
  }) {
    return _then(_value.copyWith(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String,
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as StockCategoryModel,
      plastic: null == plastic
          ? _value.plastic
          : plastic // ignore: cast_nullable_to_non_nullable
              as StockCategoryModel,
    ) as $Val);
  }

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockCategoryModelCopyWith<$Res> get regular {
    return $StockCategoryModelCopyWith<$Res>(_value.regular, (value) {
      return _then(_value.copyWith(regular: value) as $Val);
    });
  }

  /// Create a copy of StockStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockCategoryModelCopyWith<$Res> get plastic {
    return $StockCategoryModelCopyWith<$Res>(_value.plastic, (value) {
      return _then(_value.copyWith(plastic: value) as $Val);
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
      {@JsonKey(name: 'dateRange') String dateRange,
      @JsonKey(name: 'regular') StockCategoryModel regular,
      @JsonKey(name: 'plastic') StockCategoryModel plastic});

  @override
  $StockCategoryModelCopyWith<$Res> get regular;
  @override
  $StockCategoryModelCopyWith<$Res> get plastic;
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
    Object? dateRange = null,
    Object? regular = null,
    Object? plastic = null,
  }) {
    return _then(_$StockStatisticsModelImpl(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String,
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as StockCategoryModel,
      plastic: null == plastic
          ? _value.plastic
          : plastic // ignore: cast_nullable_to_non_nullable
              as StockCategoryModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockStatisticsModelImpl extends _StockStatisticsModel {
  const _$StockStatisticsModelImpl(
      {@JsonKey(name: 'dateRange') required this.dateRange,
      @JsonKey(name: 'regular') required this.regular,
      @JsonKey(name: 'plastic') required this.plastic})
      : super._();

  factory _$StockStatisticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockStatisticsModelImplFromJson(json);

  @override
  @JsonKey(name: 'dateRange')
  final String dateRange;
  @override
  @JsonKey(name: 'regular')
  final StockCategoryModel regular;
  @override
  @JsonKey(name: 'plastic')
  final StockCategoryModel plastic;

  @override
  String toString() {
    return 'StockStatisticsModel(dateRange: $dateRange, regular: $regular, plastic: $plastic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockStatisticsModelImpl &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.plastic, plastic) || other.plastic == plastic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dateRange, regular, plastic);

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
      {@JsonKey(name: 'dateRange') required final String dateRange,
      @JsonKey(name: 'regular') required final StockCategoryModel regular,
      @JsonKey(name: 'plastic')
      required final StockCategoryModel plastic}) = _$StockStatisticsModelImpl;
  const _StockStatisticsModel._() : super._();

  factory _StockStatisticsModel.fromJson(Map<String, dynamic> json) =
      _$StockStatisticsModelImpl.fromJson;

  @override
  @JsonKey(name: 'dateRange')
  String get dateRange;
  @override
  @JsonKey(name: 'regular')
  StockCategoryModel get regular;
  @override
  @JsonKey(name: 'plastic')
  StockCategoryModel get plastic;

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
