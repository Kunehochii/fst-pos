// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/grouped_sale.dart';

/// Widget for displaying grouped sales in a list format.
class GroupedSalesList extends StatelessWidget {
  final List<GroupedSale> groupedSales;
  final SalesCheckViewType viewType;

  const GroupedSalesList({
    super.key,
    required this.groupedSales,
    required this.viewType,
  });

  @override
  Widget build(BuildContext context) {
    if (groupedSales.isEmpty) {
      return Center(
        child: AppCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.muted,
                  borderRadius: BorderRadius.circular(AppColors.radiusLg),
                ),
                child: const Icon(
                  Icons.receipt_long_outlined,
                  size: 48,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'No sales found',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Try adjusting your filters',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.mutedForeground,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    // For grouped by product view, use nested list
    if (viewType == SalesCheckViewType.normalGrouped) {
      return _buildGroupedByProductView(context);
    }

    // For other views, use table view with numbered rows
    return _buildTableView(context);
  }

  Widget _buildTableView(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return AppCard(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Table Header
          Container(
            decoration: const BoxDecoration(
              color: AppColors.muted,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppColors.radiusLg),
                topRight: Radius.circular(AppColors.radiusLg),
              ),
            ),
            child: Row(
              children: [
                _buildTableHeaderCell('#',
                    flex: 1, alignment: Alignment.center),
                _buildTableHeaderCell('Product', flex: 4),
                _buildTableHeaderCell('Qty',
                    flex: 2, alignment: Alignment.centerRight),
                _buildTableHeaderCell('Txns',
                    flex: 1, alignment: Alignment.center),
                _buildTableHeaderCell('Amount',
                    flex: 3, alignment: Alignment.centerRight),
              ],
            ),
          ),
          // Table Body
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: groupedSales.length,
              itemBuilder: (context, index) {
                final sale = groupedSales[index];
                final isLast = index == groupedSales.length - 1;
                final rowNumber = index + 1;

                return InkWell(
                  onTap: () => _showSaleDetailsSheet(context, sale),
                  child: Container(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColors.card
                          : AppColors.muted.withOpacity(0.5),
                      border: isLast
                          ? null
                          : const Border(
                              bottom: BorderSide(color: AppColors.border),
                            ),
                    ),
                    child: Row(
                      children: [
                        _buildTableCell(
                          rowNumber.toString(),
                          flex: 1,
                          alignment: Alignment.center,
                          isRowNumber: true,
                        ),
                        _buildTableCell(
                          sale.productName,
                          flex: 4,
                          isBold: true,
                        ),
                        _buildTableCell(
                          _formatQuantity(sale.totalQuantity),
                          flex: 2,
                          alignment: Alignment.centerRight,
                        ),
                        _buildTableCell(
                          sale.transactionCount.toString(),
                          flex: 1,
                          alignment: Alignment.center,
                        ),
                        _buildTableCell(
                          currencyFormat.format(sale.totalAmount),
                          flex: 3,
                          alignment: Alignment.centerRight,
                          isPrimary: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeaderCell(
    String text, {
    required int flex,
    Alignment alignment = Alignment.centerLeft,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: AppColors.border),
          ),
        ),
        alignment: alignment,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColors.mutedForeground,
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(
    String text, {
    required int flex,
    Alignment alignment = Alignment.centerLeft,
    bool isBold = false,
    bool isPrimary = false,
    bool isRowNumber = false,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: AppColors.border),
          ),
        ),
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            fontWeight:
                isBold || isPrimary ? FontWeight.w600 : FontWeight.normal,
            fontSize: isRowNumber ? 12 : 13,
            color: isRowNumber
                ? AppColors.mutedForeground
                : isPrimary
                    ? AppColors.primary
                    : AppColors.foreground,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void _showSaleDetailsSheet(BuildContext context, GroupedSale sale) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return GroupedSaleDetailSheet(
            sale: sale,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  Widget _buildGroupedByProductView(BuildContext context) {
    // Group by base product name
    final grouped = _groupByBaseName(groupedSales);
    final productNames = grouped.keys.toList();

    return AppCard(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: EdgeInsets.zero,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: productNames.length,
        itemBuilder: (context, index) {
          final productName = productNames[index];
          final variants = grouped[productName]!;
          final isLast = index == productNames.length - 1;

          return _ProductGroupSection(
            index: index + 1,
            productName: productName,
            variants: variants,
            isLast: isLast,
          );
        },
      ),
    );
  }

  Map<String, List<GroupedSale>> _groupByBaseName(List<GroupedSale> sales) {
    final grouped = <String, List<GroupedSale>>{};

    for (final sale in sales) {
      final baseName = _extractBaseName(sale.productName);
      grouped.putIfAbsent(baseName, () => []);
      grouped[baseName]!.add(sale);
    }

    // Sort variants within each group
    for (final group in grouped.values) {
      group.sort((a, b) => _variantSortOrder(a.productName)
          .compareTo(_variantSortOrder(b.productName)));
    }

    return grouped;
  }

  String _extractBaseName(String productName) {
    final suffixes = [
      ' 50 KG',
      ' 25 KG',
      ' 5 KG',
      ' Per Kilo',
      ' Per Kilo (Gantang)',
    ];

    var baseName = productName;
    for (final suffix in suffixes) {
      if (baseName.endsWith(suffix)) {
        baseName = baseName.substring(0, baseName.length - suffix.length);
        break;
      }
    }

    return baseName;
  }

  int _variantSortOrder(String productName) {
    if (productName.contains('50 KG')) return 0;
    if (productName.contains('25 KG')) return 1;
    if (productName.contains('5 KG')) return 2;
    if (productName.contains('Per Kilo (Gantang)')) return 4;
    if (productName.contains('Per Kilo')) return 3;
    return 5;
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} units';
    }
    return '${quantity.toStringAsFixed(2)} units';
  }
}

/// Section widget for a product with its variants.
class _ProductGroupSection extends StatelessWidget {
  final int index;
  final String productName;
  final List<GroupedSale> variants;
  final bool isLast;

  const _ProductGroupSection({
    required this.index,
    required this.productName,
    required this.variants,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    // Calculate totals for this product group
    final totalAmount = variants.fold<double>(
      0,
      (sum, v) => sum + v.totalAmount,
    );
    final totalQuantity = variants.fold<double>(
      0,
      (sum, v) => sum + v.totalQuantity,
    );

    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: AppColors.border),
              ),
      ),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: EdgeInsets.zero,
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
          ),
          title: Text(
            productName,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          subtitle: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.muted,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  '${variants.length} variants',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.mutedForeground,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _formatQuantity(totalQuantity),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          trailing: Text(
            currencyFormat.format(totalAmount),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          children: [
            // Variants table header
            Container(
              color: AppColors.muted,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: 40), // Indent for alignment
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Variant',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'Qty',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mutedForeground,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Txns',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mutedForeground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mutedForeground,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            // Variant rows
            ...variants.asMap().entries.map((entry) {
              final variantIndex = entry.key;
              final variant = entry.value;
              return _VariantTableRow(
                rowNumber: variantIndex + 1,
                sale: variant,
                isLast: variantIndex == variants.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} units';
    }
    return '${quantity.toStringAsFixed(2)} units';
  }

  String _formatItemQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} units';
    }
    return '${quantity.toStringAsFixed(2)} kg';
  }
}

/// A table row displaying a variant's details.
class _VariantTableRow extends StatelessWidget {
  final int rowNumber;
  final GroupedSale sale;
  final bool isLast;

  const _VariantTableRow({
    required this.rowNumber,
    required this.sale,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: AppColors.border, width: 0.5),
              ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.border),
              ),
              alignment: Alignment.center,
              child: Text(
                rowNumber.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedForeground,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              _extractVariantName(sale.productName),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.foreground,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              _formatQuantity(sale.totalQuantity),
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.mutedForeground,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              sale.transactionCount.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              currencyFormat.format(sale.totalAmount),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  String _extractVariantName(String productName) {
    final suffixes = [
      '50 KG',
      '25 KG',
      '5 KG',
      'Per Kilo (Gantang)',
      'Per Kilo',
    ];

    for (final suffix in suffixes) {
      if (productName.contains(suffix)) {
        return suffix;
      }
    }

    return productName;
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} units';
    }
    return '${quantity.toStringAsFixed(2)} kg';
  }
}

/// Bottom sheet showing all items in a grouped sale.
class GroupedSaleDetailSheet extends StatelessWidget {
  final GroupedSale sale;
  final ScrollController scrollController;

  const GroupedSaleDetailSheet({
    super.key,
    required this.sale,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);
    final dateFormat = DateFormat('MMM d, yyyy HH:mm');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppColors.radiusXl),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                      ),
                      child: const Icon(
                        Icons.receipt_long,
                        size: 20,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        sale.productName,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    border:
                        Border.all(color: AppColors.primary.withOpacity(0.2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${sale.items.length} transactions',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.foreground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatQuantity(sale.totalQuantity),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.mutedForeground,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        currencyFormat.format(sale.totalAmount),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Table header
          Container(
            color: AppColors.muted,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                const SizedBox(
                  width: 36,
                  child: Text(
                    '#',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Date / Details',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedForeground,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          // Items list
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              itemCount: sale.items.length,
              itemBuilder: (context, index) {
                final item = sale.items[index];
                final rowNumber = index + 1;
                final isLast = index == sale.items.length - 1;

                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: rowNumber.isEven
                        ? AppColors.muted.withOpacity(0.3)
                        : AppColors.card,
                    border: isLast
                        ? null
                        : const Border(
                            bottom: BorderSide(color: AppColors.border),
                          ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row number
                      SizedBox(
                        width: 36,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: AppColors.muted,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.border),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            rowNumber.toString(),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mutedForeground,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateFormat.format(item.saleDate.toLocal()),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.mutedForeground,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.formattedSale,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.foreground,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 4,
                              children: [
                                _buildMethodChip(
                                    item.paymentMethod.displayName),
                                if (item.isSpecialPrice)
                                  _buildTagChip('Special Price', Colors.purple),
                                if (item.isDiscounted)
                                  _buildTagChip(
                                      'Discounted', AppColors.destructive),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              currencyFormat.format(item.totalAmount),
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '@ ${currencyFormat.format(item.unitPrice)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} units sold';
    }
    return '${quantity.toStringAsFixed(2)} units sold';
  }

  Widget _buildMethodChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.muted,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.foreground,
        ),
      ),
    );
  }

  Widget _buildTagChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
