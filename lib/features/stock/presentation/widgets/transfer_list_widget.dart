import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
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
      color: AppColors.muted,
      child: Column(
        children: [
          // Date range
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _selectDate(isStart: true),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.card,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 18),
                        const SizedBox(width: 8),
                        Text(_startDate != null
                            ? dateFormat.format(_startDate!)
                            : 'Start Date'),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('to'),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => _selectDate(isStart: false),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.card,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 18),
                        const SizedBox(width: 8),
                        Text(_endDate != null
                            ? dateFormat.format(_endDate!)
                            : 'End Date'),
                      ],
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
                child: DropdownButtonFormField<TransferType?>(
                  value: _selectedType,
                  decoration: InputDecoration(
                    labelText: 'Transfer Type',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppColors.card,
                  ),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text('All Types')),
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
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Apply Filters',
                onPressed: _applyFilters,
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                tooltip: 'Clear Filters',
                onPressed: _clearFilters,
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
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

  Widget _buildSyncIndicator() {
    final pendingSyncCount = ref.watch(pendingTransferSyncCountProvider);

    return pendingSyncCount.when(
      data: (count) {
        if (count == 0) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.orange.shade100,
          child: Row(
            children: [
              const Icon(Icons.cloud_upload, size: 18, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                '$count transfer(s) pending sync',
                style: const TextStyle(color: Colors.orange),
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
      return const Center(child: CircularProgressIndicator());
    }

    if (state is TransferListError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${state.failure.message}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  ref.read(transferListNotifierProvider.notifier).refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is TransferListLoaded) {
      if (state.transfers.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.swap_horiz, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No transfers found'),
              SizedBox(height: 8),
              Text(
                'Transfers will appear here when you move stock',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(transferListNotifierProvider.notifier).refresh();
        },
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

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _getTypeColor(transfer.type).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getTypeIcon(transfer.type),
            color: _getTypeColor(transfer.type),
          ),
        ),
        title: Text(
          transfer.product?.name ?? 'Unknown Product',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getTypeColor(transfer.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    transfer.type.displayName,
                    style: TextStyle(
                      fontSize: 11,
                      color: _getTypeColor(transfer.type),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  transfer.priceTypeDisplay,
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              dateFormat.format(transfer.createdAt),
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mutedForeground,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${transfer.quantity.toStringAsFixed(transfer.quantity == transfer.quantity.toInt() ? 0 : 1)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              transfer.isSackPrice ? 'sacks' : 'kg',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mutedForeground,
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text('Error: $error'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(transferListNotifierProvider.notifier).refresh(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(TransferType type) {
    switch (type) {
      case TransferType.kahon:
        return Colors.blue;
      case TransferType.ownConsumption:
        return Colors.orange;
      case TransferType.returnToWarehouse:
        return Colors.green;
      case TransferType.repack:
        return Colors.purple;
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
