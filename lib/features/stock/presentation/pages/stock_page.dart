import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart' as esc_pos;
import '../../../printer/presentation/providers/printer_provider.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/providers/product_provider.dart';
import '../../domain/entities/stock_statistics.dart';
import '../providers/stock_provider.dart';
import '../widgets/transfer_dialog.dart';
import '../widgets/transfer_list_widget.dart';

/// Main stock page with statistics printing and transfer functionality.
class StockPage extends ConsumerStatefulWidget {
  const StockPage({super.key});

  @override
  ConsumerState<StockPage> createState() => _StockPageState();
}

class _StockPageState extends ConsumerState<StockPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Set dates to start/end of today
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, now.day);
    _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    // Load initial statistics
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(stockStatisticsNotifierProvider.notifier).loadStatistics(
            filter: StockFilter(startDate: _startDate, endDate: _endDate),
          );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Print Stock'),
            Tab(text: 'Transfer'),
            Tab(text: 'Transfer History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPrintStockTab(),
          _buildTransferTab(),
          const TransferListWidget(),
        ],
      ),
    );
  }

  // ============================================================================
  // PRINT STOCK TAB
  // ============================================================================

  Widget _buildPrintStockTab() {
    final statisticsState = ref.watch(stockStatisticsNotifierProvider);

    return Column(
      children: [
        // Date selection bar
        _buildDateSelectionBar(),
        // Statistics content
        Expanded(
          child: _buildStatisticsContent(statisticsState),
        ),
      ],
    );
  }

  Widget _buildDateSelectionBar() {
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.card,
      child: Row(
        children: [
          Expanded(
            child: _buildDateButton(
              label: 'Start Date',
              date: _startDate,
              dateFormat: dateFormat,
              onTap: () => _selectDate(isStart: true),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildDateButton(
              label: 'End Date',
              date: _endDate,
              dateFormat: dateFormat,
              onTap: () => _selectDate(isStart: false),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: _loadStatistics,
            icon: const Icon(Icons.search),
            label: const Text('Load'),
          ),
        ],
      ),
    );
  }

  Widget _buildDateButton({
    required String label,
    required DateTime date,
    required DateFormat dateFormat,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dateFormat.format(date),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate({required bool isStart}) async {
    final initialDate = isStart ? _startDate : _endDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = DateTime(picked.year, picked.month, picked.day);
          // Ensure end date is not before start date
          if (_endDate.isBefore(_startDate)) {
            _endDate = DateTime(
                picked.year, picked.month, picked.day, 23, 59, 59, 999);
          }
        } else {
          _endDate =
              DateTime(picked.year, picked.month, picked.day, 23, 59, 59, 999);
          // Ensure start date is not after end date
          if (_startDate.isAfter(_endDate)) {
            _startDate = DateTime(picked.year, picked.month, picked.day);
          }
        }
      });
    }
  }

  void _loadStatistics() {
    ref.read(stockStatisticsNotifierProvider.notifier).loadStatistics(
          filter: StockFilter(startDate: _startDate, endDate: _endDate),
        );
  }

  Widget _buildStatisticsContent(StockStatisticsState state) {
    if (state is StockStatisticsInitial) {
      return const Center(
        child: Text('Select a date range and click Load'),
      );
    }

    if (state is StockStatisticsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is StockStatisticsError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${state.failure.message}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadStatistics,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is StockStatisticsLoaded) {
      final stats = state.statistics;

      if (!stats.hasData) {
        return const Center(
          child: Text('No stock data for the selected date range'),
        );
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date range display
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(stats.dateRange),
                subtitle: const Text('Selected Date Range'),
              ),
            ),
            const SizedBox(height: 16),

            // Regular products section
            if (stats.regularProducts.isNotEmpty) ...[
              _buildStockSection(
                title: 'Regular/Asin Products',
                products: stats.regularProducts,
                totals: stats.regularTotals,
                printerLines: stats.regularPrinterLines,
              ),
              const SizedBox(height: 16),
            ],

            // Plastic products section
            if (stats.plasticProducts.isNotEmpty) ...[
              _buildStockSection(
                title: 'Plastic Products',
                products: stats.plasticProducts,
                totals: stats.plasticTotals,
                printerLines: stats.plasticPrinterLines,
              ),
            ],

            const SizedBox(height: 24),

            // Print buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _printStatistics(stats, regularOnly: true),
                    icon: const Icon(Icons.print),
                    label: const Text('Print Regular'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _printStatistics(stats, plasticOnly: true),
                    icon: const Icon(Icons.print),
                    label: const Text('Print Plastic'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _printStatistics(stats),
                icon: const Icon(Icons.print),
                label: const Text('Print All'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildStockSection({
    required String title,
    required List<ProductStock> products,
    required StockTotals totals,
    required List<String> printerLines,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            // Header row
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Text('Product',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text('Sold',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text('Kahon',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text('Other',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text('Total',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const Divider(),
            // Product rows
            ...products.map((p) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text(p.productName)),
                      Expanded(
                          flex: 1,
                          child: Text(p.sold.toStringAsFixed(0),
                              textAlign: TextAlign.right)),
                      Expanded(
                          flex: 1,
                          child: Text(p.transferredKahon.toStringAsFixed(0),
                              textAlign: TextAlign.right)),
                      Expanded(
                          flex: 1,
                          child: Text(p.otherTransfers.toStringAsFixed(0),
                              textAlign: TextAlign.right)),
                      Expanded(
                          flex: 1,
                          child: Text(p.total.toStringAsFixed(0),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                )),
            const Divider(),
            // Totals row
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Text('TOTAL',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text(totals.sold.toStringAsFixed(0),
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text(totals.transferredKahon.toStringAsFixed(0),
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text(totals.otherTransfers.toStringAsFixed(0),
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Text(totals.total.toStringAsFixed(0),
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _printStatistics(
    StockStatistics stats, {
    bool regularOnly = false,
    bool plasticOnly = false,
  }) async {
    // Get printer list
    final printerListState = ref.read(printerListNotifierProvider);
    final printers = printerListState is PrinterListReady
        ? (printerListState).printers
        : printerListState is PrinterListScanning
            ? (printerListState).printers
            : <PrinterDevice>[];

    if (printers.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('No printer connected. Please connect a printer first.'),
        ),
      );
      return;
    }

    // Use the first connected printer
    final printer = printers.first;

    // Build receipt
    final builder = esc_pos.ReceiptBuilder()
        .paperSize(esc_pos.PaperSize.mm57)
        .header('STOCK REPORT')
        .separator()
        .text(stats.dateRange, align: esc_pos.TextAlign.center)
        .separator();

    // Add regular products
    if (!plasticOnly && stats.regularPrinterLines.isNotEmpty) {
      for (final line in stats.regularPrinterLines) {
        builder.text(line);
      }
      builder.empty();
    }

    // Add plastic products
    if (!regularOnly && stats.plasticPrinterLines.isNotEmpty) {
      for (final line in stats.plasticPrinterLines) {
        builder.text(line);
      }
    }

    builder.separator().empty();

    final receipt = builder.build();

    // Print
    await ref.read(printerNotifierProvider.notifier).printReceipt(
          printer,
          receipt,
        );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Stock report sent to printer')),
    );
  }

  // ============================================================================
  // TRANSFER TAB
  // ============================================================================

  Widget _buildTransferTab() {
    final productListState = ref.watch(productListNotifierProvider);

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              ref
                  .read(productListNotifierProvider.notifier)
                  .setSearchQuery(value);
            },
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
                      Text('Error: ${state.failure.message}'),
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
                return const Center(child: Text('No products found'));
              }

              return _buildProductGrid(loaded.products);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Error: $error')),
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return InkWell(
      onTap: () => _showTransferDialog(product),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getCategoryColor(product.category).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getCategoryIcon(product.category),
                color: _getCategoryColor(product.category),
              ),
            ),
            const SizedBox(height: 8),
            // Product name
            Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            // Stock info
            Text(
              _getStockInfo(product),
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(ProductCategory category) {
    switch (category) {
      case ProductCategory.normal:
        return Colors.blue;
      case ProductCategory.asin:
        return Colors.green;
      case ProductCategory.plastic:
        return Colors.orange;
    }
  }

  IconData _getCategoryIcon(ProductCategory category) {
    switch (category) {
      case ProductCategory.normal:
        return Icons.inventory_2;
      case ProductCategory.asin:
        return Icons.rice_bowl;
      case ProductCategory.plastic:
        return Icons.shopping_bag;
    }
  }

  String _getStockInfo(Product product) {
    if (product.sackPrices.isNotEmpty) {
      final totalStock = product.sackPrices.fold<double>(
        0,
        (sum, sp) => sum + sp.stock,
      );
      return '${totalStock.toStringAsFixed(0)} in stock';
    }
    if (product.perKiloPrice != null) {
      return '${product.perKiloPrice!.stock.toStringAsFixed(1)} kg';
    }
    return 'No stock';
  }

  void _showTransferDialog(Product product) {
    showDialog(
      context: context,
      builder: (context) => TransferDialog(product: product),
    );
  }
}
