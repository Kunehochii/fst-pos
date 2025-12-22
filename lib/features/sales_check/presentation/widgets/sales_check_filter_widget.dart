import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/sales_check_filter.dart';
import '../providers/sales_check_provider.dart';

/// Filter widget for sales check.
class SalesCheckFilterWidget extends ConsumerStatefulWidget {
  const SalesCheckFilterWidget({super.key});

  @override
  ConsumerState<SalesCheckFilterWidget> createState() =>
      _SalesCheckFilterWidgetState();
}

class _SalesCheckFilterWidgetState
    extends ConsumerState<SalesCheckFilterWidget> {
  final _searchController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(salesCheckFilterNotifierProvider);
    final theme = Theme.of(context);

    // Sync local state with filter
    _startDate = filter.startDate?.toLocal();
    _endDate = filter.endDate?.toLocal();

    return AppCard(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with reset button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Filters',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
              if (filter.hasFilters)
                TextButton.icon(
                  onPressed: () {
                    ref
                        .read(salesCheckFilterNotifierProvider.notifier)
                        .resetFilters();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.destructive,
                  ),
                  icon: const Icon(Icons.refresh, size: 16),
                  label: const Text('Reset'),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Divider
          Container(
            height: 1,
            color: AppColors.border,
          ),
          const SizedBox(height: 16),

          // Date range picker
          _buildDateRangePicker(context),
          const SizedBox(height: 16),

          // Search field
          _buildSearchField(),
          const SizedBox(height: 16),

          // Filter chips row
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildPriceTypeChip(filter),
              _buildSackTypeChip(filter),
              _buildDiscountedChip(filter),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateRangePicker(BuildContext context) {
    final dateFormat = DateFormat('MMM d, yyyy');
    final hasDateRange = _startDate != null && _endDate != null;

    return Container(
      decoration: BoxDecoration(
        color: hasDateRange
            ? AppColors.primary.withOpacity(0.05)
            : AppColors.muted,
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
        border: Border.all(
          color: hasDateRange
              ? AppColors.primary.withOpacity(0.3)
              : AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => _selectDateRange(context),
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: hasDateRange
                          ? AppColors.primary
                          : AppColors.mutedForeground,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        hasDateRange
                            ? '${dateFormat.format(_startDate!)} - ${dateFormat.format(_endDate!)}'
                            : 'Select Date Range',
                        style: TextStyle(
                          color: hasDateRange
                              ? AppColors.foreground
                              : AppColors.mutedForeground,
                          fontWeight: hasDateRange
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (hasDateRange)
            IconButton(
              icon: const Icon(Icons.clear,
                  size: 18, color: AppColors.mutedForeground),
              onPressed: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setDateRange(null, null);
              },
            ),
        ],
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final initialRange = DateTimeRange(
      start: _startDate ?? DateTime.now().subtract(const Duration(days: 7)),
      end: _endDate ?? DateTime.now(),
    );

    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: initialRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Convert to UTC with full day range
      final start = DateTime(
        picked.start.year,
        picked.start.month,
        picked.start.day,
      ).toUtc();

      final end = DateTime(
        picked.end.year,
        picked.end.month,
        picked.end.day,
        23,
        59,
        59,
        999,
      ).toUtc();

      ref.read(salesCheckFilterNotifierProvider.notifier).setDateRange(
            start,
            end,
          );
    }
  }

  Widget _buildSearchField() {
    return AppTextField(
      controller: _searchController,
      hintText: 'Search product...',
      prefixIcon: Icons.search,
      suffixIcon: _searchController.text.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear, size: 18),
              onPressed: () {
                _searchController.clear();
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setProductSearch(null);
              },
            )
          : null,
      onChanged: (value) {
        ref
            .read(salesCheckFilterNotifierProvider.notifier)
            .setProductSearch(value.isEmpty ? null : value);
      },
    );
  }

  Widget _buildPriceTypeChip(SalesCheckFilter filter) {
    final isSelected = filter.priceType != null;
    return FilterChip(
      label: Text(filter.priceType?.displayName ?? 'All Types'),
      selected: isSelected,
      onSelected: (_) => _showPriceTypeDialog(),
      avatar: isSelected
          ? const Icon(Icons.check,
              size: 16, color: AppColors.primaryForeground)
          : null,
      backgroundColor: AppColors.muted,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primaryForeground : AppColors.foreground,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.border,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
      ),
    );
  }

  void _showPriceTypeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: Text(
          'Price Type',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogOption(
              context: context,
              title: 'All',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).priceType == null,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setPriceType(null);
                Navigator.pop(context);
              },
            ),
            _buildDialogOption(
              context: context,
              title: 'Sack',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).priceType ==
                      PriceTypeFilter.sack,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setPriceType(PriceTypeFilter.sack);
                Navigator.pop(context);
              },
            ),
            _buildDialogOption(
              context: context,
              title: 'Per Kilo',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).priceType ==
                      PriceTypeFilter.kilo,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setPriceType(PriceTypeFilter.kilo);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSackTypeChip(SalesCheckFilter filter) {
    final isSelected = filter.sackType != null;
    return FilterChip(
      label: Text(filter.sackType?.displayName ?? 'All Sacks'),
      selected: isSelected,
      onSelected: (_) => _showSackTypeDialog(),
      avatar: isSelected
          ? const Icon(Icons.check,
              size: 16, color: AppColors.primaryForeground)
          : null,
      backgroundColor: AppColors.muted,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primaryForeground : AppColors.foreground,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.border,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
      ),
    );
  }

  void _showSackTypeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: Text(
          'Sack Type',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogOption(
              context: context,
              title: 'All',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).sackType == null,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setSackType(null);
                Navigator.pop(context);
              },
            ),
            ...SackType.values.map(
              (type) => _buildDialogOption(
                context: context,
                title: type.displayName,
                isSelected:
                    ref.read(salesCheckFilterNotifierProvider).sackType == type,
                onTap: () {
                  ref
                      .read(salesCheckFilterNotifierProvider.notifier)
                      .setSackType(type);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountedChip(SalesCheckFilter filter) {
    final isDiscounted = filter.isDiscounted;
    final isSelected = isDiscounted != null;

    return FilterChip(
      label: Text(
        isDiscounted == null
            ? 'Discounted: All'
            : isDiscounted
                ? 'Discounted: Yes'
                : 'Discounted: No',
      ),
      selected: isSelected,
      onSelected: (_) => _showDiscountedDialog(),
      avatar: isSelected
          ? const Icon(Icons.check,
              size: 16, color: AppColors.primaryForeground)
          : null,
      backgroundColor: AppColors.muted,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primaryForeground : AppColors.foreground,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.border,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
      ),
    );
  }

  void _showDiscountedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: Text(
          'Discounted',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogOption(
              context: context,
              title: 'All',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).isDiscounted ==
                      null,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setDiscounted(null);
                Navigator.pop(context);
              },
            ),
            _buildDialogOption(
              context: context,
              title: 'Discounted Only',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).isDiscounted ==
                      true,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setDiscounted(true);
                Navigator.pop(context);
              },
            ),
            _buildDialogOption(
              context: context,
              title: 'Non-Discounted Only',
              isSelected:
                  ref.read(salesCheckFilterNotifierProvider).isDiscounted ==
                      false,
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setDiscounted(false);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogOption({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            if (isSelected) ...[
              const Icon(Icons.check, size: 18, color: AppColors.primary),
              const SizedBox(width: 12),
            ],
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.foreground,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
