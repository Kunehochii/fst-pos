import 'package:flutter/material.dart';

import '../../domain/entities/bill_count.dart';

/// Widget for displaying bill count summary.
class BillCountSummaryCard extends StatelessWidget {
  final BillCount billCount;

  const BillCountSummaryCard({
    super.key,
    required this.billCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.receipt_long,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Bill Count Summary',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (!billCount.isSynced)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.sync_problem,
                          size: 14,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Pending Sync',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Colors.orange,
                                  ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),

            // Bills Breakdown
            ...BillType.values.map((type) => _buildBillRow(context, type)),

            const Divider(),
            const SizedBox(height: 8),

            // Bills Total
            _buildSummaryRow(
              context,
              'Bills Total',
              billCount.billsTotalDisplay,
              isBold: true,
              color: Theme.of(context).colorScheme.primary,
            ),

            // Beginning Balance (if shown)
            if (billCount.showBeginningBalance) ...[
              const SizedBox(height: 4),
              _buildSummaryRow(
                context,
                'Beginning Balance',
                '- ${billCount.beginningBalanceDisplay}',
                color: Theme.of(context).colorScheme.error,
              ),
            ],

            const Divider(),
            const SizedBox(height: 8),

            // Step 1: Bills - Beginning Balance
            _buildSummaryRow(
              context,
              'Subtotal (Bills${billCount.showBeginningBalance ? ' - Beginning' : ''})',
              billCount.summaryStep1Display,
            ),

            const SizedBox(height: 4),

            // Total Expenses
            _buildSummaryRow(
              context,
              'Total Expenses',
              '+ ${billCount.totalExpensesDisplay}',
              color: Theme.of(context).colorScheme.error,
            ),

            const Divider(),
            const SizedBox(height: 8),

            // Final Total
            _buildSummaryRow(
              context,
              'Final Total',
              billCount.summaryFinalDisplay,
              isBold: true,
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),

            // Comparison Section
            Text(
              'Comparison with Sales',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),

            _buildSummaryRow(
              context,
              'Net Cash (Sales - Expenses)',
              billCount.netCashDisplay,
            ),

            const SizedBox(height: 4),

            _buildSummaryRow(
              context,
              'Difference',
              billCount.differenceDisplay,
              isBold: true,
              color: billCount.difference >= 0 ? Colors.green : Colors.red,
            ),

            if (billCount.difference.abs() > 0.01) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (billCount.difference >= 0 ? Colors.green : Colors.red)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      billCount.difference >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      size: 16,
                      color:
                          billCount.difference >= 0 ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        billCount.difference >= 0
                            ? 'Over by ${billCount.differenceDisplay}'
                            : 'Short by ₱${billCount.difference.abs().toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: billCount.difference >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBillRow(BuildContext context, BillType type) {
    final amount = billCount.getAmountForType(type);
    final totalValue = type.value * amount;

    if (amount == 0) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              type.displayName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: type == BillType.peso1
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                  ),
            ),
          ),
          Text(
            'x $amount',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          const Spacer(),
          Text(
            '₱${totalValue.toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
    Color? color,
    double? fontSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : null,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                color: color,
                fontSize: fontSize,
              ),
        ),
      ],
    );
  }
}
