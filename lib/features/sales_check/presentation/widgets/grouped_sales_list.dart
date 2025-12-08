import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No sales found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try adjusting your filters',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    // For grouped by product view, use nested list
    if (viewType == SalesCheckViewType.normalGrouped) {
      return _buildGroupedByProductView(context);
    }

    // For other views, use simple list
    return _buildSimpleListView(context);
  }

  Widget _buildSimpleListView(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: groupedSales.length,
      itemBuilder: (context, index) {
        return GroupedSaleCard(sale: groupedSales[index]);
      },
    );
  }

  Widget _buildGroupedByProductView(BuildContext context) {
    // Group by base product name
    final grouped = _groupByBaseName(groupedSales);
    final productNames = grouped.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: productNames.length,
      itemBuilder: (context, index) {
        final productName = productNames[index];
        final variants = grouped[productName]!;

        return _ProductGroupSection(
          productName: productName,
          variants: variants,
        );
      },
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
}

/// Section widget for a product with its variants.
class _ProductGroupSection extends StatelessWidget {
  final String productName;
  final List<GroupedSale> variants;

  const _ProductGroupSection({
    required this.productName,
    required this.variants,
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

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          productName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${variants.length} variants • ${currencyFormat.format(totalAmount)}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        children: variants.map((variant) {
          return _VariantTile(sale: variant);
        }).toList(),
      ),
    );
  }
}

/// Tile widget for a single variant within a product group.
class _VariantTile extends StatelessWidget {
  final GroupedSale sale;

  const _VariantTile({required this.sale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    // Extract variant name (the suffix)
    final variantName = _extractVariantName(sale.productName);

    return ListTile(
      dense: true,
      title: Text(variantName),
      subtitle: Text('${sale.transactionCount} transactions'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            currencyFormat.format(sale.totalAmount),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            _formatQuantity(sale.totalQuantity),
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
      onTap: () => _showSaleDetails(context),
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
    return '${quantity.toStringAsFixed(2)} units';
  }

  void _showSaleDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
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
}

/// Card widget for displaying a single grouped sale.
class GroupedSaleCard extends StatelessWidget {
  final GroupedSale sale;

  const GroupedSaleCard({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          sale.productName,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '${sale.transactionCount} transactions',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(width: 8),
            Text(
              '•',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(width: 8),
            Text(
              _formatQuantity(sale.totalQuantity),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Text(
          currencyFormat.format(sale.totalAmount),
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Payment breakdown
                _buildPaymentBreakdown(context, sale.paymentTotals),
                const Divider(),
                // Recent items
                Text(
                  'Recent Sales (${sale.items.length})',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                ...sale.items
                    .take(5)
                    .map((item) => _buildItemRow(context, item)),
                if (sale.items.length > 5)
                  TextButton(
                    onPressed: () => _showAllItems(context),
                    child: Text('View all ${sale.items.length} items'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentBreakdown(BuildContext context, PaymentTotals totals) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (totals.hasCash)
          _buildPaymentChip(
            context,
            'Cash',
            currencyFormat.format(totals.cash),
            Colors.green,
          ),
        if (totals.hasCheck)
          _buildPaymentChip(
            context,
            'Check',
            currencyFormat.format(totals.check),
            Colors.blue,
          ),
        if (totals.hasBankTransfer)
          _buildPaymentChip(
            context,
            'Bank',
            currencyFormat.format(totals.bankTransfer),
            Colors.orange,
          ),
      ],
    );
  }

  Widget _buildPaymentChip(
    BuildContext context,
    String label,
    String amount,
    Color color,
  ) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: color,
        radius: 10,
        child: Icon(
          label == 'Cash'
              ? Icons.money
              : label == 'Check'
                  ? Icons.fact_check
                  : Icons.account_balance,
          size: 12,
          color: Colors.white,
        ),
      ),
      label: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 10)),
          Text(amount,
              style:
                  const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, GroupedSaleItem item) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM d, HH:mm');
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateFormat.format(item.saleDate.toLocal()),
                  style: theme.textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Text(
                      _formatItemQuantity(item.quantity),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (item.isSpecialPrice) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'SP',
                          style: TextStyle(fontSize: 9, color: Colors.purple),
                        ),
                      ),
                    ],
                    if (item.isDiscounted) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'D',
                          style: TextStyle(fontSize: 9, color: Colors.red),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Text(
            currencyFormat.format(item.totalAmount),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} total';
    }
    return '${quantity.toStringAsFixed(2)} total';
  }

  String _formatItemQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} units';
    }
    return '${quantity.toStringAsFixed(2)} kg';
  }

  void _showAllItems(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
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
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.productName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${sale.items.length} transactions'),
                    Text(
                      currencyFormat.format(sale.totalAmount),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Items list
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: sale.items.length,
              separatorBuilder: (_, __) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final item = sale.items[index];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateFormat.format(item.saleDate.toLocal()),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(item.formattedSale),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 4,
                            children: [
                              _buildMethodChip(item.paymentMethod.displayName),
                              if (item.isSpecialPrice)
                                _buildTagChip('Special Price', Colors.purple),
                              if (item.isDiscounted)
                                _buildTagChip('Discounted', Colors.red),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currencyFormat.format(item.totalAmount),
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@ ${currencyFormat.format(item.unitPrice)}',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _buildTagChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, color: color),
      ),
    );
  }
}
