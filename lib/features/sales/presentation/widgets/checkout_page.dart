import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/entities/payment_method.dart';
import '../providers/sales_provider.dart';
import 'receipt_preview.dart';

/// Checkout page for completing a sale.
class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  PaymentMethod _paymentMethod = PaymentMethod.cash;
  final _cashTenderedController = TextEditingController();
  double _cashTendered = 0;

  @override
  void dispose() {
    _cashTenderedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartNotifierProvider);
    final checkoutState = ref.watch(checkoutNotifierProvider);

    // Handle checkout success
    ref.listen(checkoutNotifierProvider, (previous, next) {
      if (next is CheckoutSuccess) {
        // Clear cart
        ref.read(cartNotifierProvider.notifier).clearCart();

        // Show receipt preview
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ReceiptPreviewPage(
              sale: next.sale,
              cashTendered:
                  _paymentMethod == PaymentMethod.cash ? _cashTendered : null,
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: cartState.isEmpty
          ? const Center(
              child: Text('Cart is empty'),
            )
          : Column(
              children: [
                // Order summary
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Items section
                      Text(
                        'Order Summary',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      ...cartState.items.map(
                        (item) => _OrderItemTile(item: item),
                      ),
                      const Divider(height: 32),

                      // Payment method section
                      Text(
                        'Payment Method',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<PaymentMethod>(
                        value: _paymentMethod,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: PaymentMethod.values.map((method) {
                          return DropdownMenuItem(
                            value: method,
                            child: Text(method.displayName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _paymentMethod = value;
                              if (value != PaymentMethod.cash) {
                                _cashTendered = 0;
                                _cashTenderedController.clear();
                              }
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16),

                      // Cash tendered section (only for cash)
                      if (_paymentMethod == PaymentMethod.cash) ...[
                        Text(
                          'Cash Tendered',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _cashTenderedController,
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            prefixText: '₱',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _cashTendered = double.tryParse(value) ?? 0;
                            });
                          },
                        ),
                        const SizedBox(height: 16),

                        // Quick cash options
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            // Exact amount
                            ActionChip(
                              label: Text(
                                  'Exact (₱${cartState.totalPrice.toStringAsFixed(0)})'),
                              onPressed: () {
                                setState(() {
                                  _cashTendered = cartState.totalPrice;
                                  _cashTenderedController.text =
                                      cartState.totalPrice.toStringAsFixed(0);
                                });
                              },
                            ),
                            // Round up options
                            ..._getRoundUpOptions(cartState.totalPrice).map(
                              (amount) => ActionChip(
                                label: Text('₱$amount'),
                                onPressed: () {
                                  setState(() {
                                    _cashTendered = amount.toDouble();
                                    _cashTenderedController.text =
                                        amount.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Change display
                        if (_cashTendered > 0)
                          Card(
                            color: _cashTendered >= cartState.totalPrice
                                ? Colors.green[50]
                                : Colors.red[50],
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Change',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '₱${(_cashTendered - cartState.totalPrice).toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          _cashTendered >= cartState.totalPrice
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ],
                  ),
                ),

                // Bottom bar
                Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              '₱${cartState.totalPrice.toStringAsFixed(0)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _canFinishSale(cartState)
                                ? () => _finishSale(cartState.items)
                                : null,
                            icon: checkoutState is CheckoutProcessing
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(Icons.check),
                            label: Text(
                              checkoutState is CheckoutProcessing
                                  ? 'Processing...'
                                  : 'Finish Sale',
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  List<int> _getRoundUpOptions(double total) {
    final options = <int>[];
    final rounded = total.ceil();

    // Common denominations
    for (final denom in [20, 50, 100, 200, 500, 1000]) {
      if (denom > rounded) {
        options.add(denom);
        if (options.length >= 4) break;
      }
    }

    // Also add rounded up to nearest 100
    final nearest100 = ((rounded / 100).ceil() * 100);
    if (!options.contains(nearest100) && nearest100 > rounded) {
      options.add(nearest100);
    }

    return options..sort();
  }

  bool _canFinishSale(CartState cartState) {
    if (cartState.isEmpty) return false;
    if (_paymentMethod == PaymentMethod.cash &&
        _cashTendered < cartState.totalPrice) {
      return false;
    }
    final checkoutState = ref.read(checkoutNotifierProvider);
    if (checkoutState is CheckoutProcessing) return false;
    return true;
  }

  void _finishSale(List<CartItem> items) async {
    final notifier = ref.read(checkoutNotifierProvider.notifier);
    await notifier.checkout(
      items: items,
      paymentMethod: _paymentMethod,
      cashTendered: _paymentMethod == PaymentMethod.cash ? _cashTendered : null,
    );
  }
}

class _OrderItemTile extends StatelessWidget {
  final CartItem item;

  const _OrderItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  '${item.variantDisplayName} • ${item.quantityDisplay}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                if (item.isDiscounted && item.discountedPrice != null)
                  Text(
                    '₱${item.discountedPrice!.toStringAsFixed(0)} / unit (discounted)',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                        ),
                  ),
              ],
            ),
          ),
          Text(
            '₱${item.totalPrice.toStringAsFixed(0)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
