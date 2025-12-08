import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/transfer.dart';
import '../providers/stock_provider.dart';

/// Dialog for creating a transfer.
class TransferDialog extends ConsumerStatefulWidget {
  final Product product;

  const TransferDialog({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<TransferDialog> createState() => _TransferDialogState();
}

class _TransferDialogState extends ConsumerState<TransferDialog> {
  TransferType? _selectedType;
  SackPrice? _selectedSackPrice;
  PerKiloPrice? _selectedPerKiloPrice;
  final _quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createTransferNotifierProvider);

    // Listen for success/error
    ref.listen(createTransferNotifierProvider, (previous, next) {
      if (next is CreateTransferSuccess) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Transfer created: ${next.transfer.quantity} ${_getUnitLabel()}'),
            backgroundColor: Colors.green,
          ),
        );
        ref.read(createTransferNotifierProvider.notifier).reset();
      } else if (next is CreateTransferError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${next.failure.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.swap_horiz,
                    color: AppColors.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Transfer Stock',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            color: AppColors.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Transfer type selection
              const Text(
                'Transfer Type',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildTransferTypeSelector(),
              const SizedBox(height: 16),

              // Price selection (sack or per kilo)
              _buildPriceSelection(),
              const SizedBox(height: 16),

              // Quantity input
              const Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _quantityController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  hintText: 'Enter quantity',
                  suffixText: _getUnitLabel(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  final qty = double.tryParse(value);
                  if (qty == null || qty <= 0) {
                    return 'Please enter a valid quantity';
                  }
                  // Check stock availability
                  final maxStock = _getMaxStock();
                  if (qty > maxStock) {
                    return 'Insufficient stock (max: ${maxStock.toStringAsFixed(1)})';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              // Stock info
              _buildStockInfo(),
              const SizedBox(height: 24),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: createState is CreateTransferLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: createState is CreateTransferLoading
                        ? null
                        : _canSubmit()
                            ? _submitTransfer
                            : null,
                    child: createState is CreateTransferLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Transfer'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransferTypeSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: TransferType.values.map((type) {
        final isSelected = _selectedType == type;
        return ChoiceChip(
          label: Text(type.displayName),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _selectedType = selected ? type : null;
            });
          },
          selectedColor: AppColors.primary.withOpacity(0.2),
          labelStyle: TextStyle(
            color: isSelected ? AppColors.primary : null,
            fontWeight: isSelected ? FontWeight.bold : null,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceSelection() {
    final product = widget.product;
    final hasSackPrices = product.sackPrices.isNotEmpty;
    final hasPerKiloPrice = product.perKiloPrice != null;

    if (!hasSackPrices && !hasPerKiloPrice) {
      return const Text(
        'No pricing available for this product',
        style: TextStyle(color: Colors.red),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Price Type',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),

        // Sack prices
        if (hasSackPrices) ...[
          ...product.sackPrices.map((sackPrice) => _buildPriceOption(
                label: sackPrice.type.displayName,
                subtitle: 'Stock: ${sackPrice.stock.toStringAsFixed(0)}',
                isSelected: _selectedSackPrice?.id == sackPrice.id,
                onTap: () {
                  setState(() {
                    _selectedSackPrice = sackPrice;
                    _selectedPerKiloPrice = null;
                  });
                },
              )),
        ],

        // Per kilo price
        if (hasPerKiloPrice)
          _buildPriceOption(
            label: 'Per Kilo',
            subtitle:
                'Stock: ${product.perKiloPrice!.stock.toStringAsFixed(1)} kg',
            isSelected: _selectedPerKiloPrice != null,
            onTap: () {
              setState(() {
                _selectedPerKiloPrice = product.perKiloPrice;
                _selectedSackPrice = null;
              });
            },
          ),
      ],
    );
  }

  Widget _buildPriceOption({
    required String label,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.primary.withOpacity(0.05) : null,
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.primary : AppColors.mutedForeground,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? AppColors.primary : null,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockInfo() {
    final maxStock = _getMaxStock();
    return Row(
      children: [
        Icon(Icons.info_outline, size: 16, color: AppColors.mutedForeground),
        const SizedBox(width: 8),
        Text(
          'Available: ${maxStock.toStringAsFixed(maxStock == maxStock.toInt() ? 0 : 1)} ${_getUnitLabel()}',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.mutedForeground,
          ),
        ),
      ],
    );
  }

  String _getUnitLabel() {
    if (_selectedPerKiloPrice != null) {
      return 'kg';
    }
    if (_selectedSackPrice != null) {
      return 'sacks';
    }
    return 'units';
  }

  double _getMaxStock() {
    if (_selectedSackPrice != null) {
      return _selectedSackPrice!.stock;
    }
    if (_selectedPerKiloPrice != null) {
      return _selectedPerKiloPrice!.stock;
    }
    return 0;
  }

  bool _canSubmit() {
    return _selectedType != null &&
        (_selectedSackPrice != null || _selectedPerKiloPrice != null) &&
        _quantityController.text.isNotEmpty;
  }

  void _submitTransfer() {
    if (!_formKey.currentState!.validate()) return;

    final quantity = double.parse(_quantityController.text);

    if (_selectedSackPrice != null) {
      ref.read(createTransferNotifierProvider.notifier).createSackTransfer(
            product: widget.product,
            sackPrice: _selectedSackPrice!,
            quantity: quantity,
            transferType: _selectedType!,
          );
    } else if (_selectedPerKiloPrice != null) {
      ref.read(createTransferNotifierProvider.notifier).createPerKiloTransfer(
            product: widget.product,
            perKiloPrice: _selectedPerKiloPrice!,
            quantity: quantity,
            transferType: _selectedType!,
          );
    }
  }
}
