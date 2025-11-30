import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_thermal_printer/utils/printer.dart';

part 'printer_device.freezed.dart';

/// Connection type for printers.
enum PrinterConnectionType {
  usb,
  bluetooth,
  ble,
  network;

  /// Convert from flutter_thermal_printer ConnectionType.
  static PrinterConnectionType fromLibrary(ConnectionType type) {
    switch (type) {
      case ConnectionType.USB:
        return PrinterConnectionType.usb;
      case ConnectionType.BLE:
        return PrinterConnectionType.ble;
      default:
        return PrinterConnectionType.bluetooth;
    }
  }

  /// Convert to flutter_thermal_printer ConnectionType.
  ConnectionType toLibrary() {
    switch (this) {
      case PrinterConnectionType.usb:
        return ConnectionType.USB;
      case PrinterConnectionType.ble:
      case PrinterConnectionType.bluetooth:
        return ConnectionType.BLE;
      case PrinterConnectionType.network:
        return ConnectionType.USB; // Network handled separately
    }
  }
}

/// Represents a POS printer device.
@freezed
class PrinterDevice with _$PrinterDevice {
  const PrinterDevice._();

  const factory PrinterDevice({
    /// Unique identifier for the printer (vendor ID or address).
    required String id,

    /// Display name of the printer.
    required String name,

    /// Type of connection (USB, Bluetooth, BLE, Network).
    required PrinterConnectionType connectionType,

    /// The underlying library printer object.
    Printer? rawPrinter,

    /// Whether the printer is currently connected.
    @Default(false) bool isConnected,

    /// IP address for network printers.
    String? ipAddress,

    /// Port for network printers (default 9100).
    @Default(9100) int port,

    /// Vendor ID for USB printers.
    String? vendorId,

    /// Product ID for USB printers.
    String? productId,
  }) = _PrinterDevice;

  /// Create from flutter_thermal_printer Printer object.
  factory PrinterDevice.fromLibrary(Printer printer) {
    return PrinterDevice(
      id: printer.address ?? printer.vendorId ?? printer.name ?? 'unknown',
      name: printer.name ?? 'Unknown Printer',
      connectionType: PrinterConnectionType.fromLibrary(
        printer.connectionType ?? ConnectionType.USB,
      ),
      rawPrinter: printer,
      isConnected: printer.isConnected ?? false,
      vendorId: printer.vendorId,
      productId: printer.productId,
    );
  }

  /// Create a network printer device.
  factory PrinterDevice.network({
    required String name,
    required String ipAddress,
    int port = 9100,
  }) {
    return PrinterDevice(
      id: '$ipAddress:$port',
      name: name,
      connectionType: PrinterConnectionType.network,
      ipAddress: ipAddress,
      port: port,
    );
  }

  /// Display string for the connection type.
  String get connectionTypeDisplay {
    switch (connectionType) {
      case PrinterConnectionType.usb:
        return 'USB';
      case PrinterConnectionType.bluetooth:
        return 'Bluetooth';
      case PrinterConnectionType.ble:
        return 'BLE';
      case PrinterConnectionType.network:
        return 'Network';
    }
  }
}
