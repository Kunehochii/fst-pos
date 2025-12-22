import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/profit_summary.dart';

/// Card widget displaying profit summary totals.
///
/// Follows the "Aura Daybreak" design with:
/// - Pure white card with subtle border and shadow
/// - Emerald green for profit values
/// - Clean section separators
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
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with offline warning
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                      ),
                      child: Icon(
                        Icons.analytics_outlined,
                        size: 20,
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Profit Summary',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                  ],
                ),
                if (isOfflineData)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.warning.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cloud_off,
                          size: 14,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Offline',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            if (isOfflineData) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.warning,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Showing locally cached sales only. Connect to internet for latest data.',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.foreground.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Total profit - big number
            Center(
              child: Column(
                children: [
                  Text(
                    currencyFormat.format(summary.totalProfit),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total Profit',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Divider
            Container(
              height: 1,
              color: AppColors.border,
            ),

            const SizedBox(height: 20),

            // Stats row with table-like borders
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatItem(
                      'Transactions',
                      summary.transactionCount.toString(),
                      Icons.receipt_long_outlined,
                    ),
                  ),
                  Container(width: 1, height: 70, color: AppColors.border),
                  Expanded(
                    child: _buildStatItem(
                      'Quantity',
                      _formatQuantity(summary.totalQuantity),
                      Icons.inventory_2_outlined,
                    ),
                  ),
                  Container(width: 1, height: 70, color: AppColors.border),
                  Expanded(
                    child: _buildStatItem(
                      'Avg Profit',
                      currencyFormat.format(summary.averageProfit),
                      Icons.trending_up_outlined,
                    ),
                  ),
                ],
              ),
            ),

            // Payment breakdown if there's data
            if (summary.paymentTotals.total > 0) ...[
              const SizedBox(height: 20),
              Text(
                'Profit by Payment Method',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 12),
              _buildPaymentBreakdown(currencyFormat),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 22,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentBreakdown(NumberFormat currencyFormat) {
    final paymentTotals = summary.paymentTotals;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
      ),
      child: Row(
        children: [
          if (paymentTotals.hasCash)
            Expanded(
              child: _buildPaymentItem(
                'Cash',
                currencyFormat.format(paymentTotals.cash),
                Icons.payments_outlined,
                AppColors.success,
              ),
            ),
          if (paymentTotals.hasCash &&
              (paymentTotals.hasCheck || paymentTotals.hasBankTransfer))
            Container(width: 1, height: 60, color: AppColors.border),
          if (paymentTotals.hasCheck)
            Expanded(
              child: _buildPaymentItem(
                'Check',
                currencyFormat.format(paymentTotals.check),
                Icons.money_outlined,
                AppColors.info,
              ),
            ),
          if (paymentTotals.hasCheck && paymentTotals.hasBankTransfer)
            Container(width: 1, height: 60, color: AppColors.border),
          if (paymentTotals.hasBankTransfer)
            Expanded(
              child: _buildPaymentItem(
                'Bank',
                currencyFormat.format(paymentTotals.bankTransfer),
                Icons.account_balance_outlined,
                AppColors.chart5,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: AppColors.mutedForeground,
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
