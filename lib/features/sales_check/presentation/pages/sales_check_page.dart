import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/grouped_sale.dart';
import '../providers/sales_check_provider.dart';
import '../widgets/grouped_sales_list.dart';
import '../widgets/sales_check_filter_widget.dart';
import '../widgets/sales_summary_card.dart';

/// Main sales check page with category tabs and filtering.
class SalesCheckPage extends ConsumerStatefulWidget {
  const SalesCheckPage({super.key});

  @override
  ConsumerState<SalesCheckPage> createState() => _SalesCheckPageState();
}

class _SalesCheckPageState extends ConsumerState<SalesCheckPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFilters = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: SalesCheckViewType.values.length,
      vsync: this,
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final viewType = SalesCheckViewType.values[_tabController.index];
        ref
            .read(salesCheckViewTypeNotifierProvider.notifier)
            .setViewType(viewType);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesState = ref.watch(salesCheckNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Check'),
        actions: [
          IconButton(
            icon: Icon(_showFilters ? Icons.filter_alt_off : Icons.filter_alt),
            tooltip: _showFilters ? 'Hide Filters' : 'Show Filters',
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              ref.read(salesCheckNotifierProvider.notifier).refresh();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: SalesCheckViewType.values.map((type) {
            return Tab(
              text: type.displayName,
            );
          }).toList(),
        ),
      ),
      body: Column(
        children: [
          // Filters (collapsible)
          AnimatedCrossFade(
            firstChild: const SalesCheckFilterWidget(),
            secondChild: const SizedBox.shrink(),
            crossFadeState: _showFilters
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),

          // Content
          Expanded(
            child: salesState.when(
              data: (state) => _buildContent(state),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => _buildError(error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(SalesCheckState state) {
    if (state is SalesCheckLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is SalesCheckError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading sales',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              state.failure.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(salesCheckNotifierProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final loaded = state as SalesCheckLoaded;
    final viewType = ref.watch(salesCheckViewTypeNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(salesCheckNotifierProvider.notifier).refresh();
      },
      child: CustomScrollView(
        slivers: [
          // Summary card
          SliverToBoxAdapter(
            child: SalesSummaryCard(
              summary: loaded.summary,
              isOfflineData: loaded.isOfflineData,
            ),
          ),

          // View type description
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                viewType.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
          ),

          // Sales list
          SliverFillRemaining(
            child: GroupedSalesList(
              groupedSales: loaded.groupedSales,
              viewType: viewType,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(salesCheckNotifierProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
