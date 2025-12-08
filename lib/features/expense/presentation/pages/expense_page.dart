import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_date_selector.dart';
import '../widgets/expense_form.dart';
import '../widgets/expense_summary_card.dart';

/// Main expense page for managing daily expenses.
class ExpensePage extends ConsumerStatefulWidget {
  const ExpensePage({super.key});

  @override
  ConsumerState<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends ConsumerState<ExpensePage> {
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize editor when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final expenseState = ref.read(expenseNotifierProvider);
      expenseState.whenData((state) {
        if (state is ExpenseLoaded) {
          ref
              .read(expenseItemsEditorProvider.notifier)
              .initializeFrom(state.expense);
          if (state.expense == null) {
            setState(() => _isEditing = true);
          }
        }
      });
    });
  }

  void _startEditing() {
    final expenseState = ref.read(expenseNotifierProvider);
    expenseState.whenData((state) {
      if (state is ExpenseLoaded) {
        ref
            .read(expenseItemsEditorProvider.notifier)
            .initializeFrom(state.expense);
      }
    });
    setState(() => _isEditing = true);
  }

  void _cancelEditing() {
    setState(() => _isEditing = false);
    ref.read(expenseItemsEditorProvider.notifier).clear();
  }

  Future<void> _saveExpense() async {
    final items = ref.read(expenseItemsEditorProvider);

    if (items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one expense item'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final success =
        await ref.read(expenseNotifierProvider.notifier).saveExpense(items);

    if (success && mounted) {
      setState(() => _isEditing = false);
      ref.read(expenseItemsEditorProvider.notifier).clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense saved successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Future<void> _deleteExpense(String expenseId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Expense'),
        content: const Text(
            'Are you sure you want to delete this expense? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await ref
          .read(expenseNotifierProvider.notifier)
          .deleteExpense(expenseId);

      if (success && mounted) {
        setState(() => _isEditing = true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Expense deleted'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final expenseState = ref.watch(expenseNotifierProvider);
    final selectedDate = ref.watch(expenseDateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          if (_isEditing) ...[
            TextButton.icon(
              onPressed: _cancelEditing,
              icon: const Icon(Icons.close),
              label: const Text('Cancel'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white70,
              ),
            ),
            TextButton.icon(
              onPressed: _saveExpense,
              icon: const Icon(Icons.save),
              label: const Text('Save'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit Expenses',
              onPressed: _startEditing,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                ref.read(expenseNotifierProvider.notifier).refresh();
              },
            ),
          ],
        ],
      ),
      body: Column(
        children: [
          // Date selector
          ExpenseDateSelector(
            selectedDate: selectedDate,
            onPreviousDay: () {
              ref.read(expenseDateNotifierProvider.notifier).previousDay();
              setState(() => _isEditing = false);
            },
            onNextDay: () {
              ref.read(expenseDateNotifierProvider.notifier).nextDay();
              setState(() => _isEditing = false);
            },
            onDateSelected: (date) {
              ref.read(expenseDateNotifierProvider.notifier).setDate(date);
              setState(() => _isEditing = false);
            },
          ),

          // Content
          Expanded(
            child: expenseState.when(
              data: (state) => _buildContent(state, selectedDate),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => _buildError(error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ExpenseState state, DateTime selectedDate) {
    if (state is ExpenseLoading || state is ExpenseSaving) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ExpenseError) {
      return _buildErrorState(state.failure);
    }

    final loaded = state as ExpenseLoaded;
    final dateStr = DateFormat('MMMM d, yyyy').format(selectedDate);

    if (_isEditing) {
      return ExpenseForm(
        existingExpense: loaded.expense,
      );
    }

    // View mode
    if (!loaded.hasExpense) {
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
              'No expenses for $dateStr',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _startEditing,
              icon: const Icon(Icons.add),
              label: const Text('Add Expenses'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Summary card
          ExpenseSummaryCard(expense: loaded.expense!),

          const SizedBox(height: 16),

          // Expense items list
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expense Items',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        color: Colors.red,
                        tooltip: 'Delete Expense',
                        onPressed: () => _deleteExpense(loaded.expense!.id),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: loaded.expense!.expenseItems.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = loaded.expense!.expenseItems[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: Text(
                        item.amountDisplay,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading expenses',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(expenseNotifierProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(dynamic failure) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Error',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            failure.toString(),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(expenseNotifierProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
