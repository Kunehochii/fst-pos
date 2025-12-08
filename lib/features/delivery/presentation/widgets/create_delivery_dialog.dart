import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/failure.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/providers/product_provider.dart';
import '../../domain/entities/delivery.dart';
import '../providers/delivery_provider.dart';

/// Dialog for creating a new delivery.
class CreateDeliveryDialog extends ConsumerStatefulWidget {
  const CreateDeliveryDialog({super.key});

  @override
  ConsumerState<CreateDeliveryDialog> createState() =>
      _CreateDeliveryDialogState();
}

class _CreateDeliveryDialogState extends ConsumerState<CreateDeliveryDialog> {
  final _formKey = GlobalKey<FormState>();
  final _driverNameController = TextEditingController();
  DateTime _deliveryTime = DateTime.now();
  final List<_DeliveryItemEntry> _items = [];
  bool _isSubmitting = false;

  @override
  void dispose() {
    _driverNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createDeliveryNotifierProvider);

    // Handle state changes
    ref.listen(createDeliveryNotifierProvider, (previous, next) {
      if (next is CreateDeliverySuccess) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.isOffline
                ? 'Delivery saved offline. Will sync when online.'
                : 'Delivery created successfully!'),
            backgroundColor: next.isOffline ? Colors.orange : Colors.green,
          ),
        );
      } else if (next is CreateDeliveryError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.failure.userMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    _isSubmitting = createState is CreateDeliveryLoading;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            _buildHeader(),
            const Divider(height: 1),
            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Driver name field
                      TextFormField(
                        controller: _driverNameController,
                        decoration: const InputDecoration(
                          labelText: 'Driver Name *',
                          hintText: 'Enter driver name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Driver name is required';
                          }
                          return null;
                        },
                        enabled: !_isSubmitting,
                      ),
                      const SizedBox(height: 16),
                      // Delivery time picker
                      _buildDeliveryTimePicker(),
                      const SizedBox(height: 24),
                      // Items section
                      _buildItemsSection(),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            // Actions
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.local_shipping),
          const SizedBox(width: 8),
          Text(
            'New Delivery',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryTimePicker() {
    final dateFormat = DateFormat('MMM d, yyyy h:mm a');

    return InkWell(
      onTap: _isSubmitting ? null : _selectDeliveryTime,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Delivery Time *',
          prefixIcon: Icon(Icons.access_time),
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dateFormat.format(_deliveryTime)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Items',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add Item'),
              onPressed: _isSubmitting ? null : _showAddItemDialog,
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (_items.isEmpty)
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Column(
                children: [
                  Icon(Icons.inventory_2_outlined,
                      size: 48, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'No items added yet',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Tap "Add Item" to add products',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return _buildItemCard(item, index);
            },
          ),
      ],
    );
  }

  Widget _buildItemCard(_DeliveryItemEntry item, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(
            Icons.inventory_2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(item.product.name),
        subtitle: Text(
          '${item.quantity} ${item.priceTypeDisplay}',
        ),
        trailing: _isSubmitting
            ? null
            : IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  setState(() => _items.removeAt(index));
                },
              ),
      ),
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _isSubmitting || _items.isEmpty ? null : _submit,
            child: _isSubmitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Create Delivery'),
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
      }
    }
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => _AddItemDialog(
        onItemAdded: (item) {
          setState(() => _items.add(item));
        },
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one item'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final dto = CreateDeliveryDto(
      driverName: _driverNameController.text.trim(),
      deliveryTimeStart: _deliveryTime.toUtc(),
      deliveryItems: _items
          .map((item) => CreateDeliveryItemDto(
                productId: item.product.id,
                sackPrice: item.sackPriceId != null
                    ? SackPriceDto(
                        id: item.sackPriceId!,
                        quantity: item.quantity,
                        type: item.sackType!,
                      )
                    : null,
                perKiloPrice: item.perKiloPriceId != null
                    ? PerKiloPriceDto(
                        id: item.perKiloPriceId!,
                        quantity: item.quantity,
                      )
                    : null,
              ))
          .toList(),
    );

    ref.read(createDeliveryNotifierProvider.notifier).createDelivery(dto);
  }
}

/// Internal class to track delivery item entries.
class _DeliveryItemEntry {
  final Product product;
  final double quantity;
  final String? sackPriceId;
  final SackType? sackType;
  final String? perKiloPriceId;

  _DeliveryItemEntry({
    required this.product,
    required this.quantity,
    this.sackPriceId,
    this.sackType,
    this.perKiloPriceId,
  });

  String get priceTypeDisplay {
    if (sackType != null) return sackType!.displayName;
    if (perKiloPriceId != null) return 'Per Kilo';
    return 'Unknown';
  }
}

/// Dialog for adding a delivery item.
class _AddItemDialog extends ConsumerStatefulWidget {
  final void Function(_DeliveryItemEntry item) onItemAdded;

  const _AddItemDialog({required this.onItemAdded});

  @override
  ConsumerState<_AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends ConsumerState<_AddItemDialog> {
  Product? _selectedProduct;
  String? _selectedPriceType; // 'sack' or 'perKilo'
  String? _selectedSackPriceId;
  SackType? _selectedSackType;
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productListState = ref.watch(productListNotifierProvider);

    return AlertDialog(
      title: const Text('Add Item'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product dropdown
            productListState.when(
              data: (state) {
                if (state is ProductListLoaded) {
                  return DropdownButtonFormField<Product>(
                    decoration: const InputDecoration(
                      labelText: 'Product *',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedProduct,
                    items: state.products
                        .map((p) => DropdownMenuItem(
                              value: p,
                              child: Text(p.name),
                            ))
                        .toList(),
                    onChanged: (product) {
                      setState(() {
                        _selectedProduct = product;
                        _selectedPriceType = null;
                        _selectedSackPriceId = null;
                        _selectedSackType = null;
                      });
                    },
                  );
                }
                return const Text('No products available');
              },
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text('Error loading products'),
            ),
            const SizedBox(height: 16),
            // Price type selection
            if (_selectedProduct != null) ...[
              const Text('Price Type *'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  if (_selectedProduct!.sackPrices.isNotEmpty)
                    ..._selectedProduct!.sackPrices.map((sp) => ChoiceChip(
                          label: Text(sp.type.displayName),
                          selected: _selectedSackPriceId == sp.id,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedPriceType = 'sack';
                                _selectedSackPriceId = sp.id;
                                _selectedSackType = sp.type;
                              } else {
                                _selectedPriceType = null;
                                _selectedSackPriceId = null;
                                _selectedSackType = null;
                              }
                            });
                          },
                        )),
                  if (_selectedProduct!.perKiloPrice != null)
                    ChoiceChip(
                      label: const Text('Per Kilo'),
                      selected: _selectedPriceType == 'perKilo',
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedPriceType = 'perKilo';
                            _selectedSackPriceId = null;
                            _selectedSackType = null;
                          } else {
                            _selectedPriceType = null;
                          }
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            // Quantity field
            if (_selectedPriceType != null)
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity *',
                  hintText: _selectedPriceType == 'sack'
                      ? 'Number of sacks'
                      : 'Weight in KG',
                  border: const OutlineInputBorder(),
                  suffixText: _selectedPriceType == 'sack' ? 'sacks' : 'kg',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _canAdd ? _addItem : null,
          child: const Text('Add'),
        ),
      ],
    );
  }

  bool get _canAdd {
    if (_selectedProduct == null) return false;
    if (_selectedPriceType == null) return false;
    final quantity = double.tryParse(_quantityController.text);
    if (quantity == null || quantity <= 0) return false;
    return true;
  }

  void _addItem() {
    final quantity = double.parse(_quantityController.text);

    widget.onItemAdded(_DeliveryItemEntry(
      product: _selectedProduct!,
      quantity: quantity,
      sackPriceId: _selectedSackPriceId,
      sackType: _selectedSackType,
      perKiloPriceId: _selectedPriceType == 'perKilo'
          ? _selectedProduct!.perKiloPrice?.id
          : null,
    ));

    Navigator.of(context).pop();
  }
}
