import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/printer_datasource.dart';
import '../../data/repositories/printer_repository_impl.dart';
import '../../domain/entities/printer_device.dart';
import '../../domain/entities/receipt_line.dart';
import '../../domain/repositories/printer_repository.dart';

part 'printer_provider.g.dart';

/// Provides the printer data source.
@riverpod
PrinterDataSource printerDataSource(Ref ref) {
  final dataSource = PrinterDataSource();
  ref.onDispose(() => dataSource.dispose());
  return dataSource;
}

/// Provides the printer repository.
@riverpod
PrinterRepository printerRepository(Ref ref) {
  final dataSource = ref.watch(printerDataSourceProvider);
  return PrinterRepositoryImpl(dataSource);
}

/// State for the printer list.
sealed class PrinterListState {
  const PrinterListState();
}

class PrinterListInitial extends PrinterListState {
  const PrinterListInitial();
}

class PrinterListScanning extends PrinterListState {
  final List<PrinterDevice> printers;
  const PrinterListScanning(this.printers);
}

class PrinterListReady extends PrinterListState {
  final List<PrinterDevice> printers;
  const PrinterListReady(this.printers);
}

class PrinterListError extends PrinterListState {
  final String message;
  const PrinterListError(this.message);
}

/// Notifier for managing printer discovery and list.
@riverpod
class PrinterListNotifier extends _$PrinterListNotifier {
  StreamSubscription<List<PrinterDevice>>? _subscription;

  @override
  PrinterListState build() {
    ref.onDispose(() {
      _subscription?.cancel();
    });
    return const PrinterListInitial();
  }

  /// Start scanning for printers.
  Future<void> startScan({
    List<PrinterConnectionType> connectionTypes = const [
      PrinterConnectionType.usb,
      PrinterConnectionType.ble,
    ],
  }) async {
    final repository = ref.read(printerRepositoryProvider);

    state = const PrinterListScanning([]);

    _subscription?.cancel();
    _subscription = repository.printersStream.listen(
      (printers) {
        state = PrinterListScanning(printers);
      },
      onError: (error) {
        state = PrinterListError(error.toString());
      },
    );

    await repository.startScan(connectionTypes: connectionTypes);
  }

  /// Stop scanning for printers.
  Future<void> stopScan() async {
    final repository = ref.read(printerRepositoryProvider);
    await repository.stopScan();

    if (state is PrinterListScanning) {
      final currentState = state as PrinterListScanning;
      state = PrinterListReady(currentState.printers);
    }
  }

  /// Get the current list of printers.
  List<PrinterDevice> get printers {
    if (state is PrinterListScanning) {
      return (state as PrinterListScanning).printers;
    }
    if (state is PrinterListReady) {
      return (state as PrinterListReady).printers;
    }
    return [];
  }
}

/// State for printing operations.
sealed class PrintingState {
  const PrintingState();
}

class PrintingIdle extends PrintingState {
  const PrintingIdle();
}

class PrintingInProgress extends PrintingState {
  const PrintingInProgress();
}

class PrintingSuccess extends PrintingState {
  const PrintingSuccess();
}

class PrintingError extends PrintingState {
  final String message;
  const PrintingError(this.message);
}

/// Notifier for printing operations.
@riverpod
class PrinterNotifier extends _$PrinterNotifier {
  @override
  PrintingState build() => const PrintingIdle();

  /// Connect to a printer.
  Future<bool> connect(PrinterDevice printer) async {
    final repository = ref.read(printerRepositoryProvider);
    return await repository.connect(printer);
  }

  /// Disconnect from a printer.
  Future<void> disconnect(PrinterDevice printer) async {
    final repository = ref.read(printerRepositoryProvider);
    await repository.disconnect(printer);
  }

  /// Print a receipt.
  Future<void> printReceipt(
    PrinterDevice printer,
    Receipt receipt, {
    bool cut = true,
  }) async {
    state = const PrintingInProgress();

    try {
      final repository = ref.read(printerRepositoryProvider);
      await repository.printReceipt(printer, receipt, cut: cut);
      state = const PrintingSuccess();
    } catch (e) {
      state = PrintingError(e.toString());
    }
  }

  /// Print raw bytes.
  Future<void> printRawData(
    PrinterDevice printer,
    List<int> data,
  ) async {
    state = const PrintingInProgress();

    try {
      final repository = ref.read(printerRepositoryProvider);
      await repository.printRawData(printer, data);
      state = const PrintingSuccess();
    } catch (e) {
      state = PrintingError(e.toString());
    }
  }

  /// Print a test page.
  Future<void> printTestPage(
    PrinterDevice printer,
    PaperSize paperSize,
  ) async {
    state = const PrintingInProgress();

    try {
      final receipt = ReceiptBuilder()
          .paperSize(paperSize)
          .header('TEST PRINT')
          .separator()
          .empty()
          .text('Printer: ${printer.name}')
          .text('Connection: ${printer.connectionTypeDisplay}')
          .text(
            'Paper Size: ${paperSize == PaperSize.mm80 ? '80mm' : '57mm'}',
          )
          .empty()
          .separator(char: '=')
          .row('Left Text', 'Right Text')
          .separator()
          .empty()
          .center('Centered Text')
          .right('Right Aligned')
          .empty()
          .separator(char: '=')
          .center('Thank You!')
          .emptyLines(3)
          .build();

      final repository = ref.read(printerRepositoryProvider);
      await repository.printReceipt(printer, receipt, cut: true);
      state = const PrintingSuccess();
    } catch (e) {
      state = PrintingError(e.toString());
    }
  }

  /// Reset to idle state.
  void reset() {
    state = const PrintingIdle();
  }
}

/// Provider for Bluetooth state.
@riverpod
Future<bool> bluetoothOn(Ref ref) async {
  final repository = ref.watch(printerRepositoryProvider);
  return await repository.isBluetoothOn();
}
