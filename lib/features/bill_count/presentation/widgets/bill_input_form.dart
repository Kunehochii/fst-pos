import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/bill_count.dart';

/// Widget for inputting bill amounts.
///
/// Styled with "Aura Daybreak" design:
/// - Clean white inputs with subtle borders
/// - Orange accent for interactive elements
/// - Deep Navy text for high contrast
/// - Tactile button feedback
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
        const SizedBox(height: 20),

        // Divider
        Container(
          height: 1,
          color: AppColors.border,
        ),
        const SizedBox(height: 20),

        // Bills Section Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.payments_outlined,
                color: AppColors.secondary,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bill Count',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Enter the number of each bill denomination',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

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
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.primary,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Beginning Balance',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
            ),
            // Toggle switch
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Include',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(width: 6),
                  SizedBox(
                    height: 20,
                    child: Switch(
                      value: showBeginningBalance,
                      onChanged: enabled ? onShowBeginningBalanceChanged : null,
                      activeTrackColor:
                          AppColors.primary.withValues(alpha: 0.5),
                      activeThumbColor: AppColors.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          enabled: enabled,
          initialValue: beginningBalance > 0 ? beginningBalance.toString() : '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
          decoration: InputDecoration(
            hintText: 'Enter beginning balance',
            hintStyle: TextStyle(
              color: AppColors.mutedForeground,
              fontWeight: FontWeight.normal,
            ),
            prefixText: '₱ ',
            prefixStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
            filled: true,
            fillColor: enabled ? AppColors.muted : AppColors.border,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          // Bill type label
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: type == BillType.peso1
                  ? AppColors.secondary.withValues(alpha: 0.1)
                  : AppColors.muted,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: type == BillType.peso1
                    ? AppColors.secondary.withValues(alpha: 0.2)
                    : AppColors.border,
              ),
            ),
            child: Text(
              type.displayName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: type == BillType.peso1
                    ? AppColors.secondary
                    : AppColors.foreground,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(width: 12),

          // Decrement button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: enabled && amount > 0
                  ? () => onBillAmountChanged(type, amount - 1)
                  : null,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: enabled && amount > 0
                      ? AppColors.destructive.withValues(alpha: 0.1)
                      : AppColors.muted,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: enabled && amount > 0
                        ? AppColors.destructive.withValues(alpha: 0.2)
                        : AppColors.border,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  size: 18,
                  color: enabled && amount > 0
                      ? AppColors.destructive
                      : AppColors.mutedForeground,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Amount input
          SizedBox(
            width: 70,
            child: TextFormField(
              enabled: enabled,
              key: ValueKey('${type.name}_$amount'),
              initialValue: amount.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                filled: true,
                fillColor: enabled ? AppColors.card : AppColors.muted,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
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

          const SizedBox(width: 8),

          // Increment button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:
                  enabled ? () => onBillAmountChanged(type, amount + 1) : null,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: enabled
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.muted,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: enabled
                        ? AppColors.primary.withValues(alpha: 0.2)
                        : AppColors.border,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 18,
                  color:
                      enabled ? AppColors.primary : AppColors.mutedForeground,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Total value
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: totalValue > 0
                    ? AppColors.primary.withValues(alpha: 0.05)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '= ₱${totalValue.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: totalValue > 0
                      ? AppColors.primary
                      : AppColors.mutedForeground,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
