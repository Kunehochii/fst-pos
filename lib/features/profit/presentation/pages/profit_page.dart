import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/grouped_profit.dart';
import '../providers/profit_provider.dart';
import '../widgets/grouped_profits_list.dart';
import '../widgets/profit_filter_widget.dart';
import '../widgets/profit_summary_card.dart';

/// Main profit page with category tabs and filtering.
///
/// Follows the "Aura Daybreak" design with:
/// - Clean white cards with subtle borders
/// - Vivid Orange accent for tabs and actions
/// - Cool White background
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profit',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.foreground),
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
            icon: Icon(Icons.refresh, color: AppColors.foreground),
            tooltip: 'Refresh',
            onPressed: () {
              ref.read(profitNotifierProvider.notifier).refresh();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: BoxDecoration(
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
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              tabs: ProfitViewType.values.map((type) {
                return Tab(text: type.displayName);
              }).toList(),
            ),
          ),
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
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (error, stack) => _buildError(error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ProfitState state) {
    if (state is ProfitLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (state is ProfitError) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppColors.radiusLg),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.destructive.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppColors.radiusMd),
                ),
                child: Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.destructive,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Error loading profits',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.failure.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(profitNotifierProvider.notifier).refresh();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.primaryForeground,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  ),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final loaded = state as ProfitLoaded;
    final viewType = ref.watch(profitViewTypeNotifierProvider);

    return RefreshIndicator(
      color: AppColors.primary,
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: AppColors.mutedForeground,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      viewType.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ),
                ],
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
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.destructive.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppColors.radiusMd),
              ),
              child: Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.destructive,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(profitNotifierProvider.notifier).refresh();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.primaryForeground,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
