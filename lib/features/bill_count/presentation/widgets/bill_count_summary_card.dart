import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/bill_count.dart';

/// Widget for displaying bill count summary.
///
/// Styled with "Aura Daybreak" design:
/// - Pure white card with soft shadow
/// - Deep Navy text for high contrast
/// - Orange accents for primary values
/// - Emerald/Rose for positive/negative differences
class BillCountSummaryCard extends StatelessWidget {
  final BillCount billCount;

  const BillCountSummaryCard({
    super.key,
    required this.billCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.receipt_long,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Bill Count Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              ),
              if (!billCount.isSynced)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                        Icons.sync_problem,
                        size: 14,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Pending Sync',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),

          // Divider
          Container(
            height: 1,
            color: AppColors.border,
          ),
          const SizedBox(height: 16),

          // Bills Breakdown
          ...BillType.values.map((type) => _buildBillRow(context, type)),

          Container(
            height: 1,
            color: AppColors.border,
          ),
          const SizedBox(height: 12),

          // Bills Total
          _buildSummaryRow(
            context,
            'Bills Total',
            billCount.billsTotalDisplay,
            isBold: true,
            color: AppColors.primary,
          ),

          // Beginning Balance (if shown)
          if (billCount.showBeginningBalance) ...[
            const SizedBox(height: 8),
            _buildSummaryRow(
              context,
              'Beginning Balance',
              '- ${billCount.beginningBalanceDisplay}',
              color: AppColors.destructive,
            ),
          ],

          const SizedBox(height: 12),
          Container(
            height: 1,
            color: AppColors.border,
          ),
          const SizedBox(height: 12),

          // Step 1: Bills - Beginning Balance
          _buildSummaryRow(
            context,
            'Subtotal (Bills${billCount.showBeginningBalance ? ' - Beginning' : ''})',
            billCount.summaryStep1Display,
          ),

          const SizedBox(height: 8),

          // Total Expenses
          _buildSummaryRow(
            context,
            'Total Expenses',
            '+ ${billCount.totalExpensesDisplay}',
            color: AppColors.destructive,
          ),

          const SizedBox(height: 12),
          Container(
            height: 1,
            color: AppColors.border,
          ),
          const SizedBox(height: 12),

          // Final Total
          _buildSummaryRow(
            context,
            'Final Total',
            billCount.summaryFinalDisplay,
            isBold: true,
            color: AppColors.primary,
            fontSize: 18,
          ),

          const SizedBox(height: 24),

          // Section Divider
          Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 16),

          // Comparison Section
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.compare_arrows,
                  size: 18,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Comparison with Sales',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          _buildSummaryRow(
            context,
            'Net Cash (Sales - Expenses)',
            billCount.netCashDisplay,
          ),

          const SizedBox(height: 8),

          _buildSummaryRow(
            context,
            'Difference',
            billCount.differenceDisplay,
            isBold: true,
            color: billCount.difference >= 0
                ? AppColors.success
                : AppColors.destructive,
          ),

          if (billCount.difference.abs() > 0.01) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: billCount.difference >= 0
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.destructive.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
                border: Border.all(
                  color: billCount.difference >= 0
                      ? AppColors.success.withValues(alpha: 0.2)
                      : AppColors.destructive.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: billCount.difference >= 0
                          ? AppColors.success.withValues(alpha: 0.2)
                          : AppColors.destructive.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      billCount.difference >= 0
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      size: 16,
                      color: billCount.difference >= 0
                          ? AppColors.success
                          : AppColors.destructive,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      billCount.difference >= 0
                          ? 'Over by ${billCount.differenceDisplay}'
                          : 'Short by ₱${billCount.difference.abs().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: billCount.difference >= 0
                            ? AppColors.success
                            : AppColors.destructive,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBillRow(BuildContext context, BillType type) {
    final amount = billCount.getAmountForType(type);
    final totalValue = type.value * amount;

    if (amount == 0) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: type == BillType.peso1
                  ? AppColors.secondary.withValues(alpha: 0.1)
                  : AppColors.muted,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              type.displayName,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: type == BillType.peso1
                    ? AppColors.secondary
                    : AppColors.foreground,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'x $amount',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedForeground,
            ),
          ),
          const Spacer(),
          Text(
            '₱${totalValue.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.foreground,
            ),
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
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            color: AppColors.foreground,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: color ?? AppColors.foreground,
          ),
        ),
      ],
    );
  }
}
