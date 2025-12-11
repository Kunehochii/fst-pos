import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../providers/expense_provider.dart';

/// Form for adding/editing expense items.
class ExpenseForm extends ConsumerStatefulWidget {
  final ExpenseList? existingExpense;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final bool isSaving;

  const ExpenseForm({
    super.key,
    this.existingExpense,
    this.onSave,
    this.onCancel,
    this.isSaving = false,
  });

  @override
  ConsumerState<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends ConsumerState<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize editor with existing items
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(expenseItemsEditorProvider.notifier)
          .initializeFrom(widget.existingExpense);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _addItem() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final amount = double.tryParse(_amountController.text) ?? 0;

      ref.read(expenseItemsEditorProvider.notifier).addItem(
            ExpenseItemInput(name: name, amount: amount),
          );

      _nameController.clear();
      _amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(expenseItemsEditorProvider);
    final totalAmount =
        items.fold<double>(0.0, (sum, item) => sum + item.amount);

    return Column(
      children: [
        // Add item form
        Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Expense Item',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Expense Name',
                      hintText: 'e.g., Transportation, Supplies',
                      prefixIcon: Icon(Icons.description_outlined),
                    ),
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter expense name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount (PHP)',
                      hintText: '0.00',
                      prefixIcon: Icon(Icons.payments_outlined),
                      prefixText: '₱ ',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount';
                      }
                      final amount = double.tryParse(value);
                      if (amount == null || amount <= 0) {
                        return 'Please enter a valid amount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _addItem,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Item'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Items list
        Expanded(
          child: items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 48,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No expense items added yet',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Text('₱${item.amount.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.red,
                          onPressed: () {
                            ref
                                .read(expenseItemsEditorProvider.notifier)
                                .removeItem(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),

        // Total and Save button
        if (items.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total (${items.length} items)',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '₱${totalAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (widget.onCancel != null)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.isSaving ? null : widget.onCancel,
                          child: const Text('Cancel'),
                        ),
                      ),
                    if (widget.onCancel != null) const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: FilledButton.icon(
                        onPressed: widget.isSaving ? null : widget.onSave,
                        icon: widget.isSaving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.save),
                        label: Text(
                            widget.isSaving ? 'Saving...' : 'Save Expenses'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
