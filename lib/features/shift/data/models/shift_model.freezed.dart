// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftModel _$ShiftModelFromJson(Map<String, dynamic> json) {
  return _ShiftModel.fromJson(json);
}

/// @nodoc
mixin _$ShiftModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashierId')
  String get cashierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'startTime')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'endTime')
  DateTime? get endTime => throw _privateConstructorUsedError;
  List<ShiftEmployeeModel> get employees => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ShiftModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftModelCopyWith<ShiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftModelCopyWith<$Res> {
  factory $ShiftModelCopyWith(
          ShiftModel value, $Res Function(ShiftModel) then) =
      _$ShiftModelCopyWithImpl<$Res, ShiftModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'startTime') DateTime startTime,
      @JsonKey(name: 'endTime') DateTime? endTime,
      List<ShiftEmployeeModel> employees,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$ShiftModelCopyWithImpl<$Res, $Val extends ShiftModel>
    implements $ShiftModelCopyWith<$Res> {
  _$ShiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cashierId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? employees = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<ShiftEmployeeModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftModelImplCopyWith<$Res>
    implements $ShiftModelCopyWith<$Res> {
  factory _$$ShiftModelImplCopyWith(
          _$ShiftModelImpl value, $Res Function(_$ShiftModelImpl) then) =
      __$$ShiftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'startTime') DateTime startTime,
      @JsonKey(name: 'endTime') DateTime? endTime,
      List<ShiftEmployeeModel> employees,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$ShiftModelImplCopyWithImpl<$Res>
    extends _$ShiftModelCopyWithImpl<$Res, _$ShiftModelImpl>
    implements _$$ShiftModelImplCopyWith<$Res> {
  __$$ShiftModelImplCopyWithImpl(
      _$ShiftModelImpl _value, $Res Function(_$ShiftModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cashierId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? employees = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ShiftModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employees: null == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<ShiftEmployeeModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftModelImpl extends _ShiftModel {
  const _$ShiftModelImpl(
      {required this.id,
      @JsonKey(name: 'cashierId') required this.cashierId,
      @JsonKey(name: 'startTime') required this.startTime,
      @JsonKey(name: 'endTime') this.endTime,
      required final List<ShiftEmployeeModel> employees,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : _employees = employees,
        super._();

  factory _$ShiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'cashierId')
  final String cashierId;
  @override
  @JsonKey(name: 'startTime')
  final DateTime startTime;
  @override
  @JsonKey(name: 'endTime')
  final DateTime? endTime;
  final List<ShiftEmployeeModel> _employees;
  @override
  List<ShiftEmployeeModel> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ShiftModel(id: $id, cashierId: $cashierId, startTime: $startTime, endTime: $endTime, employees: $employees, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      cashierId,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(_employees),
      createdAt,
      updatedAt);

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftModelImplCopyWith<_$ShiftModelImpl> get copyWith =>
      __$$ShiftModelImplCopyWithImpl<_$ShiftModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftModelImplToJson(
      this,
    );
  }
}

abstract class _ShiftModel extends ShiftModel {
  const factory _ShiftModel(
          {required final String id,
          @JsonKey(name: 'cashierId') required final String cashierId,
          @JsonKey(name: 'startTime') required final DateTime startTime,
          @JsonKey(name: 'endTime') final DateTime? endTime,
          required final List<ShiftEmployeeModel> employees,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$ShiftModelImpl;
  const _ShiftModel._() : super._();

  factory _ShiftModel.fromJson(Map<String, dynamic> json) =
      _$ShiftModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'cashierId')
  String get cashierId;
  @override
  @JsonKey(name: 'startTime')
  DateTime get startTime;
  @override
  @JsonKey(name: 'endTime')
  DateTime? get endTime;
  @override
  List<ShiftEmployeeModel> get employees;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftModelImplCopyWith<_$ShiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftRequest _$ShiftRequestFromJson(Map<String, dynamic> json) {
  return _ShiftRequest.fromJson(json);
}

/// @nodoc
mixin _$ShiftRequest {
  List<String> get employees => throw _privateConstructorUsedError;

  /// Serializes this ShiftRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftRequestCopyWith<ShiftRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftRequestCopyWith<$Res> {
  factory $ShiftRequestCopyWith(
          ShiftRequest value, $Res Function(ShiftRequest) then) =
      _$ShiftRequestCopyWithImpl<$Res, ShiftRequest>;
  @useResult
  $Res call({List<String> employees});
}

/// @nodoc
class _$ShiftRequestCopyWithImpl<$Res, $Val extends ShiftRequest>
    implements $ShiftRequestCopyWith<$Res> {
  _$ShiftRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
  }) {
    return _then(_value.copyWith(
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftRequestImplCopyWith<$Res>
    implements $ShiftRequestCopyWith<$Res> {
  factory _$$ShiftRequestImplCopyWith(
          _$ShiftRequestImpl value, $Res Function(_$ShiftRequestImpl) then) =
      __$$ShiftRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> employees});
}

/// @nodoc
class __$$ShiftRequestImplCopyWithImpl<$Res>
    extends _$ShiftRequestCopyWithImpl<$Res, _$ShiftRequestImpl>
    implements _$$ShiftRequestImplCopyWith<$Res> {
  __$$ShiftRequestImplCopyWithImpl(
      _$ShiftRequestImpl _value, $Res Function(_$ShiftRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
  }) {
    return _then(_$ShiftRequestImpl(
      employees: null == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftRequestImpl implements _ShiftRequest {
  const _$ShiftRequestImpl({required final List<String> employees})
      : _employees = employees;

  factory _$ShiftRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftRequestImplFromJson(json);

  final List<String> _employees;
  @override
  List<String> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  @override
  String toString() {
    return 'ShiftRequest(employees: $employees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftRequestImpl &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_employees));

  /// Create a copy of ShiftRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftRequestImplCopyWith<_$ShiftRequestImpl> get copyWith =>
      __$$ShiftRequestImplCopyWithImpl<_$ShiftRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftRequestImplToJson(
      this,
    );
  }
}

abstract class _ShiftRequest implements ShiftRequest {
  const factory _ShiftRequest({required final List<String> employees}) =
      _$ShiftRequestImpl;

  factory _ShiftRequest.fromJson(Map<String, dynamic> json) =
      _$ShiftRequestImpl.fromJson;

  @override
  List<String> get employees;

  /// Create a copy of ShiftRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftRequestImplCopyWith<_$ShiftRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
