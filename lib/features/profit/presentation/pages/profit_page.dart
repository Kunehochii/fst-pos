import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/grouped_profit.dart';
import '../providers/profit_provider.dart';
import '../widgets/grouped_profits_list.dart';
import '../widgets/profit_filter_widget.dart';
import '../widgets/profit_summary_card.dart';

/// Main profit page with category tabs and filtering.
class ProfitPage extends ConsumerStatefulWidget {
  const ProfitPage({super.key});

  @override
  ConsumerState<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends ConsumerState<ProfitPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFilters = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: ProfitViewType.values.length,
      vsync: this,
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final viewType = ProfitViewType.values[_tabController.index];
        ref.read(profitViewTypeNotifierProvider.notifier).setViewType(viewType);
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
    final profitState = ref.watch(profitNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profit'),
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
              ref.read(profitNotifierProvider.notifier).refresh();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: ProfitViewType.values.map((type) {
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
            firstChild: const ProfitFilterWidget(),
            secondChild: const SizedBox.shrink(),
            crossFadeState: _showFilters
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),

          // Content
          Expanded(
            child: profitState.when(
              data: (state) => _buildContent(state),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => _buildError(error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ProfitState state) {
    if (state is ProfitLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ProfitError) {
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
              'Error loading profits',
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
                ref.read(profitNotifierProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final loaded = state as ProfitLoaded;
    final viewType = ref.watch(profitViewTypeNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(profitNotifierProvider.notifier).refresh();
      },
      child: CustomScrollView(
        slivers: [
          // Summary card
          SliverToBoxAdapter(
            child: ProfitSummaryCard(
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

          // Profits list
          SliverFillRemaining(
            child: GroupedProfitsList(
              groupedProfits: loaded.groupedProfits,
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
              ref.read(profitNotifierProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
