/// Printer feature exports.
///
/// Provides POS printer functionality including:
/// - Printer discovery (USB, Bluetooth, BLE)
/// - Receipt formatting with alignment options
/// - ESC/POS command generation
/// - Print operations

// Domain - Entities
export 'domain/entities/printer_device.dart';
export 'domain/entities/receipt_line.dart';

// Domain - Repositories
export 'domain/repositories/printer_repository.dart';

// Data - Datasources
export 'data/datasources/printer_datasource.dart';

// Data - Repositories
export 'data/repositories/printer_repository_impl.dart';

// Presentation - Providers
export 'presentation/providers/printer_provider.dart';
