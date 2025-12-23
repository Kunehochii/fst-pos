// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sheet.dart';

part 'sheet_model.freezed.dart';
part 'sheet_model.g.dart';

/// Cell model for API serialization.
@freezed
class CellModel with _$CellModel {
  const CellModel._();

  const factory CellModel({
    required String id,
    @JsonKey(name: 'rowId') required String rowId,
    @JsonKey(name: 'columnIndex') required int columnIndex,
    String? value,
    String? formula,
    String? color,
    @JsonKey(name: 'isCalculated') @Default(false) bool isCalculated,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _CellModel;

  factory CellModel.fromJson(Map<String, dynamic> json) =>
      _$CellModelFromJson(json);

  /// Convert to domain entity.
  Cell toEntity() => Cell(
        id: id,
        rowId: rowId,
        columnIndex: columnIndex,
        value: value,
        formula: formula,
        color: color,
        isCalculated: isCalculated,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory CellModel.fromEntity(Cell entity) => CellModel(
        id: entity.id,
        rowId: entity.rowId,
        columnIndex: entity.columnIndex,
        value: entity.value,
        formula: entity.formula,
        color: entity.color,
        isCalculated: entity.isCalculated,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Row model for API serialization.
@freezed
class RowModel with _$RowModel {
  const RowModel._();

  const factory RowModel({
    required String id,
    @JsonKey(name: 'sheetId') required String sheetId,
    @JsonKey(name: 'rowIndex') required int rowIndex,
    @JsonKey(name: 'isItemRow') @Default(true) bool isItemRow,
    @JsonKey(name: 'itemName') String? itemName,
    @Default([]) List<CellModel> cells,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _RowModel;

  factory RowModel.fromJson(Map<String, dynamic> json) =>
      _$RowModelFromJson(json);

  /// Convert to domain entity.
  SheetRow toEntity() => SheetRow(
        id: id,
        sheetId: sheetId,
        rowIndex: rowIndex,
        isItemRow: isItemRow,
        itemName: itemName,
        cells: cells.map((c) => c.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory RowModel.fromEntity(SheetRow entity) => RowModel(
        id: entity.id,
        sheetId: entity.sheetId,
        rowIndex: entity.rowIndex,
        isItemRow: entity.isItemRow,
        itemName: entity.itemName,
        cells: entity.cells.map((c) => CellModel.fromEntity(c)).toList(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Sheet model for API serialization.
@freezed
class SheetModel with _$SheetModel {
  const SheetModel._();

  const factory SheetModel({
    required String id,
    required String type,
    required String name,
    @Default(10) int columns,
    @JsonKey(name: 'kahonCashierId') String? kahonCashierId,
    @JsonKey(name: 'inventoryCashierId') String? inventoryCashierId,
    @Default([]) List<RowModel> rows,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _SheetModel;

  factory SheetModel.fromJson(Map<String, dynamic> json) =>
      _$SheetModelFromJson(json);

  /// Get the cashierId based on sheet type.
  String get cashierId => kahonCashierId ?? inventoryCashierId ?? '';

  /// Convert to domain entity.
  Sheet toEntity() => Sheet(
        id: id,
        type: SheetType.fromString(type),
        name: name,
        columns: columns,
        cashierId: cashierId,
        rows: rows.map((r) => r.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Create from domain entity.
  factory SheetModel.fromEntity(Sheet entity) => SheetModel(
        id: entity.id,
        type: entity.type.toApiString(),
        name: entity.name,
        columns: entity.columns,
        kahonCashierId:
            entity.type == SheetType.kahon ? entity.cashierId : null,
        inventoryCashierId:
            entity.type == SheetType.inventory ? entity.cashierId : null,
        rows: entity.rows.map((r) => RowModel.fromEntity(r)).toList(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
