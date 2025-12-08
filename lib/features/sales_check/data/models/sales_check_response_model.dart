import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/grouped_sale.dart';
import '../../domain/entities/sales_summary.dart';
import '../../../sales/domain/entities/payment_method.dart';

part 'sales_check_response_model.freezed.dart';
part 'sales_check_response_model.g.dart';

/// Model for a grouped sale item from API.
@freezed
class GroupedSaleItemModel with _$GroupedSaleItemModel {
  const GroupedSaleItemModel._();

  const factory GroupedSaleItemModel({
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    required String paymentMethod,
    required bool isSpecialPrice,
    required bool isDiscounted,
    String? discountedPrice,
    required DateTime saleDate,
    required String formattedSale,
  }) = _GroupedSaleItemModel;

  factory GroupedSaleItemModel.fromJson(Map<String, dynamic> json) =>
      _$GroupedSaleItemModelFromJson(json);

  GroupedSaleItem toEntity() => GroupedSaleItem(
        quantity: double.parse(quantity),
        unitPrice: double.parse(unitPrice),
        totalAmount: double.parse(totalAmount),
        paymentMethod: PaymentMethod.fromString(paymentMethod),
        isSpecialPrice: isSpecialPrice,
        isDiscounted: isDiscounted,
        discountedPrice:
            discountedPrice != null ? double.parse(discountedPrice!) : null,
        saleDate: saleDate,
        formattedSale: formattedSale,
      );
}

/// Model for payment totals from API.
@freezed
class PaymentTotalsModel with _$PaymentTotalsModel {
  const PaymentTotalsModel._();

  const factory PaymentTotalsModel({
    required String cash,
    @JsonKey(name: 'check') required String checkAmount,
    required String bankTransfer,
  }) = _PaymentTotalsModel;

  factory PaymentTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentTotalsModelFromJson(json);

  PaymentTotals toEntity() => PaymentTotals(
        cash: double.parse(cash),
        check: double.parse(checkAmount),
        bankTransfer: double.parse(bankTransfer),
      );
}

/// Model for a grouped sale from API.
@freezed
class GroupedSaleModel with _$GroupedSaleModel {
  const GroupedSaleModel._();

  const factory GroupedSaleModel({
    required String productName,
    required List<GroupedSaleItemModel> items,
    required String totalQuantity,
    required String totalAmount,
    required PaymentTotalsModel paymentTotals,
  }) = _GroupedSaleModel;

  factory GroupedSaleModel.fromJson(Map<String, dynamic> json) =>
      _$GroupedSaleModelFromJson(json);

  GroupedSale toEntity() => GroupedSale(
        productName: productName,
        items: items.map((item) => item.toEntity()).toList(),
        totalQuantity: double.parse(totalQuantity),
        totalAmount: double.parse(totalAmount),
        paymentTotals: paymentTotals.toEntity(),
      );
}

/// Model for total sales summary from API.
@freezed
class SalesSummaryModel with _$SalesSummaryModel {
  const SalesSummaryModel._();

  const factory SalesSummaryModel({
    required String totalQuantity,
    required String totalAmount,
    required PaymentTotalsModel paymentTotals,
    required int transactionCount,
  }) = _SalesSummaryModel;

  factory SalesSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SalesSummaryModelFromJson(json);

  SalesSummary toEntity() => SalesSummary(
        totalQuantity: double.parse(totalQuantity),
        totalAmount: double.parse(totalAmount),
        paymentTotals: paymentTotals.toEntity(),
        transactionCount: transactionCount,
      );
}
