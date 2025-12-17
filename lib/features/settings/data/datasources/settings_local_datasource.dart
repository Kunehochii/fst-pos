import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/app_settings.dart';
import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart';

/// Local data source for app settings using SharedPreferences.
class SettingsLocalDataSource {
  static const _settingsKey = 'app_settings';
  static const _paperSizeKey = 'paper_size';
  static const _selectedPrinterIdKey = 'selected_printer_id';
  static const _selectedPrinterNameKey = 'selected_printer_name';
  static const _selectedPrinterConnectionTypeKey =
      'selected_printer_connection_type';
  static const _kioskModeKey = 'kiosk_mode';
  static const _networkPrinterIpKey = 'network_printer_ip';
  static const _networkPrinterPortKey = 'network_printer_port';

  /// Load settings from SharedPreferences.
  Future<AppSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Try to load full JSON settings first
    final settingsJson = prefs.getString(_settingsKey);
    if (settingsJson != null) {
      try {
        final json = jsonDecode(settingsJson) as Map<String, dynamic>;
        return AppSettings.fromJson(json);
      } catch (_) {
        // Fall back to individual keys
      }
    }

    // Load from individual keys
    final paperSizeStr = prefs.getString(_paperSizeKey);
    final paperSize = _parsePaperSize(paperSizeStr);

    final selectedPrinterId = prefs.getString(_selectedPrinterIdKey);
    final selectedPrinterName = prefs.getString(_selectedPrinterNameKey);
    final connectionTypeStr =
        prefs.getString(_selectedPrinterConnectionTypeKey);
    final connectionType = _parseConnectionType(connectionTypeStr);

    final kioskModeEnabled = prefs.getBool(_kioskModeKey) ?? false;
    final networkPrinterIp = prefs.getString(_networkPrinterIpKey);
    final networkPrinterPort = prefs.getInt(_networkPrinterPortKey) ?? 9100;

    return AppSettings(
      paperSize: paperSize,
      selectedPrinterId: selectedPrinterId,
      selectedPrinterName: selectedPrinterName,
      selectedPrinterConnectionType: connectionType,
      kioskModeEnabled: kioskModeEnabled,
      networkPrinterIp: networkPrinterIp,
      networkPrinterPort: networkPrinterPort,
    );
  }

  /// Save settings to SharedPreferences.
  Future<void> saveSettings(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();

    // Save as JSON for complete persistence
    final json = settings.toJson();
    await prefs.setString(_settingsKey, jsonEncode(json));

    // Also save individual keys for quick access
    await prefs.setString(_paperSizeKey, settings.paperSize.name);

    if (settings.selectedPrinterId != null) {
      await prefs.setString(_selectedPrinterIdKey, settings.selectedPrinterId!);
    } else {
      await prefs.remove(_selectedPrinterIdKey);
    }

    if (settings.selectedPrinterName != null) {
      await prefs.setString(
          _selectedPrinterNameKey, settings.selectedPrinterName!);
    } else {
      await prefs.remove(_selectedPrinterNameKey);
    }

    if (settings.selectedPrinterConnectionType != null) {
      await prefs.setString(
        _selectedPrinterConnectionTypeKey,
        settings.selectedPrinterConnectionType!.name,
      );
    } else {
      await prefs.remove(_selectedPrinterConnectionTypeKey);
    }

    await prefs.setBool(_kioskModeKey, settings.kioskModeEnabled);

    if (settings.networkPrinterIp != null) {
      await prefs.setString(_networkPrinterIpKey, settings.networkPrinterIp!);
    } else {
      await prefs.remove(_networkPrinterIpKey);
    }

    await prefs.setInt(_networkPrinterPortKey, settings.networkPrinterPort);
  }

  /// Update paper size.
  Future<void> updatePaperSize(String paperSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_paperSizeKey, paperSize);
  }

  /// Update selected printer.
  Future<void> updateSelectedPrinter({
    required String printerId,
    required String printerName,
    required String connectionType,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedPrinterIdKey, printerId);
    await prefs.setString(_selectedPrinterNameKey, printerName);
    await prefs.setString(_selectedPrinterConnectionTypeKey, connectionType);
  }

  /// Clear selected printer.
  Future<void> clearSelectedPrinter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_selectedPrinterIdKey);
    await prefs.remove(_selectedPrinterNameKey);
    await prefs.remove(_selectedPrinterConnectionTypeKey);
  }

  /// Update kiosk mode.
  Future<void> updateKioskMode(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kioskModeKey, enabled);
  }

  /// Update network printer.
  Future<void> updateNetworkPrinter({
    required String ip,
    required int port,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_networkPrinterIpKey, ip);
    await prefs.setInt(_networkPrinterPortKey, port);
  }

  /// Parse paper size from string.
  PaperSize _parsePaperSize(String? value) {
    if (value == null) return PaperSize.mm80;
    switch (value.toLowerCase()) {
      case 'mm57':
        return PaperSize.mm57;
      case 'mm80':
      default:
        return PaperSize.mm80;
    }
  }

  /// Parse connection type from string.
  PrinterConnectionType? _parseConnectionType(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'usb':
        return PrinterConnectionType.usb;
      case 'bluetooth':
        return PrinterConnectionType.bluetooth;
      case 'ble':
        return PrinterConnectionType.ble;
      case 'network':
        return PrinterConnectionType.network;
      default:
        return null;
    }
  }
}
