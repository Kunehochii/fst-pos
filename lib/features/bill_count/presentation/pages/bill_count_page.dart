import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bill count saved successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save bill count'),
          backgroundColor: Colors.red,
        ),
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
        title: const Text('Bill Count'),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: _startEditing,
            ),
          if (_isEditing) ...[
            TextButton(
              onPressed: _cancelEditing,
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: _saveBillCount,
              child: const Text('Save'),
            ),
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
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
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
      return const Center(child: CircularProgressIndicator());
    }

    if (state is BillCountSaving) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Saving bill count...'),
          ],
        ),
      );
    }

    if (state is BillCountError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(state.failure.message),
            const SizedBox(height: 16),
            ElevatedButton(
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
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
              ),

              const SizedBox(height: 16),

              // Bills Total Preview
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bills Total',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '₱${inputState.billsTotal.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
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
              Icon(
                Icons.receipt_long_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 16),
              Text(
                'No bill count for this date',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the edit button to add one',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _startEditing,
                icon: const Icon(Icons.add),
                label: const Text('Add Bill Count'),
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
