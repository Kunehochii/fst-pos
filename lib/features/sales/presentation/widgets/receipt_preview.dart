import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart' hide TextAlign;
import '../../../printer/presentation/providers/printer_provider.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/sale.dart';

/// Receipt preview page shown after a successful sale.
///
/// "Aura Daybreak" design:
/// - Clean white receipt card
/// - Green success banner
/// - Orange accent for primary actions
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sale Complete',
          style: TextStyle(
            color: AppColors.foreground,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: AppColors.foreground),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.border),
        ),
      ),
      body: Column(
        children: [
          // Success banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: _printingFailed
                  ? AppColors.warning.withValues(alpha: 0.1)
                  : AppColors.success.withValues(alpha: 0.1),
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _printingFailed
                        ? AppColors.warning.withValues(alpha: 0.2)
                        : AppColors.success.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _printingFailed ? Icons.warning : Icons.check_circle,
                    size: 48,
                    color:
                        _printingFailed ? AppColors.warning : AppColors.success,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Sale Completed!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:
                        _printingFailed ? AppColors.warning : AppColors.success,
                  ),
                ),
                if (widget.sale.isSynced == false)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Sale saved offline. Will sync when online.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.warning,
                      ),
                    ),
                  ),
                if (_printingFailed && _printError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Print failed: $_printError',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.destructive,
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
            decoration: BoxDecoration(
              color: AppColors.card,
              border: Border(
                top: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: SafeArea(
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: AppColors.secondaryForeground,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppColors.radiusSm),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primaryForeground,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppColors.radiusSm),
                        ),
                      ),
                      child: const Text('New Sale'),
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

  Widget _buildReceiptPreview() {
    final sale = widget.sale;
    final change = widget.cashTendered != null
        ? widget.cashTendered! - sale.totalAmount
        : null;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppColors.radiusSm),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            Text(
              'Falsisters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Rice Trading',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 16),

            // Items
            ...sale.saleItems.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.product?.name ?? 'Product',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.foreground,
                              ),
                            ),
                          ),
                          Text(
                            item.quantityDisplay,
                            style: TextStyle(color: AppColors.mutedForeground),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₱${(item.isDiscounted && item.discountedPrice != null ? item.discountedPrice! : item.price).toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedForeground,
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
                    ],
                  ),
                )),

            const SizedBox(height: 16),
            Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 16),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                Text(
                  '₱${sale.totalAmount.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            // Cash tendered and change (only for cash payments)
            if (sale.paymentMethod == PaymentMethod.cash &&
                widget.cashTendered != null) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cash Tendered',
                    style: TextStyle(color: AppColors.mutedForeground),
                  ),
                  Text(
                    '₱${widget.cashTendered!.toStringAsFixed(0)}',
                    style: TextStyle(color: AppColors.foreground),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Change',
                    style: TextStyle(color: AppColors.mutedForeground),
                  ),
                  Text(
                    '₱${change!.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 16),
            Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 16),

            // Footer
            Text(
              'Thank You!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
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
