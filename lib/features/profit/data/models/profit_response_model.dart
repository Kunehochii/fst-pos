// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/grouped_profit.dart';
import '../../domain/entities/profit_summary.dart';

part 'profit_response_model.freezed.dart';
part 'profit_response_model.g.dart';

/// Model for a grouped profit from API.
@freezed
class GroupedProfitModel with _$GroupedProfitModel {
  const GroupedProfitModel._();

  const factory GroupedProfitModel({
    required String productName,
    required String priceType,
    required String profitPerUnit,
    required String totalQuantity,
    required String totalProfit,
    required int orderCount,
  }) = _GroupedProfitModel;

  factory GroupedProfitModel.fromJson(Map<String, dynamic> json) =>
      _$GroupedProfitModelFromJson(json);

  GroupedProfit toEntity() => GroupedProfit(
        productName: productName,
        priceType: priceType,
        profitPerUnit: double.parse(profitPerUnit),
        totalQuantity: double.parse(totalQuantity),
        totalProfit: double.parse(totalProfit),
        orderCount: orderCount,
      );
}

/// Model for payment totals from API.
@freezed
class ProfitPaymentTotalsModel with _$ProfitPaymentTotalsModel {
  const ProfitPaymentTotalsModel._();

  const factory ProfitPaymentTotalsModel({
    required String cash,
    @JsonKey(name: 'check') required String checkAmount,
    required String bankTransfer,
  }) = _ProfitPaymentTotalsModel;

  factory ProfitPaymentTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitPaymentTotalsModelFromJson(json);

  ProfitPaymentTotals toEntity() => ProfitPaymentTotals(
        cash: double.parse(cash),
        check: double.parse(checkAmount),
        bankTransfer: double.parse(bankTransfer),
      );
}

/// Model for total profit summary from API.
@freezed
class ProfitSummaryModel with _$ProfitSummaryModel {
  const ProfitSummaryModel._();

  const factory ProfitSummaryModel({
    required String totalQuantity,
    required String totalProfit,
    required ProfitPaymentTotalsModel paymentTotals,
    required int transactionCount,
  }) = _ProfitSummaryModel;

  factory ProfitSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitSummaryModelFromJson(json);

  ProfitSummary toEntity() => ProfitSummary(
        totalQuantity: double.parse(totalQuantity),
        totalProfit: double.parse(totalProfit),
        paymentTotals: paymentTotals.toEntity(),
        transactionCount: transactionCount,
      );
}
