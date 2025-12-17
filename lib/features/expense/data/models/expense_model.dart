import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/expense.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

/// Converter to handle amount that can come as String or num from API.
class StringToDoubleConverter implements JsonConverter<double, dynamic> {
  const StringToDoubleConverter();

  @override
  double fromJson(dynamic json) {
    if (json is String) {
      return double.tryParse(json) ?? 0.0;
    } else if (json is num) {
      return json.toDouble();
    }
    return 0.0;
  }

  @override
  dynamic toJson(double value) => value;
}

/// Model for an expense item from API.
@freezed
class ExpenseItemModel with _$ExpenseItemModel {
  const ExpenseItemModel._();

  const factory ExpenseItemModel({
    required String id,
    required String name,
    @StringToDoubleConverter() required double amount,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _ExpenseItemModel;

  factory ExpenseItemModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemModelFromJson(json);

  /// Convert to domain entity.
  ExpenseItem toEntity() => ExpenseItem(
        id: id,
        name: name,
        amount: amount,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

/// Model for an expense list from API.
@freezed
class ExpenseListModel with _$ExpenseListModel {
  const ExpenseListModel._();

  const factory ExpenseListModel({
    required String id,
    @JsonKey(name: 'cashierId') required String cashierId,
    @JsonKey(name: 'businessId') required String businessId,
    @Default([]) List<ExpenseItemModel> expenseItems,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _ExpenseListModel;

  factory ExpenseListModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseListModelFromJson(json);

  /// Convert to domain entity.
  ExpenseList toEntity() => ExpenseList(
        id: id,
        cashierId: cashierId,
        businessId: businessId,
        expenseItems: expenseItems.map((item) => item.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

/// Request model for creating/updating an expense.
@freezed
class CreateExpenseRequest with _$CreateExpenseRequest {
  const CreateExpenseRequest._();

  const factory CreateExpenseRequest({
    /// ISO 8601 UTC timestamp. If not provided, server uses current date.
    String? date,
    required List<ExpenseItemRequest> expenseItems,
  }) = _CreateExpenseRequest;

  factory CreateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseRequestFromJson(json);
}

/// Request model for an expense item.
@freezed
class ExpenseItemRequest with _$ExpenseItemRequest {
  const ExpenseItemRequest._();

  const factory ExpenseItemRequest({
    required String name,
    required double amount,
  }) = _ExpenseItemRequest;

  factory ExpenseItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemRequestFromJson(json);
}
