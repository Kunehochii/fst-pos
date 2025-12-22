import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/transfer.dart';
import '../providers/stock_provider.dart';

/// Widget displaying the list of transfers with filtering.
class TransferListWidget extends ConsumerStatefulWidget {
  const TransferListWidget({super.key});

  @override
  ConsumerState<TransferListWidget> createState() => _TransferListWidgetState();
}

class _TransferListWidgetState extends ConsumerState<TransferListWidget> {
  DateTime? _startDate;
  DateTime? _endDate;
  TransferType? _selectedType;

  @override
  Widget build(BuildContext context) {
    final transferListState = ref.watch(transferListNotifierProvider);

    return Column(
      children: [
        // Filter bar
        _buildFilterBar(),
        // Sync indicator
        _buildSyncIndicator(),
        // Transfer list
        Expanded(
          child: transferListState.when(
            data: (state) => _buildTransferList(state),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => _buildErrorState(error.toString()),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterBar() {
    final dateFormat = DateFormat('MMM dd');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Date range
          Row(
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _selectDate(isStart: true),
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                        color: AppColors.card,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: AppColors.mutedForeground,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _startDate != null
                                  ? dateFormat.format(_startDate!)
                                  : 'Start Date',
                              style: TextStyle(
                                fontSize: 14,
                                color: _startDate != null
                                    ? AppColors.foreground
                                    : AppColors.mutedForeground,
                                fontWeight: _startDate != null
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'to',
                  style: TextStyle(
                    color: AppColors.mutedForeground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _selectDate(isStart: false),
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                        color: AppColors.card,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: AppColors.mutedForeground,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _endDate != null
                                  ? dateFormat.format(_endDate!)
                                  : 'End Date',
                              style: TextStyle(
                                fontSize: 14,
                                color: _endDate != null
                                    ? AppColors.foreground
                                    : AppColors.mutedForeground,
                                fontWeight: _endDate != null
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Type filter + actions
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.muted,
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<TransferType?>(
                      value: _selectedType,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.mutedForeground,
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.foreground,
                      ),
                      hint: const Text(
                        'All Types',
                        style: TextStyle(
                          color: AppColors.mutedForeground,
                          fontSize: 14,
                        ),
                      ),
                      items: [
                        const DropdownMenuItem(
                          value: null,
                          child: Text('All Types'),
                        ),
                        ...TransferType.values.map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type.displayName),
                            )),
                      ],
                      onChanged: (value) {
                        setState(() => _selectedType = value);
                        ref
                            .read(transferListNotifierProvider.notifier)
                            .setTypeFilter(value);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _buildIconButton(
                icon: Icons.search,
                tooltip: 'Apply Filters',
                onPressed: _applyFilters,
                color: AppColors.primary,
              ),
              _buildIconButton(
                icon: Icons.clear,
                tooltip: 'Clear Filters',
                onPressed: _clearFilters,
              ),
              _buildIconButton(
                icon: Icons.refresh,
                tooltip: 'Refresh',
                onPressed: () {
                  ref.read(transferListNotifierProvider.notifier).refresh();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Tooltip(
          message: tooltip,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color?.withValues(alpha: 0.1) ?? AppColors.muted,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: color ?? AppColors.mutedForeground,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSyncIndicator() {
    final pendingSyncCount = ref.watch(pendingTransferSyncCountProvider);

    return pendingSyncCount.when(
      data: (count) {
        if (count == 0) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.warning.withValues(alpha: 0.1),
            border: Border(
              bottom: BorderSide(
                color: AppColors.warning.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 18,
                color: AppColors.warning,
              ),
              const SizedBox(width: 10),
              Text(
                '$count transfer(s) pending sync',
                style: TextStyle(
                  color: AppColors.warning,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildTransferList(TransferListState state) {
    if (state is TransferListLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: 16),
            Text(
              'Loading transfers...',
              style: TextStyle(color: AppColors.mutedForeground),
            ),
          ],
        ),
      );
    }

    if (state is TransferListError) {
      return Center(
        child: AppCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIconBox(
                icon: Icons.error_outline,
                backgroundColor: AppColors.destructive.withValues(alpha: 0.1),
                iconColor: AppColors.destructive,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'Error loading transfers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.failure.message,
                style: const TextStyle(color: AppColors.mutedForeground),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              AppButton.primary(
                onPressed: () =>
                    ref.read(transferListNotifierProvider.notifier).refresh(),
                icon: const Icon(Icons.refresh, size: 18),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (state is TransferListLoaded) {
      if (state.transfers.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconBox(
                icon: Icons.swap_horiz,
                backgroundColor: AppColors.muted,
                iconColor: AppColors.mutedForeground,
                size: 72,
              ),
              const SizedBox(height: 20),
              const Text(
                'No transfers found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Transfers will appear here when you move stock',
                style: TextStyle(
                  color: AppColors.mutedForeground,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(transferListNotifierProvider.notifier).refresh();
        },
        color: AppColors.primary,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.transfers.length,
          itemBuilder: (context, index) {
            final transfer = state.transfers[index];
            return _buildTransferCard(transfer);
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildTransferCard(Transfer transfer) {
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Type icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getTypeColor(transfer.type).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
            ),
            child: Icon(
              _getTypeIcon(transfer.type),
              color: _getTypeColor(transfer.type),
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transfer.product?.name ?? 'Unknown Product',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color:
                            _getTypeColor(transfer.type).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        transfer.type.displayName,
                        style: TextStyle(
                          fontSize: 11,
                          color: _getTypeColor(transfer.type),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.muted,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        transfer.priceTypeDisplay,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.mutedForeground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppColors.mutedForeground,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dateFormat.format(transfer.createdAt),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Quantity
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(AppColors.radiusSm),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${transfer.quantity.toStringAsFixed(transfer.quantity == transfer.quantity.toInt() ? 0 : 1)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  transfer.isSackPrice ? 'sacks' : 'kg',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: AppCard(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIconBox(
              icon: Icons.error_outline,
              backgroundColor: AppColors.destructive.withValues(alpha: 0.1),
              iconColor: AppColors.destructive,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $error',
              style: const TextStyle(color: AppColors.mutedForeground),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppButton.primary(
              onPressed: () =>
                  ref.read(transferListNotifierProvider.notifier).refresh(),
              icon: const Icon(Icons.refresh, size: 18),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(TransferType type) {
    switch (type) {
      case TransferType.kahon:
        return AppColors.info;
      case TransferType.ownConsumption:
        return AppColors.primary;
      case TransferType.returnToWarehouse:
        return AppColors.success;
      case TransferType.repack:
        return const Color(0xFF8B5CF6); // Purple from chart colors
    }
  }

  IconData _getTypeIcon(TransferType type) {
    switch (type) {
      case TransferType.kahon:
        return Icons.inventory_2;
      case TransferType.ownConsumption:
        return Icons.restaurant;
      case TransferType.returnToWarehouse:
        return Icons.undo;
      case TransferType.repack:
        return Icons.autorenew;
    }
  }

  Future<void> _selectDate({required bool isStart}) async {
    final initialDate =
        isStart ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now());
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
        } else {
          _endDate =
              DateTime(picked.year, picked.month, picked.day, 23, 59, 59, 999);
        }
      });
    }
  }

  void _applyFilters() {
    ref
        .read(transferListNotifierProvider.notifier)
        .setDateRange(_startDate, _endDate);
  }

  void _clearFilters() {
    setState(() {
      _startDate = null;
      _endDate = null;
      _selectedType = null;
    });
    ref.read(transferListNotifierProvider.notifier).clearFilters();
  }
}
