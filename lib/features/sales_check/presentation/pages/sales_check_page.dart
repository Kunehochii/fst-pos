import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_card.dart';
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.foreground,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Sales Check',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _showFilters ? Icons.filter_alt_off : Icons.filter_alt,
              color:
                  _showFilters ? AppColors.primary : AppColors.mutedForeground,
            ),
            tooltip: _showFilters ? 'Hide Filters' : 'Show Filters',
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.mutedForeground),
            tooltip: 'Refresh',
            onPressed: () {
              ref.read(salesCheckNotifierProvider.notifier).refresh();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.mutedForeground,
              indicatorColor: AppColors.primary,
              indicatorWeight: 2,
              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              tabs: SalesCheckViewType.values.map((type) {
                return Tab(
                  text: type.displayName,
                );
              }).toList(),
            ),
          ),
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
    final theme = Theme.of(context);

    if (state is SalesCheckLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              'Loading sales data...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.mutedForeground,
              ),
            ),
          ],
        ),
      );
    }

    if (state is SalesCheckError) {
      return Center(
        child: AppCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.destructive.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppColors.radiusLg),
                ),
                child: const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.destructive,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Error loading sales',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.failure.toString(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AppButton.primary(
                onPressed: () {
                  ref.read(salesCheckNotifierProvider.notifier).refresh();
                },
                icon: const Icon(Icons.refresh, size: 18),
                child: const Text('Retry'),
              ),
            ],
          ),
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.muted,
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 16,
                      color: AppColors.mutedForeground,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        viewType.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.mutedForeground,
                            ),
                      ),
                    ),
                  ],
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
    final theme = Theme.of(context);

    return Center(
      child: AppCard(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.destructive.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppColors.radiusLg),
              ),
              child: const Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.destructive,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Something went wrong',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AppButton.primary(
              onPressed: () {
                ref.read(salesCheckNotifierProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh, size: 18),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
