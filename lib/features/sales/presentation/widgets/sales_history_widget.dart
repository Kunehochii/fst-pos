import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/sale.dart';
import '../providers/sales_provider.dart';

/// Sales history widget with pagination and void functionality.
class SalesHistoryWidget extends ConsumerStatefulWidget {
  const SalesHistoryWidget({super.key});

  @override
  ConsumerState<SalesHistoryWidget> createState() => _SalesHistoryWidgetState();
}

class _SalesHistoryWidgetState extends ConsumerState<SalesHistoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Voided'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              _ActiveSalesTab(),
              _VoidedSalesTab(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActiveSalesTab extends ConsumerWidget {
  const _ActiveSalesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesState = ref.watch(salesHistoryNotifierProvider);

    return salesState.when(
      data: (state) {
        if (state is SalesListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SalesListError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.failure.toString()}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(salesHistoryNotifierProvider.notifier).refresh();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final loaded = state as SalesListLoaded;
        if (loaded.sales.isEmpty) {
          return const Center(
            child: Text('No sales yet'),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(salesHistoryNotifierProvider.notifier).refresh();
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter < 200 &&
                  loaded.hasMore &&
                  !loaded.isLoadingMore) {
                ref.read(salesHistoryNotifierProvider.notifier).loadMore();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: loaded.sales.length + (loaded.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= loaded.sales.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return _SaleListTile(
                  sale: loaded.sales[index],
                  showVoidButton: true,
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class _VoidedSalesTab extends ConsumerWidget {
  const _VoidedSalesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesState = ref.watch(voidedSalesNotifierProvider);

    return salesState.when(
      data: (state) {
        if (state is SalesListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SalesListError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.failure.toString()}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(voidedSalesNotifierProvider.notifier).refresh();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final loaded = state as SalesListLoaded;
        if (loaded.sales.isEmpty) {
          return const Center(
            child: Text('No voided sales'),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(voidedSalesNotifierProvider.notifier).refresh();
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter < 200 &&
                  loaded.hasMore &&
                  !loaded.isLoadingMore) {
                ref.read(voidedSalesNotifierProvider.notifier).loadMore();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: loaded.sales.length + (loaded.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= loaded.sales.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return _SaleListTile(
                  sale: loaded.sales[index],
                  showVoidButton: false,
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

class _SaleListTile extends ConsumerWidget {
  final Sale sale;
  final bool showVoidButton;

  const _SaleListTile({
    required this.sale,
    required this.showVoidButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = DateFormat('MMM d, yyyy HH:mm');
    final voidState = ref.watch(voidSaleNotifierProvider);
    final isVoiding = voidState is VoidSaleProcessing;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => _showSaleDetails(context, sale),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Sale info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₱${sale.totalAmount.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${sale.totalItems} items • ${sale.paymentMethod.displayName}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          dateFormat.format(sale.createdAt),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        if (!sale.isSynced) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Pending sync',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.orange[800],
                                    fontSize: 10,
                                  ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              // Void button
              if (showVoidButton)
                IconButton(
                  icon: isVoiding
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.cancel_outlined),
                  onPressed: isVoiding
                      ? null
                      : () => _showVoidConfirmation(context, ref, sale),
                  tooltip: 'Void sale',
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSaleDetails(BuildContext context, Sale sale) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => _SaleDetailsSheet(
          sale: sale,
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _showVoidConfirmation(BuildContext context, WidgetRef ref, Sale sale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Void Sale'),
        content: Text(
          'Are you sure you want to void this sale of ₱${sale.totalAmount.toStringAsFixed(0)}?\n\nThis will restore the stock for all items.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(voidSaleNotifierProvider.notifier).voidSale(sale.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Void Sale'),
          ),
        ],
      ),
    );
  }
}

class _SaleDetailsSheet extends StatelessWidget {
  final Sale sale;
  final ScrollController scrollController;

  const _SaleDetailsSheet({
    required this.sale,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMMM d, yyyy HH:mm');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            'Sale Details',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            dateFormat.format(sale.createdAt),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const Divider(height: 24),

          // Items
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: sale.saleItems.length,
              itemBuilder: (context, index) {
                final item = sale.saleItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product?.name ?? 'Product',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${item.variantDisplayName} • ${item.quantityDisplay}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '₱${item.totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Summary
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₱${sale.totalAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Payment Method'),
              Text(sale.paymentMethod.displayName),
            ],
          ),
          if (sale.isVoid && sale.voidedAt != null) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Voided',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  dateFormat.format(sale.voidedAt!),
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
