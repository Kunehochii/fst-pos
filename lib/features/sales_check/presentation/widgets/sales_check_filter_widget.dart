import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
                          .read(salesCheckFilterNotifierProvider.notifier)
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
                _buildDiscountedChip(filter),
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
                  .read(salesCheckFilterNotifierProvider.notifier)
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

      ref.read(salesCheckFilterNotifierProvider.notifier).setDateRange(
            start,
            end,
          );
    }
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search product...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  ref
                      .read(salesCheckFilterNotifierProvider.notifier)
                      .setProductSearch(null);
                },
              )
            : null,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onChanged: (value) {
        ref
            .read(salesCheckFilterNotifierProvider.notifier)
            .setProductSearch(value.isEmpty ? null : value);
      },
    );
  }

  Widget _buildPriceTypeChip(SalesCheckFilter filter) {
    return FilterChip(
      label: Text(filter.priceType?.displayName ?? 'All Types'),
      selected: filter.priceType != null,
      onSelected: (_) => _showPriceTypeDialog(),
      avatar:
          filter.priceType != null ? const Icon(Icons.check, size: 18) : null,
    );
  }

  void _showPriceTypeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Price Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All'),
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setPriceType(null);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sack'),
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setPriceType(PriceTypeFilter.sack);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Per Kilo'),
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
    return FilterChip(
      label: Text(filter.sackType?.displayName ?? 'All Sacks'),
      selected: filter.sackType != null,
      onSelected: (_) => _showSackTypeDialog(),
      avatar:
          filter.sackType != null ? const Icon(Icons.check, size: 18) : null,
    );
  }

  void _showSackTypeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sack Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All'),
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setSackType(null);
                Navigator.pop(context);
              },
            ),
            ...SackType.values.map(
              (type) => ListTile(
                title: Text(type.displayName),
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

    return FilterChip(
      label: Text(
        isDiscounted == null
            ? 'Discounted: All'
            : isDiscounted
                ? 'Discounted: Yes'
                : 'Discounted: No',
      ),
      selected: isDiscounted != null,
      onSelected: (_) => _showDiscountedDialog(),
      avatar: isDiscounted != null ? const Icon(Icons.check, size: 18) : null,
    );
  }

  void _showDiscountedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discounted'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All'),
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setDiscounted(null);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Discounted Only'),
              onTap: () {
                ref
                    .read(salesCheckFilterNotifierProvider.notifier)
                    .setDiscounted(true);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Non-Discounted Only'),
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
}
