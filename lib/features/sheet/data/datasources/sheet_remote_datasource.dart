import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/sheet.dart';
import '../../domain/repositories/sheet_repository.dart';
import '../models/sheet_model.dart';

/// Remote data source for sheet operations.
///
/// Handles all API calls to the sheet endpoints.
class SheetRemoteDataSource {
  final Dio _dio;

  SheetRemoteDataSource(this._dio);

  // ============================================================================
  // Get Sheet Operations
  // ============================================================================

  /// Fetch Kahon sheet for the authenticated cashier.
  Future<SheetModel> getKahonSheet() async {
    final response = await _dio.get(ApiEndpoints.sheet.kahon);
    return SheetModel.fromJson(response.data);
  }

  /// Fetch Kahon sheet by date range.
  Future<SheetModel> getKahonSheetByDate({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.sheet.kahonByDate,
      queryParameters: {
        'startDate': startDate.toUtc().toIso8601String(),
        'endDate': endDate.toUtc().toIso8601String(),
      },
    );
    return SheetModel.fromJson(response.data);
  }

  /// Fetch Inventory sheet for the authenticated cashier.
  Future<SheetModel> getInventorySheet() async {
    final response = await _dio.get(ApiEndpoints.sheet.inventory);
    return SheetModel.fromJson(response.data);
  }

  /// Fetch Inventory sheet by date range.
  Future<SheetModel> getInventorySheetByDate({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.sheet.inventoryByDate,
      queryParameters: {
        'startDate': startDate.toUtc().toIso8601String(),
        'endDate': endDate.toUtc().toIso8601String(),
      },
    );
    return SheetModel.fromJson(response.data);
  }

  // ============================================================================
  // Row Operations
  // ============================================================================

  /// Add a single row to a sheet.
  Future<RowModel> addRow({
    required String sheetId,
    required int rowIndex,
    bool isItemRow = true,
    String? itemName,
    DateTime? createdAt,
    List<CellInput>? cells,
  }) async {
    final body = <String, dynamic>{
      'sheetId': sheetId,
      'rowIndex': rowIndex,
      'isItemRow': isItemRow,
    };

    if (itemName != null) body['itemName'] = itemName;
    if (createdAt != null)
      body['createdAt'] = createdAt.toUtc().toIso8601String();
    if (cells != null && cells.isNotEmpty) {
      body['cells'] = cells
          .map((c) => {
                'columnIndex': c.columnIndex,
                if (c.value != null) 'value': c.value,
                if (c.formula != null) 'formula': c.formula,
                if (c.color != null) 'color': c.color,
                'isCalculated': c.isCalculated,
              })
          .toList();
    }

    final response = await _dio.post(ApiEndpoints.sheet.row, data: body);
    return RowModel.fromJson(response.data);
  }

  /// Add multiple rows to a sheet.
  Future<List<RowModel>> addRows({
    required String sheetId,
    required List<RowInput> rows,
  }) async {
    final body = {
      'sheetId': sheetId,
      'rows': rows
          .map((r) => {
                'rowIndex': r.rowIndex,
                'isItemRow': r.isItemRow,
                if (r.itemName != null) 'itemName': r.itemName,
                if (r.createdAt != null)
                  'createdAt': r.createdAt!.toUtc().toIso8601String(),
                if (r.cells != null && r.cells!.isNotEmpty)
                  'cells': r.cells!
                      .map((c) => {
                            'columnIndex': c.columnIndex,
                            if (c.value != null) 'value': c.value,
                            if (c.formula != null) 'formula': c.formula,
                            if (c.color != null) 'color': c.color,
                            'isCalculated': c.isCalculated,
                          })
                      .toList(),
              })
          .toList(),
    };

    final response = await _dio.post(ApiEndpoints.sheet.rows, data: body);
    return (response.data as List)
        .map((json) => RowModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Delete a row.
  Future<void> deleteRow(String rowId) async {
    await _dio.delete(ApiEndpoints.sheet.rowById(rowId));
  }

  /// Reorder a single row.
  Future<RowModel> reorderRow({
    required String rowId,
    required int newRowIndex,
  }) async {
    final response = await _dio.patch(
      ApiEndpoints.sheet.rowReorder,
      data: {
        'rowId': rowId,
        'newRowIndex': newRowIndex,
      },
    );
    return RowModel.fromJson(response.data);
  }

  /// Batch update row positions.
  Future<void> updateRowPositions(List<RowPositionUpdate> updates) async {
    await _dio.patch(
      ApiEndpoints.sheet.rowsPositions,
      data: {
        'updates': updates
            .map((u) => {
                  'rowId': u.rowId,
                  'newRowIndex': u.newRowIndex,
                })
            .toList(),
      },
    );
  }

  // ============================================================================
  // Cell Operations
  // ============================================================================

  /// Add a single cell.
  Future<CellModel> addCell({
    required String rowId,
    required int columnIndex,
    String? value,
    String? formula,
    String? color,
    bool isCalculated = false,
  }) async {
    final body = <String, dynamic>{
      'rowId': rowId,
      'columnIndex': columnIndex,
      'isCalculated': isCalculated,
    };

    if (value != null) body['value'] = value;
    if (formula != null) body['formula'] = formula;
    if (color != null) body['color'] = color;

    final response = await _dio.post(ApiEndpoints.sheet.cell, data: body);
    return CellModel.fromJson(response.data);
  }

  /// Add multiple cells.
  Future<void> addCells(List<CellInput> cells) async {
    await _dio.post(
      ApiEndpoints.sheet.cells,
      data: {
        'cells': cells
            .map((c) => {
                  'rowId': c.rowId,
                  'columnIndex': c.columnIndex,
                  if (c.value != null) 'value': c.value,
                  if (c.formula != null) 'formula': c.formula,
                  if (c.color != null) 'color': c.color,
                  'isCalculated': c.isCalculated,
                })
            .toList(),
      },
    );
  }

  /// Update a single cell.
  Future<CellModel> updateCell({
    required String cellId,
    String? value,
    String? formula,
    String? color,
    bool? isCalculated,
  }) async {
    final body = <String, dynamic>{};

    if (value != null) body['value'] = value;
    if (formula != null) body['formula'] = formula;
    if (color != null) body['color'] = color;
    if (isCalculated != null) body['isCalculated'] = isCalculated;

    final response = await _dio.patch(
      ApiEndpoints.sheet.cellById(cellId),
      data: body,
    );
    return CellModel.fromJson(response.data);
  }

  /// Update multiple cells.
  Future<void> updateCells(List<CellUpdate> cells) async {
    await _dio.patch(
      ApiEndpoints.sheet.cells,
      data: {
        'cells': cells
            .map((c) => {
                  'id': c.cellId,
                  if (c.value != null) 'value': c.value,
                  if (c.formula != null) 'formula': c.formula,
                  if (c.color != null) 'color': c.color,
                  if (c.isCalculated != null) 'isCalculated': c.isCalculated,
                })
            .toList(),
      },
    );
  }

  /// Delete a cell.
  Future<void> deleteCell(String cellId) async {
    await _dio.delete(ApiEndpoints.sheet.cellById(cellId));
  }
}
