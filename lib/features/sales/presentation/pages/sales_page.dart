import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/providers/product_provider.dart';
import '../providers/sales_provider.dart';
import '../widgets/add_to_cart_page.dart';
import '../widgets/cart_widget.dart';
import '../widgets/product_grid.dart';
import '../widgets/sales_history_widget.dart';

/// Main sales page with product list and cart.
///
/// "Aura Daybreak" design:
/// - White AppBar with subtle shadow
/// - Orange accent for tabs and badges
/// - Clean layout with proper borders
class SalesPage extends ConsumerStatefulWidget {
  const SalesPage({super.key});

  @override
  ConsumerState<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends ConsumerState<SalesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  ProductCategory? _selectedCategory;

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
    final pendingSyncCount = ref.watch(pendingSalesCountProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sales',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Show pending sync count and sync button
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
                        tooltip: 'Sync $count pending sales',
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
                Tab(text: 'New Sale'),
                Tab(text: 'Sales History'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewSaleTab(),
          _buildSalesHistoryTab(),
        ],
      ),
    );
  }

  Widget _buildNewSaleTab() {
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
                child: _buildCartSection(),
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
                            .setSearchQuery(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.muted,
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: PopupMenuButton<ProductCategory?>(
                    icon: Icon(
                      Icons.filter_list,
                      color: AppColors.foreground,
                    ),
                    tooltip: 'Filter by category',
                    initialValue: _selectedCategory,
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
                      const PopupMenuItem(
                        value: ProductCategory.normal,
                        child: Text('Normal'),
                      ),
                      const PopupMenuItem(
                        value: ProductCategory.asin,
                        child: Text('Asin'),
                      ),
                      const PopupMenuItem(
                        value: ProductCategory.plastic,
                        child: Text('Plastic'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Border under search
          Container(
            height: 1,
            color: AppColors.border,
          ),
          // Product grid
          Expanded(
            child: productListState.when(
              data: (state) {
                if (state is ProductListLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                if (state is ProductListError) {
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
                            ref
                                .read(productListNotifierProvider.notifier)
                                .refresh();
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

                final loaded = state as ProductListLoaded;
                if (loaded.products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 48,
                          color: AppColors.mutedForeground,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No products found',
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
                    await ref
                        .read(productListNotifierProvider.notifier)
                        .refresh();
                  },
                  child: ProductGrid(
                    products: loaded.products,
                    onProductTap: (product) => _showAddToCartScreen(product),
                  ),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
              error: (error, _) => Center(
                child: Text(
                  'Error: $error',
                  style: TextStyle(color: AppColors.destructive),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartSection() {
    return const CartWidget();
  }

  Widget _buildMiniCart() {
    final cartState = ref.watch(cartNotifierProvider);

    if (cartState.isEmpty) {
      return const SizedBox.shrink();
    }

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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${cartState.itemCount} items',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedForeground,
                  ),
                ),
                Text(
                  '₱${cartState.totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _showCartBottomSheet(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.primaryForeground,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
              ),
            ),
            child: const Text('View Cart'),
          ),
        ],
      ),
    );
  }

  void _showCartBottomSheet() {
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
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) => const CartWidget(),
        ),
      ),
    );
  }

  void _showSyncDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const _SyncPendingSalesDialog(),
    );
  }

  void _showAddToCartScreen(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => AddToCartPage(product: product),
      ),
    );
  }

  Widget _buildSalesHistoryTab() {
    return const SalesHistoryWidget();
  }
}

/// Dialog for syncing pending sales.
class _SyncPendingSalesDialog extends ConsumerStatefulWidget {
  const _SyncPendingSalesDialog();

  @override
  ConsumerState<_SyncPendingSalesDialog> createState() =>
      _SyncPendingSalesDialogState();
}

class _SyncPendingSalesDialogState
    extends ConsumerState<_SyncPendingSalesDialog> {
  @override
  void initState() {
    super.initState();
    // Start sync automatically when dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(syncSalesNotifierProvider.notifier).syncPendingSales();
    });
  }

  @override
  Widget build(BuildContext context) {
    final syncState = ref.watch(syncSalesNotifierProvider);

    return AlertDialog(
      backgroundColor: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppColors.radiusLg),
      ),
      title: Text(
        'Sync Pending Sales',
        style: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: syncState is SyncSalesSyncing
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  'Syncing pending sales...',
                  style: TextStyle(color: AppColors.mutedForeground),
                ),
              ],
            )
          : syncState is SyncSalesSuccess
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: AppColors.success,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Successfully synced ${syncState.count} sales',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : syncState is SyncSalesError
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.destructive.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.error,
                            color: AppColors.destructive,
                            size: 48,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Failed to sync: ${syncState.failure.message}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.foreground),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
      actions: [
        if (syncState is SyncSalesSuccess || syncState is SyncSalesError)
          TextButton(
            onPressed: () {
              ref.read(syncSalesNotifierProvider.notifier).reset();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.mutedForeground,
            ),
            child: const Text('Close'),
          ),
        if (syncState is SyncSalesError)
          ElevatedButton(
            onPressed: () {
              ref.read(syncSalesNotifierProvider.notifier).syncPendingSales();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.primaryForeground,
            ),
            child: const Text('Retry'),
          ),
      ],
    );
  }
}
