// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShiftEmployee {
  String get id => throw _privateConstructorUsedError;
  String get shiftId => throw _privateConstructorUsedError;
  String get employeeId => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of ShiftEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftEmployeeCopyWith<ShiftEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEmployeeCopyWith<$Res> {
  factory $ShiftEmployeeCopyWith(
          ShiftEmployee value, $Res Function(ShiftEmployee) then) =
      _$ShiftEmployeeCopyWithImpl<$Res, ShiftEmployee>;
  @useResult
  $Res call(
      {String id,
      String shiftId,
      String employeeId,
      String employeeName,
      DateTime createdAt});
}

/// @nodoc
class _$ShiftEmployeeCopyWithImpl<$Res, $Val extends ShiftEmployee>
    implements $ShiftEmployeeCopyWith<$Res> {
  _$ShiftEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftId = null,
    Object? employeeId = null,
    Object? employeeName = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftEmployeeImplCopyWith<$Res>
    implements $ShiftEmployeeCopyWith<$Res> {
  factory _$$ShiftEmployeeImplCopyWith(
          _$ShiftEmployeeImpl value, $Res Function(_$ShiftEmployeeImpl) then) =
      __$$ShiftEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String shiftId,
      String employeeId,
      String employeeName,
      DateTime createdAt});
}

/// @nodoc
class __$$ShiftEmployeeImplCopyWithImpl<$Res>
    extends _$ShiftEmployeeCopyWithImpl<$Res, _$ShiftEmployeeImpl>
    implements _$$ShiftEmployeeImplCopyWith<$Res> {
  __$$ShiftEmployeeImplCopyWithImpl(
      _$ShiftEmployeeImpl _value, $Res Function(_$ShiftEmployeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftId = null,
    Object? employeeId = null,
    Object? employeeName = null,
    Object? createdAt = null,
  }) {
    return _then(_$ShiftEmployeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ShiftEmployeeImpl implements _ShiftEmployee {
  const _$ShiftEmployeeImpl(
      {required this.id,
      required this.shiftId,
      required this.employeeId,
      required this.employeeName,
      required this.createdAt});

  @override
  final String id;
  @override
  final String shiftId;
  @override
  final String employeeId;
  @override
  final String employeeName;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ShiftEmployee(id: $id, shiftId: $shiftId, employeeId: $employeeId, employeeName: $employeeName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, shiftId, employeeId, employeeName, createdAt);

  /// Create a copy of ShiftEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftEmployeeImplCopyWith<_$ShiftEmployeeImpl> get copyWith =>
      __$$ShiftEmployeeImplCopyWithImpl<_$ShiftEmployeeImpl>(this, _$identity);
}

abstract class _ShiftEmployee implements ShiftEmployee {
  const factory _ShiftEmployee(
      {required final String id,
      required final String shiftId,
      required final String employeeId,
      required final String employeeName,
      required final DateTime createdAt}) = _$ShiftEmployeeImpl;

  @override
  String get id;
  @override
  String get shiftId;
  @override
  String get employeeId;
  @override
  String get employeeName;
  @override
  DateTime get createdAt;

  /// Create a copy of ShiftEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftEmployeeImplCopyWith<_$ShiftEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
