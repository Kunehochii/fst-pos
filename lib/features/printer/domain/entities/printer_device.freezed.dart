// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrinterDevice {
  /// Unique identifier for the printer (vendor ID or address).
  String get id => throw _privateConstructorUsedError;

  /// Display name of the printer.
  String get name => throw _privateConstructorUsedError;

  /// Type of connection (USB, Bluetooth, BLE, Network).
  PrinterConnectionType get connectionType =>
      throw _privateConstructorUsedError;

  /// The underlying library printer object.
  Printer? get rawPrinter => throw _privateConstructorUsedError;

  /// Whether the printer is currently connected.
  bool get isConnected => throw _privateConstructorUsedError;

  /// IP address for network printers.
  String? get ipAddress => throw _privateConstructorUsedError;

  /// Port for network printers (default 9100).
  int get port => throw _privateConstructorUsedError;

  /// Vendor ID for USB printers.
  String? get vendorId => throw _privateConstructorUsedError;

  /// Product ID for USB printers.
  String? get productId => throw _privateConstructorUsedError;

  /// Create a copy of PrinterDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterDeviceCopyWith<PrinterDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterDeviceCopyWith<$Res> {
  factory $PrinterDeviceCopyWith(
          PrinterDevice value, $Res Function(PrinterDevice) then) =
      _$PrinterDeviceCopyWithImpl<$Res, PrinterDevice>;
  @useResult
  $Res call(
      {String id,
      String name,
      PrinterConnectionType connectionType,
      Printer? rawPrinter,
      bool isConnected,
      String? ipAddress,
      int port,
      String? vendorId,
      String? productId});
}

/// @nodoc
class _$PrinterDeviceCopyWithImpl<$Res, $Val extends PrinterDevice>
    implements $PrinterDeviceCopyWith<$Res> {
  _$PrinterDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? connectionType = null,
    Object? rawPrinter = freezed,
    Object? isConnected = null,
    Object? ipAddress = freezed,
    Object? port = null,
    Object? vendorId = freezed,
    Object? productId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      connectionType: null == connectionType
          ? _value.connectionType
          : connectionType // ignore: cast_nullable_to_non_nullable
              as PrinterConnectionType,
      rawPrinter: freezed == rawPrinter
          ? _value.rawPrinter
          : rawPrinter // ignore: cast_nullable_to_non_nullable
              as Printer?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrinterDeviceImplCopyWith<$Res>
    implements $PrinterDeviceCopyWith<$Res> {
  factory _$$PrinterDeviceImplCopyWith(
          _$PrinterDeviceImpl value, $Res Function(_$PrinterDeviceImpl) then) =
      __$$PrinterDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      PrinterConnectionType connectionType,
      Printer? rawPrinter,
      bool isConnected,
      String? ipAddress,
      int port,
      String? vendorId,
      String? productId});
}

/// @nodoc
class __$$PrinterDeviceImplCopyWithImpl<$Res>
    extends _$PrinterDeviceCopyWithImpl<$Res, _$PrinterDeviceImpl>
    implements _$$PrinterDeviceImplCopyWith<$Res> {
  __$$PrinterDeviceImplCopyWithImpl(
      _$PrinterDeviceImpl _value, $Res Function(_$PrinterDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? connectionType = null,
    Object? rawPrinter = freezed,
    Object? isConnected = null,
    Object? ipAddress = freezed,
    Object? port = null,
    Object? vendorId = freezed,
    Object? productId = freezed,
  }) {
    return _then(_$PrinterDeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      connectionType: null == connectionType
          ? _value.connectionType
          : connectionType // ignore: cast_nullable_to_non_nullable
              as PrinterConnectionType,
      rawPrinter: freezed == rawPrinter
          ? _value.rawPrinter
          : rawPrinter // ignore: cast_nullable_to_non_nullable
              as Printer?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PrinterDeviceImpl extends _PrinterDevice {
  const _$PrinterDeviceImpl(
      {required this.id,
      required this.name,
      required this.connectionType,
      this.rawPrinter,
      this.isConnected = false,
      this.ipAddress,
      this.port = 9100,
      this.vendorId,
      this.productId})
      : super._();

  /// Unique identifier for the printer (vendor ID or address).
  @override
  final String id;

  /// Display name of the printer.
  @override
  final String name;

  /// Type of connection (USB, Bluetooth, BLE, Network).
  @override
  final PrinterConnectionType connectionType;

  /// The underlying library printer object.
  @override
  final Printer? rawPrinter;

  /// Whether the printer is currently connected.
  @override
  @JsonKey()
  final bool isConnected;

  /// IP address for network printers.
  @override
  final String? ipAddress;

  /// Port for network printers (default 9100).
  @override
  @JsonKey()
  final int port;

  /// Vendor ID for USB printers.
  @override
  final String? vendorId;

  /// Product ID for USB printers.
  @override
  final String? productId;

  @override
  String toString() {
    return 'PrinterDevice(id: $id, name: $name, connectionType: $connectionType, rawPrinter: $rawPrinter, isConnected: $isConnected, ipAddress: $ipAddress, port: $port, vendorId: $vendorId, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterDeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.connectionType, connectionType) ||
                other.connectionType == connectionType) &&
            (identical(other.rawPrinter, rawPrinter) ||
                other.rawPrinter == rawPrinter) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, connectionType,
      rawPrinter, isConnected, ipAddress, port, vendorId, productId);

  /// Create a copy of PrinterDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterDeviceImplCopyWith<_$PrinterDeviceImpl> get copyWith =>
      __$$PrinterDeviceImplCopyWithImpl<_$PrinterDeviceImpl>(this, _$identity);
}

abstract class _PrinterDevice extends PrinterDevice {
  const factory _PrinterDevice(
      {required final String id,
      required final String name,
      required final PrinterConnectionType connectionType,
      final Printer? rawPrinter,
      final bool isConnected,
      final String? ipAddress,
      final int port,
      final String? vendorId,
      final String? productId}) = _$PrinterDeviceImpl;
  const _PrinterDevice._() : super._();

  /// Unique identifier for the printer (vendor ID or address).
  @override
  String get id;

  /// Display name of the printer.
  @override
  String get name;

  /// Type of connection (USB, Bluetooth, BLE, Network).
  @override
  PrinterConnectionType get connectionType;

  /// The underlying library printer object.
  @override
  Printer? get rawPrinter;

  /// Whether the printer is currently connected.
  @override
  bool get isConnected;

  /// IP address for network printers.
  @override
  String? get ipAddress;

  /// Port for network printers (default 9100).
  @override
  int get port;

  /// Vendor ID for USB printers.
  @override
  String? get vendorId;

  /// Product ID for USB printers.
  @override
  String? get productId;

  /// Create a copy of PrinterDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterDeviceImplCopyWith<_$PrinterDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
