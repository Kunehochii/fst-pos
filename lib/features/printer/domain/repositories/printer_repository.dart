import 'dart:typed_data';

import '../entities/printer_device.dart';
import '../entities/receipt_line.dart';

/// Repository interface for printer operations.
abstract class PrinterRepository {
  /// Stream of available printers.
  Stream<List<PrinterDevice>> get printersStream;

  /// Start scanning for available printers.
  ///
  /// [connectionTypes] - Types of connections to scan for.
  Future<void> startScan({
    List<PrinterConnectionType> connectionTypes = const [
      PrinterConnectionType.usb,
      PrinterConnectionType.ble,
    ],
  });

  /// Stop scanning for printers.
  Future<void> stopScan();

  /// Connect to a printer.
  Future<bool> connect(PrinterDevice printer);

  /// Disconnect from a printer.
  Future<void> disconnect(PrinterDevice printer);

  /// Check if a printer is connected.
  Future<bool> isConnected(PrinterDevice printer);

  /// Print a receipt.
  ///
  /// [printer] - The printer to print to.
  /// [receipt] - The receipt to print.
  /// [cut] - Whether to cut the paper after printing.
  Future<void> printReceipt(
    PrinterDevice printer,
    Receipt receipt, {
    bool cut = true,
  });

  /// Print raw ESC/POS bytes.
  ///
  /// [printer] - The printer to print to.
  /// [data] - The raw byte data to send.
  Future<void> printRawData(
    PrinterDevice printer,
    List<int> data,
  );

  /// Print a widget as an image.
  ///
  /// [printer] - The printer to print to.
  /// [image] - The image bytes to print.
  /// [paperSize] - The paper size to use.
  /// [cut] - Whether to cut the paper after printing.
  Future<void> printImage(
    PrinterDevice printer,
    Uint8List image,
    PaperSize paperSize, {
    bool cut = true,
  });

  /// Turn on Bluetooth (if supported).
  Future<void> turnOnBluetooth();

  /// Check if Bluetooth is turned on.
  Future<bool> isBluetoothOn();

  /// Dispose resources.
  Future<void> dispose();
}
