import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/providers/product_provider.dart';
import '../providers/sales_provider.dart';
import '../widgets/add_to_cart_page.dart';
import '../widgets/cart_widget.dart';
import '../widgets/product_grid.dart';
import '../widgets/sales_history_widget.dart';

/// Main sales page with product list and cart.
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'New Sale'),
            Tab(text: 'Sales History'),
          ],
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
              const VerticalDivider(width: 1),
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

    return Column(
      children: [
        // Search and filter bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
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
                                  .read(productListNotifierProvider.notifier)
                                  .setSearchQuery(null);
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
                        .read(productListNotifierProvider.notifier)
                        .setSearchQuery(value);
                  },
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<ProductCategory?>(
                icon: const Icon(Icons.filter_list),
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
            ],
          ),
        ),
        // Product grid
        Expanded(
          child: productListState.when(
            data: (state) {
              if (state is ProductListLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductListError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.failure.toString()}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(productListNotifierProvider.notifier)
                              .refresh();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              final loaded = state as ProductListLoaded;
              if (loaded.products.isEmpty) {
                return const Center(
                  child: Text('No products found'),
                );
              }

              return RefreshIndicator(
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
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Error: $error')),
          ),
        ),
      ],
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
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '₱${cartState.totalPrice.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _showCartBottomSheet(),
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
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => const CartWidget(),
      ),
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
