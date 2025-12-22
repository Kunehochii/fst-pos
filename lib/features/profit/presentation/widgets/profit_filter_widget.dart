import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../product/domain/entities/product.dart';
import '../../../sales_check/domain/entities/sales_check_filter.dart';
import '../../domain/entities/profit_filter.dart';
import '../providers/profit_provider.dart';

/// Filter widget for profit.
///
/// Follows the "Aura Daybreak" design with:
/// - Clean white card with subtle border
/// - Orange accent for active filters
/// - Gray backgrounds for inputs
class ProfitFilterWidget extends ConsumerStatefulWidget {
  const ProfitFilterWidget({super.key});

  @override
  ConsumerState<ProfitFilterWidget> createState() => _ProfitFilterWidgetState();
}

class _ProfitFilterWidgetState extends ConsumerState<ProfitFilterWidget> {
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
    final filter = ref.watch(profitFilterNotifierProvider);

    // Sync local state with filter
    _startDate = filter.startDate?.toLocal();
    _endDate = filter.endDate?.toLocal();

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
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
                    Icon(
                      Icons.tune,
                      size: 18,
                      color: AppColors.foreground,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 15,
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
                          .read(profitFilterNotifierProvider.notifier)
                          .resetFilters();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                    ),
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Date range picker
            _buildDateRangePicker(context),
            const SizedBox(height: 12),

            // Search field
            _buildSearchField(),
            const SizedBox(height: 12),

            // Filter chips row
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildPriceTypeChip(filter),
                _buildSackTypeChip(filter),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRangePicker(BuildContext context) {
    final dateFormat = DateFormat('MMM d, yyyy');
    final hasDateRange = _startDate != null && _endDate != null;

    return Container(
      decoration: BoxDecoration(
        color: hasDateRange
            ? AppColors.primary.withValues(alpha: 0.05)
            : AppColors.muted,
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
        border: Border.all(
          color: hasDateRange
              ? AppColors.primary.withValues(alpha: 0.3)
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
                          fontSize: 14,
                          color: hasDateRange
                              ? AppColors.foreground
                              : AppColors.mutedForeground,
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
              icon: Icon(
                Icons.close,
                size: 18,
                color: AppColors.mutedForeground,
              ),
              onPressed: () {
                ref
                    .read(profitFilterNotifierProvider.notifier)
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
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.primaryForeground,
              surface: AppColors.card,
              onSurface: AppColors.foreground,
            ),
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

      ref.read(profitFilterNotifierProvider.notifier).setDateRange(start, end);
    }
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.muted,
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.foreground,
        ),
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: TextStyle(
            color: AppColors.mutedForeground,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.mutedForeground,
            size: 20,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.mutedForeground,
                    size: 18,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    ref
                        .read(profitFilterNotifierProvider.notifier)
                        .setProductSearch(null);
                  },
                )
              : null,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        onSubmitted: (value) {
          ref
              .read(profitFilterNotifierProvider.notifier)
              .setProductSearch(value.isEmpty ? null : value);
        },
      ),
    );
  }

  Widget _buildPriceTypeChip(ProfitFilter filter) {
    final isActive = filter.priceType != null;

    return PopupMenuButton<PriceTypeFilter?>(
      initialValue: filter.priceType,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.muted,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? AppColors.primary.withValues(alpha: 0.4)
                : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.category_outlined,
              size: 16,
              color: isActive ? AppColors.primary : AppColors.mutedForeground,
            ),
            const SizedBox(width: 6),
            Text(
              filter.priceType?.displayName ?? 'Price Type',
              style: TextStyle(
                fontSize: 13,
                color: isActive ? AppColors.primary : AppColors.foreground,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isActive) ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  ref
                      .read(profitFilterNotifierProvider.notifier)
                      .setPriceType(null);
                },
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            ] else ...[
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                size: 18,
                color: AppColors.mutedForeground,
              ),
            ],
          ],
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem<PriceTypeFilter?>(
          value: null,
          child: Text(
            'All',
            style: TextStyle(color: AppColors.foreground),
          ),
        ),
        ...PriceTypeFilter.values.map((type) => PopupMenuItem(
              value: type,
              child: Text(
                type.displayName,
                style: TextStyle(color: AppColors.foreground),
              ),
            )),
      ],
      onSelected: (value) {
        ref.read(profitFilterNotifierProvider.notifier).setPriceType(value);
      },
    );
  }

  Widget _buildSackTypeChip(ProfitFilter filter) {
    final isActive = filter.sackType != null;

    return PopupMenuButton<SackType?>(
      initialValue: filter.sackType,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.muted,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? AppColors.primary.withValues(alpha: 0.4)
                : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 16,
              color: isActive ? AppColors.primary : AppColors.mutedForeground,
            ),
            const SizedBox(width: 6),
            Text(
              filter.sackType?.displayName ?? 'Sack Type',
              style: TextStyle(
                fontSize: 13,
                color: isActive ? AppColors.primary : AppColors.foreground,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isActive) ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  ref
                      .read(profitFilterNotifierProvider.notifier)
                      .setSackType(null);
                },
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            ] else ...[
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                size: 18,
                color: AppColors.mutedForeground,
              ),
            ],
          ],
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem<SackType?>(
          value: null,
          child: Text(
            'All',
            style: TextStyle(color: AppColors.foreground),
          ),
        ),
        ...SackType.values.map((type) => PopupMenuItem(
              value: type,
              child: Text(
                type.displayName,
                style: TextStyle(color: AppColors.foreground),
              ),
            )),
      ],
      onSelected: (value) {
        ref.read(profitFilterNotifierProvider.notifier).setSackType(value);
      },
    );
  }
}
