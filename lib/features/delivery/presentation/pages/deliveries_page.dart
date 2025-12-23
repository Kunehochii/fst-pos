import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/providers/product_provider.dart';
import '../../domain/entities/delivery.dart';
import '../providers/delivery_provider.dart';
import '../widgets/delivery_add_to_cart_page.dart';
import '../widgets/delivery_cart_widget.dart';
import '../widgets/delivery_detail_dialog.dart';
import '../widgets/delivery_product_grid.dart';

/// Main deliveries page with product grid and cart for creating new deliveries.
///
/// "Aura Daybreak" design:
/// - White AppBar with subtle shadow
/// - Primary accent for tabs and badges
/// - Clean layout with proper borders
class DeliveriesPage extends ConsumerStatefulWidget {
  const DeliveriesPage({super.key});

  @override
  ConsumerState<DeliveriesPage> createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends ConsumerState<DeliveriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  ProductCategory? _selectedCategory;
  DateTimeRange? _dateRange;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pendingSyncCount = ref.watch(pendingDeliverySyncCountProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Deliveries',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Show pending sync count
          pendingSyncCount.when(
            data: (count) => count > 0
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Center(
                      child: IconButton(
                        icon: Badge(
                          backgroundColor: AppColors.primary,
                          textColor: Colors.white,
                          label: Text('$count'),
                          child: Icon(
                            Icons.sync,
                            color: AppColors.foreground,
                          ),
                        ),
                        onPressed: () => _showSyncDialog(context),
                        tooltip: 'Sync $count pending deliveries',
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
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
                Tab(text: 'New Delivery'),
                Tab(text: 'Delivery History'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewDeliveryTab(),
          _buildDeliveryHistoryTab(),
        ],
      ),
    );
  }

  Widget _buildNewDeliveryTab() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive layout
        final isWide = constraints.maxWidth > 800;

        if (isWide) {
          // Wide layout: 60% products, 40% cart
          return Row(
            children: [
              Expanded(
                flex: 6,
                child: _buildProductSection(),
              ),
              // Vertical divider with proper styling
              Container(
                width: 1,
                color: AppColors.border,
              ),
              Expanded(
                flex: 4,
                child: const DeliveryCartWidget(),
              ),
            ],
          );
        } else {
          // Narrow layout: Stack with cart in bottom sheet
          return Column(
            children: [
              Expanded(child: _buildProductSection()),
              _buildMiniCart(),
            ],
          );
        }
      },
    );
  }

  Widget _buildProductSection() {
    final productListState = ref.watch(productListNotifierProvider);

    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          // Search and filter bar
          Container(
            padding: const EdgeInsets.all(12),
            color: AppColors.card,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.muted,
                      borderRadius: BorderRadius.circular(AppColors.radiusSm),
                      border: Border.all(color: AppColors.border, width: 1),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: AppColors.foreground),
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        hintStyle: TextStyle(color: AppColors.mutedForeground),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.mutedForeground,
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: AppColors.mutedForeground,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  ref
                                      .read(
                                          productListNotifierProvider.notifier)
                                      .setSearchQuery(null);
                                  setState(() {});
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onChanged: (value) {
                        ref
                            .read(productListNotifierProvider.notifier)
                            .setSearchQuery(value.isEmpty ? null : value);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Category filter
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.muted,
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: PopupMenuButton<ProductCategory?>(
                    icon: Icon(
                      Icons.filter_list,
                      color: _selectedCategory != null
                          ? AppColors.primary
                          : AppColors.mutedForeground,
                    ),
                    onSelected: (category) {
                      setState(() => _selectedCategory = category);
                      ref
                          .read(productListNotifierProvider.notifier)
                          .setCategory(category);
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: null,
                        child: Text('All Categories'),
                      ),
                      ...ProductCategory.values.map(
                        (cat) => PopupMenuItem(
                          value: cat,
                          child: Text(cat.name.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Product grid
          Expanded(
            child: productListState.when(
              data: (state) {
                if (state is ProductListLoaded) {
                  if (state.products.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 64,
                            color: AppColors.mutedForeground
                                .withValues(alpha: 0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No products found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mutedForeground,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return DeliveryProductGrid(
                    products: state.products,
                    onProductTap: (product) => _openAddToCart(product),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48, color: AppColors.destructive),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load products',
                      style: TextStyle(color: AppColors.mutedForeground),
                    ),
                    TextButton(
                      onPressed: () =>
                          ref.invalidate(productListNotifierProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniCart() {
    final cartState = ref.watch(deliveryCartNotifierProvider);

    if (cartState.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cartState.itemCount} items',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  Text(
                    '${cartState.totalQuantity.toStringAsFixed(cartState.totalQuantity % 1 == 0 ? 0 : 2)} units total',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _showCartBottomSheet(),
              icon: const Icon(Icons.local_shipping),
              label: const Text('View Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.primaryForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCartBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: const DeliveryCartWidget(),
        ),
      ),
    );
  }

  Widget _buildDeliveryHistoryTab() {
    final deliveryListState = ref.watch(deliveryListNotifierProvider);

    return Column(
      children: [
        // Search and filter bar
        _buildHistoryFilterBar(),
        // Delivery list
        Expanded(
          child: deliveryListState.when(
            data: (state) => _buildDeliveryList(state),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => _buildErrorState(error.toString()),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryFilterBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.card,
      child: Row(
        children: [
          // Date range picker
          Expanded(
            child: OutlinedButton.icon(
              icon: Icon(Icons.date_range, color: AppColors.primary),
              label: Text(
                _dateRange != null
                    ? '${DateFormat('MMM d').format(_dateRange!.start)} - ${DateFormat('MMM d').format(_dateRange!.end)}'
                    : 'Select Date Range',
                style: TextStyle(color: AppColors.foreground),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.border),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onPressed: () => _showDateRangePicker(),
            ),
          ),
          if (_dateRange != null) ...[
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.clear, color: AppColors.mutedForeground),
              onPressed: () {
                setState(() => _dateRange = null);
                ref
                    .read(deliveryListNotifierProvider.notifier)
                    .setDateRange(null, null);
              },
            ),
          ],
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.refresh, color: AppColors.primary),
            onPressed: () =>
                ref.read(deliveryListNotifierProvider.notifier).refresh(),
          ),
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
          padding: const EdgeInsets.all(16),
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
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange.shade700),
                  const SizedBox(width: 8),
                  Text(
                    'Showing cached data. Connection issue.',
                    style: TextStyle(color: Colors.orange.shade900),
                  ),
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

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _showDeliveryDetail(delivery),
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
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
                        Row(
                          children: [
                            Icon(
                              Icons.local_shipping,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                delivery.driverName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.foreground,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dateFormat
                              .format(delivery.deliveryTimeStart.toLocal()),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${delivery.totalItems} ${delivery.totalItems == 1 ? 'item' : 'items'}',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Preview of items
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: delivery.deliveryItems
                    .take(3)
                    .map((item) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.muted,
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                          ),
                          child: Text(
                            '${item.product?.name ?? 'Product'} (${item.quantity.toStringAsFixed(0)})',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.foreground,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              if (delivery.deliveryItems.length > 3)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '+${delivery.deliveryItems.length - 3} more items',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ),
            ],
          ),
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
            color: AppColors.mutedForeground.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No deliveries yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create a new delivery from the "New Delivery" tab',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedForeground,
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
            color: AppColors.destructive,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading deliveries',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.primaryForeground,
            ),
            onPressed: () {
              ref.read(deliveryListNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
    );
  }

  void _openAddToCart(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => DeliveryAddToCartPage(product: product),
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

  void _showSyncDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
        ),
        title: Text(
          'Sync Pending Deliveries',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'This will attempt to sync all pending deliveries with the server.',
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
              ref.read(deliveryListNotifierProvider.notifier).syncWithServer();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.primaryForeground,
            ),
            child: const Text('Sync Now'),
          ),
        ],
      ),
    );
  }

  void _showDeliveryDetail(Delivery delivery) {
    showDialog(
      context: context,
      builder: (context) => DeliveryDetailDialog(delivery: delivery),
    );
  }
}
