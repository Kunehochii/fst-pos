import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

/// JSON converter for PaperSize enum.
class PaperSizeConverter implements JsonConverter<PaperSize, String> {
  const PaperSizeConverter();

  @override
  PaperSize fromJson(String json) {
    switch (json.toLowerCase()) {
      case 'mm57':
        return PaperSize.mm57;
      case 'mm80':
      default:
        return PaperSize.mm80;
    }
  }

  @override
  String toJson(PaperSize object) => object.name;
}

/// JSON converter for PrinterConnectionType enum.
class PrinterConnectionTypeConverter
    implements JsonConverter<PrinterConnectionType?, String?> {
  const PrinterConnectionTypeConverter();

  @override
  PrinterConnectionType? fromJson(String? json) {
    if (json == null) return null;
    switch (json.toLowerCase()) {
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

  @override
  String? toJson(PrinterConnectionType? object) => object?.name;
}

/// Application settings entity.
@freezed
class AppSettings with _$AppSettings {
  const AppSettings._();

  const factory AppSettings({
    /// Selected paper size for printing.
    @PaperSizeConverter() @Default(PaperSize.mm80) PaperSize paperSize,

    /// Selected printer device ID.
    String? selectedPrinterId,

    /// Selected printer name (for display).
    String? selectedPrinterName,

    /// Selected printer connection type.
    @PrinterConnectionTypeConverter()
    PrinterConnectionType? selectedPrinterConnectionType,

    /// Whether kiosk mode is enabled.
    @Default(false) bool kioskModeEnabled,

    /// Network printer IP address.
    String? networkPrinterIp,

    /// Network printer port.
    @Default(9100) int networkPrinterPort,
  }) = _AppSettings;

  /// Create from JSON.
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  /// Check if a printer is selected.
  bool get hasPrinterSelected => selectedPrinterId != null;

  /// Paper size display name.
  String get paperSizeDisplay {
    switch (paperSize) {
      case PaperSize.mm57:
        return '57mm (32 chars)';
      case PaperSize.mm80:
        return '80mm (48 chars)';
    }
  }
}
