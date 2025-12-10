// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Sheet {
  String get id => throw _privateConstructorUsedError;
  SheetType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get columns => throw _privateConstructorUsedError;
  String get cashierId => throw _privateConstructorUsedError;
  List<SheetRow> get rows => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SheetCopyWith<Sheet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheetCopyWith<$Res> {
  factory $SheetCopyWith(Sheet value, $Res Function(Sheet) then) =
      _$SheetCopyWithImpl<$Res, Sheet>;
  @useResult
  $Res call(
      {String id,
      SheetType type,
      String name,
      int columns,
      String cashierId,
      List<SheetRow> rows,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SheetCopyWithImpl<$Res, $Val extends Sheet>
    implements $SheetCopyWith<$Res> {
  _$SheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? columns = null,
    Object? cashierId = null,
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
              as SheetType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<SheetRow>,
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
abstract class _$$SheetImplCopyWith<$Res> implements $SheetCopyWith<$Res> {
  factory _$$SheetImplCopyWith(
          _$SheetImpl value, $Res Function(_$SheetImpl) then) =
      __$$SheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SheetType type,
      String name,
      int columns,
      String cashierId,
      List<SheetRow> rows,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SheetImplCopyWithImpl<$Res>
    extends _$SheetCopyWithImpl<$Res, _$SheetImpl>
    implements _$$SheetImplCopyWith<$Res> {
  __$$SheetImplCopyWithImpl(
      _$SheetImpl _value, $Res Function(_$SheetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? columns = null,
    Object? cashierId = null,
    Object? rows = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SheetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SheetType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<SheetRow>,
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

class _$SheetImpl extends _Sheet {
  const _$SheetImpl(
      {required this.id,
      required this.type,
      required this.name,
      required this.columns,
      required this.cashierId,
      required final List<SheetRow> rows,
      required this.createdAt,
      required this.updatedAt})
      : _rows = rows,
        super._();

  @override
  final String id;
  @override
  final SheetType type;
  @override
  final String name;
  @override
  final int columns;
  @override
  final String cashierId;
  final List<SheetRow> _rows;
  @override
  List<SheetRow> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Sheet(id: $id, type: $type, name: $name, columns: $columns, cashierId: $cashierId, rows: $rows, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SheetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.columns, columns) || other.columns == columns) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            const DeepCollectionEquality().equals(other._rows, _rows) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      columns,
      cashierId,
      const DeepCollectionEquality().hash(_rows),
      createdAt,
      updatedAt);

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SheetImplCopyWith<_$SheetImpl> get copyWith =>
      __$$SheetImplCopyWithImpl<_$SheetImpl>(this, _$identity);
}

abstract class _Sheet extends Sheet {
  const factory _Sheet(
      {required final String id,
      required final SheetType type,
      required final String name,
      required final int columns,
      required final String cashierId,
      required final List<SheetRow> rows,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SheetImpl;
  const _Sheet._() : super._();

  @override
  String get id;
  @override
  SheetType get type;
  @override
  String get name;
  @override
  int get columns;
  @override
  String get cashierId;
  @override
  List<SheetRow> get rows;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SheetImplCopyWith<_$SheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SheetRow {
  String get id => throw _privateConstructorUsedError;
  String get sheetId => throw _privateConstructorUsedError;
  int get rowIndex => throw _privateConstructorUsedError;
  bool get isItemRow => throw _privateConstructorUsedError;
  String? get itemName => throw _privateConstructorUsedError;
  List<Cell> get cells => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of SheetRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SheetRowCopyWith<SheetRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheetRowCopyWith<$Res> {
  factory $SheetRowCopyWith(SheetRow value, $Res Function(SheetRow) then) =
      _$SheetRowCopyWithImpl<$Res, SheetRow>;
  @useResult
  $Res call(
      {String id,
      String sheetId,
      int rowIndex,
      bool isItemRow,
      String? itemName,
      List<Cell> cells,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SheetRowCopyWithImpl<$Res, $Val extends SheetRow>
    implements $SheetRowCopyWith<$Res> {
  _$SheetRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SheetRow
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
              as List<Cell>,
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
abstract class _$$SheetRowImplCopyWith<$Res>
    implements $SheetRowCopyWith<$Res> {
  factory _$$SheetRowImplCopyWith(
          _$SheetRowImpl value, $Res Function(_$SheetRowImpl) then) =
      __$$SheetRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sheetId,
      int rowIndex,
      bool isItemRow,
      String? itemName,
      List<Cell> cells,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SheetRowImplCopyWithImpl<$Res>
    extends _$SheetRowCopyWithImpl<$Res, _$SheetRowImpl>
    implements _$$SheetRowImplCopyWith<$Res> {
  __$$SheetRowImplCopyWithImpl(
      _$SheetRowImpl _value, $Res Function(_$SheetRowImpl) _then)
      : super(_value, _then);

  /// Create a copy of SheetRow
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
    return _then(_$SheetRowImpl(
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
              as List<Cell>,
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

class _$SheetRowImpl extends _SheetRow {
  const _$SheetRowImpl(
      {required this.id,
      required this.sheetId,
      required this.rowIndex,
      required this.isItemRow,
      this.itemName,
      required final List<Cell> cells,
      required this.createdAt,
      required this.updatedAt})
      : _cells = cells,
        super._();

  @override
  final String id;
  @override
  final String sheetId;
  @override
  final int rowIndex;
  @override
  final bool isItemRow;
  @override
  final String? itemName;
  final List<Cell> _cells;
  @override
  List<Cell> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SheetRow(id: $id, sheetId: $sheetId, rowIndex: $rowIndex, isItemRow: $isItemRow, itemName: $itemName, cells: $cells, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SheetRowImpl &&
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

  /// Create a copy of SheetRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SheetRowImplCopyWith<_$SheetRowImpl> get copyWith =>
      __$$SheetRowImplCopyWithImpl<_$SheetRowImpl>(this, _$identity);
}

abstract class _SheetRow extends SheetRow {
  const factory _SheetRow(
      {required final String id,
      required final String sheetId,
      required final int rowIndex,
      required final bool isItemRow,
      final String? itemName,
      required final List<Cell> cells,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SheetRowImpl;
  const _SheetRow._() : super._();

  @override
  String get id;
  @override
  String get sheetId;
  @override
  int get rowIndex;
  @override
  bool get isItemRow;
  @override
  String? get itemName;
  @override
  List<Cell> get cells;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of SheetRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SheetRowImplCopyWith<_$SheetRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Cell {
  String get id => throw _privateConstructorUsedError;
  String get rowId => throw _privateConstructorUsedError;
  int get columnIndex => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get formula => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  bool get isCalculated => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Cell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CellCopyWith<Cell> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellCopyWith<$Res> {
  factory $CellCopyWith(Cell value, $Res Function(Cell) then) =
      _$CellCopyWithImpl<$Res, Cell>;
  @useResult
  $Res call(
      {String id,
      String rowId,
      int columnIndex,
      String? value,
      String? formula,
      String? color,
      bool isCalculated,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CellCopyWithImpl<$Res, $Val extends Cell>
    implements $CellCopyWith<$Res> {
  _$CellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cell
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
abstract class _$$CellImplCopyWith<$Res> implements $CellCopyWith<$Res> {
  factory _$$CellImplCopyWith(
          _$CellImpl value, $Res Function(_$CellImpl) then) =
      __$$CellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String rowId,
      int columnIndex,
      String? value,
      String? formula,
      String? color,
      bool isCalculated,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$CellImplCopyWithImpl<$Res>
    extends _$CellCopyWithImpl<$Res, _$CellImpl>
    implements _$$CellImplCopyWith<$Res> {
  __$$CellImplCopyWithImpl(_$CellImpl _value, $Res Function(_$CellImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cell
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
    return _then(_$CellImpl(
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

class _$CellImpl extends _Cell {
  const _$CellImpl(
      {required this.id,
      required this.rowId,
      required this.columnIndex,
      this.value,
      this.formula,
      this.color,
      required this.isCalculated,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  @override
  final String id;
  @override
  final String rowId;
  @override
  final int columnIndex;
  @override
  final String? value;
  @override
  final String? formula;
  @override
  final String? color;
  @override
  final bool isCalculated;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Cell(id: $id, rowId: $rowId, columnIndex: $columnIndex, value: $value, formula: $formula, color: $color, isCalculated: $isCalculated, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CellImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, rowId, columnIndex, value,
      formula, color, isCalculated, createdAt, updatedAt);

  /// Create a copy of Cell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CellImplCopyWith<_$CellImpl> get copyWith =>
      __$$CellImplCopyWithImpl<_$CellImpl>(this, _$identity);
}

abstract class _Cell extends Cell {
  const factory _Cell(
      {required final String id,
      required final String rowId,
      required final int columnIndex,
      final String? value,
      final String? formula,
      final String? color,
      required final bool isCalculated,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CellImpl;
  const _Cell._() : super._();

  @override
  String get id;
  @override
  String get rowId;
  @override
  int get columnIndex;
  @override
  String? get value;
  @override
  String? get formula;
  @override
  String? get color;
  @override
  bool get isCalculated;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Cell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CellImplCopyWith<_$CellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
