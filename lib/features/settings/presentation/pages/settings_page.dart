import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart';
import '../../../printer/presentation/providers/printer_provider.dart';
import '../providers/settings_provider.dart';

/// Settings page for configuring printer and app settings.
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    super.initState();
    // Start scanning for printers when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(printerListNotifierProvider.notifier).startScan();
    });
  }

  @override
  void dispose() {
    // Stop scanning when leaving the page
    ref.read(printerListNotifierProvider.notifier).stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(settingsNotifierProvider);
    final printerListState = ref.watch(printerListNotifierProvider);
    final printingState = ref.watch(printerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading settings: $error'),
        ),
        data: (settings) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Paper Size Section
              _buildSectionHeader(context, 'Paper Size'),
              AppCard(
                child: Column(
                  children: [
                    _buildPaperSizeOption(
                      context,
                      title: '80mm (48 characters)',
                      subtitle: 'Standard thermal receipt width',
                      isSelected: settings.paperSize == PaperSize.mm80,
                      onTap: () => _setPaperSize(PaperSize.mm80),
                    ),
                    const Divider(height: 1),
                    _buildPaperSizeOption(
                      context,
                      title: '57mm (32 characters)',
                      subtitle: 'Narrow thermal receipt width',
                      isSelected: settings.paperSize == PaperSize.mm57,
                      onTap: () => _setPaperSize(PaperSize.mm57),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Printer Selection Section
              _buildSectionHeader(context, 'Printer'),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (settings.hasPrinterSelected) ...[
                      ListTile(
                        leading: Icon(
                          _getConnectionIcon(
                            settings.selectedPrinterConnectionType,
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(settings.selectedPrinterName ?? 'Unknown'),
                        subtitle: Text(
                          settings.selectedPrinterConnectionType?.name
                                  .toUpperCase() ??
                              '',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: _clearSelectedPrinter,
                        ),
                      ),
                      const Divider(),
                    ],
                    _buildPrinterList(printerListState, settings),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Test Print Section
              _buildSectionHeader(context, 'Test Print'),
              AppCard(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Print a test receipt to verify printer settings.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton.primary(
                          onPressed: settings.hasPrinterSelected
                              ? () => _printTestPage(settings)
                              : null,
                          isLoading: printingState is PrintingInProgress,
                          child: const Text('Print Test Page'),
                        ),
                      ),
                      if (printingState is PrintingSuccess)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Test print successful!',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      if (printingState is PrintingError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Error: ${(printingState as PrintingError).message}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Kiosk Mode Section
              _buildSectionHeader(context, 'Kiosk Mode'),
              AppCard(
                child: SwitchListTile(
                  title: const Text('Enable Kiosk Mode'),
                  subtitle: const Text(
                    'Lock app to full screen mode (prevents exiting)',
                  ),
                  value: settings.kioskModeEnabled,
                  onChanged: _setKioskMode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildPaperSizeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Widget _buildPrinterList(
    PrinterListState printerListState,
    dynamic settings,
  ) {
    if (printerListState is PrinterListInitial) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Tap to scan for printers'),
            const SizedBox(height: 8),
            AppButton.secondary(
              onPressed: _startScan,
              child: const Text('Scan for Printers'),
            ),
          ],
        ),
      );
    }

    if (printerListState is PrinterListScanning) {
      final printers = printerListState.printers;
      return Column(
        children: [
          if (printers.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 8),
                  Text('Scanning for printers...'),
                ],
              ),
            )
          else ...[
            ...printers.map((printer) => _buildPrinterTile(printer, settings)),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 8),
                  Text('Scanning...'),
                ],
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(8),
            child: AppButton.ghost(
              onPressed: _stopScan,
              child: const Text('Stop Scanning'),
            ),
          ),
        ],
      );
    }

    if (printerListState is PrinterListReady) {
      final printers = printerListState.printers;
      return Column(
        children: [
          if (printers.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('No printers found'),
            )
          else
            ...printers.map((printer) => _buildPrinterTile(printer, settings)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: AppButton.secondary(
              onPressed: _startScan,
              child: const Text('Scan Again'),
            ),
          ),
        ],
      );
    }

    if (printerListState is PrinterListError) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Error: ${printerListState.message}'),
            const SizedBox(height: 8),
            AppButton.secondary(
              onPressed: _startScan,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return const SizedBox();
  }

  Widget _buildPrinterTile(PrinterDevice printer, dynamic settings) {
    final isSelected = settings.selectedPrinterId == printer.id;

    return ListTile(
      leading: Icon(
        _getConnectionIcon(printer.connectionType),
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(printer.name),
      subtitle: Text(printer.connectionTypeDisplay),
      trailing: isSelected
          ? Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      onTap: () => _selectPrinter(printer),
    );
  }

  IconData _getConnectionIcon(PrinterConnectionType? type) {
    switch (type) {
      case PrinterConnectionType.usb:
        return Icons.usb;
      case PrinterConnectionType.bluetooth:
      case PrinterConnectionType.ble:
        return Icons.bluetooth;
      case PrinterConnectionType.network:
        return Icons.wifi;
      default:
        return Icons.print;
    }
  }

  void _setPaperSize(PaperSize size) {
    ref.read(settingsNotifierProvider.notifier).setPaperSize(size);
  }

  void _selectPrinter(PrinterDevice printer) async {
    // Connect to printer
    final connected =
        await ref.read(printerNotifierProvider.notifier).connect(printer);
    if (connected) {
      ref.read(settingsNotifierProvider.notifier).setSelectedPrinter(printer);
      if (mounted) {
        AppToast.success(
          context,
          title: 'Printer Selected',
          message: 'Connected to ${printer.name}',
        );
      }
    } else {
      if (mounted) {
        AppToast.error(
          context,
          title: 'Connection Failed',
          message: 'Could not connect to ${printer.name}',
        );
      }
    }
  }

  void _clearSelectedPrinter() {
    ref.read(settingsNotifierProvider.notifier).clearSelectedPrinter();
  }

  void _startScan() {
    ref.read(printerListNotifierProvider.notifier).startScan();
  }

  void _stopScan() {
    ref.read(printerListNotifierProvider.notifier).stopScan();
  }

  void _printTestPage(dynamic settings) {
    // Get the selected printer from the list
    final printerListState = ref.read(printerListNotifierProvider);
    final printers = switch (printerListState) {
      PrinterListScanning state => state.printers,
      PrinterListReady state => state.printers,
      _ => <PrinterDevice>[],
    };

    final selectedPrinter = printers.firstWhere(
      (p) => p.id == settings.selectedPrinterId,
      orElse: () => throw Exception('Selected printer not found'),
    );

    ref.read(printerNotifierProvider.notifier).printTestPage(
          selectedPrinter,
          settings.paperSize,
        );
  }

  void _setKioskMode(bool enabled) {
    ref.read(settingsNotifierProvider.notifier).setKioskMode(enabled);
    // TODO: Actually enable/disable kiosk mode using kiosk_mode package
  }
}
