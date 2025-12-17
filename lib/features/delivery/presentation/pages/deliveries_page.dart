import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/delivery.dart';
import '../providers/delivery_provider.dart';
import '../widgets/create_delivery_dialog.dart';
import '../widgets/delivery_detail_dialog.dart';

/// Main deliveries page showing list of stock replenishments.
class DeliveriesPage extends ConsumerStatefulWidget {
  const DeliveriesPage({super.key});

  @override
  ConsumerState<DeliveriesPage> createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends ConsumerState<DeliveriesPage> {
  final TextEditingController _searchController = TextEditingController();
  DateTimeRange? _dateRange;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deliveryListState = ref.watch(deliveryListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deliveries'),
        actions: [
          // Sync indicator
          _buildSyncIndicator(),
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(deliveryListNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and filter bar
          _buildFilterBar(),
          // Delivery list
          Expanded(
            child: deliveryListState.when(
              data: (state) => _buildDeliveryList(state),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => _buildErrorState(error.toString()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateDeliveryDialog(),
        icon: const Icon(Icons.add),
        label: const Text('New Delivery'),
      ),
    );
  }

  Widget _buildSyncIndicator() {
    final pendingSyncCount = ref.watch(pendingDeliverySyncCountProvider);

    return pendingSyncCount.when(
      data: (count) {
        if (count == 0) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Chip(
            avatar: const Icon(Icons.cloud_upload, size: 18),
            label: Text('$count pending'),
            backgroundColor: Colors.orange.shade100,
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Search field
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by product...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref
                              .read(deliveryListNotifierProvider.notifier)
                              .setProductSearch(null);
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                ref
                    .read(deliveryListNotifierProvider.notifier)
                    .setProductSearch(value);
              },
            ),
          ),
          const SizedBox(width: 8),
          // Date range picker
          OutlinedButton.icon(
            icon: const Icon(Icons.date_range),
            label: Text(_dateRange != null
                ? '${DateFormat('MMM d').format(_dateRange!.start)} - ${DateFormat('MMM d').format(_dateRange!.end)}'
                : 'Date Range'),
            onPressed: () => _showDateRangePicker(),
          ),
          if (_dateRange != null) ...[
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() => _dateRange = null);
                ref
                    .read(deliveryListNotifierProvider.notifier)
                    .setDateRange(null, null);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDeliveryList(DeliveryListState state) {
    if (state is DeliveryListLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is DeliveryListError) {
      if (state.cachedDeliveries != null &&
          state.cachedDeliveries!.isNotEmpty) {
        return _buildDeliveryListView(state.cachedDeliveries!, hasError: true);
      }
      return _buildErrorState(state.failure.userMessage);
    }

    if (state is DeliveryListLoaded) {
      if (state.deliveries.isEmpty) {
        return _buildEmptyState();
      }

      return RefreshIndicator(
        onRefresh: () =>
            ref.read(deliveryListNotifierProvider.notifier).refresh(),
        child: _buildDeliveryListView(
          state.deliveries,
          isRefreshing: state.isRefreshing,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildDeliveryListView(
    List<Delivery> deliveries, {
    bool hasError = false,
    bool isRefreshing = false,
  }) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: deliveries.length,
          itemBuilder: (context, index) {
            final delivery = deliveries[index];
            return _buildDeliveryCard(delivery);
          },
        ),
        if (hasError)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.orange.shade100,
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange),
                  SizedBox(width: 8),
                  Text('Showing cached data. Connection issue.'),
                ],
              ),
            ),
          ),
        if (isRefreshing)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(),
          ),
      ],
    );
  }

  Widget _buildDeliveryCard(Delivery delivery) {
    final dateFormat = DateFormat('MMM d, yyyy h:mm a');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showDeliveryDetail(delivery),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          delivery.driverName,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dateFormat
                              .format(delivery.deliveryTimeStart.toLocal()),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  _buildItemCountBadge(delivery.totalItems),
                ],
              ),
              const SizedBox(height: 12),
              // Preview of items
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: delivery.deliveryItems
                    .take(3)
                    .map((item) => Chip(
                          label: Text(
                            '${item.product?.name ?? 'Product'} (${item.quantity.toStringAsFixed(0)})',
                            style: const TextStyle(fontSize: 12),
                          ),
                          visualDensity: VisualDensity.compact,
                        ))
                    .toList(),
              ),
              if (delivery.deliveryItems.length > 3)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '+${delivery.deliveryItems.length - 3} more items',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemCountBadge(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '$count ${count == 1 ? 'item' : 'items'}',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_shipping_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No deliveries yet',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the + button to record a new delivery',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading deliveries',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            onPressed: () {
              ref.read(deliveryListNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showDateRangePicker() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
      initialDateRange: _dateRange,
    );

    if (picked != null) {
      setState(() => _dateRange = picked);
      // Convert to UTC for API
      final startUtc = DateTime.utc(
        picked.start.year,
        picked.start.month,
        picked.start.day,
      );
      final endUtc = DateTime.utc(
        picked.end.year,
        picked.end.month,
        picked.end.day,
        23,
        59,
        59,
      );
      ref
          .read(deliveryListNotifierProvider.notifier)
          .setDateRange(startUtc, endUtc);
    }
  }

  void _showCreateDeliveryDialog() {
    showDialog(
      context: context,
      builder: (context) => const CreateDeliveryDialog(),
    );
  }

  void _showDeliveryDetail(Delivery delivery) {
    showDialog(
      context: context,
      builder: (context) => DeliveryDetailDialog(delivery: delivery),
    );
  }
}
