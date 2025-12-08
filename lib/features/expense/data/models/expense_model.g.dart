// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseItemModelImpl _$$ExpenseItemModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ExpenseItemModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ExpenseItemModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ExpenseItemModelImplToJson(
        _$ExpenseItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ExpenseListModelImpl _$$ExpenseListModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ExpenseListModelImpl',
      json,
      ($checkedConvert) {
        final val = _$ExpenseListModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          cashierId: $checkedConvert('cashierId', (v) => v as String),
          businessId: $checkedConvert('businessId', (v) => v as String),
          expenseItems: $checkedConvert(
              'expense_items',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          ExpenseItemModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'expenseItems': 'expense_items'},
    );

Map<String, dynamic> _$$ExpenseListModelImplToJson(
        _$ExpenseListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cashierId': instance.cashierId,
      'businessId': instance.businessId,
      'expense_items': instance.expenseItems.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$CreateExpenseRequestImpl _$$CreateExpenseRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateExpenseRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateExpenseRequestImpl(
          date: $checkedConvert('date', (v) => v as String?),
          expenseItems: $checkedConvert(
              'expense_items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      ExpenseItemRequest.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'expenseItems': 'expense_items'},
    );

Map<String, dynamic> _$$CreateExpenseRequestImplToJson(
        _$CreateExpenseRequestImpl instance) =>
    <String, dynamic>{
      if (instance.date case final value?) 'date': value,
      'expense_items': instance.expenseItems.map((e) => e.toJson()).toList(),
    };

_$ExpenseItemRequestImpl _$$ExpenseItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ExpenseItemRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$ExpenseItemRequestImpl(
          name: $checkedConvert('name', (v) => v as String),
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ExpenseItemRequestImplToJson(
        _$ExpenseItemRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };
