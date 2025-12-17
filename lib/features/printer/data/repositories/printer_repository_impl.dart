import 'dart:typed_data';

import '../../domain/entities/printer_device.dart';
import '../../domain/entities/receipt_line.dart';
import '../../domain/repositories/printer_repository.dart';
import '../datasources/printer_datasource.dart';

/// Implementation of [PrinterRepository] using [PrinterDataSource].
class PrinterRepositoryImpl implements PrinterRepository {
  final PrinterDataSource _dataSource;

  PrinterRepositoryImpl(this._dataSource);

  @override
  Stream<List<PrinterDevice>> get printersStream => _dataSource.printersStream;

  @override
  Future<void> startScan({
    List<PrinterConnectionType> connectionTypes = const [
      PrinterConnectionType.usb,
      PrinterConnectionType.ble,
    ],
  }) async {
    await _dataSource.startScan(connectionTypes: connectionTypes);
  }

  @override
  Future<void> stopScan() async {
    await _dataSource.stopScan();
  }

  @override
  Future<bool> connect(PrinterDevice printer) async {
    return await _dataSource.connect(printer);
  }

  @override
  Future<void> disconnect(PrinterDevice printer) async {
    await _dataSource.disconnect(printer);
  }

  @override
  Future<bool> isConnected(PrinterDevice printer) async {
    return printer.isConnected;
  }

  @override
  Future<void> printReceipt(
    PrinterDevice printer,
    Receipt receipt, {
    bool cut = true,
  }) async {
    await _dataSource.printReceipt(printer, receipt, cut: cut);
  }

  @override
  Future<void> printRawData(PrinterDevice printer, List<int> data) async {
    await _dataSource.printRawData(printer, data);
  }

  @override
  Future<void> printImage(
    PrinterDevice printer,
    Uint8List image,
    PaperSize paperSize, {
    bool cut = true,
  }) async {
    await _dataSource.printImage(printer, image, paperSize, cut: cut);
  }

  @override
  Future<void> turnOnBluetooth() async {
    await _dataSource.turnOnBluetooth();
  }

  @override
  Future<bool> isBluetoothOn() async {
    return await _dataSource.isBluetoothOn();
  }

  @override
  Future<void> dispose() async {
    await _dataSource.dispose();
  }
}
