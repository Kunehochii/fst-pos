import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../product/domain/entities/product.dart';
import '../../../sales_check/domain/entities/sales_check_filter.dart';
import '../../domain/entities/profit_filter.dart';
import '../providers/profit_provider.dart';

/// Filter widget for profit.
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
    final theme = Theme.of(context);

    // Sync local state with filter
    _startDate = filter.startDate?.toLocal();
    _endDate = filter.endDate?.toLocal();

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with reset button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (filter.hasFilters)
                  TextButton.icon(
                    onPressed: () {
                      ref
                          .read(profitFilterNotifierProvider.notifier)
                          .resetFilters();
                    },
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Reset'),
                  ),
              ],
            ),
            const SizedBox(height: 12),

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

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _selectDateRange(context),
            icon: const Icon(Icons.calendar_today, size: 18),
            label: Text(
              _startDate != null && _endDate != null
                  ? '${dateFormat.format(_startDate!)} - ${dateFormat.format(_endDate!)}'
                  : 'Select Date Range',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (_startDate != null || _endDate != null)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              ref
                  .read(profitFilterNotifierProvider.notifier)
                  .setDateRange(null, null);
            },
          ),
      ],
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

      ref.read(profitFilterNotifierProvider.notifier).setDateRange(start, end);
    }
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  ref
                      .read(profitFilterNotifierProvider.notifier)
                      .setProductSearch(null);
                },
              )
            : null,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onSubmitted: (value) {
        ref
            .read(profitFilterNotifierProvider.notifier)
            .setProductSearch(value.isEmpty ? null : value);
      },
    );
  }

  Widget _buildPriceTypeChip(ProfitFilter filter) {
    return PopupMenuButton<PriceTypeFilter?>(
      initialValue: filter.priceType,
      child: Chip(
        avatar: Icon(
          Icons.category,
          size: 18,
          color: filter.priceType != null
              ? Theme.of(context).colorScheme.primary
              : null,
        ),
        label: Text(
          filter.priceType?.displayName ?? 'Price Type',
        ),
        deleteIcon:
            filter.priceType != null ? const Icon(Icons.close, size: 18) : null,
        onDeleted: filter.priceType != null
            ? () {
                ref
                    .read(profitFilterNotifierProvider.notifier)
                    .setPriceType(null);
              }
            : null,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem<PriceTypeFilter?>(
          value: null,
          child: Text('All'),
        ),
        ...PriceTypeFilter.values.map((type) => PopupMenuItem(
              value: type,
              child: Text(type.displayName),
            )),
      ],
      onSelected: (value) {
        ref.read(profitFilterNotifierProvider.notifier).setPriceType(value);
      },
    );
  }

  Widget _buildSackTypeChip(ProfitFilter filter) {
    return PopupMenuButton<SackType?>(
      initialValue: filter.sackType,
      child: Chip(
        avatar: Icon(
          Icons.inventory_2,
          size: 18,
          color: filter.sackType != null
              ? Theme.of(context).colorScheme.primary
              : null,
        ),
        label: Text(
          filter.sackType?.displayName ?? 'Sack Type',
        ),
        deleteIcon:
            filter.sackType != null ? const Icon(Icons.close, size: 18) : null,
        onDeleted: filter.sackType != null
            ? () {
                ref
                    .read(profitFilterNotifierProvider.notifier)
                    .setSackType(null);
              }
            : null,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem<SackType?>(
          value: null,
          child: Text('All'),
        ),
        ...SackType.values.map((type) => PopupMenuItem(
              value: type,
              child: Text(type.displayName),
            )),
      ],
      onSelected: (value) {
        ref.read(profitFilterNotifierProvider.notifier).setSackType(value);
      },
    );
  }
}
