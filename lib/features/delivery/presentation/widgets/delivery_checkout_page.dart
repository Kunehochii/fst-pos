import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/app_toast.dart';
import '../../domain/entities/delivery_cart_item.dart';
import '../providers/delivery_provider.dart';

/// Checkout page for completing a delivery.
///
/// "Aura Daybreak" design:
/// - Clean white cards for sections
/// - Primary accent for primary actions
/// - Consistent borders and shadows
class DeliveryCheckoutPage extends ConsumerStatefulWidget {
  const DeliveryCheckoutPage({super.key});

  @override
  ConsumerState<DeliveryCheckoutPage> createState() =>
      _DeliveryCheckoutPageState();
}

class _DeliveryCheckoutPageState extends ConsumerState<DeliveryCheckoutPage> {
  final _driverNameController = TextEditingController();
  DateTime _deliveryTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Load existing values from cart state
    final cartState = ref.read(deliveryCartNotifierProvider);
    _driverNameController.text = cartState.driverName;
    _deliveryTime = cartState.deliveryTime;
  }

  @override
  void dispose() {
    _driverNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(deliveryCartNotifierProvider);
    final createState = ref.watch(createDeliveryNotifierProvider);

    // Handle create success
    ref.listen(createDeliveryNotifierProvider, (previous, next) {
      if (next is CreateDeliverySuccess) {
        // Clear cart
        ref.read(deliveryCartNotifierProvider.notifier).clearCart();

        // Show success and pop back
        if (next.isOffline) {
          AppToast.warning(
            context,
            title: 'Saved Offline',
            message: 'Delivery saved offline. Will sync when online.',
          );
        } else {
          AppToast.success(
            context,
            title: 'Success',
            message: 'Delivery created successfully!',
          );
        }

        // Pop back to deliveries page
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else if (next is CreateDeliveryError) {
        AppToast.error(
          context,
          title: 'Error',
          message: next.failure.userMessage,
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
          'Delivery Details',
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
                'No items in delivery',
                style: TextStyle(color: AppColors.mutedForeground),
              ),
            )
          : Column(
              children: [
                // Delivery details
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Driver name section
                      Text(
                        'Driver Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.muted,
                          borderRadius:
                              BorderRadius.circular(AppColors.radiusSm),
                          border: Border.all(color: AppColors.border, width: 1),
                        ),
                        child: TextField(
                          controller: _driverNameController,
                          style: TextStyle(color: AppColors.foreground),
                          decoration: InputDecoration(
                            labelText: 'Driver Name *',
                            labelStyle:
                                TextStyle(color: AppColors.mutedForeground),
                            prefixIcon: Icon(Icons.person,
                                color: AppColors.mutedForeground),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                          onChanged: (value) {
                            ref
                                .read(deliveryCartNotifierProvider.notifier)
                                .setDriverName(value);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Delivery time section
                      Text(
                        'Delivery Time',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: _selectDeliveryTime,
                        borderRadius: BorderRadius.circular(AppColors.radiusSm),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.muted,
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                            border:
                                Border.all(color: AppColors.border, width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.access_time,
                                  color: AppColors.mutedForeground),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  DateFormat('MMM d, yyyy h:mm a')
                                      .format(_deliveryTime),
                                  style: TextStyle(color: AppColors.foreground),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                  color: AppColors.mutedForeground),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Items section
                      Text(
                        'Delivery Items (${cartState.itemCount})',
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
                                      _DeliveryItemTile(item: entry.value),
                                      if (entry.key <
                                          cartState.items.length - 1)
                                        Divider(
                                            height: 1, color: AppColors.border),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
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
                              'Total Items',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.foreground,
                              ),
                            ),
                            Text(
                              '${cartState.itemCount} products',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Quantity',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                            Text(
                              '${cartState.totalQuantity.toStringAsFixed(cartState.totalQuantity % 1 == 0 ? 0 : 2)} units',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.foreground,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _canCreateDelivery(cartState)
                                ? () => _createDelivery(cartState)
                                : null,
                            icon: createState is CreateDeliveryLoading
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
                              createState is CreateDeliveryLoading
                                  ? 'Creating...'
                                  : 'Create Delivery',
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

  Future<void> _selectDeliveryTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _deliveryTime,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_deliveryTime),
      );

      if (time != null && mounted) {
        setState(() {
          _deliveryTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
        ref
            .read(deliveryCartNotifierProvider.notifier)
            .setDeliveryTime(_deliveryTime);
      }
    }
  }

  bool _canCreateDelivery(DeliveryCartState cartState) {
    if (cartState.isEmpty) return false;
    if (_driverNameController.text.trim().isEmpty) return false;
    final createState = ref.read(createDeliveryNotifierProvider);
    if (createState is CreateDeliveryLoading) return false;
    return true;
  }

  void _createDelivery(DeliveryCartState cartState) {
    // Ensure driver name is set
    ref
        .read(deliveryCartNotifierProvider.notifier)
        .setDriverName(_driverNameController.text.trim());
    ref
        .read(deliveryCartNotifierProvider.notifier)
        .setDeliveryTime(_deliveryTime);

    // Get the DTO and create delivery
    final dto = ref.read(deliveryCartNotifierProvider.notifier).toDto();
    ref.read(createDeliveryNotifierProvider.notifier).createDelivery(dto);
  }
}

class _DeliveryItemTile extends StatelessWidget {
  final DeliveryCartItem item;

  const _DeliveryItemTile({required this.item});

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
                  item.variantDisplayName,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.quantityDisplay,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
