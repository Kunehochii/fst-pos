import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_toast.dart';
import '../../../product/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../providers/sales_provider.dart';

/// Full-screen page for adding a product to the cart.
///
/// "Aura Daybreak" design:
/// - Clean white background with subtle shadows
/// - Orange accents for selection and CTAs
/// - Consistent border and spacing patterns
class AddToCartPage extends ConsumerStatefulWidget {
  final Product product;

  const AddToCartPage({super.key, required this.product});

  @override
  ConsumerState<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends ConsumerState<AddToCartPage> {
  // Selected pricing type
  CartPriceType? _selectedPriceType;
  SackType? _selectedSackType;

  // For per kilo pricing
  bool _setByPrice = false;
  bool _isGantang = false;
  double _quantity = 1.0;
  double _priceInput = 0.0;

  // For discounts
  bool _isDiscounted = false;
  double _discountedPrice = 0.0;

  // Controllers
  final _quantityController = TextEditingController(text: '1');
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();

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
      _selectedPriceType = CartPriceType.perKilo;
      _updatePriceFromQuantity();
    } else if (!hasPerKilo &&
        hasSackPrices &&
        widget.product.sackPrices.length == 1) {
      _selectedPriceType = CartPriceType.sack;
      _selectedSackType = widget.product.sackPrices.first.type;
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  double get _unitPrice {
    if (_selectedPriceType == CartPriceType.perKilo) {
      final basePrice = widget.product.perKiloPrice?.price ?? 0;
      if (_isGantang) {
        return (basePrice * 2.25).ceilToDouble();
      }
      return basePrice;
    } else if (_selectedPriceType == CartPriceType.sack &&
        _selectedSackType != null) {
      final sackPrice = widget.product.sackPrices.firstWhere(
        (sp) => sp.type == _selectedSackType,
      );
      return sackPrice.price;
    }
    return 0;
  }

  double get _totalPrice {
    final effectivePrice =
        _isDiscounted && _discountedPrice > 0 ? _discountedPrice : _unitPrice;
    return (effectivePrice * _quantity).ceilToDouble();
  }

  double get _availableStock {
    if (_selectedPriceType == CartPriceType.perKilo) {
      final baseStock = widget.product.perKiloPrice?.stock ?? 0;
      final cartNotifier = ref.read(cartNotifierProvider.notifier);
      return cartNotifier.getRemainingStock(
        widget.product,
        CartPriceType.perKilo,
        null,
      );
    } else if (_selectedPriceType == CartPriceType.sack &&
        _selectedSackType != null) {
      final cartNotifier = ref.read(cartNotifierProvider.notifier);
      return cartNotifier.getRemainingStock(
        widget.product,
        CartPriceType.sack,
        _selectedSackType,
      );
    }
    return 0;
  }

  void _updateQuantityFromPrice(double price) {
    if (_unitPrice <= 0) return;
    final newQuantity = price / _unitPrice;
    setState(() {
      _quantity = newQuantity;
      _quantityController.text = newQuantity.toStringAsFixed(2);
    });
  }

  void _updatePriceFromQuantity() {
    setState(() {
      _priceInput = _unitPrice * _quantity;
      _priceController.text = _priceInput.toStringAsFixed(0);
    });
  }

  void _addQuickQuantity(double value) {
    setState(() {
      _quantity += value;
      _quantityController.text = _quantity % 1 == 0
          ? _quantity.toInt().toString()
          : _quantity.toStringAsFixed(2);
      _updatePriceFromQuantity();
    });
  }

  void _setQuantity(double value) {
    setState(() {
      _quantity = value;
      _quantityController.text =
          value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(2);
      _updatePriceFromQuantity();
    });
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
                    isSelected: _selectedPriceType == CartPriceType.perKilo,
                    onTap: () {
                      setState(() {
                        _selectedPriceType = CartPriceType.perKilo;
                        _selectedSackType = null;
                        _quantity = 1;
                        _quantityController.text = '1';
                        _updatePriceFromQuantity();
                      });
                    },
                  ),
                // Sack options
                ...widget.product.sackPrices.map((sackPrice) => _PricingCard(
                      title: sackPrice.type.displayName,
                      subtitle: '₱${sackPrice.price.toStringAsFixed(0)}',
                      stock: sackPrice.stock,
                      isSelected: _selectedPriceType == CartPriceType.sack &&
                          _selectedSackType == sackPrice.type,
                      onTap: () {
                        setState(() {
                          _selectedPriceType = CartPriceType.sack;
                          _selectedSackType = sackPrice.type;
                          _quantity = 1;
                          _quantityController.text = '1';
                          _isGantang = false;
                          _setByPrice = false;
                          _updatePriceFromQuantity();
                        });
                      },
                    )),
              ],
            ),

            const SizedBox(height: 24),

            // Quantity/Price input section
            if (_selectedPriceType != null) ...[
              // Per kilo specific options
              if (_selectedPriceType == CartPriceType.perKilo) ...[
                // Gantang toggle
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(AppColors.radiusSm),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: SwitchListTile(
                    title: Text(
                      'Gantang',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'Multiply price by 2.25 (₱${(_unitPrice).toStringAsFixed(0)})',
                      style: TextStyle(
                        color: AppColors.mutedForeground,
                        fontSize: 12,
                      ),
                    ),
                    value: _isGantang,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        _isGantang = value;
                        _updatePriceFromQuantity();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Set by price/quantity toggle
                Row(
                  children: [
                    Expanded(
                      child: _ChoiceChipButton(
                        label: 'Set by Quantity',
                        isSelected: !_setByPrice,
                        onTap: () => setState(() => _setByPrice = false),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _ChoiceChipButton(
                        label: 'Set by Price',
                        isSelected: _setByPrice,
                        onTap: () => setState(() => _setByPrice = true),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Input field based on mode
                if (_setByPrice)
                  _StyledTextField(
                    controller: _priceController,
                    label: 'Price (₱)',
                    helperText: 'Quantity: ${_quantity.toStringAsFixed(2)} kg',
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                    ],
                    onChanged: (value) {
                      final price = double.tryParse(value) ?? 0;
                      _updateQuantityFromPrice(price);
                    },
                  )
                else
                  _StyledTextField(
                    controller: _quantityController,
                    label: 'Quantity (kg)',
                    helperText:
                        'Available: ${_availableStock.toStringAsFixed(2)} kg',
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                    ],
                    onChanged: (value) {
                      final qty = double.tryParse(value) ?? 0;
                      setState(() {
                        _quantity = qty;
                        _updatePriceFromQuantity();
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
                    // Whole numbers
                    ...List.generate(5, (i) => i + 1).map(
                      (kg) => _QuickAddChip(
                        label: '$kg kg',
                        onTap: () => _addQuickQuantity(kg.toDouble()),
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
                    ...[0.1, 0.25, 0.5, 0.75].map(
                      (kg) => _QuickAddChip(
                        label: '$kg kg',
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
                  helperText: 'Available: ${_availableStock.toInt()} sacks',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    final qty = double.tryParse(value) ?? 0;
                    setState(() {
                      _quantity = qty;
                      _updatePriceFromQuantity();
                    });
                  },
                ),
              ],

              const SizedBox(height: 24),

              // Discounted price section
              Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text(
                        'Apply Discount',
                        style: TextStyle(
                          color: AppColors.foreground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: _isDiscounted,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() {
                          _isDiscounted = value;
                          if (!value) {
                            _discountedPrice = 0;
                            _discountController.clear();
                          }
                        });
                      },
                    ),
                    if (_isDiscounted)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: _StyledTextField(
                          controller: _discountController,
                          label: 'Discounted Price per Unit',
                          prefixText: '₱',
                          helperText:
                              'Original: ₱${_unitPrice.toStringAsFixed(0)}',
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _discountedPrice = double.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar:
          _selectedPriceType != null ? _buildBottomBar() : null,
    );
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
                      _selectedPriceType == CartPriceType.perKilo
                          ? '${_quantity.toStringAsFixed(2)} kg'
                          : '${_quantity.toInt()} ${_quantity == 1 ? 'sack' : 'sacks'}',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontSize: 14,
                      ),
                    ),
                    if (_isGantang)
                      Text(
                        'Gantang applied',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    if (_isDiscounted && _discountedPrice > 0)
                      Text(
                        'Discounted: ₱${_discountedPrice.toStringAsFixed(0)}/unit',
                        style: TextStyle(
                          color: AppColors.success,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
                Text(
                  '₱${_totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _canAddToCart() ? _addToCart : null,
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
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
    if (_quantity > _availableStock) return false;
    if (_isDiscounted && _discountedPrice <= 0) return false;
    return true;
  }

  void _addToCart() {
    final cartItem = CartItem(
      cartItemId: CartItem.generateId(),
      product: widget.product,
      priceType: _selectedPriceType!,
      sackType: _selectedSackType,
      quantity: _quantity,
      unitPrice: _selectedPriceType == CartPriceType.perKilo
          ? widget.product.perKiloPrice!.price
          : widget.product.sackPrices
              .firstWhere((sp) => sp.type == _selectedSackType)
              .price,
      discountedPrice: _isDiscounted ? _discountedPrice : null,
      isDiscounted: _isDiscounted,
      isGantang: _isGantang,
      sackPriceId: _selectedSackType != null
          ? widget.product.sackPrices
              .firstWhere((sp) => sp.type == _selectedSackType)
              .id
          : null,
      perKiloPriceId: _selectedPriceType == CartPriceType.perKilo
          ? widget.product.perKiloPrice?.id
          : null,
    );

    ref.read(cartNotifierProvider.notifier).addItem(cartItem);
    Navigator.of(context).pop();

    AppToast.success(
      context,
      title: 'Added to Cart',
      message: '${widget.product.name} added to cart',
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
    final isOutOfStock = stock <= 0;

    return InkWell(
      onTap: isOutOfStock ? null : onTap,
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isOutOfStock ? AppColors.muted : AppColors.card,
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
                color: isOutOfStock
                    ? AppColors.mutedForeground
                    : AppColors.foreground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: isOutOfStock
                    ? AppColors.mutedForeground
                    : AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isOutOfStock
                  ? 'Out of stock'
                  : 'Stock: ${stock % 1 == 0 ? stock.toInt() : stock.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 11,
                color: isOutOfStock
                    ? AppColors.destructive
                    : AppColors.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Choice chip button for "Aura Daybreak" design
class _ChoiceChipButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChoiceChipButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.muted,
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.primaryForeground
                  : AppColors.foreground,
            ),
          ),
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
