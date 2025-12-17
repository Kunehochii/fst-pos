import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/grouped_profit.dart';
import '../../domain/entities/profit_summary.dart';

/// Card widget displaying profit summary totals.
class ProfitSummaryCard extends StatelessWidget {
  final ProfitSummary summary;
  final bool isOfflineData;

  const ProfitSummaryCard({
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
                  'Profit Summary',
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

            // Total profit - big number
            Center(
              child: Column(
                children: [
                  Text(
                    currencyFormat.format(summary.totalProfit),
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  Text(
                    'Total Profit',
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
                  'Avg Profit',
                  currencyFormat.format(summary.averageProfit),
                  Icons.analytics,
                ),
              ],
            ),

            // Payment breakdown if there's data
            if (summary.paymentTotals.total > 0) ...[
              const Divider(height: 24),
              Text(
                'Profit by Payment Method',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              _buildPaymentBreakdown(context, currencyFormat),
            ],
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
        Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 24,
        ),
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

  Widget _buildPaymentBreakdown(
    BuildContext context,
    NumberFormat currencyFormat,
  ) {
    final theme = Theme.of(context);
    final paymentTotals = summary.paymentTotals;

    return Row(
      children: [
        if (paymentTotals.hasCash)
          Expanded(
            child: _buildPaymentItem(
              theme,
              'Cash',
              currencyFormat.format(paymentTotals.cash),
              Icons.payments,
              Colors.green,
            ),
          ),
        if (paymentTotals.hasCheck)
          Expanded(
            child: _buildPaymentItem(
              theme,
              'Check',
              currencyFormat.format(paymentTotals.check),
              Icons.money,
              Colors.blue,
            ),
          ),
        if (paymentTotals.hasBankTransfer)
          Expanded(
            child: _buildPaymentItem(
              theme,
              'Bank',
              currencyFormat.format(paymentTotals.bankTransfer),
              Icons.account_balance,
              Colors.purple,
            ),
          ),
      ],
    );
  }

  Widget _buildPaymentItem(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  String _formatQuantity(double quantity) {
    if (quantity == quantity.toInt()) {
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2);
  }
}
