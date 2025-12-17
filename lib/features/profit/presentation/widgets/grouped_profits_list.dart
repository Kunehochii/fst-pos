import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/profit_repository_impl.dart';
import '../../domain/entities/grouped_profit.dart';

/// Widget for displaying grouped profits in a list format.
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
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.trending_up, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No profits found',
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
    if (viewType == ProfitViewType.normalGrouped) {
      return _buildGroupedByProductView(context);
    }

    // For other views, use simple list
    return _buildSimpleListView(context);
  }

  Widget _buildSimpleListView(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: groupedProfits.length,
      itemBuilder: (context, index) {
        return GroupedProfitCard(profit: groupedProfits[index]);
      },
    );
  }

  Widget _buildGroupedByProductView(BuildContext context) {
    // Group by base product name
    final grouped = groupedProfits.groupByProductBaseName();
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
}

/// Section widget for a product with its variants.
class _ProductGroupSection extends StatelessWidget {
  final String productName;
  final List<GroupedProfit> variants;

  const _ProductGroupSection({
    required this.productName,
    required this.variants,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    // Calculate totals for this product group
    final totalProfit = variants.fold<double>(
      0,
      (sum, v) => sum + v.totalProfit,
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
          '${variants.length} variants • ${currencyFormat.format(totalProfit)}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.green.shade700,
          ),
        ),
        children: variants.map((variant) {
          return _VariantTile(profit: variant);
        }).toList(),
      ),
    );
  }
}

/// Tile widget for a single variant within a product group.
class _VariantTile extends StatelessWidget {
  final GroupedProfit profit;

  const _VariantTile({required this.profit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return ListTile(
      dense: true,
      title: Text(profit.priceType.isEmpty ? 'Standard' : profit.priceType),
      subtitle: Text(
          '${profit.orderCount} orders • Qty: ${_formatQuantity(profit.totalQuantity)}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            currencyFormat.format(profit.totalProfit),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.green.shade700,
            ),
          ),
          Text(
            '${currencyFormat.format(profit.profitPerUnit)}/unit',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
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

/// Card widget for a single grouped profit entry.
class GroupedProfitCard extends StatelessWidget {
  final GroupedProfit profit;

  const GroupedProfitCard({super.key, required this.profit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(
            Icons.trending_up,
            color: Colors.green.shade700,
          ),
        ),
        title: Text(
          profit.displayName,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '${profit.orderCount} orders • Qty: ${_formatQuantity(profit.totalQuantity)}',
          style: theme.textTheme.bodySmall,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currencyFormat.format(profit.totalProfit),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            Text(
              '${currencyFormat.format(profit.profitPerUnit)}/unit',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
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
