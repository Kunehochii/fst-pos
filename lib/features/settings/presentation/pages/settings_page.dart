import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart';
import '../../../printer/presentation/providers/printer_provider.dart';
import '../providers/settings_provider.dart';

/// Settings page for configuring printer and app settings.
///
/// Features:
/// - Paper size configuration (80mm / 57mm)
/// - Printer selection via Bluetooth/USB/Network
/// - Test print functionality
/// - Kiosk mode toggle
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page header (consistent with other pages)
            Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Configure printer and application preferences',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 32),
            // Content
            Expanded(
              child: settingsAsync.when(
                loading: () => const Center(child: AppLoadingIndicator()),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: AppColors.destructive,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Failed to load settings',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppButton.primary(
                        onPressed: () =>
                            ref.invalidate(settingsNotifierProvider),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                data: (settings) => SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left column - Paper Size & Kiosk Mode
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Paper Size Section
                            _buildSectionHeader(
                              context,
                              'Paper Size',
                              Icons.straighten,
                            ),
                            const SizedBox(height: 12),
                            AppCard(
                              elevation: 1,
                              child: Column(
                                children: [
                                  _buildPaperSizeOption(
                                    context,
                                    title: '80mm (48 characters)',
                                    subtitle: 'Standard thermal receipt width',
                                    isSelected:
                                        settings.paperSize == PaperSize.mm80,
                                    onTap: () => _setPaperSize(PaperSize.mm80),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: AppColors.border,
                                  ),
                                  _buildPaperSizeOption(
                                    context,
                                    title: '57mm (32 characters)',
                                    subtitle: 'Narrow thermal receipt width',
                                    isSelected:
                                        settings.paperSize == PaperSize.mm57,
                                    onTap: () => _setPaperSize(PaperSize.mm57),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 28),

                            // Kiosk Mode Section
                            _buildSectionHeader(
                              context,
                              'Kiosk Mode',
                              Icons.fullscreen,
                            ),
                            const SizedBox(height: 12),
                            AppCard(
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 8,
                                ),
                                child: SwitchListTile(
                                  title: Text(
                                    'Enable Kiosk Mode',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.foreground,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      'Lock app to full screen mode (prevents exiting)',
                                      style: TextStyle(
                                        color: AppColors.mutedForeground,
                                      ),
                                    ),
                                  ),
                                  value: settings.kioskModeEnabled,
                                  onChanged: _setKioskMode,
                                  activeTrackColor: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 28),

                            // Test Print Section
                            _buildSectionHeader(
                              context,
                              'Test Print',
                              Icons.print,
                            ),
                            const SizedBox(height: 12),
                            AppCard(
                              elevation: 1,
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Print a test receipt to verify printer settings.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    child: AppButton.primary(
                                      onPressed: settings.hasPrinterSelected
                                          ? () => _printTestPage(settings)
                                          : null,
                                      isLoading:
                                          printingState is PrintingInProgress,
                                      icon: const Icon(Icons.print, size: 18),
                                      child: const Text('Print Test Page'),
                                    ),
                                  ),
                                  if (printingState is PrintingSuccess)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            size: 18,
                                            color: AppColors.success,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Test print successful!',
                                            style: TextStyle(
                                              color: AppColors.success,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (printingState is PrintingError)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.error_outline,
                                            size: 18,
                                            color: AppColors.destructive,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              'Error: ${printingState.message}',
                                              style: TextStyle(
                                                color: AppColors.destructive,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Right column - Printer Selection
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader(
                              context,
                              'Printer',
                              Icons.print_outlined,
                            ),
                            const SizedBox(height: 12),
                            AppCard(
                              elevation: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (settings.hasPrinterSelected) ...[
                                    _buildSelectedPrinterTile(settings),
                                    Divider(
                                      height: 1,
                                      color: AppColors.border,
                                    ),
                                  ],
                                  _buildPrinterList(printerListState, settings),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedPrinterTile(dynamic settings) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppColors.radiusLg),
          topRight: Radius.circular(AppColors.radiusLg),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getConnectionIcon(settings.selectedPrinterConnectionType),
              color: AppColors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        settings.selectedPrinterName ?? 'Unknown',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Connected',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  settings.selectedPrinterConnectionType?.name.toUpperCase() ??
                      '',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _clearSelectedPrinter,
            icon: Icon(
              Icons.close,
              size: 20,
              color: AppColors.mutedForeground,
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.muted,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.mutedForeground,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }

  Widget _buildPaperSizeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrinterList(
    PrinterListState printerListState,
    dynamic settings,
  ) {
    if (printerListState is PrinterListInitial) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.print_outlined,
                size: 28,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No printers detected',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Tap to scan for available printers',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 16),
            AppButton.primary(
              onPressed: _startScan,
              icon: const Icon(Icons.search, size: 18),
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
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Scanning for printers...',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Make sure your printer is turned on',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            )
          else ...[
            ...printers.map((printer) => _buildPrinterTile(printer, settings)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Scanning...',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: AppButton.ghost(
                onPressed: _stopScan,
                child: const Text('Stop Scanning'),
              ),
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
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.muted,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Icon(
                      Icons.search_off,
                      size: 28,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No printers found',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Make sure your printer is on and nearby',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            )
          else
            ...printers.map((printer) => _buildPrinterTile(printer, settings)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: AppButton.secondary(
                onPressed: _startScan,
                icon: const Icon(Icons.refresh, size: 18),
                child: const Text('Scan Again'),
              ),
            ),
          ),
        ],
      );
    }

    if (printerListState is PrinterListError) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.destructive.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.error_outline,
                size: 28,
                color: AppColors.destructive,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Scan failed',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              printerListState.message,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 16),
            AppButton.primary(
              onPressed: _startScan,
              icon: const Icon(Icons.refresh, size: 18),
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

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _selectPrinter(printer),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.05)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.muted,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getConnectionIcon(printer.connectionType),
                  size: 20,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.mutedForeground,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      printer.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      printer.connectionTypeDisplay,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: AppColors.primaryForeground,
                  ),
                ),
            ],
          ),
        ),
      ),
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
