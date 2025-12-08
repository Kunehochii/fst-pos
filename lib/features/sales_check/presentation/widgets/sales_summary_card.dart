import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/grouped_sale.dart';
import '../../domain/entities/sales_summary.dart';

/// Card widget displaying sales summary totals.
class SalesSummaryCard extends StatelessWidget {
  final SalesSummary summary;
  final bool isOfflineData;

  const SalesSummaryCard({
    super.key,
    required this.summary,
    this.isOfflineData = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Card(
      margin: const EdgeInsets.all(8),
      color: isOfflineData
          ? theme.colorScheme.errorContainer.withOpacity(0.3)
          : theme.colorScheme.primaryContainer.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with offline warning
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sales Summary',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isOfflineData)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cloud_off,
                          size: 14,
                          color: theme.colorScheme.onError,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Offline',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onError,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            if (isOfflineData) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: theme.colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Showing locally cached sales only. Connect to internet for latest data.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Total amount - big number
            Center(
              child: Column(
                children: [
                  Text(
                    currencyFormat.format(summary.totalAmount),
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Total Sales',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 24),

            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  'Transactions',
                  summary.transactionCount.toString(),
                  Icons.receipt_long,
                ),
                _buildStatItem(
                  context,
                  'Quantity',
                  _formatQuantity(summary.totalQuantity),
                  Icons.inventory,
                ),
                _buildStatItem(
                  context,
                  'Average',
                  currencyFormat.format(summary.averageTransaction),
                  Icons.analytics,
                ),
              ],
            ),

            const Divider(height: 24),

            // Payment breakdown
            Text(
              'Payment Breakdown',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            _buildPaymentRow(
              context,
              'Cash',
              summary.paymentTotals.cash,
              Icons.money,
              Colors.green,
            ),
            _buildPaymentRow(
              context,
              'Check',
              summary.paymentTotals.check,
              Icons.fact_check,
              Colors.blue,
            ),
            _buildPaymentRow(
              context,
              'Bank Transfer',
              summary.paymentTotals.bankTransfer,
              Icons.account_balance,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, size: 24, color: theme.colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentRow(
    BuildContext context,
    String label,
    double amount,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(label)),
          Text(
            currencyFormat.format(amount),
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
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2);
  }
}
