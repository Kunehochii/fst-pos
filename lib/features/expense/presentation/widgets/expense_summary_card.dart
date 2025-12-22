import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/expense.dart';

/// Card showing expense summary with "Aura Daybreak" styling.
///
/// Features:
/// - Pure white card background with subtle border
/// - Soft diffused shadow for depth
/// - Orange accent for highlighted values
/// - Clean stat items with icons
class ExpenseSummaryCard extends StatelessWidget {
  final ExpenseList expense;

  const ExpenseSummaryCard({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                ),
                child: Icon(
                  Icons.summarize_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Expense Summary',
                style: TextStyle(
                  color: AppColors.foreground,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Stats row
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  label: 'Total Items',
                  value: expense.itemCount.toString(),
                  icon: Icons.receipt_long_rounded,
                  isHighlighted: false,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatItem(
                  label: 'Total Amount',
                  value: expense.totalAmountDisplay,
                  icon: Icons.payments_rounded,
                  isHighlighted: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required IconData icon,
    required bool isHighlighted,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted
            ? AppColors.primary.withValues(alpha: 0.08)
            : AppColors.muted,
        borderRadius: BorderRadius.circular(AppColors.radiusMd),
        border: isHighlighted
            ? Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
                width: 1,
              )
            : null,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? AppColors.primary.withValues(alpha: 0.15)
                  : AppColors.card,
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
            ),
            child: Icon(
              icon,
              color: isHighlighted ? AppColors.primary : AppColors.foreground,
              size: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: isHighlighted ? AppColors.primary : AppColors.foreground,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: AppColors.mutedForeground,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
