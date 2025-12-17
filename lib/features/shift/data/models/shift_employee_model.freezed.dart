// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftEmployeeModel _$ShiftEmployeeModelFromJson(Map<String, dynamic> json) {
  return _ShiftEmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$ShiftEmployeeModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'shiftId')
  String get shiftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'employeeId')
  String get employeeId => throw _privateConstructorUsedError;
  ShiftEmployeeInfo get employee => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ShiftEmployeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftEmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftEmployeeModelCopyWith<ShiftEmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEmployeeModelCopyWith<$Res> {
  factory $ShiftEmployeeModelCopyWith(
          ShiftEmployeeModel value, $Res Function(ShiftEmployeeModel) then) =
      _$ShiftEmployeeModelCopyWithImpl<$Res, ShiftEmployeeModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'shiftId') String shiftId,
      @JsonKey(name: 'employeeId') String employeeId,
      ShiftEmployeeInfo employee,
      @JsonKey(name: 'createdAt') DateTime createdAt});

  $ShiftEmployeeInfoCopyWith<$Res> get employee;
}

/// @nodoc
class _$ShiftEmployeeModelCopyWithImpl<$Res, $Val extends ShiftEmployeeModel>
    implements $ShiftEmployeeModelCopyWith<$Res> {
  _$ShiftEmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftEmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftId = null,
    Object? employeeId = null,
    Object? employee = null,
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
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as ShiftEmployeeInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of ShiftEmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftEmployeeInfoCopyWith<$Res> get employee {
    return $ShiftEmployeeInfoCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShiftEmployeeModelImplCopyWith<$Res>
    implements $ShiftEmployeeModelCopyWith<$Res> {
  factory _$$ShiftEmployeeModelImplCopyWith(_$ShiftEmployeeModelImpl value,
          $Res Function(_$ShiftEmployeeModelImpl) then) =
      __$$ShiftEmployeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'shiftId') String shiftId,
      @JsonKey(name: 'employeeId') String employeeId,
      ShiftEmployeeInfo employee,
      @JsonKey(name: 'createdAt') DateTime createdAt});

  @override
  $ShiftEmployeeInfoCopyWith<$Res> get employee;
}

/// @nodoc
class __$$ShiftEmployeeModelImplCopyWithImpl<$Res>
    extends _$ShiftEmployeeModelCopyWithImpl<$Res, _$ShiftEmployeeModelImpl>
    implements _$$ShiftEmployeeModelImplCopyWith<$Res> {
  __$$ShiftEmployeeModelImplCopyWithImpl(_$ShiftEmployeeModelImpl _value,
      $Res Function(_$ShiftEmployeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftEmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftId = null,
    Object? employeeId = null,
    Object? employee = null,
    Object? createdAt = null,
  }) {
    return _then(_$ShiftEmployeeModelImpl(
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
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as ShiftEmployeeInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftEmployeeModelImpl extends _ShiftEmployeeModel {
  const _$ShiftEmployeeModelImpl(
      {required this.id,
      @JsonKey(name: 'shiftId') required this.shiftId,
      @JsonKey(name: 'employeeId') required this.employeeId,
      required this.employee,
      @JsonKey(name: 'createdAt') required this.createdAt})
      : super._();

  factory _$ShiftEmployeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftEmployeeModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'shiftId')
  final String shiftId;
  @override
  @JsonKey(name: 'employeeId')
  final String employeeId;
  @override
  final ShiftEmployeeInfo employee;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ShiftEmployeeModel(id: $id, shiftId: $shiftId, employeeId: $employeeId, employee: $employee, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEmployeeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, shiftId, employeeId, employee, createdAt);

  /// Create a copy of ShiftEmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftEmployeeModelImplCopyWith<_$ShiftEmployeeModelImpl> get copyWith =>
      __$$ShiftEmployeeModelImplCopyWithImpl<_$ShiftEmployeeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftEmployeeModelImplToJson(
      this,
    );
  }
}

abstract class _ShiftEmployeeModel extends ShiftEmployeeModel {
  const factory _ShiftEmployeeModel(
          {required final String id,
          @JsonKey(name: 'shiftId') required final String shiftId,
          @JsonKey(name: 'employeeId') required final String employeeId,
          required final ShiftEmployeeInfo employee,
          @JsonKey(name: 'createdAt') required final DateTime createdAt}) =
      _$ShiftEmployeeModelImpl;
  const _ShiftEmployeeModel._() : super._();

  factory _ShiftEmployeeModel.fromJson(Map<String, dynamic> json) =
      _$ShiftEmployeeModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'shiftId')
  String get shiftId;
  @override
  @JsonKey(name: 'employeeId')
  String get employeeId;
  @override
  ShiftEmployeeInfo get employee;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;

  /// Create a copy of ShiftEmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftEmployeeModelImplCopyWith<_$ShiftEmployeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftEmployeeInfo _$ShiftEmployeeInfoFromJson(Map<String, dynamic> json) {
  return _ShiftEmployeeInfo.fromJson(json);
}

/// @nodoc
mixin _$ShiftEmployeeInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this ShiftEmployeeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftEmployeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftEmployeeInfoCopyWith<ShiftEmployeeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEmployeeInfoCopyWith<$Res> {
  factory $ShiftEmployeeInfoCopyWith(
          ShiftEmployeeInfo value, $Res Function(ShiftEmployeeInfo) then) =
      _$ShiftEmployeeInfoCopyWithImpl<$Res, ShiftEmployeeInfo>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$ShiftEmployeeInfoCopyWithImpl<$Res, $Val extends ShiftEmployeeInfo>
    implements $ShiftEmployeeInfoCopyWith<$Res> {
  _$ShiftEmployeeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftEmployeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftEmployeeInfoImplCopyWith<$Res>
    implements $ShiftEmployeeInfoCopyWith<$Res> {
  factory _$$ShiftEmployeeInfoImplCopyWith(_$ShiftEmployeeInfoImpl value,
          $Res Function(_$ShiftEmployeeInfoImpl) then) =
      __$$ShiftEmployeeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$ShiftEmployeeInfoImplCopyWithImpl<$Res>
    extends _$ShiftEmployeeInfoCopyWithImpl<$Res, _$ShiftEmployeeInfoImpl>
    implements _$$ShiftEmployeeInfoImplCopyWith<$Res> {
  __$$ShiftEmployeeInfoImplCopyWithImpl(_$ShiftEmployeeInfoImpl _value,
      $Res Function(_$ShiftEmployeeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftEmployeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ShiftEmployeeInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftEmployeeInfoImpl implements _ShiftEmployeeInfo {
  const _$ShiftEmployeeInfoImpl({required this.id, required this.name});

  factory _$ShiftEmployeeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftEmployeeInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'ShiftEmployeeInfo(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEmployeeInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ShiftEmployeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftEmployeeInfoImplCopyWith<_$ShiftEmployeeInfoImpl> get copyWith =>
      __$$ShiftEmployeeInfoImplCopyWithImpl<_$ShiftEmployeeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftEmployeeInfoImplToJson(
      this,
    );
  }
}

abstract class _ShiftEmployeeInfo implements ShiftEmployeeInfo {
  const factory _ShiftEmployeeInfo(
      {required final String id,
      required final String name}) = _$ShiftEmployeeInfoImpl;

  factory _ShiftEmployeeInfo.fromJson(Map<String, dynamic> json) =
      _$ShiftEmployeeInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of ShiftEmployeeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftEmployeeInfoImplCopyWith<_$ShiftEmployeeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
