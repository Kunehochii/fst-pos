import 'package:flutter/material.dart';

import '../../domain/entities/expense.dart';

/// Card showing expense summary.
class ExpenseSummaryCard extends StatelessWidget {
  final ExpenseList expense;

  const ExpenseSummaryCard({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Expense Summary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem(
                  context,
                  'Total Items',
                  expense.itemCount.toString(),
                  Icons.receipt_outlined,
                ),
                _buildStatItem(
                  context,
                  'Total Amount',
                  expense.totalAmountDisplay,
                  Icons.payments_outlined,
                  isHighlighted: true,
                ),
              ],
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
    IconData icon, {
    bool isHighlighted = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isHighlighted
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isHighlighted
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.onSurface,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isHighlighted
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isHighlighted
                        ? colorScheme.onPrimaryContainer.withValues(alpha: 0.8)
                        : colorScheme.outline,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
