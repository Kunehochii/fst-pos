import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../providers/sales_provider.dart';

/// Full-screen page for adding a product to the cart.
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
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          TextButton(
            onPressed: _canAddToCart() ? _addToCart : null,
            child: const Text('Add'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pricing type selection
            Text(
              'Select Variant',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
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
                Card(
                  child: SwitchListTile(
                    title: const Text('Gantang'),
                    subtitle: Text(
                      'Multiply price by 2.25 (₱${(_unitPrice).toStringAsFixed(0)})',
                    ),
                    value: _isGantang,
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
                      child: ChoiceChip(
                        label: const Text('Set by Quantity'),
                        selected: !_setByPrice,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _setByPrice = false);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('Set by Price'),
                        selected: _setByPrice,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _setByPrice = true);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Input field based on mode
                if (_setByPrice)
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price (₱)',
                      border: const OutlineInputBorder(),
                      helperText:
                          'Quantity: ${_quantity.toStringAsFixed(2)} kg',
                    ),
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
                  TextField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity (kg)',
                      border: const OutlineInputBorder(),
                      helperText:
                          'Available: ${_availableStock.toStringAsFixed(2)} kg',
                    ),
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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Whole numbers
                    ...List.generate(5, (i) => i + 1).map(
                      (kg) => ActionChip(
                        label: Text('$kg kg'),
                        onPressed: () => _addQuickQuantity(kg.toDouble()),
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
                      (kg) => ActionChip(
                        label: Text('$kg kg'),
                        onPressed: () => _addQuickQuantity(kg),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Sack quantity input
                TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity (sacks)',
                    border: const OutlineInputBorder(),
                    helperText: 'Available: ${_availableStock.toInt()} sacks',
                  ),
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
              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Apply Discount'),
                      value: _isDiscounted,
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
                        child: TextField(
                          controller: _discountController,
                          decoration: InputDecoration(
                            labelText: 'Discounted Price per Unit',
                            border: const OutlineInputBorder(),
                            prefixText: '₱',
                            helperText:
                                'Original: ₱${_unitPrice.toStringAsFixed(0)}',
                          ),
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
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (_isGantang)
                      Text(
                        'Gantang applied',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    if (_isDiscounted && _discountedPrice > 0)
                      Text(
                        'Discounted: ₱${_discountedPrice.toStringAsFixed(0)}/unit',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                            ),
                      ),
                  ],
                ),
                Text(
                  '₱${_totalPrice.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} added to cart'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ref
                .read(cartNotifierProvider.notifier)
                .removeItem(cartItem.cartItemId);
          },
        ),
      ),
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
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : isOutOfStock
                  ? Colors.grey[200]
                  : null,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isOutOfStock ? Colors.grey : null,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isOutOfStock
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              isOutOfStock
                  ? 'Out of stock'
                  : 'Stock: ${stock % 1 == 0 ? stock.toInt() : stock.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isOutOfStock ? Colors.red : Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
