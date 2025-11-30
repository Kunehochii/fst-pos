// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  /// Selected paper size for printing.
  @PaperSizeConverter()
  PaperSize get paperSize => throw _privateConstructorUsedError;

  /// Selected printer device ID.
  String? get selectedPrinterId => throw _privateConstructorUsedError;

  /// Selected printer name (for display).
  String? get selectedPrinterName => throw _privateConstructorUsedError;

  /// Selected printer connection type.
  @PrinterConnectionTypeConverter()
  PrinterConnectionType? get selectedPrinterConnectionType =>
      throw _privateConstructorUsedError;

  /// Whether kiosk mode is enabled.
  bool get kioskModeEnabled => throw _privateConstructorUsedError;

  /// Network printer IP address.
  String? get networkPrinterIp => throw _privateConstructorUsedError;

  /// Network printer port.
  int get networkPrinterPort => throw _privateConstructorUsedError;

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {@PaperSizeConverter() PaperSize paperSize,
      String? selectedPrinterId,
      String? selectedPrinterName,
      @PrinterConnectionTypeConverter()
      PrinterConnectionType? selectedPrinterConnectionType,
      bool kioskModeEnabled,
      String? networkPrinterIp,
      int networkPrinterPort});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paperSize = null,
    Object? selectedPrinterId = freezed,
    Object? selectedPrinterName = freezed,
    Object? selectedPrinterConnectionType = freezed,
    Object? kioskModeEnabled = null,
    Object? networkPrinterIp = freezed,
    Object? networkPrinterPort = null,
  }) {
    return _then(_value.copyWith(
      paperSize: null == paperSize
          ? _value.paperSize
          : paperSize // ignore: cast_nullable_to_non_nullable
              as PaperSize,
      selectedPrinterId: freezed == selectedPrinterId
          ? _value.selectedPrinterId
          : selectedPrinterId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPrinterName: freezed == selectedPrinterName
          ? _value.selectedPrinterName
          : selectedPrinterName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPrinterConnectionType: freezed == selectedPrinterConnectionType
          ? _value.selectedPrinterConnectionType
          : selectedPrinterConnectionType // ignore: cast_nullable_to_non_nullable
              as PrinterConnectionType?,
      kioskModeEnabled: null == kioskModeEnabled
          ? _value.kioskModeEnabled
          : kioskModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      networkPrinterIp: freezed == networkPrinterIp
          ? _value.networkPrinterIp
          : networkPrinterIp // ignore: cast_nullable_to_non_nullable
              as String?,
      networkPrinterPort: null == networkPrinterPort
          ? _value.networkPrinterPort
          : networkPrinterPort // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@PaperSizeConverter() PaperSize paperSize,
      String? selectedPrinterId,
      String? selectedPrinterName,
      @PrinterConnectionTypeConverter()
      PrinterConnectionType? selectedPrinterConnectionType,
      bool kioskModeEnabled,
      String? networkPrinterIp,
      int networkPrinterPort});
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paperSize = null,
    Object? selectedPrinterId = freezed,
    Object? selectedPrinterName = freezed,
    Object? selectedPrinterConnectionType = freezed,
    Object? kioskModeEnabled = null,
    Object? networkPrinterIp = freezed,
    Object? networkPrinterPort = null,
  }) {
    return _then(_$AppSettingsImpl(
      paperSize: null == paperSize
          ? _value.paperSize
          : paperSize // ignore: cast_nullable_to_non_nullable
              as PaperSize,
      selectedPrinterId: freezed == selectedPrinterId
          ? _value.selectedPrinterId
          : selectedPrinterId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPrinterName: freezed == selectedPrinterName
          ? _value.selectedPrinterName
          : selectedPrinterName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPrinterConnectionType: freezed == selectedPrinterConnectionType
          ? _value.selectedPrinterConnectionType
          : selectedPrinterConnectionType // ignore: cast_nullable_to_non_nullable
              as PrinterConnectionType?,
      kioskModeEnabled: null == kioskModeEnabled
          ? _value.kioskModeEnabled
          : kioskModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      networkPrinterIp: freezed == networkPrinterIp
          ? _value.networkPrinterIp
          : networkPrinterIp // ignore: cast_nullable_to_non_nullable
              as String?,
      networkPrinterPort: null == networkPrinterPort
          ? _value.networkPrinterPort
          : networkPrinterPort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl extends _AppSettings {
  const _$AppSettingsImpl(
      {@PaperSizeConverter() this.paperSize = PaperSize.mm80,
      this.selectedPrinterId,
      this.selectedPrinterName,
      @PrinterConnectionTypeConverter() this.selectedPrinterConnectionType,
      this.kioskModeEnabled = false,
      this.networkPrinterIp,
      this.networkPrinterPort = 9100})
      : super._();

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  /// Selected paper size for printing.
  @override
  @JsonKey()
  @PaperSizeConverter()
  final PaperSize paperSize;

  /// Selected printer device ID.
  @override
  final String? selectedPrinterId;

  /// Selected printer name (for display).
  @override
  final String? selectedPrinterName;

  /// Selected printer connection type.
  @override
  @PrinterConnectionTypeConverter()
  final PrinterConnectionType? selectedPrinterConnectionType;

  /// Whether kiosk mode is enabled.
  @override
  @JsonKey()
  final bool kioskModeEnabled;

  /// Network printer IP address.
  @override
  final String? networkPrinterIp;

  /// Network printer port.
  @override
  @JsonKey()
  final int networkPrinterPort;

  @override
  String toString() {
    return 'AppSettings(paperSize: $paperSize, selectedPrinterId: $selectedPrinterId, selectedPrinterName: $selectedPrinterName, selectedPrinterConnectionType: $selectedPrinterConnectionType, kioskModeEnabled: $kioskModeEnabled, networkPrinterIp: $networkPrinterIp, networkPrinterPort: $networkPrinterPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.paperSize, paperSize) ||
                other.paperSize == paperSize) &&
            (identical(other.selectedPrinterId, selectedPrinterId) ||
                other.selectedPrinterId == selectedPrinterId) &&
            (identical(other.selectedPrinterName, selectedPrinterName) ||
                other.selectedPrinterName == selectedPrinterName) &&
            (identical(other.selectedPrinterConnectionType,
                    selectedPrinterConnectionType) ||
                other.selectedPrinterConnectionType ==
                    selectedPrinterConnectionType) &&
            (identical(other.kioskModeEnabled, kioskModeEnabled) ||
                other.kioskModeEnabled == kioskModeEnabled) &&
            (identical(other.networkPrinterIp, networkPrinterIp) ||
                other.networkPrinterIp == networkPrinterIp) &&
            (identical(other.networkPrinterPort, networkPrinterPort) ||
                other.networkPrinterPort == networkPrinterPort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paperSize,
      selectedPrinterId,
      selectedPrinterName,
      selectedPrinterConnectionType,
      kioskModeEnabled,
      networkPrinterIp,
      networkPrinterPort);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(
      this,
    );
  }
}

abstract class _AppSettings extends AppSettings {
  const factory _AppSettings(
      {@PaperSizeConverter() final PaperSize paperSize,
      final String? selectedPrinterId,
      final String? selectedPrinterName,
      @PrinterConnectionTypeConverter()
      final PrinterConnectionType? selectedPrinterConnectionType,
      final bool kioskModeEnabled,
      final String? networkPrinterIp,
      final int networkPrinterPort}) = _$AppSettingsImpl;
  const _AppSettings._() : super._();

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  /// Selected paper size for printing.
  @override
  @PaperSizeConverter()
  PaperSize get paperSize;

  /// Selected printer device ID.
  @override
  String? get selectedPrinterId;

  /// Selected printer name (for display).
  @override
  String? get selectedPrinterName;

  /// Selected printer connection type.
  @override
  @PrinterConnectionTypeConverter()
  PrinterConnectionType? get selectedPrinterConnectionType;

  /// Whether kiosk mode is enabled.
  @override
  bool get kioskModeEnabled;

  /// Network printer IP address.
  @override
  String? get networkPrinterIp;

  /// Network printer port.
  @override
  int get networkPrinterPort;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
