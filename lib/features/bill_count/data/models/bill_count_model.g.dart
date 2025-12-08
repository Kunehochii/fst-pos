// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillItemModelImpl _$$BillItemModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$BillItemModelImpl',
      json,
      ($checkedConvert) {
        final val = _$BillItemModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          amount: $checkedConvert('amount', (v) => (v as num).toInt()),
          value: $checkedConvert('value', (v) => (v as num).toInt()),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$BillItemModelImplToJson(_$BillItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'value': instance.value,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$BillCountCashierModelImpl _$$BillCountCashierModelImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$BillCountCashierModelImpl',
      json,
      ($checkedConvert) {
        final val = _$BillCountCashierModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          branchName: $checkedConvert('branch_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'branchName': 'branch_name'},
    );

Map<String, dynamic> _$$BillCountCashierModelImplToJson(
        _$BillCountCashierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'branch_name': instance.branchName,
    };

_$BillCountModelImpl _$$BillCountModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$BillCountModelImpl',
      json,
      ($checkedConvert) {
        final val = _$BillCountModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          date: $checkedConvert('date', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
          cashier: $checkedConvert('cashier',
              (v) => BillCountCashierModel.fromJson(v as Map<String, dynamic>)),
          beginningBalance: $checkedConvert(
              'beginning_balance', (v) => (v as num).toDouble()),
          showBeginningBalance:
              $checkedConvert('show_beginning_balance', (v) => v as bool),
          totalCash:
              $checkedConvert('total_cash', (v) => (v as num).toDouble()),
          totalExpenses:
              $checkedConvert('total_expenses', (v) => (v as num).toDouble()),
          netCash: $checkedConvert('net_cash', (v) => (v as num).toDouble()),
          bills: $checkedConvert(
              'bills',
              (v) => (v as List<dynamic>)
                  .map((e) => BillItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          billsByType: $checkedConvert(
              'bills_by_type', (v) => Map<String, int>.from(v as Map)),
          billsTotal:
              $checkedConvert('bills_total', (v) => (v as num).toDouble()),
          summaryStep1:
              $checkedConvert('summary_step1', (v) => (v as num).toDouble()),
          summaryFinal:
              $checkedConvert('summary_final', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'beginningBalance': 'beginning_balance',
        'showBeginningBalance': 'show_beginning_balance',
        'totalCash': 'total_cash',
        'totalExpenses': 'total_expenses',
        'netCash': 'net_cash',
        'billsByType': 'bills_by_type',
        'billsTotal': 'bills_total',
        'summaryStep1': 'summary_step1',
        'summaryFinal': 'summary_final'
      },
    );

Map<String, dynamic> _$$BillCountModelImplToJson(
        _$BillCountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'updatedAt': instance.updatedAt,
      'cashier': instance.cashier.toJson(),
      'beginning_balance': instance.beginningBalance,
      'show_beginning_balance': instance.showBeginningBalance,
      'total_cash': instance.totalCash,
      'total_expenses': instance.totalExpenses,
      'net_cash': instance.netCash,
      'bills': instance.bills.map((e) => e.toJson()).toList(),
      'bills_by_type': instance.billsByType,
      'bills_total': instance.billsTotal,
      'summary_step1': instance.summaryStep1,
      'summary_final': instance.summaryFinal,
    };

_$CreateBillCountRequestImpl _$$CreateBillCountRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CreateBillCountRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$CreateBillCountRequestImpl(
          beginningBalance: $checkedConvert(
              'beginning_balance', (v) => (v as num?)?.toDouble() ?? 0),
          showBeginningBalance: $checkedConvert(
              'show_beginning_balance', (v) => v as bool? ?? false),
          bills: $checkedConvert(
              'bills',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      BillItemRequest.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'beginningBalance': 'beginning_balance',
        'showBeginningBalance': 'show_beginning_balance'
      },
    );

Map<String, dynamic> _$$CreateBillCountRequestImplToJson(
        _$CreateBillCountRequestImpl instance) =>
    <String, dynamic>{
      'beginning_balance': instance.beginningBalance,
      'show_beginning_balance': instance.showBeginningBalance,
      if (instance.bills?.map((e) => e.toJson()).toList() case final value?)
        'bills': value,
    };

_$BillItemRequestImpl _$$BillItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$BillItemRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$BillItemRequestImpl(
          type: $checkedConvert('type', (v) => v as String),
          amount: $checkedConvert('amount', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$BillItemRequestImplToJson(
        _$BillItemRequestImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };
