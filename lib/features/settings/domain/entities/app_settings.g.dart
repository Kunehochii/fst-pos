// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AppSettingsImpl',
      json,
      ($checkedConvert) {
        final val = _$AppSettingsImpl(
          paperSize: $checkedConvert(
              'paper_size',
              (v) => v == null
                  ? PaperSize.mm80
                  : const PaperSizeConverter().fromJson(v as String)),
          selectedPrinterId:
              $checkedConvert('selected_printer_id', (v) => v as String?),
          selectedPrinterName:
              $checkedConvert('selected_printer_name', (v) => v as String?),
          selectedPrinterConnectionType: $checkedConvert(
              'selected_printer_connection_type',
              (v) => const PrinterConnectionTypeConverter()
                  .fromJson(v as String?)),
          kioskModeEnabled:
              $checkedConvert('kiosk_mode_enabled', (v) => v as bool? ?? false),
          networkPrinterIp:
              $checkedConvert('network_printer_ip', (v) => v as String?),
          networkPrinterPort: $checkedConvert(
              'network_printer_port', (v) => (v as num?)?.toInt() ?? 9100),
        );
        return val;
      },
      fieldKeyMap: const {
        'paperSize': 'paper_size',
        'selectedPrinterId': 'selected_printer_id',
        'selectedPrinterName': 'selected_printer_name',
        'selectedPrinterConnectionType': 'selected_printer_connection_type',
        'kioskModeEnabled': 'kiosk_mode_enabled',
        'networkPrinterIp': 'network_printer_ip',
        'networkPrinterPort': 'network_printer_port'
      },
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'paper_size': const PaperSizeConverter().toJson(instance.paperSize),
      if (instance.selectedPrinterId case final value?)
        'selected_printer_id': value,
      if (instance.selectedPrinterName case final value?)
        'selected_printer_name': value,
      if (const PrinterConnectionTypeConverter()
              .toJson(instance.selectedPrinterConnectionType)
          case final value?)
        'selected_printer_connection_type': value,
      'kiosk_mode_enabled': instance.kioskModeEnabled,
      if (instance.networkPrinterIp case final value?)
        'network_printer_ip': value,
      'network_printer_port': instance.networkPrinterPort,
    };
