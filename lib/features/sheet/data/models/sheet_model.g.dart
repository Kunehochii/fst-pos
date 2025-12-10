// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CellModelImpl _$$CellModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CellModelImpl',
      json,
      ($checkedConvert) {
        final val = _$CellModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          rowId: $checkedConvert('rowId', (v) => v as String),
          columnIndex:
              $checkedConvert('columnIndex', (v) => (v as num).toInt()),
          value: $checkedConvert('value', (v) => v as String?),
          formula: $checkedConvert('formula', (v) => v as String?),
          color: $checkedConvert('color', (v) => v as String?),
          isCalculated:
              $checkedConvert('isCalculated', (v) => v as bool? ?? false),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CellModelImplToJson(_$CellModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rowId': instance.rowId,
      'columnIndex': instance.columnIndex,
      if (instance.value case final value?) 'value': value,
      if (instance.formula case final value?) 'formula': value,
      if (instance.color case final value?) 'color': value,
      'isCalculated': instance.isCalculated,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$RowModelImpl _$$RowModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$RowModelImpl',
      json,
      ($checkedConvert) {
        final val = _$RowModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          sheetId: $checkedConvert('sheetId', (v) => v as String),
          rowIndex: $checkedConvert('rowIndex', (v) => (v as num).toInt()),
          isItemRow: $checkedConvert('isItemRow', (v) => v as bool? ?? true),
          itemName: $checkedConvert('itemName', (v) => v as String?),
          cells: $checkedConvert(
              'cells',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => CellModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$RowModelImplToJson(_$RowModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sheetId': instance.sheetId,
      'rowIndex': instance.rowIndex,
      'isItemRow': instance.isItemRow,
      if (instance.itemName case final value?) 'itemName': value,
      'cells': instance.cells.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$SheetModelImpl _$$SheetModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SheetModelImpl',
      json,
      ($checkedConvert) {
        final val = _$SheetModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          columns:
              $checkedConvert('columns', (v) => (v as num?)?.toInt() ?? 10),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          rows: $checkedConvert(
              'rows',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => RowModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SheetModelImplToJson(_$SheetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'columns': instance.columns,
      'cashierId': instance.cashierId,
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
