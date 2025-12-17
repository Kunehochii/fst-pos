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
              'paperSize',
              (v) => v == null
                  ? PaperSize.mm80
                  : const PaperSizeConverter().fromJson(v as String)),
          selectedPrinterId:
              $checkedConvert('selectedPrinterId', (v) => v as String?),
          selectedPrinterName:
              $checkedConvert('selectedPrinterName', (v) => v as String?),
          selectedPrinterConnectionType: $checkedConvert(
              'selectedPrinterConnectionType',
              (v) => const PrinterConnectionTypeConverter()
                  .fromJson(v as String?)),
          kioskModeEnabled:
              $checkedConvert('kioskModeEnabled', (v) => v as bool? ?? false),
          networkPrinterIp:
              $checkedConvert('networkPrinterIp', (v) => v as String?),
          networkPrinterPort: $checkedConvert(
              'networkPrinterPort', (v) => (v as num?)?.toInt() ?? 9100),
        );
        return val;
      },
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'paperSize': const PaperSizeConverter().toJson(instance.paperSize),
      if (instance.selectedPrinterId case final value?)
        'selectedPrinterId': value,
      if (instance.selectedPrinterName case final value?)
        'selectedPrinterName': value,
      if (const PrinterConnectionTypeConverter()
              .toJson(instance.selectedPrinterConnectionType)
          case final value?)
        'selectedPrinterConnectionType': value,
      'kioskModeEnabled': instance.kioskModeEnabled,
      if (instance.networkPrinterIp case final value?)
        'networkPrinterIp': value,
      'networkPrinterPort': instance.networkPrinterPort,
    };
