import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/payment_method.dart';
import '../providers/sales_provider.dart';
import 'receipt_preview.dart';

/// Checkout page for completing a sale.
///
/// "Aura Daybreak" design:
/// - Clean white cards for sections
/// - Orange accent for primary actions
/// - Consistent borders and shadows
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.foreground),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.border),
        ),
      ),
      body: cartState.isEmpty
          ? Center(
              child: Text(
                'Cart is empty',
                style: TextStyle(color: AppColors.mutedForeground),
              ),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius:
                              BorderRadius.circular(AppColors.radiusSm),
                          border: Border.all(color: AppColors.border, width: 1),
                        ),
                        child: Column(
                          children: cartState.items
                              .asMap()
                              .entries
                              .map((entry) => Column(
                                    children: [
                                      _OrderItemTile(item: entry.value),
                                      if (entry.key <
                                          cartState.items.length - 1)
                                        Divider(
                                            height: 1, color: AppColors.border),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Payment method section
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.muted,
                          borderRadius:
                              BorderRadius.circular(AppColors.radiusSm),
                          border: Border.all(color: AppColors.border, width: 1),
                        ),
                        child: DropdownButtonFormField<PaymentMethod>(
                          value: _paymentMethod,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                          dropdownColor: AppColors.card,
                          style: TextStyle(
                            color: AppColors.foreground,
                            fontSize: 14,
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
                      ),
                      const SizedBox(height: 20),

                      // Cash tendered section (only for cash)
                      if (_paymentMethod == PaymentMethod.cash) ...[
                        Text(
                          'Cash Tendered',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.muted,
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            border:
                                Border.all(color: AppColors.border, width: 1),
                          ),
                          child: TextField(
                            controller: _cashTenderedController,
                            style: TextStyle(color: AppColors.foreground),
                            decoration: InputDecoration(
                              labelText: 'Amount',
                              labelStyle:
                                  TextStyle(color: AppColors.mutedForeground),
                              prefixText: '₱',
                              prefixStyle:
                                  TextStyle(color: AppColors.foreground),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[\d.]')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _cashTendered = double.tryParse(value) ?? 0;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Quick cash options
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            // Exact amount
                            _QuickCashChip(
                              label:
                                  'Exact (₱${cartState.totalPrice.toStringAsFixed(0)})',
                              onTap: () {
                                setState(() {
                                  _cashTendered = cartState.totalPrice;
                                  _cashTenderedController.text =
                                      cartState.totalPrice.toStringAsFixed(0);
                                });
                              },
                            ),
                            // Round up options
                            ..._getRoundUpOptions(cartState.totalPrice).map(
                              (amount) => _QuickCashChip(
                                label: '₱$amount',
                                onTap: () {
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
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _cashTendered >= cartState.totalPrice
                                  ? AppColors.success.withValues(alpha: 0.1)
                                  : AppColors.destructive
                                      .withValues(alpha: 0.1),
                              borderRadius:
                                  BorderRadius.circular(AppColors.radiusSm),
                              border: Border.all(
                                color: _cashTendered >= cartState.totalPrice
                                    ? AppColors.success
                                    : AppColors.destructive,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Change',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.foreground,
                                  ),
                                ),
                                Text(
                                  '₱${(_cashTendered - cartState.totalPrice).toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: _cashTendered >= cartState.totalPrice
                                        ? AppColors.success
                                        : AppColors.destructive,
                                  ),
                                ),
                              ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.foreground,
                              ),
                            ),
                            Text(
                              '₱${cartState.totalPrice.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
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
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.primaryForeground,
                              disabledBackgroundColor: AppColors.muted,
                              disabledForegroundColor:
                                  AppColors.mutedForeground,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppColors.radiusSm),
                              ),
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.variantDisplayName} • ${item.quantityDisplay}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                ),
                if (item.isDiscounted && item.discountedPrice != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '₱${item.discountedPrice!.toStringAsFixed(0)} / unit (discounted)',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.success,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Text(
            '₱${item.totalPrice.toStringAsFixed(0)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

/// Quick cash chip for "Aura Daybreak" design
class _QuickCashChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickCashChip({
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
