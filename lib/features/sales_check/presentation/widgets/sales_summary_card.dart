import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_card.dart';
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

    return AppCard(
      margin: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isOfflineData
                          ? AppColors.warning.withOpacity(0.1)
                          : AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    ),
                    child: Icon(
                      isOfflineData
                          ? Icons.analytics_outlined
                          : Icons.analytics,
                      size: 20,
                      color:
                          isOfflineData ? AppColors.warning : AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Sales Summary',
                    style: theme.textTheme.titleMedium?.copyWith(
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
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.warning.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.cloud_off,
                        size: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Offline',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          if (isOfflineData) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
                border: Border.all(
                  color: AppColors.warning.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.warning,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Showing locally cached sales only. Connect to internet for latest data.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.foreground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          // Total amount - big number
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.05),
                  AppColors.primary.withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppColors.radiusMd),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  currencyFormat.format(summary.totalAmount),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Sales',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.mutedForeground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
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
                  child: _buildStatCell(
                    context,
                    'Transactions',
                    summary.transactionCount.toString(),
                    Icons.receipt_long,
                    showRightBorder: true,
                  ),
                ),
                Expanded(
                  child: _buildStatCell(
                    context,
                    'Quantity',
                    _formatQuantity(summary.totalQuantity),
                    Icons.inventory,
                    showRightBorder: true,
                  ),
                ),
                Expanded(
                  child: _buildStatCell(
                    context,
                    'Average',
                    currencyFormat.format(summary.averageTransaction),
                    Icons.analytics,
                    showRightBorder: false,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Payment breakdown header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.payments_outlined,
                  size: 16,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Payment Breakdown',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Payment breakdown with table borders
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
            ),
            child: Column(
              children: [
                _buildPaymentTableRow(
                  context,
                  'Cash',
                  summary.paymentTotals.cash,
                  Icons.money,
                  AppColors.success,
                  showBottomBorder: true,
                ),
                _buildPaymentTableRow(
                  context,
                  'Check',
                  summary.paymentTotals.check,
                  Icons.fact_check,
                  AppColors.info,
                  showBottomBorder: true,
                ),
                _buildPaymentTableRow(
                  context,
                  'Bank Transfer',
                  summary.paymentTotals.bankTransfer,
                  Icons.account_balance,
                  AppColors.primary,
                  showBottomBorder: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCell(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    required bool showRightBorder,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        border: showRightBorder
            ? const Border(right: BorderSide(color: AppColors.border))
            : null,
      ),
      child: Column(
        children: [
          Icon(icon, size: 22, color: AppColors.primary),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTableRow(
    BuildContext context,
    String label,
    double amount,
    IconData icon,
    Color color, {
    required bool showBottomBorder,
  }) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '₱', decimalDigits: 2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: showBottomBorder
            ? const Border(bottom: BorderSide(color: AppColors.border))
            : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.foreground,
              ),
            ),
          ),
          Text(
            currencyFormat.format(amount),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
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
