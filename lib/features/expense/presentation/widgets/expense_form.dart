import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../providers/expense_provider.dart';

/// Form for adding/editing expense items with "Aura Daybreak" styling.
///
/// Features:
/// - White card with subtle border and shadow
/// - Orange accent for primary actions
/// - Clean input fields with focus states
/// - Tactile button feedback
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
  final _nameFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();

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
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
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
      _nameFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(expenseItemsEditorProvider);
    final totalAmount =
        items.fold<double>(0.0, (sum, item) => sum + item.amount);

    return Column(
      children: [
        // Add item form card
        Container(
          margin: const EdgeInsets.all(16),
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
          child: Form(
            key: _formKey,
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
                        Icons.add_circle_outline_rounded,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Add Expense Item',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Expense name field
                _buildFormField(
                  controller: _nameController,
                  focusNode: _nameFocusNode,
                  label: 'Expense Name',
                  hintText: 'e.g., Transportation, Supplies',
                  prefixIcon: Icons.description_outlined,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter expense name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => _amountFocusNode.requestFocus(),
                ),
                const SizedBox(height: 16),
                // Amount field
                _buildFormField(
                  controller: _amountController,
                  focusNode: _amountFocusNode,
                  label: 'Amount (PHP)',
                  hintText: '0.00',
                  prefixIcon: Icons.payments_outlined,
                  prefixText: '₱ ',
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
                  onFieldSubmitted: (_) => _addItem(),
                ),
                const SizedBox(height: 20),
                // Add button
                AppButton.primary(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add_rounded),
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ),
        ),

        // Items list
        Expanded(
          child: items.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _buildExpenseItemCard(item, index);
                  },
                ),
        ),

        // Total and Save button
        if (items.isNotEmpty) _buildFooter(items, totalAmount),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.muted,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.receipt_long_outlined,
              size: 48,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No expense items added yet',
            style: TextStyle(
              color: AppColors.mutedForeground,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first expense item above',
            style: TextStyle(
              color: AppColors.mutedForeground.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseItemCard(ExpenseItemInput item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppColors.radiusSm),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '₱${item.amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        trailing: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              ref.read(expenseItemsEditorProvider.notifier).removeItem(index);
            },
            borderRadius: BorderRadius.circular(AppColors.radiusSm),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.destructive.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                color: AppColors.destructive,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(List<ExpenseItemInput> items, double totalAmount) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Total row
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.muted,
              borderRadius: BorderRadius.circular(AppColors.radiusMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      color: AppColors.mutedForeground,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Total (${items.length} ${items.length == 1 ? 'item' : 'items'})',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  '₱${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              if (widget.onCancel != null)
                Expanded(
                  child: AppButton.secondary(
                    onPressed: widget.isSaving ? null : widget.onCancel,
                    child: const Text('Cancel'),
                  ),
                ),
              if (widget.onCancel != null) const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: AppButton.primary(
                  onPressed: widget.isSaving ? null : widget.onSave,
                  isLoading: widget.isSaving,
                  icon: widget.isSaving ? null : const Icon(Icons.save_rounded),
                  child: Text(widget.isSaving ? 'Saving...' : 'Save Expenses'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds a styled form field with Aura Daybreak theming.
  Widget _buildFormField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    String? hintText,
    IconData? prefixIcon,
    String? prefixText,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    void Function(String)? onFieldSubmitted,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          style: TextStyle(
            color: AppColors.foreground,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.mutedForeground,
              fontSize: 15,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 18,
                    color: AppColors.mutedForeground,
                  )
                : null,
            prefixText: prefixText,
            prefixStyle: TextStyle(
              color: AppColors.foreground,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: AppColors.muted,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide(
                color: AppColors.destructive,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              borderSide: BorderSide(
                color: AppColors.destructive,
                width: 2,
              ),
            ),
            errorStyle: TextStyle(
              color: AppColors.destructive,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
