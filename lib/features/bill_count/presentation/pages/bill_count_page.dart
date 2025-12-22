import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../providers/bill_count_provider.dart';
import '../widgets/bill_count_date_selector.dart';
import '../widgets/bill_count_summary_card.dart';
import '../widgets/bill_input_form.dart';

/// Main bill count page for managing daily bill counts.
class BillCountPage extends ConsumerStatefulWidget {
  const BillCountPage({super.key});

  @override
  ConsumerState<BillCountPage> createState() => _BillCountPageState();
}

class _BillCountPageState extends ConsumerState<BillCountPage> {
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize form when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final billCountState = ref.read(billCountNotifierProvider);
      billCountState.whenData((state) {
        if (state is BillCountLoaded) {
          // Form is automatically initialized by watching billCountNotifierProvider
          if (state.billCount == null) {
            setState(() => _isEditing = true);
          }
        }
      });
    });
  }

  void _startEditing() {
    setState(() => _isEditing = true);
  }

  void _cancelEditing() {
    setState(() => _isEditing = false);
    // Reset form to current bill count state
    ref.invalidate(billInputNotifierProvider);
  }

  Future<void> _saveBillCount() async {
    final inputState = ref.read(billInputNotifierProvider);
    final bills = inputState.toBillItemInputs();

    final success =
        await ref.read(billCountNotifierProvider.notifier).saveBillCount(
              beginningBalance: inputState.beginningBalance,
              showBeginningBalance: inputState.showBeginningBalance,
              bills: bills,
            );

    if (success && mounted) {
      setState(() => _isEditing = false);
      AppToast.success(
        context,
        title: 'Success',
        message: 'Bill count saved successfully',
      );
    } else if (mounted) {
      AppToast.error(
        context,
        title: 'Error',
        message: 'Failed to save bill count',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(billCountDateNotifierProvider);
    final billCountState = ref.watch(billCountNotifierProvider);
    final inputState = ref.watch(billInputNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bill Count',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              color: AppColors.mutedForeground,
              onPressed: _startEditing,
            ),
          if (_isEditing) ...[
            AppButton.ghost(
              onPressed: _cancelEditing,
              small: true,
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 8),
            AppButton.primary(
              onPressed: _saveBillCount,
              small: true,
              icon: const Icon(Icons.save, size: 16),
              child: const Text('Save'),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
      body: Column(
        children: [
          // Date Selector
          BillCountDateSelector(
            selectedDate: selectedDate,
            onPreviousDay: () {
              ref.read(billCountDateNotifierProvider.notifier).previousDay();
            },
            onNextDay: () {
              ref.read(billCountDateNotifierProvider.notifier).nextDay();
            },
            onDateSelected: (date) {
              ref.read(billCountDateNotifierProvider.notifier).setDate(date);
            },
          ),

          // Content
          Expanded(
            child: billCountState.when(
              data: (state) => _buildContent(context, state, inputState),
              loading: () => const Center(
                child: AppLoadingIndicator(message: 'Loading bill count...'),
              ),
              error: (error, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIconBox(
                      icon: Icons.error_outline,
                      backgroundColor:
                          AppColors.destructive.withValues(alpha: 0.1),
                      iconColor: AppColors.destructive,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: $error',
                      style: TextStyle(color: AppColors.mutedForeground),
                    ),
                    const SizedBox(height: 16),
                    AppButton.primary(
                      onPressed: () {
                        ref.invalidate(billCountNotifierProvider);
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BillCountState state,
    BillInputState inputState,
  ) {
    if (state is BillCountLoading) {
      return const Center(
        child: AppLoadingIndicator(message: 'Loading...'),
      );
    }

    if (state is BillCountSaving) {
      return const Center(
        child: AppLoadingIndicator(message: 'Saving bill count...'),
      );
    }

    if (state is BillCountError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconBox(
              icon: Icons.error_outline,
              backgroundColor: AppColors.destructive.withValues(alpha: 0.1),
              iconColor: AppColors.destructive,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              state.failure.message,
              style: TextStyle(color: AppColors.mutedForeground),
            ),
            const SizedBox(height: 16),
            AppButton.primary(
              onPressed: () {
                ref.read(billCountNotifierProvider.notifier).refresh();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is BillCountLoaded) {
      final billCount = state.billCount;

      if (_isEditing) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Form
              AppCard(
                padding: const EdgeInsets.all(20),
                elevation: 1,
                child: BillInputForm(
                  billAmounts: inputState.billAmounts,
                  beginningBalance: inputState.beginningBalance,
                  showBeginningBalance: inputState.showBeginningBalance,
                  onBeginningBalanceChanged: (value) {
                    ref
                        .read(billInputNotifierProvider.notifier)
                        .setBeginningBalance(value);
                  },
                  onShowBeginningBalanceChanged: (value) {
                    ref
                        .read(billInputNotifierProvider.notifier)
                        .setShowBeginningBalance(value);
                  },
                  onBillAmountChanged: (type, amount) {
                    ref
                        .read(billInputNotifierProvider.notifier)
                        .setBillAmount(type, amount);
                  },
                  enabled: true,
                ),
              ),

              const SizedBox(height: 16),

              // Bills Total Preview
              AppCard(
                padding: const EdgeInsets.all(20),
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Bills Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.foreground,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₱${inputState.billsTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }

      // View mode
      if (billCount == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconBox(
                icon: Icons.receipt_long_outlined,
                backgroundColor: AppColors.muted,
                iconColor: AppColors.mutedForeground,
                size: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'No bill count for this date',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the button below to add one',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 28),
              AppButton.primary(
                onPressed: _startEditing,
                icon: const Icon(Icons.add, size: 18),
                child: const Text('Add Bill Count'),
              ),
            ],
          ),
        );
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillCountSummaryCard(billCount: billCount),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
