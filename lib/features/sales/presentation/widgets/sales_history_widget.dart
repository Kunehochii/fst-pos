import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/sale.dart';
import '../providers/sales_provider.dart';

/// Sales history widget with pagination and void functionality.
///
/// "Aura Daybreak" design:
/// - Clean white cards with subtle borders
/// - Orange accents for key information
/// - Consistent spacing and typography
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
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            border: Border(
              bottom: BorderSide(color: AppColors.border, width: 1),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.mutedForeground,
            indicatorColor: AppColors.primary,
            indicatorWeight: 2,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Voided'),
            ],
          ),
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

    return Container(
      color: AppColors.background,
      child: salesState.when(
        data: (state) {
          if (state is SalesListLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is SalesListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: AppColors.destructive,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.failure.toString()}',
                    style: TextStyle(color: AppColors.foreground),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(salesHistoryNotifierProvider.notifier).refresh();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.primaryForeground,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final loaded = state as SalesListLoaded;
          if (loaded.sales.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 48,
                    color: AppColors.mutedForeground,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No sales yet',
                    style: TextStyle(
                      color: AppColors.mutedForeground,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
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
                padding: const EdgeInsets.all(12),
                itemCount: loaded.sales.length + (loaded.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= loaded.sales.length) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
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
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (error, _) => Center(
          child: Text(
            'Error: $error',
            style: TextStyle(color: AppColors.destructive),
          ),
        ),
      ),
    );
  }
}

class _VoidedSalesTab extends ConsumerWidget {
  const _VoidedSalesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesState = ref.watch(voidedSalesNotifierProvider);

    return Container(
      color: AppColors.background,
      child: salesState.when(
        data: (state) {
          if (state is SalesListLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is SalesListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: AppColors.destructive,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.failure.toString()}',
                    style: TextStyle(color: AppColors.foreground),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(voidedSalesNotifierProvider.notifier).refresh();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.primaryForeground,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final loaded = state as SalesListLoaded;
          if (loaded.sales.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: 48,
                    color: AppColors.mutedForeground,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No voided sales',
                    style: TextStyle(
                      color: AppColors.mutedForeground,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
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
                padding: const EdgeInsets.all(12),
                itemCount: loaded.sales.length + (loaded.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= loaded.sales.length) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
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
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (error, _) => Center(
          child: Text(
            'Error: $error',
            style: TextStyle(color: AppColors.destructive),
          ),
        ),
      ),
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

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showSaleDetails(context, sale),
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          hoverColor: AppColors.accent,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Sale info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₱${sale.totalAmount.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${sale.totalItems} items • ${sale.paymentMethod.displayName}',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            dateFormat.format(sale.createdAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedForeground,
                            ),
                          ),
                          if (!sale.isSynced) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.warning.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Pending sync',
                                style: TextStyle(
                                  color: AppColors.warning,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
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
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.muted,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: isVoiding
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.destructive,
                              ),
                            )
                          : Icon(
                              Icons.cancel_outlined,
                              color: AppColors.destructive,
                            ),
                      onPressed: isVoiding
                          ? null
                          : () => _showVoidConfirmation(context, ref, sale),
                      tooltip: 'Void sale',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSaleDetails(BuildContext context, Sale sale) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) => _SaleDetailsSheet(
            sale: sale,
            scrollController: scrollController,
          ),
        ),
      ),
    );
  }

  void _showVoidConfirmation(BuildContext context, WidgetRef ref, Sale sale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: Text(
          'Void Sale',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to void this sale of ₱${sale.totalAmount.toStringAsFixed(0)}?\n\nThis will restore the stock for all items.',
          style: TextStyle(color: AppColors.mutedForeground),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.mutedForeground,
            ),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(voidSaleNotifierProvider.notifier).voidSale(sale.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.destructive,
              foregroundColor: Colors.white,
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

    return Padding(
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
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            'Sale Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            dateFormat.format(sale.createdAt),
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),

          // Items
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: sale.saleItems.length,
              itemBuilder: (context, index) {
                final item = sale.saleItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product?.name ?? 'Product',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.foreground,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${item.variantDisplayName} • ${item.quantityDisplay}',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '₱${item.totalPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Summary
          Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              Text(
                '₱${sale.totalAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Method',
                style: TextStyle(color: AppColors.mutedForeground),
              ),
              Text(
                sale.paymentMethod.displayName,
                style: TextStyle(color: AppColors.foreground),
              ),
            ],
          ),
          if (sale.isVoid && sale.voidedAt != null) ...[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Voided',
                  style: TextStyle(
                    color: AppColors.destructive,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  dateFormat.format(sale.voidedAt!),
                  style: TextStyle(color: AppColors.destructive),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
