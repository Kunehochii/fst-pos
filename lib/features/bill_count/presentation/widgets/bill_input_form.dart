import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/entities/bill_count.dart';

/// Widget for inputting bill amounts.
class BillInputForm extends StatelessWidget {
  final Map<BillType, int> billAmounts;
  final double beginningBalance;
  final bool showBeginningBalance;
  final ValueChanged<double> onBeginningBalanceChanged;
  final ValueChanged<bool> onShowBeginningBalanceChanged;
  final void Function(BillType type, int amount) onBillAmountChanged;
  final bool enabled;

  const BillInputForm({
    super.key,
    required this.billAmounts,
    required this.beginningBalance,
    required this.showBeginningBalance,
    required this.onBeginningBalanceChanged,
    required this.onShowBeginningBalanceChanged,
    required this.onBillAmountChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Beginning Balance Section
        _buildBeginningBalanceSection(context),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),

        // Bills Section Header
        Text(
          'Bill Count',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the number of each bill denomination',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
        const SizedBox(height: 16),

        // Bill Input Fields
        ...BillType.values.map((type) => _buildBillInputRow(context, type)),
      ],
    );
  }

  Widget _buildBeginningBalanceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Beginning Balance',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Include in calculation',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Switch(
                  value: showBeginningBalance,
                  onChanged: enabled ? onShowBeginningBalanceChanged : null,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          enabled: enabled,
          initialValue: beginningBalance > 0 ? beginningBalance.toString() : '',
          decoration: InputDecoration(
            hintText: 'Enter beginning balance',
            prefixText: '₱ ',
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: enabled
                ? null
                : Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          onChanged: (value) {
            final parsed = double.tryParse(value) ?? 0;
            onBeginningBalanceChanged(parsed);
          },
        ),
      ],
    );
  }

  Widget _buildBillInputRow(BuildContext context, BillType type) {
    final amount = billAmounts[type] ?? 0;
    final totalValue = type.value * amount;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Bill type label
          SizedBox(
            width: 80,
            child: Text(
              type.displayName,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: type == BillType.peso1
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                  ),
            ),
          ),

          // Decrement button
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: enabled && amount > 0
                ? () => onBillAmountChanged(type, amount - 1)
                : null,
            color: Theme.of(context).colorScheme.error,
          ),

          // Amount input
          SizedBox(
            width: 80,
            child: TextFormField(
              enabled: enabled,
              key: ValueKey('${type.name}_$amount'),
              initialValue: amount.toString(),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: enabled
                    ? null
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                final parsed = int.tryParse(value) ?? 0;
                onBillAmountChanged(type, parsed);
              },
            ),
          ),

          // Increment button
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed:
                enabled ? () => onBillAmountChanged(type, amount + 1) : null,
            color: Theme.of(context).colorScheme.primary,
          ),

          // Total value
          Expanded(
            child: Text(
              '= ₱${totalValue.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.outline,
                  ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
