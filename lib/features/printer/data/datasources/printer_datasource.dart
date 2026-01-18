import 'dart:async';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart' as esc;
import 'package:flutter/foundation.dart';
import 'package:flutter_thermal_printer/flutter_thermal_printer.dart'
    hide PaperSize;
import 'package:flutter_thermal_printer/utils/printer.dart'
    show Printer, ConnectionType;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/entities/printer_device.dart';
import '../../domain/entities/receipt_line.dart';

/// Data source for printer operations using flutter_thermal_printer.
class PrinterDataSource {
  final FlutterThermalPrinter _thermalPrinter = FlutterThermalPrinter.instance;
  StreamSubscription<List<Printer>>? _devicesStreamSubscription;

  /// Stream of available printers.
  Stream<List<PrinterDevice>> get printersStream =>
      _thermalPrinter.devicesStream.map(
        (printers) =>
            printers.map((p) => PrinterDevice.fromLibrary(p)).toList(),
      );

  /// Ensure location services are enabled (required for BLE scanning on Android).
  Future<bool> _ensureLocationServices() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('Location services are disabled');
        return false;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          debugPrint('Location permissions are denied');
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint('Location permissions are permanently denied');
        return false;
      }

      debugPrint('Location services and permissions are available');
      return true;
    } catch (e) {
      debugPrint('Error checking location services: $e');
      return false;
    }
  }

  /// Ensure Bluetooth permissions are granted.
  Future<bool> _ensureBluetoothPermissions() async {
    try {
      // Request necessary Bluetooth permissions
      final bluetoothScanStatus = await Permission.bluetoothScan.request();
      final bluetoothConnectStatus =
          await Permission.bluetoothConnect.request();

      if (bluetoothScanStatus.isPermanentlyDenied ||
          bluetoothConnectStatus.isPermanentlyDenied) {
        debugPrint('Bluetooth permissions permanently denied');
        return false;
      }

      if (bluetoothScanStatus.isDenied || bluetoothConnectStatus.isDenied) {
        debugPrint('Bluetooth permissions denied');
        return false;
      }

      debugPrint('Bluetooth permissions granted');
      return true;
    } catch (e) {
      debugPrint('Error requesting Bluetooth permissions: $e');
      return false;
    }
  }

  /// Request all required permissions for Bluetooth scanning.
  /// Returns true if all permissions are granted.
  Future<bool> requestBluetoothPermissions() async {
    try {
      // First check location services (required for BLE on Android)
      final locationOk = await _ensureLocationServices();
      if (!locationOk) {
        debugPrint('Location services check failed');
        return false;
      }

      // Then check Bluetooth permissions
      final bluetoothOk = await _ensureBluetoothPermissions();
      if (!bluetoothOk) {
        debugPrint('Bluetooth permissions check failed');
        return false;
      }

      return true;
    } catch (e) {
      debugPrint('Error in requestBluetoothPermissions: $e');
      return false;
    }
  }

  /// Get the current Bluetooth availability state.
  /// Returns a string describing the state.
  Future<String> getBluetoothAvailabilityStatus() async {
    try {
      // Check location services first
      final locationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!locationEnabled) {
        return 'location_disabled';
      }

      // Check location permission
      final locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        return 'location_permission_denied';
      }

      // Check Bluetooth permissions
      final bluetoothScan = await Permission.bluetoothScan.status;
      final bluetoothConnect = await Permission.bluetoothConnect.status;
      if (bluetoothScan.isDenied || bluetoothConnect.isDenied) {
        return 'bluetooth_permission_denied';
      }
      if (bluetoothScan.isPermanentlyDenied ||
          bluetoothConnect.isPermanentlyDenied) {
        return 'bluetooth_permission_permanently_denied';
      }

      // Check if Bluetooth is on
      final isOn = await _thermalPrinter.isBleTurnedOn();
      if (isOn) {
        return 'poweredOn';
      } else {
        return 'poweredOff';
      }
    } catch (e) {
      debugPrint('Error getting Bluetooth status: $e');
      return 'unknown';
    }
  }

  /// Start scanning for BLE printers with proper timeout handling.
  Future<List<PrinterDevice>> scanBlePrinters({
    Duration timeout = const Duration(seconds: 8),
  }) async {
    try {
      debugPrint('Starting BLE printer scan...');

      // Ensure permissions first
      final locationOk = await _ensureLocationServices();
      if (!locationOk) {
        debugPrint('Location services not available for Bluetooth scanning');
        return [];
      }

      final bluetoothOk = await _ensureBluetoothPermissions();
      if (!bluetoothOk) {
        debugPrint('Bluetooth permissions not available');
        return [];
      }

      final completer = Completer<List<PrinterDevice>>();
      final List<PrinterDevice> printers = [];

      _devicesStreamSubscription?.cancel();

      try {
        await _thermalPrinter.getPrinters(connectionTypes: [
          ConnectionType.BLE,
        ]);

        _devicesStreamSubscription = _thermalPrinter.devicesStream.listen(
          (List<Printer> devices) {
            log('Found ${devices.length} BLE printers');

            printers.clear();
            for (var device in devices) {
              printers.add(PrinterDevice.fromLibrary(device));
              debugPrint('BLE Printer: ${device.name} - ${device.address}');
            }

            // Complete after receiving devices (with a small delay to allow more)
            if (!completer.isCompleted && printers.isNotEmpty) {
              Future.delayed(const Duration(seconds: 2), () {
                if (!completer.isCompleted) {
                  completer.complete(List.from(printers));
                }
              });
            }
          },
          onError: (error) {
            debugPrint('BLE scan error: $error');
            if (!completer.isCompleted) {
              completer.complete([]);
            }
          },
        );
      } catch (e) {
        debugPrint('Error starting BLE printer scan: $e');
        if (!completer.isCompleted) {
          completer.complete([]);
        }
      }

      // Wait for results with timeout
      try {
        final result = await completer.future.timeout(
          timeout,
          onTimeout: () {
            debugPrint(
                'BLE scan timeout, returning ${printers.length} printers found so far');
            return List.from(printers);
          },
        );

        return result;
      } catch (e) {
        debugPrint('Error in BLE scan: $e');
        return [];
      }
    } catch (e) {
      debugPrint('Exception in scanBlePrinters: $e');
      return [];
    }
  }

  /// Start scanning for printers (stream-based scanning).
  Future<void> startScan({
    List<PrinterConnectionType> connectionTypes = const [
      PrinterConnectionType.usb,
      PrinterConnectionType.ble,
    ],
  }) async {
    // Request permissions before scanning
    final hasPermissions = await requestBluetoothPermissions();
    if (!hasPermissions) {
      debugPrint('Bluetooth permissions not granted for scanning');
    }

    final types = connectionTypes.map((t) => t.toLibrary()).toList();
    await _thermalPrinter.getPrinters(
      connectionTypes: types,
      refreshDuration: const Duration(seconds: 2),
    );
  }

  /// Stop scanning for printers.
  Future<void> stopScan() async {
    _devicesStreamSubscription?.cancel();
    await _thermalPrinter.stopScan();
  }

  /// Connect to a printer.
  Future<bool> connect(PrinterDevice device) async {
    if (device.rawPrinter == null) {
      debugPrint('Cannot connect: rawPrinter is null');
      return false;
    }
    try {
      debugPrint('Connecting to printer: ${device.name}...');

      // For BLE printers, disconnect first to ensure clean state
      if (device.connectionType == PrinterConnectionType.ble) {
        try {
          await _thermalPrinter.disconnect(device.rawPrinter!);
          await Future.delayed(const Duration(milliseconds: 500));
        } catch (e) {
          debugPrint('Disconnect before connect (expected): $e');
        }
      }

      final result = await _thermalPrinter.connect(device.rawPrinter!);

      // Wait for connection to stabilize
      if (device.connectionType == PrinterConnectionType.ble) {
        await Future.delayed(const Duration(milliseconds: 1500));
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
      }

      debugPrint('Connection result: $result');
      return result;
    } catch (e) {
      debugPrint('Printer connection error: $e');
      return false;
    }
  }

  /// Disconnect from a printer.
  Future<void> disconnect(PrinterDevice device) async {
    if (device.rawPrinter == null) {
      return;
    }
    await _thermalPrinter.disconnect(device.rawPrinter!);
  }

  /// Print a receipt.
  Future<void> printReceipt(
    PrinterDevice device,
    Receipt receipt, {
    bool cut = true,
  }) async {
    if (device.rawPrinter == null) {
      throw Exception('Printer not connected');
    }

    final profile = await esc.CapabilityProfile.load();
    final escPaperSize = _toEscPaperSize(receipt.paperSize);
    final generator = esc.Generator(escPaperSize, profile);

    List<int> bytes = [];

    // Initialize printer
    bytes += generator.reset();

    for (final line in receipt.lines) {
      bytes += _generateLineBytes(generator, line, receipt.paperSize);
    }

    // Add some space at the end
    bytes += generator.feed(2);

    // Cut paper if requested
    if (cut) {
      bytes += generator.cut();
    }

    await _thermalPrinter.printData(
      device.rawPrinter!,
      bytes,
      longData: true,
    );
  }

  /// Generate ESC/POS bytes for a receipt line.
  List<int> _generateLineBytes(
    esc.Generator generator,
    ReceiptLine line,
    PaperSize paperSize,
  ) {
    return line.map(
      text: (textLine) {
        return generator.text(
          textLine.text,
          styles: esc.PosStyles(
            align: _toEscAlign(textLine.align),
            bold: textLine.bold,
          ),
        );
      },
      row: (rowLine) {
        // For row lines, we format the text ourselves and use left alignment
        final formattedText = rowLine.format(paperSize);
        return generator.text(
          formattedText,
          styles: esc.PosStyles(
            align: esc.PosAlign.left,
            bold: rowLine.bold,
          ),
        );
      },
      separator: (sepLine) {
        return generator.hr(ch: sepLine.char);
      },
      empty: (_) {
        return generator.feed(1);
      },
      header: (headerLine) {
        return generator.text(
          headerLine.text,
          styles: esc.PosStyles(
            align: _toEscAlign(headerLine.align),
            bold: headerLine.bold,
            height: esc.PosTextSize.size2,
            width: esc.PosTextSize.size2,
          ),
        );
      },
    );
  }

  /// Convert our TextAlign to ESC/POS alignment.
  esc.PosAlign _toEscAlign(TextAlign align) {
    switch (align) {
      case TextAlign.left:
        return esc.PosAlign.left;
      case TextAlign.center:
        return esc.PosAlign.center;
      case TextAlign.right:
        return esc.PosAlign.right;
    }
  }

  /// Convert our PaperSize to ESC/POS paper size.
  esc.PaperSize _toEscPaperSize(PaperSize size) {
    switch (size) {
      case PaperSize.mm57:
        return esc.PaperSize.mm58;
      case PaperSize.mm80:
        return esc.PaperSize.mm80;
    }
  }

  /// Print raw bytes to a printer.
  Future<void> printRawData(PrinterDevice device, List<int> data) async {
    if (device.rawPrinter == null) {
      throw Exception('Printer not connected');
    }

    await _thermalPrinter.printData(
      device.rawPrinter!,
      data,
      longData: true,
    );
  }

  /// Print image bytes to a printer.
  Future<void> printImage(
    PrinterDevice device,
    Uint8List image,
    PaperSize paperSize, {
    bool cut = true,
  }) async {
    if (device.rawPrinter == null) {
      throw Exception('Printer not connected');
    }

    final profile = await esc.CapabilityProfile.load();
    final escPaperSize = _toEscPaperSize(paperSize);
    final generator = esc.Generator(escPaperSize, profile);

    // The flutter_thermal_printer package handles image conversion internally
    // We'll use their printWidget method for complex widgets
    List<int> bytes = [];
    bytes += generator.reset();

    // For simple byte array images, we decode and print
    // For widget printing, the repository layer should use printWidget
    if (cut) {
      bytes += generator.cut();
    }

    await _thermalPrinter.printData(
      device.rawPrinter!,
      bytes,
      longData: true,
    );
  }

  /// Turn on Bluetooth.
  Future<void> turnOnBluetooth() async {
    await _thermalPrinter.turnOnBluetooth();
  }

  /// Check if Bluetooth is on.
  Future<bool> isBluetoothOn() async {
    return await _thermalPrinter.isBleTurnedOn();
  }

  /// Dispose resources.
  Future<void> dispose() async {
    _devicesStreamSubscription?.cancel();
    await stopScan();
  }
}
