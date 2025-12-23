// ignore_for_file: unused_local_variable, unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_toast.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/delivery_cart_item.dart';
import '../providers/delivery_provider.dart';

/// Full-screen page for adding a product to the delivery cart.
///
/// "Aura Daybreak" design:
/// - Clean white background with subtle shadows
/// - Primary accents for selection and CTAs
/// - Consistent border and spacing patterns
class DeliveryAddToCartPage extends ConsumerStatefulWidget {
  final Product product;

  const DeliveryAddToCartPage({super.key, required this.product});

  @override
  ConsumerState<DeliveryAddToCartPage> createState() =>
      _DeliveryAddToCartPageState();
}

class _DeliveryAddToCartPageState extends ConsumerState<DeliveryAddToCartPage> {
  // Selected pricing type
  DeliveryPriceType? _selectedPriceType;
  SackType? _selectedSackType;

  // Quantity
  double _quantity = 1.0;

  // Controllers
  final _quantityController = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    // Auto-select if only one option available
    _autoSelectPricingType();
  }

  void _autoSelectPricingType() {
    final hasPerKilo = widget.product.perKiloPrice != null;
    final hasSackPrices = widget.product.sackPrices.isNotEmpty;

    if (hasPerKilo && !hasSackPrices) {
      _selectedPriceType = DeliveryPriceType.perKilo;
    } else if (!hasPerKilo &&
        hasSackPrices &&
        widget.product.sackPrices.length == 1) {
      _selectedPriceType = DeliveryPriceType.sack;
      _selectedSackType = widget.product.sackPrices.first.type;
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasPerKilo = widget.product.perKiloPrice != null;
    final hasSackPrices = widget.product.sackPrices.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: AppColors.foreground),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.product.name,
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _canAddToCart() ? _addToCart : null,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              disabledForegroundColor: AppColors.mutedForeground,
            ),
            child: const Text('Add'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.border),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pricing type selection
            Text(
              'Select Variant',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                // Per kilo option
                if (hasPerKilo)
                  _PricingCard(
                    title: 'Per Kilo',
                    subtitle:
                        '₱${widget.product.perKiloPrice!.price.toStringAsFixed(0)}/kg',
                    stock: widget.product.perKiloPrice!.stock,
                    isSelected: _selectedPriceType == DeliveryPriceType.perKilo,
                    onTap: () {
                      setState(() {
                        _selectedPriceType = DeliveryPriceType.perKilo;
                        _selectedSackType = null;
                        _quantity = 1;
                        _quantityController.text = '1';
                      });
                    },
                  ),
                // Sack options
                ...widget.product.sackPrices.map((sackPrice) => _PricingCard(
                      title: sackPrice.type.displayName,
                      subtitle: '₱${sackPrice.price.toStringAsFixed(0)}',
                      stock: sackPrice.stock,
                      isSelected:
                          _selectedPriceType == DeliveryPriceType.sack &&
                              _selectedSackType == sackPrice.type,
                      onTap: () {
                        setState(() {
                          _selectedPriceType = DeliveryPriceType.sack;
                          _selectedSackType = sackPrice.type;
                          _quantity = 1;
                          _quantityController.text = '1';
                        });
                      },
                    )),
              ],
            ),

            const SizedBox(height: 24),

            // Quantity input section
            if (_selectedPriceType != null) ...[
              if (_selectedPriceType == DeliveryPriceType.perKilo) ...[
                _StyledTextField(
                  controller: _quantityController,
                  label: 'Quantity (kg)',
                  helperText: 'Enter quantity in kilograms to deliver',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                  ],
                  onChanged: (value) {
                    final qty = double.tryParse(value) ?? 0;
                    setState(() {
                      _quantity = qty;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Quick options for per kilo
                Text(
                  'Quick Add',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Common delivery amounts
                    ...[10, 25, 50, 100, 200].map(
                      (kg) => _QuickAddChip(
                        label: '$kg kg',
                        onTap: () => _setQuantity(kg.toDouble()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Decimals
                    ...[0.5, 1.0, 2.5, 5.0].map(
                      (kg) => _QuickAddChip(
                        label: '+$kg kg',
                        onTap: () => _addQuickQuantity(kg),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Sack quantity input
                _StyledTextField(
                  controller: _quantityController,
                  label: 'Quantity (sacks)',
                  helperText: 'Enter number of sacks to deliver',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    final qty = double.tryParse(value) ?? 0;
                    setState(() {
                      _quantity = qty;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Quick options for sacks
                Text(
                  'Quick Add',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...[1, 5, 10, 20, 50].map(
                      (count) => _QuickAddChip(
                        label: '$count sacks',
                        onTap: () => _setQuantity(count.toDouble()),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ],
        ),
      ),
      bottomNavigationBar:
          _selectedPriceType != null ? _buildBottomBar() : null,
    );
  }

  void _addQuickQuantity(double value) {
    setState(() {
      _quantity += value;
      _quantityController.text = _quantity % 1 == 0
          ? _quantity.toInt().toString()
          : _quantity.toStringAsFixed(2);
    });
  }

  void _setQuantity(double value) {
    setState(() {
      _quantity = value;
      _quantityController.text =
          value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(2);
    });
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedPriceType == DeliveryPriceType.perKilo
                          ? 'Per Kilo'
                          : _selectedSackType?.displayName ?? 'Sack',
                      style: TextStyle(
                        color: AppColors.mutedForeground,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _selectedPriceType == DeliveryPriceType.perKilo
                          ? '${_quantity.toStringAsFixed(_quantity % 1 == 0 ? 0 : 2)} kg'
                          : '${_quantity.toInt()} ${_quantity == 1 ? 'sack' : 'sacks'}',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.local_shipping,
                  size: 32,
                  color: AppColors.primary,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _canAddToCart() ? _addToCart : null,
                icon: const Icon(Icons.add),
                label: const Text('Add to Delivery'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.primaryForeground,
                  disabledBackgroundColor: AppColors.muted,
                  disabledForegroundColor: AppColors.mutedForeground,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canAddToCart() {
    if (_selectedPriceType == null) return false;
    if (_quantity <= 0) return false;
    return true;
  }

  void _addToCart() {
    final cartItem = DeliveryCartItem(
      cartItemId: DeliveryCartItem.generateId(),
      product: widget.product,
      priceType: _selectedPriceType!,
      sackType: _selectedSackType,
      quantity: _quantity,
      sackPriceId: _selectedSackType != null
          ? widget.product.sackPrices
              .firstWhere((sp) => sp.type == _selectedSackType)
              .id
          : null,
      perKiloPriceId: _selectedPriceType == DeliveryPriceType.perKilo
          ? widget.product.perKiloPrice?.id
          : null,
    );

    ref.read(deliveryCartNotifierProvider.notifier).addItem(cartItem);
    Navigator.of(context).pop();

    AppToast.success(
      context,
      title: 'Added to Delivery',
      message: '${widget.product.name} added to delivery',
    );
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double stock;
  final bool isSelected;
  final VoidCallback onTap;

  const _PricingCard({
    required this.title,
    required this.subtitle,
    required this.stock,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Current: ${stock % 1 == 0 ? stock.toInt() : stock.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 11,
                color: AppColors.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick add chip for "Aura Daybreak" design
class _QuickAddChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickAddChip({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
      ),
    );
  }
}

/// Styled text field for "Aura Daybreak" design
class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? helperText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  const _StyledTextField({
    required this.controller,
    required this.label,
    this.helperText,
    this.prefixText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style: TextStyle(color: AppColors.foreground),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.mutedForeground),
        helperText: helperText,
        helperStyle: TextStyle(color: AppColors.mutedForeground, fontSize: 11),
        prefixText: prefixText,
        prefixStyle: TextStyle(color: AppColors.foreground),
        filled: true,
        fillColor: AppColors.muted,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
