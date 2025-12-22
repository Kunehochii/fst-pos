import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../providers/expense_provider.dart';
import '../widgets/expense_date_selector.dart';
import '../widgets/expense_form.dart';
import '../widgets/expense_summary_card.dart';

/// Main expense page for managing daily expenses.
///
/// Styled with "Aura Daybreak" design system:
/// - Light gray background with white cards
/// - Orange accent for primary actions
/// - Subtle shadows and borders for depth
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
      AppToast.warning(
        context,
        title: 'No Items',
        message: 'Please add at least one expense item',
      );
      return;
    }

    final success =
        await ref.read(expenseNotifierProvider.notifier).saveExpense(items);

    if (success && mounted) {
      setState(() => _isEditing = false);
      ref.read(expenseItemsEditorProvider.notifier).clear();
      AppToast.success(
        context,
        title: 'Success',
        message: 'Expense saved successfully',
      );
    }
  }

  Future<void> _deleteExpense(String expenseId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: Row(
          children: [
            Container(
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
            const SizedBox(width: 12),
            Text(
              'Delete Expense',
              style: TextStyle(
                color: AppColors.foreground,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        content: Text(
          'Are you sure you want to delete this expense? This action cannot be undone.',
          style: TextStyle(
            color: AppColors.mutedForeground,
            fontSize: 15,
          ),
        ),
        actions: [
          AppButton.secondary(
            onPressed: () => Navigator.of(context).pop(false),
            small: true,
            child: const Text('Cancel'),
          ),
          AppButton.destructive(
            onPressed: () => Navigator.of(context).pop(true),
            small: true,
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
        AppToast.info(
          context,
          title: 'Deleted',
          message: 'Expense has been deleted',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final expenseState = ref.watch(expenseNotifierProvider);
    final selectedDate = ref.watch(expenseDateNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Expenses',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          if (_isEditing) ...[
            AppButton.ghost(
              onPressed: _cancelEditing,
              small: true,
              icon: Icon(Icons.close_rounded, color: AppColors.mutedForeground),
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColors.mutedForeground),
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AppButton.primary(
                onPressed: _saveExpense,
                small: true,
                icon: const Icon(Icons.save_rounded),
                child: const Text('Save'),
              ),
            ),
          ] else ...[
            IconButton(
              icon: Icon(
                Icons.edit_rounded,
                color: AppColors.foreground,
              ),
              tooltip: 'Edit Expenses',
              onPressed: _startEditing,
            ),
            IconButton(
              icon: Icon(
                Icons.refresh_rounded,
                color: AppColors.foreground,
              ),
              tooltip: 'Refresh',
              onPressed: () {
                ref.read(expenseNotifierProvider.notifier).refresh();
              },
            ),
          ],
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: AppColors.border,
          ),
        ),
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
              loading: () => _buildLoadingState(),
              error: (error, stack) => _buildError(error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading expenses...',
            style: TextStyle(
              color: AppColors.mutedForeground,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ExpenseState state, DateTime selectedDate) {
    final isSaving = state is ExpenseSaving;

    if (state is ExpenseLoading) {
      return _buildLoadingState();
    }

    if (state is ExpenseError) {
      return _buildErrorState(state.failure);
    }

    // During saving, show the form with saving state
    if (isSaving && _isEditing) {
      return ExpenseForm(
        existingExpense: null,
        onSave: _saveExpense,
        onCancel: _cancelEditing,
        isSaving: true,
      );
    }

    if (state is! ExpenseLoaded) {
      return _buildLoadingState();
    }

    final loaded = state;
    final dateStr = DateFormat('MMMM d, yyyy').format(selectedDate);

    if (_isEditing) {
      return ExpenseForm(
        existingExpense: loaded.expense,
        onSave: _saveExpense,
        onCancel: _cancelEditing,
        isSaving: false,
      );
    }

    // View mode
    if (!loaded.hasExpense) {
      return _buildEmptyState(dateStr);
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
          _buildExpenseItemsList(loaded),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String dateStr) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.muted,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.receipt_long_outlined,
              size: 56,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No expenses for $dateStr',
            style: TextStyle(
              color: AppColors.foreground,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start tracking your daily expenses',
            style: TextStyle(
              color: AppColors.mutedForeground,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          AppButton.primary(
            onPressed: _startEditing,
            icon: const Icon(Icons.add_rounded),
            child: const Text('Add Expenses'),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseItemsList(ExpenseLoaded loaded) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                      ),
                      child: Icon(
                        Icons.list_alt_rounded,
                        color: AppColors.secondary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Expense Items',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _deleteExpense(loaded.expense!.id),
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.destructive.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.destructive,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: AppColors.destructive,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.border),
          // Items list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: loaded.expense!.expenseItems.length,
            separatorBuilder: (_, __) =>
                Container(height: 1, color: AppColors.border),
            itemBuilder: (context, index) {
              final item = loaded.expense!.expenseItems[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.muted,
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: AppColors.mutedForeground,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          color: AppColors.foreground,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      item.amountDisplay,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildError(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.destructive.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.destructive,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Error loading expenses',
              style: TextStyle(
                color: AppColors.foreground,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: TextStyle(
                color: AppColors.mutedForeground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppButton.primary(
              onPressed: () {
                ref.read(expenseNotifierProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh_rounded),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(dynamic failure) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.destructive.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.destructive,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Error',
              style: TextStyle(
                color: AppColors.foreground,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              failure.toString(),
              style: TextStyle(
                color: AppColors.mutedForeground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppButton.primary(
              onPressed: () {
                ref.read(expenseNotifierProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh_rounded),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
