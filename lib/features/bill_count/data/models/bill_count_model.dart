import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/bill_count.dart';

part 'bill_count_model.freezed.dart';
part 'bill_count_model.g.dart';

/// Model for a bill item from API.
@freezed
class BillItemModel with _$BillItemModel {
  const BillItemModel._();

  const factory BillItemModel({
    required String id,
    required String type,
    required int amount,
    required int value,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _BillItemModel;

  factory BillItemModel.fromJson(Map<String, dynamic> json) =>
      _$BillItemModelFromJson(json);

  /// Convert to domain entity.
  BillItem toEntity() => BillItem(
        id: id,
        type: BillType.fromApiValue(type),
        amount: amount,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

/// Model for cashier info from API.
@freezed
class BillCountCashierModel with _$BillCountCashierModel {
  const BillCountCashierModel._();

  const factory BillCountCashierModel({
    required String id,
    required String username,
    required String branchName,
  }) = _BillCountCashierModel;

  factory BillCountCashierModel.fromJson(Map<String, dynamic> json) =>
      _$BillCountCashierModelFromJson(json);

  /// Convert to domain entity.
  BillCountCashier toEntity() => BillCountCashier(
        id: id,
        username: username,
        branchName: branchName,
      );
}

/// Model for a bill count from API.
@freezed
class BillCountModel with _$BillCountModel {
  const BillCountModel._();

  const factory BillCountModel({
    required String id,
    required String date,
    @JsonKey(name: 'updatedAt') required String updatedAt,
    required BillCountCashierModel cashier,
    required double beginningBalance,
    required bool showBeginningBalance,
    required double totalCash,
    required double totalExpenses,
    required double netCash,
    required List<BillItemModel> bills,
    required Map<String, int> billsByType,
    required double billsTotal,
    required double summaryStep1,
    required double summaryFinal,
  }) = _BillCountModel;

  factory BillCountModel.fromJson(Map<String, dynamic> json) =>
      _$BillCountModelFromJson(json);

  /// Convert to domain entity.
  BillCount toEntity({bool isSynced = true, String? localId}) {
    // Convert billsByType from String keys to BillType keys
    final Map<BillType, int> typedBillsByType = {};
    billsByType.forEach((key, value) {
      typedBillsByType[BillType.fromApiValue(key)] = value;
    });

    return BillCount(
      id: id,
      date: DateTime.parse(date),
      updatedAt: DateTime.parse(updatedAt),
      cashier: cashier.toEntity(),
      beginningBalance: beginningBalance,
      showBeginningBalance: showBeginningBalance,
      totalCash: totalCash,
      totalExpenses: totalExpenses,
      netCash: netCash,
      bills: bills.map((b) => b.toEntity()).toList(),
      billsByType: typedBillsByType,
      billsTotal: billsTotal,
      summaryStep1: summaryStep1,
      summaryFinal: summaryFinal,
      isSynced: isSynced,
      localId: localId,
    );
  }

  /// Create from domain entity.
  factory BillCountModel.fromEntity(BillCount entity) {
    // Convert BillType keys to String keys
    final Map<String, int> stringBillsByType = {};
    entity.billsByType.forEach((key, value) {
      stringBillsByType[key.apiValue] = value;
    });

    return BillCountModel(
      id: entity.id,
      date: entity.date.toUtc().toIso8601String(),
      updatedAt: entity.updatedAt.toUtc().toIso8601String(),
      cashier: BillCountCashierModel(
        id: entity.cashier.id,
        username: entity.cashier.username,
        branchName: entity.cashier.branchName,
      ),
      beginningBalance: entity.beginningBalance,
      showBeginningBalance: entity.showBeginningBalance,
      totalCash: entity.totalCash,
      totalExpenses: entity.totalExpenses,
      netCash: entity.netCash,
      bills: entity.bills
          .map((b) => BillItemModel(
                id: b.id,
                type: b.type.apiValue,
                amount: b.amount,
                value: b.type.value,
                createdAt: b.createdAt,
                updatedAt: b.updatedAt,
              ))
          .toList(),
      billsByType: stringBillsByType,
      billsTotal: entity.billsTotal,
      summaryStep1: entity.summaryStep1,
      summaryFinal: entity.summaryFinal,
    );
  }
}

/// Request model for creating/updating a bill count.
@freezed
class CreateBillCountRequest with _$CreateBillCountRequest {
  const CreateBillCountRequest._();

  const factory CreateBillCountRequest({
    @Default(0) double beginningBalance,
    @Default(false) bool showBeginningBalance,
    List<BillItemRequest>? bills,
  }) = _CreateBillCountRequest;

  factory CreateBillCountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBillCountRequestFromJson(json);
}

/// Request model for a bill item.
@freezed
class BillItemRequest with _$BillItemRequest {
  const BillItemRequest._();

  const factory BillItemRequest({
    required String type,
    required int amount,
  }) = _BillItemRequest;

  factory BillItemRequest.fromJson(Map<String, dynamic> json) =>
      _$BillItemRequestFromJson(json);
}
