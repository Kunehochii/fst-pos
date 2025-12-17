import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart' hide TextAlign;
import '../../../printer/presentation/providers/printer_provider.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/sale.dart';

/// Receipt preview page shown after a successful sale.
class ReceiptPreviewPage extends ConsumerStatefulWidget {
  final Sale sale;
  final double? cashTendered;

  const ReceiptPreviewPage({
    super.key,
    required this.sale,
    this.cashTendered,
  });

  @override
  ConsumerState<ReceiptPreviewPage> createState() => _ReceiptPreviewPageState();
}

class _ReceiptPreviewPageState extends ConsumerState<ReceiptPreviewPage> {
  bool _isPrinting = false;
  bool _printingFailed = false;
  String? _printError;

  @override
  void initState() {
    super.initState();
    // Auto-print on load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _printReceipt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Complete'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      body: Column(
        children: [
          // Success banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.green[50],
            child: Column(
              children: [
                Icon(
                  _printingFailed ? Icons.warning : Icons.check_circle,
                  size: 64,
                  color: _printingFailed ? Colors.orange : Colors.green,
                ),
                const SizedBox(height: 16),
                Text(
                  'Sale Completed!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                ),
                if (widget.sale.isSynced == false)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Sale saved offline. Will sync when online.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.orange[700],
                          ),
                    ),
                  ),
                if (_printingFailed && _printError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Print failed: $_printError',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.red,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),

          // Receipt preview
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _buildReceiptPreview(),
            ),
          ),

          // Action buttons
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (_printingFailed || !_isPrinting)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isPrinting ? null : _printReceipt,
                      icon: _isPrinting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.print),
                      label:
                          Text(_isPrinting ? 'Printing...' : 'Print Receipt'),
                    ),
                  ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('New Sale'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptPreview() {
    final sale = widget.sale;
    final change = widget.cashTendered != null
        ? widget.cashTendered! - sale.totalAmount
        : null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Text(
              'Falsisters',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Rice Trading',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 24),

            // Items
            ...sale.saleItems.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.product?.name ?? 'Product',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(item.quantityDisplay),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₱${(item.isDiscounted && item.discountedPrice != null ? item.discountedPrice! : item.price).toStringAsFixed(0)}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Text(
                            '₱${item.totalPrice.toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),

            const Divider(height: 24),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '₱${sale.totalAmount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Cash tendered and change (only for cash payments)
            if (sale.paymentMethod == PaymentMethod.cash &&
                widget.cashTendered != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cash Tendered'),
                  Text('₱${widget.cashTendered!.toStringAsFixed(0)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Change'),
                  Text('₱${change!.toStringAsFixed(0)}'),
                ],
              ),
            ],

            const Divider(height: 24),

            // Footer
            Text(
              'Thank You!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _printReceipt() async {
    setState(() {
      _isPrinting = true;
      _printingFailed = false;
      _printError = null;
    });

    try {
      final printerListState = ref.read(printerListNotifierProvider);

      // Find connected printer
      PrinterDevice? connectedPrinter;
      if (printerListState is PrinterListReady) {
        for (final printer in printerListState.printers) {
          final repo = ref.read(printerRepositoryProvider);
          if (await repo.isConnected(printer)) {
            connectedPrinter = printer;
            break;
          }
        }
      }

      if (connectedPrinter == null) {
        throw Exception(
            'No printer connected. Please connect a printer in Settings.');
      }

      // Build receipt
      final receipt = _buildReceipt();

      // Print
      final printerNotifier = ref.read(printerNotifierProvider.notifier);
      await printerNotifier.printReceipt(connectedPrinter, receipt);

      setState(() {
        _isPrinting = false;
      });
    } catch (e) {
      setState(() {
        _isPrinting = false;
        _printingFailed = true;
        _printError = e.toString();
      });
    }
  }

  Receipt _buildReceipt() {
    final sale = widget.sale;
    final change = widget.cashTendered != null
        ? widget.cashTendered! - sale.totalAmount
        : null;

    final builder = ReceiptBuilder()
        .paperSize(PaperSize.mm80)
        .header('Falsisters')
        .center('Rice Trading')
        .separator();

    // Items
    for (final item in sale.saleItems) {
      builder
          .row(
            item.product?.name ?? 'Product',
            item.quantityDisplay,
          )
          .row(
            '₱${(item.isDiscounted && item.discountedPrice != null ? item.discountedPrice! : item.price).toStringAsFixed(0)}',
            '₱${item.totalPrice.toStringAsFixed(0)}',
          );
    }

    builder.separator();

    // Total
    builder.row('Total', '₱${sale.totalAmount.toStringAsFixed(0)}', bold: true);

    // Cash tendered and change
    if (sale.paymentMethod == PaymentMethod.cash &&
        widget.cashTendered != null) {
      builder
          .row('Cash Tendered', '₱${widget.cashTendered!.toStringAsFixed(0)}')
          .row('Change', '₱${change!.toStringAsFixed(0)}');
    }

    builder.separator().center('Thank You!').emptyLines(3);

    return builder.build();
  }
}
