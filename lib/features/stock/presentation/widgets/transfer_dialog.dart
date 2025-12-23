import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
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
        AppToast.success(
          context,
          title: 'Transfer Created',
          message:
              '${next.transfer.quantity} ${_getUnitLabel()} transferred successfully',
        );
        ref.read(createTransferNotifierProvider.notifier).reset();
      } else if (next is CreateTransferError) {
        AppToast.error(
          context,
          title: 'Transfer Failed',
          message: next.failure.message,
        );
      }
    });

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420, maxHeight: 620),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.border),
                  ),
                ),
                child: Row(
                  children: [
                    AppIconBox(
                      icon: Icons.swap_horiz,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      iconColor: AppColors.primary,
                      size: 44,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Transfer Stock',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.mutedForeground,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.mutedForeground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Transfer type selection
                      const Text(
                        'Transfer Type',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildTransferTypeSelector(),
                      const SizedBox(height: 20),

                      // Price selection (sack or per kilo)
                      _buildPriceSelection(),
                      const SizedBox(height: 20),

                      // Quantity input
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _quantityController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.foreground,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter quantity',
                          hintStyle: const TextStyle(
                            color: AppColors.mutedForeground,
                          ),
                          suffixText: _getUnitLabel(),
                          suffixStyle: const TextStyle(
                            color: AppColors.mutedForeground,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: AppColors.muted,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            borderSide: const BorderSide(
                              color: AppColors.destructive,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            borderSide: const BorderSide(
                              color: AppColors.destructive,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
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
                      const SizedBox(height: 12),

                      // Stock info
                      _buildStockInfo(),
                    ],
                  ),
                ),
              ),

              // Action buttons (outside scrollable area)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.border),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton.ghost(
                      onPressed: createState is CreateTransferLoading
                          ? null
                          : () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 12),
                    AppButton.primary(
                      onPressed: createState is CreateTransferLoading
                          ? null
                          : _canSubmit()
                              ? _submitTransfer
                              : null,
                      isLoading: createState is CreateTransferLoading,
                      icon: const Icon(Icons.swap_horiz, size: 18),
                      child: const Text('Transfer'),
                    ),
                  ],
                ),
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
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedType = isSelected ? null : type;
              });
            },
            borderRadius: BorderRadius.circular(AppColors.radiusSm),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.muted,
                borderRadius: BorderRadius.circular(AppColors.radiusSm),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Text(
                type.displayName,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppColors.primary : AppColors.foreground,
                ),
              ),
            ),
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
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.destructive.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(
            color: AppColors.destructive.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.destructive,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'No pricing available for this product',
              style: TextStyle(
                color: AppColors.destructive,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Price Type',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 10),

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(AppColors.radiusSm),
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.05)
                : AppColors.card,
          ),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: isSelected ? 2 : 1.5,
                  ),
                  color: isSelected ? AppColors.primary : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 14,
                        color: AppColors.primaryForeground,
                      )
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 14,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
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
      ),
    );
  }

  Widget _buildStockInfo() {
    final maxStock = _getMaxStock();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 16,
            color: AppColors.info,
          ),
          const SizedBox(width: 8),
          Text(
            'Available: ${maxStock.toStringAsFixed(maxStock == maxStock.toInt() ? 0 : 1)} ${_getUnitLabel()}',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.info,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
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
