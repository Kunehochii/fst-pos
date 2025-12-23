import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/repositories/profit_repository_impl.dart';
import '../../domain/entities/grouped_profit.dart';

/// Widget for displaying grouped profits in a table format with numbered rows.
///
/// Follows the "Aura Daybreak" design with:
/// - Clean white cards with subtle borders
/// - Table layout with visible borders for better UX
/// - Numbered rows for easy reference
class GroupedProfitsList extends StatelessWidget {
  final List<GroupedProfit> groupedProfits;
  final ProfitViewType viewType;

  const GroupedProfitsList({
    super.key,
    required this.groupedProfits,
    required this.viewType,
  });

  @override
  Widget build(BuildContext context) {
    if (groupedProfits.isEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppColors.radiusLg),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.muted,
                  borderRadius: BorderRadius.circular(AppColors.radiusMd),
                ),
                child: Icon(
                  Icons.trending_up_outlined,
                  size: 48,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'No profits found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Try adjusting your filters',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedForeground,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // For grouped by product view, use nested list
    if (viewType == ProfitViewType.normalGrouped) {
      return _buildGroupedByProductView(context);
    }

    // For other views, use table view
    return _buildTableView(context);
  }

  Widget _buildTableView(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Table header
              Container(
                decoration: BoxDecoration(
                  color: AppColors.muted,
                  border: Border(
                    bottom: BorderSide(color: AppColors.border, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    _buildHeaderCell('#',
                        width: 50, alignment: Alignment.center),
                    _buildHeaderCell('Product', flex: 3),
                    _buildHeaderCell('Orders', alignment: Alignment.center),
                    _buildHeaderCell('Qty', alignment: Alignment.center),
                    _buildHeaderCell('Per Unit',
                        flex: 2, alignment: Alignment.centerRight),
                    _buildHeaderCell('Total',
                        flex: 2, alignment: Alignment.centerRight),
                  ],
                ),
              ),
              // Table rows
              ...List.generate(groupedProfits.length, (index) {
                final profit = groupedProfits[index];
                final isLast = index == groupedProfits.length - 1;

                return Container(
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? AppColors.card
                        : AppColors.muted.withValues(alpha: 0.5),
                    border: isLast
                        ? null
                        : Border(
                            bottom:
                                BorderSide(color: AppColors.border, width: 1),
                          ),
                  ),
                  child: Row(
                    children: [
                      _buildDataCell(
                        '${index + 1}',
                        width: 50,
                        alignment: Alignment.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      _buildDataCell(
                        profit.displayName,
                        flex: 3,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.foreground,
                        ),
                      ),
                      _buildDataCell(
                        profit.orderCount.toString(),
                        alignment: Alignment.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.foreground,
                        ),
                      ),
                      _buildDataCell(
                        _formatQuantity(profit.totalQuantity),
                        alignment: Alignment.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.foreground,
                        ),
                      ),
                      _buildDataCell(
                        currencyFormat.format(profit.profitPerUnit),
                        flex: 2,
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      _buildDataCell(
                        currencyFormat.format(profit.totalProfit),
                        flex: 2,
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(
    String text, {
    int flex = 1,
    double? width,
    Alignment alignment = Alignment.centerLeft,
  }) {
    final cell = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
              color: AppColors.border.withValues(alpha: 0.5), width: 1),
        ),
      ),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.mutedForeground,
          letterSpacing: 0.5,
        ),
      ),
    );

    if (width != null) {
      return SizedBox(width: width, child: cell);
    }
    return Expanded(flex: flex, child: cell);
  }

  Widget _buildDataCell(
    String text, {
    int flex = 1,
    double? width,
    Alignment alignment = Alignment.centerLeft,
    TextStyle? style,
  }) {
    final cell = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
              color: AppColors.border.withValues(alpha: 0.3), width: 1),
        ),
      ),
      alignment: alignment,
      child: Text(
        text,
        style: style ??
            TextStyle(
              fontSize: 13,
              color: AppColors.foreground,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );

    if (width != null) {
      return SizedBox(width: width, child: cell);
    }
    return Expanded(flex: flex, child: cell);
  }

  Widget _buildGroupedByProductView(BuildContext context) {
    // Group by base product name
    final grouped = groupedProfits.groupByProductBaseName();
    final productNames = grouped.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      itemCount: productNames.length,
      itemBuilder: (context, index) {
        final productName = productNames[index];
        final variants = grouped[productName]!;

        return _ProductGroupSection(
          index: index + 1,
          productName: productName,
          variants: variants,
        );
      },
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.toInt()) {
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2);
  }
}

/// Section widget for a product with its variants.
class _ProductGroupSection extends StatelessWidget {
  final int index;
  final String productName;
  final List<GroupedProfit> variants;

  const _ProductGroupSection({
    required this.index,
    required this.productName,
    required this.variants,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    // Calculate totals for this product group
    final totalProfit = variants.fold<double>(
      0,
      (sum, v) => sum + v.totalProfit,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            backgroundColor: AppColors.card,
            collapsedBackgroundColor: AppColors.card,
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            title: Text(
              productName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  '${variants.length} variants',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.mutedForeground,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  currencyFormat.format(totalProfit),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.border, width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    // Variants table header
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.muted,
                        border: Border(
                          bottom: BorderSide(color: AppColors.border, width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 32,
                            child: Text(
                              '#',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Type',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Orders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Qty',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Profit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Variant rows
                    ...List.generate(variants.length, (variantIndex) {
                      final variant = variants[variantIndex];
                      final isLast = variantIndex == variants.length - 1;

                      return Container(
                        decoration: BoxDecoration(
                          color: variantIndex.isEven
                              ? AppColors.card
                              : AppColors.muted.withValues(alpha: 0.3),
                          border: isLast
                              ? null
                              : Border(
                                  bottom: BorderSide(
                                    color:
                                        AppColors.border.withValues(alpha: 0.5),
                                    width: 1,
                                  ),
                                ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 32,
                              child: Text(
                                '${variantIndex + 1}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                variant.priceType.isEmpty
                                    ? 'Standard'
                                    : variant.priceType,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                variant.orderCount.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _formatQuantity(variant.totalQuantity),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    currencyFormat.format(variant.totalProfit),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.success,
                                    ),
                                  ),
                                  Text(
                                    '${currencyFormat.format(variant.profitPerUnit)}/unit',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.toInt()) {
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2);
  }
}
