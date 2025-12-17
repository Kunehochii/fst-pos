// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CellModel _$CellModelFromJson(Map<String, dynamic> json) {
  return _CellModel.fromJson(json);
}

/// @nodoc
mixin _$CellModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'rowId')
  String get rowId => throw _privateConstructorUsedError;
  @JsonKey(name: 'columnIndex')
  int get columnIndex => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get formula => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCalculated')
  bool get isCalculated => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CellModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CellModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CellModelCopyWith<CellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellModelCopyWith<$Res> {
  factory $CellModelCopyWith(CellModel value, $Res Function(CellModel) then) =
      _$CellModelCopyWithImpl<$Res, CellModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'rowId') String rowId,
      @JsonKey(name: 'columnIndex') int columnIndex,
      String? value,
      String? formula,
      String? color,
      @JsonKey(name: 'isCalculated') bool isCalculated,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$CellModelCopyWithImpl<$Res, $Val extends CellModel>
    implements $CellModelCopyWith<$Res> {
  _$CellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CellModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rowId = null,
    Object? columnIndex = null,
    Object? value = freezed,
    Object? formula = freezed,
    Object? color = freezed,
    Object? isCalculated = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rowId: null == rowId
          ? _value.rowId
          : rowId // ignore: cast_nullable_to_non_nullable
              as String,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      formula: freezed == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isCalculated: null == isCalculated
          ? _value.isCalculated
          : isCalculated // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CellModelImplCopyWith<$Res>
    implements $CellModelCopyWith<$Res> {
  factory _$$CellModelImplCopyWith(
          _$CellModelImpl value, $Res Function(_$CellModelImpl) then) =
      __$$CellModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'rowId') String rowId,
      @JsonKey(name: 'columnIndex') int columnIndex,
      String? value,
      String? formula,
      String? color,
      @JsonKey(name: 'isCalculated') bool isCalculated,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$CellModelImplCopyWithImpl<$Res>
    extends _$CellModelCopyWithImpl<$Res, _$CellModelImpl>
    implements _$$CellModelImplCopyWith<$Res> {
  __$$CellModelImplCopyWithImpl(
      _$CellModelImpl _value, $Res Function(_$CellModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CellModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rowId = null,
    Object? columnIndex = null,
    Object? value = freezed,
    Object? formula = freezed,
    Object? color = freezed,
    Object? isCalculated = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CellModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rowId: null == rowId
          ? _value.rowId
          : rowId // ignore: cast_nullable_to_non_nullable
              as String,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      formula: freezed == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isCalculated: null == isCalculated
          ? _value.isCalculated
          : isCalculated // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CellModelImpl extends _CellModel {
  const _$CellModelImpl(
      {required this.id,
      @JsonKey(name: 'rowId') required this.rowId,
      @JsonKey(name: 'columnIndex') required this.columnIndex,
      this.value,
      this.formula,
      this.color,
      @JsonKey(name: 'isCalculated') this.isCalculated = false,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : super._();

  factory _$CellModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CellModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'rowId')
  final String rowId;
  @override
  @JsonKey(name: 'columnIndex')
  final int columnIndex;
  @override
  final String? value;
  @override
  final String? formula;
  @override
  final String? color;
  @override
  @JsonKey(name: 'isCalculated')
  final bool isCalculated;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CellModel(id: $id, rowId: $rowId, columnIndex: $columnIndex, value: $value, formula: $formula, color: $color, isCalculated: $isCalculated, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CellModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.formula, formula) || other.formula == formula) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isCalculated, isCalculated) ||
                other.isCalculated == isCalculated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rowId, columnIndex, value,
      formula, color, isCalculated, createdAt, updatedAt);

  /// Create a copy of CellModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CellModelImplCopyWith<_$CellModelImpl> get copyWith =>
      __$$CellModelImplCopyWithImpl<_$CellModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CellModelImplToJson(
      this,
    );
  }
}

abstract class _CellModel extends CellModel {
  const factory _CellModel(
          {required final String id,
          @JsonKey(name: 'rowId') required final String rowId,
          @JsonKey(name: 'columnIndex') required final int columnIndex,
          final String? value,
          final String? formula,
          final String? color,
          @JsonKey(name: 'isCalculated') final bool isCalculated,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$CellModelImpl;
  const _CellModel._() : super._();

  factory _CellModel.fromJson(Map<String, dynamic> json) =
      _$CellModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'rowId')
  String get rowId;
  @override
  @JsonKey(name: 'columnIndex')
  int get columnIndex;
  @override
  String? get value;
  @override
  String? get formula;
  @override
  String? get color;
  @override
  @JsonKey(name: 'isCalculated')
  bool get isCalculated;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of CellModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CellModelImplCopyWith<_$CellModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RowModel _$RowModelFromJson(Map<String, dynamic> json) {
  return _RowModel.fromJson(json);
}

/// @nodoc
mixin _$RowModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sheetId')
  String get sheetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'rowIndex')
  int get rowIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'isItemRow')
  bool get isItemRow => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemName')
  String? get itemName => throw _privateConstructorUsedError;
  List<CellModel> get cells => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RowModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RowModelCopyWith<RowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowModelCopyWith<$Res> {
  factory $RowModelCopyWith(RowModel value, $Res Function(RowModel) then) =
      _$RowModelCopyWithImpl<$Res, RowModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'sheetId') String sheetId,
      @JsonKey(name: 'rowIndex') int rowIndex,
      @JsonKey(name: 'isItemRow') bool isItemRow,
      @JsonKey(name: 'itemName') String? itemName,
      List<CellModel> cells,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$RowModelCopyWithImpl<$Res, $Val extends RowModel>
    implements $RowModelCopyWith<$Res> {
  _$RowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sheetId = null,
    Object? rowIndex = null,
    Object? isItemRow = null,
    Object? itemName = freezed,
    Object? cells = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sheetId: null == sheetId
          ? _value.sheetId
          : sheetId // ignore: cast_nullable_to_non_nullable
              as String,
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isItemRow: null == isItemRow
          ? _value.isItemRow
          : isItemRow // ignore: cast_nullable_to_non_nullable
              as bool,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<CellModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RowModelImplCopyWith<$Res>
    implements $RowModelCopyWith<$Res> {
  factory _$$RowModelImplCopyWith(
          _$RowModelImpl value, $Res Function(_$RowModelImpl) then) =
      __$$RowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'sheetId') String sheetId,
      @JsonKey(name: 'rowIndex') int rowIndex,
      @JsonKey(name: 'isItemRow') bool isItemRow,
      @JsonKey(name: 'itemName') String? itemName,
      List<CellModel> cells,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$RowModelImplCopyWithImpl<$Res>
    extends _$RowModelCopyWithImpl<$Res, _$RowModelImpl>
    implements _$$RowModelImplCopyWith<$Res> {
  __$$RowModelImplCopyWithImpl(
      _$RowModelImpl _value, $Res Function(_$RowModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sheetId = null,
    Object? rowIndex = null,
    Object? isItemRow = null,
    Object? itemName = freezed,
    Object? cells = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RowModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sheetId: null == sheetId
          ? _value.sheetId
          : sheetId // ignore: cast_nullable_to_non_nullable
              as String,
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isItemRow: null == isItemRow
          ? _value.isItemRow
          : isItemRow // ignore: cast_nullable_to_non_nullable
              as bool,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<CellModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowModelImpl extends _RowModel {
  const _$RowModelImpl(
      {required this.id,
      @JsonKey(name: 'sheetId') required this.sheetId,
      @JsonKey(name: 'rowIndex') required this.rowIndex,
      @JsonKey(name: 'isItemRow') this.isItemRow = true,
      @JsonKey(name: 'itemName') this.itemName,
      final List<CellModel> cells = const [],
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : _cells = cells,
        super._();

  factory _$RowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'sheetId')
  final String sheetId;
  @override
  @JsonKey(name: 'rowIndex')
  final int rowIndex;
  @override
  @JsonKey(name: 'isItemRow')
  final bool isItemRow;
  @override
  @JsonKey(name: 'itemName')
  final String? itemName;
  final List<CellModel> _cells;
  @override
  @JsonKey()
  List<CellModel> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RowModel(id: $id, sheetId: $sheetId, rowIndex: $rowIndex, isItemRow: $isItemRow, itemName: $itemName, cells: $cells, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sheetId, sheetId) || other.sheetId == sheetId) &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.isItemRow, isItemRow) ||
                other.isItemRow == isItemRow) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sheetId,
      rowIndex,
      isItemRow,
      itemName,
      const DeepCollectionEquality().hash(_cells),
      createdAt,
      updatedAt);

  /// Create a copy of RowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RowModelImplCopyWith<_$RowModelImpl> get copyWith =>
      __$$RowModelImplCopyWithImpl<_$RowModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowModelImplToJson(
      this,
    );
  }
}

abstract class _RowModel extends RowModel {
  const factory _RowModel(
          {required final String id,
          @JsonKey(name: 'sheetId') required final String sheetId,
          @JsonKey(name: 'rowIndex') required final int rowIndex,
          @JsonKey(name: 'isItemRow') final bool isItemRow,
          @JsonKey(name: 'itemName') final String? itemName,
          final List<CellModel> cells,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$RowModelImpl;
  const _RowModel._() : super._();

  factory _RowModel.fromJson(Map<String, dynamic> json) =
      _$RowModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'sheetId')
  String get sheetId;
  @override
  @JsonKey(name: 'rowIndex')
  int get rowIndex;
  @override
  @JsonKey(name: 'isItemRow')
  bool get isItemRow;
  @override
  @JsonKey(name: 'itemName')
  String? get itemName;
  @override
  List<CellModel> get cells;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of RowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RowModelImplCopyWith<_$RowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SheetModel _$SheetModelFromJson(Map<String, dynamic> json) {
  return _SheetModel.fromJson(json);
}

/// @nodoc
mixin _$SheetModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get columns => throw _privateConstructorUsedError;
  @JsonKey(name: 'kahonCashierId')
  String? get kahonCashierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'inventoryCashierId')
  String? get inventoryCashierId => throw _privateConstructorUsedError;
  List<RowModel> get rows => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SheetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SheetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SheetModelCopyWith<SheetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheetModelCopyWith<$Res> {
  factory $SheetModelCopyWith(
          SheetModel value, $Res Function(SheetModel) then) =
      _$SheetModelCopyWithImpl<$Res, SheetModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      String name,
      int columns,
      @JsonKey(name: 'kahonCashierId') String? kahonCashierId,
      @JsonKey(name: 'inventoryCashierId') String? inventoryCashierId,
      List<RowModel> rows,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$SheetModelCopyWithImpl<$Res, $Val extends SheetModel>
    implements $SheetModelCopyWith<$Res> {
  _$SheetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SheetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? columns = null,
    Object? kahonCashierId = freezed,
    Object? inventoryCashierId = freezed,
    Object? rows = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      kahonCashierId: freezed == kahonCashierId
          ? _value.kahonCashierId
          : kahonCashierId // ignore: cast_nullable_to_non_nullable
              as String?,
      inventoryCashierId: freezed == inventoryCashierId
          ? _value.inventoryCashierId
          : inventoryCashierId // ignore: cast_nullable_to_non_nullable
              as String?,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<RowModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SheetModelImplCopyWith<$Res>
    implements $SheetModelCopyWith<$Res> {
  factory _$$SheetModelImplCopyWith(
          _$SheetModelImpl value, $Res Function(_$SheetModelImpl) then) =
      __$$SheetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String name,
      int columns,
      @JsonKey(name: 'kahonCashierId') String? kahonCashierId,
      @JsonKey(name: 'inventoryCashierId') String? inventoryCashierId,
      List<RowModel> rows,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$SheetModelImplCopyWithImpl<$Res>
    extends _$SheetModelCopyWithImpl<$Res, _$SheetModelImpl>
    implements _$$SheetModelImplCopyWith<$Res> {
  __$$SheetModelImplCopyWithImpl(
      _$SheetModelImpl _value, $Res Function(_$SheetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SheetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? columns = null,
    Object? kahonCashierId = freezed,
    Object? inventoryCashierId = freezed,
    Object? rows = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SheetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      kahonCashierId: freezed == kahonCashierId
          ? _value.kahonCashierId
          : kahonCashierId // ignore: cast_nullable_to_non_nullable
              as String?,
      inventoryCashierId: freezed == inventoryCashierId
          ? _value.inventoryCashierId
          : inventoryCashierId // ignore: cast_nullable_to_non_nullable
              as String?,
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<RowModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SheetModelImpl extends _SheetModel {
  const _$SheetModelImpl(
      {required this.id,
      required this.type,
      required this.name,
      this.columns = 10,
      @JsonKey(name: 'kahonCashierId') this.kahonCashierId,
      @JsonKey(name: 'inventoryCashierId') this.inventoryCashierId,
      final List<RowModel> rows = const [],
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : _rows = rows,
        super._();

  factory _$SheetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SheetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String name;
  @override
  @JsonKey()
  final int columns;
  @override
  @JsonKey(name: 'kahonCashierId')
  final String? kahonCashierId;
  @override
  @JsonKey(name: 'inventoryCashierId')
  final String? inventoryCashierId;
  final List<RowModel> _rows;
  @override
  @JsonKey()
  List<RowModel> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SheetModel(id: $id, type: $type, name: $name, columns: $columns, kahonCashierId: $kahonCashierId, inventoryCashierId: $inventoryCashierId, rows: $rows, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SheetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.columns, columns) || other.columns == columns) &&
            (identical(other.kahonCashierId, kahonCashierId) ||
                other.kahonCashierId == kahonCashierId) &&
            (identical(other.inventoryCashierId, inventoryCashierId) ||
                other.inventoryCashierId == inventoryCashierId) &&
            const DeepCollectionEquality().equals(other._rows, _rows) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      columns,
      kahonCashierId,
      inventoryCashierId,
      const DeepCollectionEquality().hash(_rows),
      createdAt,
      updatedAt);

  /// Create a copy of SheetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SheetModelImplCopyWith<_$SheetModelImpl> get copyWith =>
      __$$SheetModelImplCopyWithImpl<_$SheetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SheetModelImplToJson(
      this,
    );
  }
}

abstract class _SheetModel extends SheetModel {
  const factory _SheetModel(
          {required final String id,
          required final String type,
          required final String name,
          final int columns,
          @JsonKey(name: 'kahonCashierId') final String? kahonCashierId,
          @JsonKey(name: 'inventoryCashierId') final String? inventoryCashierId,
          final List<RowModel> rows,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$SheetModelImpl;
  const _SheetModel._() : super._();

  factory _SheetModel.fromJson(Map<String, dynamic> json) =
      _$SheetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get name;
  @override
  int get columns;
  @override
  @JsonKey(name: 'kahonCashierId')
  String? get kahonCashierId;
  @override
  @JsonKey(name: 'inventoryCashierId')
  String? get inventoryCashierId;
  @override
  List<RowModel> get rows;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of SheetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SheetModelImplCopyWith<_$SheetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
