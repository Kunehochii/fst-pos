// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseItemModel _$ExpenseItemModelFromJson(Map<String, dynamic> json) {
  return _ExpenseItemModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseItemModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ExpenseItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseItemModelCopyWith<ExpenseItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseItemModelCopyWith<$Res> {
  factory $ExpenseItemModelCopyWith(
          ExpenseItemModel value, $Res Function(ExpenseItemModel) then) =
      _$ExpenseItemModelCopyWithImpl<$Res, ExpenseItemModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      double amount,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$ExpenseItemModelCopyWithImpl<$Res, $Val extends ExpenseItemModel>
    implements $ExpenseItemModelCopyWith<$Res> {
  _$ExpenseItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$ExpenseItemModelImplCopyWith<$Res>
    implements $ExpenseItemModelCopyWith<$Res> {
  factory _$$ExpenseItemModelImplCopyWith(_$ExpenseItemModelImpl value,
          $Res Function(_$ExpenseItemModelImpl) then) =
      __$$ExpenseItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double amount,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$ExpenseItemModelImplCopyWithImpl<$Res>
    extends _$ExpenseItemModelCopyWithImpl<$Res, _$ExpenseItemModelImpl>
    implements _$$ExpenseItemModelImplCopyWith<$Res> {
  __$$ExpenseItemModelImplCopyWithImpl(_$ExpenseItemModelImpl _value,
      $Res Function(_$ExpenseItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ExpenseItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$ExpenseItemModelImpl extends _ExpenseItemModel {
  const _$ExpenseItemModelImpl(
      {required this.id,
      required this.name,
      required this.amount,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : super._();

  factory _$ExpenseItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double amount;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ExpenseItemModel(id: $id, name: $name, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, amount, createdAt, updatedAt);

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseItemModelImplCopyWith<_$ExpenseItemModelImpl> get copyWith =>
      __$$ExpenseItemModelImplCopyWithImpl<_$ExpenseItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseItemModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseItemModel extends ExpenseItemModel {
  const factory _ExpenseItemModel(
          {required final String id,
          required final String name,
          required final double amount,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$ExpenseItemModelImpl;
  const _ExpenseItemModel._() : super._();

  factory _ExpenseItemModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseItemModelImplCopyWith<_$ExpenseItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseListModel _$ExpenseListModelFromJson(Map<String, dynamic> json) {
  return _ExpenseListModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseListModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashierId')
  String get cashierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessId')
  String get businessId => throw _privateConstructorUsedError;
  List<ExpenseItemModel> get expenseItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ExpenseListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseListModelCopyWith<ExpenseListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseListModelCopyWith<$Res> {
  factory $ExpenseListModelCopyWith(
          ExpenseListModel value, $Res Function(ExpenseListModel) then) =
      _$ExpenseListModelCopyWithImpl<$Res, ExpenseListModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'businessId') String businessId,
      List<ExpenseItemModel> expenseItems,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$ExpenseListModelCopyWithImpl<$Res, $Val extends ExpenseListModel>
    implements $ExpenseListModelCopyWith<$Res> {
  _$ExpenseListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cashierId = null,
    Object? businessId = null,
    Object? expenseItems = null,
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
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      expenseItems: null == expenseItems
          ? _value.expenseItems
          : expenseItems // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemModel>,
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
abstract class _$$ExpenseListModelImplCopyWith<$Res>
    implements $ExpenseListModelCopyWith<$Res> {
  factory _$$ExpenseListModelImplCopyWith(_$ExpenseListModelImpl value,
          $Res Function(_$ExpenseListModelImpl) then) =
      __$$ExpenseListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cashierId') String cashierId,
      @JsonKey(name: 'businessId') String businessId,
      List<ExpenseItemModel> expenseItems,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$ExpenseListModelImplCopyWithImpl<$Res>
    extends _$ExpenseListModelCopyWithImpl<$Res, _$ExpenseListModelImpl>
    implements _$$ExpenseListModelImplCopyWith<$Res> {
  __$$ExpenseListModelImplCopyWithImpl(_$ExpenseListModelImpl _value,
      $Res Function(_$ExpenseListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cashierId = null,
    Object? businessId = null,
    Object? expenseItems = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ExpenseListModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      expenseItems: null == expenseItems
          ? _value._expenseItems
          : expenseItems // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemModel>,
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
class _$ExpenseListModelImpl extends _ExpenseListModel {
  const _$ExpenseListModelImpl(
      {required this.id,
      @JsonKey(name: 'cashierId') required this.cashierId,
      @JsonKey(name: 'businessId') required this.businessId,
      final List<ExpenseItemModel> expenseItems = const [],
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : _expenseItems = expenseItems,
        super._();

  factory _$ExpenseListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseListModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'cashierId')
  final String cashierId;
  @override
  @JsonKey(name: 'businessId')
  final String businessId;
  final List<ExpenseItemModel> _expenseItems;
  @override
  @JsonKey()
  List<ExpenseItemModel> get expenseItems {
    if (_expenseItems is EqualUnmodifiableListView) return _expenseItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseItems);
  }

  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ExpenseListModel(id: $id, cashierId: $cashierId, businessId: $businessId, expenseItems: $expenseItems, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            const DeepCollectionEquality()
                .equals(other._expenseItems, _expenseItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cashierId, businessId,
      const DeepCollectionEquality().hash(_expenseItems), createdAt, updatedAt);

  /// Create a copy of ExpenseListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseListModelImplCopyWith<_$ExpenseListModelImpl> get copyWith =>
      __$$ExpenseListModelImplCopyWithImpl<_$ExpenseListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseListModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseListModel extends ExpenseListModel {
  const factory _ExpenseListModel(
          {required final String id,
          @JsonKey(name: 'cashierId') required final String cashierId,
          @JsonKey(name: 'businessId') required final String businessId,
          final List<ExpenseItemModel> expenseItems,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$ExpenseListModelImpl;
  const _ExpenseListModel._() : super._();

  factory _ExpenseListModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseListModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'cashierId')
  String get cashierId;
  @override
  @JsonKey(name: 'businessId')
  String get businessId;
  @override
  List<ExpenseItemModel> get expenseItems;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of ExpenseListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseListModelImplCopyWith<_$ExpenseListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateExpenseRequest _$CreateExpenseRequestFromJson(Map<String, dynamic> json) {
  return _CreateExpenseRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateExpenseRequest {
  /// ISO 8601 UTC timestamp. If not provided, server uses current date.
  String? get date => throw _privateConstructorUsedError;
  List<ExpenseItemRequest> get expenseItems =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateExpenseRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateExpenseRequestCopyWith<CreateExpenseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateExpenseRequestCopyWith<$Res> {
  factory $CreateExpenseRequestCopyWith(CreateExpenseRequest value,
          $Res Function(CreateExpenseRequest) then) =
      _$CreateExpenseRequestCopyWithImpl<$Res, CreateExpenseRequest>;
  @useResult
  $Res call({String? date, List<ExpenseItemRequest> expenseItems});
}

/// @nodoc
class _$CreateExpenseRequestCopyWithImpl<$Res,
        $Val extends CreateExpenseRequest>
    implements $CreateExpenseRequestCopyWith<$Res> {
  _$CreateExpenseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? expenseItems = null,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseItems: null == expenseItems
          ? _value.expenseItems
          : expenseItems // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateExpenseRequestImplCopyWith<$Res>
    implements $CreateExpenseRequestCopyWith<$Res> {
  factory _$$CreateExpenseRequestImplCopyWith(_$CreateExpenseRequestImpl value,
          $Res Function(_$CreateExpenseRequestImpl) then) =
      __$$CreateExpenseRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, List<ExpenseItemRequest> expenseItems});
}

/// @nodoc
class __$$CreateExpenseRequestImplCopyWithImpl<$Res>
    extends _$CreateExpenseRequestCopyWithImpl<$Res, _$CreateExpenseRequestImpl>
    implements _$$CreateExpenseRequestImplCopyWith<$Res> {
  __$$CreateExpenseRequestImplCopyWithImpl(_$CreateExpenseRequestImpl _value,
      $Res Function(_$CreateExpenseRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? expenseItems = null,
  }) {
    return _then(_$CreateExpenseRequestImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseItems: null == expenseItems
          ? _value._expenseItems
          : expenseItems // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateExpenseRequestImpl extends _CreateExpenseRequest {
  const _$CreateExpenseRequestImpl(
      {this.date, required final List<ExpenseItemRequest> expenseItems})
      : _expenseItems = expenseItems,
        super._();

  factory _$CreateExpenseRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateExpenseRequestImplFromJson(json);

  /// ISO 8601 UTC timestamp. If not provided, server uses current date.
  @override
  final String? date;
  final List<ExpenseItemRequest> _expenseItems;
  @override
  List<ExpenseItemRequest> get expenseItems {
    if (_expenseItems is EqualUnmodifiableListView) return _expenseItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseItems);
  }

  @override
  String toString() {
    return 'CreateExpenseRequest(date: $date, expenseItems: $expenseItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateExpenseRequestImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._expenseItems, _expenseItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_expenseItems));

  /// Create a copy of CreateExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateExpenseRequestImplCopyWith<_$CreateExpenseRequestImpl>
      get copyWith =>
          __$$CreateExpenseRequestImplCopyWithImpl<_$CreateExpenseRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateExpenseRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateExpenseRequest extends CreateExpenseRequest {
  const factory _CreateExpenseRequest(
          {final String? date,
          required final List<ExpenseItemRequest> expenseItems}) =
      _$CreateExpenseRequestImpl;
  const _CreateExpenseRequest._() : super._();

  factory _CreateExpenseRequest.fromJson(Map<String, dynamic> json) =
      _$CreateExpenseRequestImpl.fromJson;

  /// ISO 8601 UTC timestamp. If not provided, server uses current date.
  @override
  String? get date;
  @override
  List<ExpenseItemRequest> get expenseItems;

  /// Create a copy of CreateExpenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateExpenseRequestImplCopyWith<_$CreateExpenseRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExpenseItemRequest _$ExpenseItemRequestFromJson(Map<String, dynamic> json) {
  return _ExpenseItemRequest.fromJson(json);
}

/// @nodoc
mixin _$ExpenseItemRequest {
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this ExpenseItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseItemRequestCopyWith<ExpenseItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseItemRequestCopyWith<$Res> {
  factory $ExpenseItemRequestCopyWith(
          ExpenseItemRequest value, $Res Function(ExpenseItemRequest) then) =
      _$ExpenseItemRequestCopyWithImpl<$Res, ExpenseItemRequest>;
  @useResult
  $Res call({String name, double amount});
}

/// @nodoc
class _$ExpenseItemRequestCopyWithImpl<$Res, $Val extends ExpenseItemRequest>
    implements $ExpenseItemRequestCopyWith<$Res> {
  _$ExpenseItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseItemRequestImplCopyWith<$Res>
    implements $ExpenseItemRequestCopyWith<$Res> {
  factory _$$ExpenseItemRequestImplCopyWith(_$ExpenseItemRequestImpl value,
          $Res Function(_$ExpenseItemRequestImpl) then) =
      __$$ExpenseItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double amount});
}

/// @nodoc
class __$$ExpenseItemRequestImplCopyWithImpl<$Res>
    extends _$ExpenseItemRequestCopyWithImpl<$Res, _$ExpenseItemRequestImpl>
    implements _$$ExpenseItemRequestImplCopyWith<$Res> {
  __$$ExpenseItemRequestImplCopyWithImpl(_$ExpenseItemRequestImpl _value,
      $Res Function(_$ExpenseItemRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$ExpenseItemRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseItemRequestImpl extends _ExpenseItemRequest {
  const _$ExpenseItemRequestImpl({required this.name, required this.amount})
      : super._();

  factory _$ExpenseItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseItemRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double amount;

  @override
  String toString() {
    return 'ExpenseItemRequest(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseItemRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  /// Create a copy of ExpenseItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseItemRequestImplCopyWith<_$ExpenseItemRequestImpl> get copyWith =>
      __$$ExpenseItemRequestImplCopyWithImpl<_$ExpenseItemRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseItemRequestImplToJson(
      this,
    );
  }
}

abstract class _ExpenseItemRequest extends ExpenseItemRequest {
  const factory _ExpenseItemRequest(
      {required final String name,
      required final double amount}) = _$ExpenseItemRequestImpl;
  const _ExpenseItemRequest._() : super._();

  factory _ExpenseItemRequest.fromJson(Map<String, dynamic> json) =
      _$ExpenseItemRequestImpl.fromJson;

  @override
  String get name;
  @override
  double get amount;

  /// Create a copy of ExpenseItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseItemRequestImplCopyWith<_$ExpenseItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
