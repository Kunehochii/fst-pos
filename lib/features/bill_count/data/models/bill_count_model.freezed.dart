// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillItemModel _$BillItemModelFromJson(Map<String, dynamic> json) {
  return _BillItemModel.fromJson(json);
}

/// @nodoc
mixin _$BillItemModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BillItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillItemModelCopyWith<BillItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemModelCopyWith<$Res> {
  factory $BillItemModelCopyWith(
          BillItemModel value, $Res Function(BillItemModel) then) =
      _$BillItemModelCopyWithImpl<$Res, BillItemModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      int amount,
      int value,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class _$BillItemModelCopyWithImpl<$Res, $Val extends BillItemModel>
    implements $BillItemModelCopyWith<$Res> {
  _$BillItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? value = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$BillItemModelImplCopyWith<$Res>
    implements $BillItemModelCopyWith<$Res> {
  factory _$$BillItemModelImplCopyWith(
          _$BillItemModelImpl value, $Res Function(_$BillItemModelImpl) then) =
      __$$BillItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      int amount,
      int value,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'updatedAt') DateTime updatedAt});
}

/// @nodoc
class __$$BillItemModelImplCopyWithImpl<$Res>
    extends _$BillItemModelCopyWithImpl<$Res, _$BillItemModelImpl>
    implements _$$BillItemModelImplCopyWith<$Res> {
  __$$BillItemModelImplCopyWithImpl(
      _$BillItemModelImpl _value, $Res Function(_$BillItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? value = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BillItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$BillItemModelImpl extends _BillItemModel {
  const _$BillItemModelImpl(
      {required this.id,
      required this.type,
      required this.amount,
      required this.value,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'updatedAt') required this.updatedAt})
      : super._();

  factory _$BillItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final int amount;
  @override
  final int value;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BillItemModel(id: $id, type: $type, amount: $amount, value: $value, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, amount, value, createdAt, updatedAt);

  /// Create a copy of BillItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemModelImplCopyWith<_$BillItemModelImpl> get copyWith =>
      __$$BillItemModelImplCopyWithImpl<_$BillItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillItemModelImplToJson(
      this,
    );
  }
}

abstract class _BillItemModel extends BillItemModel {
  const factory _BillItemModel(
          {required final String id,
          required final String type,
          required final int amount,
          required final int value,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'updatedAt') required final DateTime updatedAt}) =
      _$BillItemModelImpl;
  const _BillItemModel._() : super._();

  factory _BillItemModel.fromJson(Map<String, dynamic> json) =
      _$BillItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  int get amount;
  @override
  int get value;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime get updatedAt;

  /// Create a copy of BillItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillItemModelImplCopyWith<_$BillItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BillCountCashierModel _$BillCountCashierModelFromJson(
    Map<String, dynamic> json) {
  return _BillCountCashierModel.fromJson(json);
}

/// @nodoc
mixin _$BillCountCashierModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;

  /// Serializes this BillCountCashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillCountCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillCountCashierModelCopyWith<BillCountCashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCountCashierModelCopyWith<$Res> {
  factory $BillCountCashierModelCopyWith(BillCountCashierModel value,
          $Res Function(BillCountCashierModel) then) =
      _$BillCountCashierModelCopyWithImpl<$Res, BillCountCashierModel>;
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class _$BillCountCashierModelCopyWithImpl<$Res,
        $Val extends BillCountCashierModel>
    implements $BillCountCashierModelCopyWith<$Res> {
  _$BillCountCashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillCountCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillCountCashierModelImplCopyWith<$Res>
    implements $BillCountCashierModelCopyWith<$Res> {
  factory _$$BillCountCashierModelImplCopyWith(
          _$BillCountCashierModelImpl value,
          $Res Function(_$BillCountCashierModelImpl) then) =
      __$$BillCountCashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class __$$BillCountCashierModelImplCopyWithImpl<$Res>
    extends _$BillCountCashierModelCopyWithImpl<$Res,
        _$BillCountCashierModelImpl>
    implements _$$BillCountCashierModelImplCopyWith<$Res> {
  __$$BillCountCashierModelImplCopyWithImpl(_$BillCountCashierModelImpl _value,
      $Res Function(_$BillCountCashierModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillCountCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_$BillCountCashierModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillCountCashierModelImpl extends _BillCountCashierModel {
  const _$BillCountCashierModelImpl(
      {required this.id, required this.username, required this.branchName})
      : super._();

  factory _$BillCountCashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillCountCashierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String branchName;

  @override
  String toString() {
    return 'BillCountCashierModel(id: $id, username: $username, branchName: $branchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillCountCashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, branchName);

  /// Create a copy of BillCountCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillCountCashierModelImplCopyWith<_$BillCountCashierModelImpl>
      get copyWith => __$$BillCountCashierModelImplCopyWithImpl<
          _$BillCountCashierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillCountCashierModelImplToJson(
      this,
    );
  }
}

abstract class _BillCountCashierModel extends BillCountCashierModel {
  const factory _BillCountCashierModel(
      {required final String id,
      required final String username,
      required final String branchName}) = _$BillCountCashierModelImpl;
  const _BillCountCashierModel._() : super._();

  factory _BillCountCashierModel.fromJson(Map<String, dynamic> json) =
      _$BillCountCashierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get branchName;

  /// Create a copy of BillCountCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillCountCashierModelImplCopyWith<_$BillCountCashierModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BillCountModel _$BillCountModelFromJson(Map<String, dynamic> json) {
  return _BillCountModel.fromJson(json);
}

/// @nodoc
mixin _$BillCountModel {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String get updatedAt => throw _privateConstructorUsedError;
  BillCountCashierModel get cashier => throw _privateConstructorUsedError;
  double get beginningBalance => throw _privateConstructorUsedError;
  bool get showBeginningBalance => throw _privateConstructorUsedError;
  double get totalCash => throw _privateConstructorUsedError;
  double get totalExpenses => throw _privateConstructorUsedError;
  double get netCash => throw _privateConstructorUsedError;
  List<BillItemModel> get bills => throw _privateConstructorUsedError;
  Map<String, int> get billsByType => throw _privateConstructorUsedError;
  double get billsTotal => throw _privateConstructorUsedError;
  double get summaryStep1 => throw _privateConstructorUsedError;
  double get summaryFinal => throw _privateConstructorUsedError;

  /// Serializes this BillCountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillCountModelCopyWith<BillCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCountModelCopyWith<$Res> {
  factory $BillCountModelCopyWith(
          BillCountModel value, $Res Function(BillCountModel) then) =
      _$BillCountModelCopyWithImpl<$Res, BillCountModel>;
  @useResult
  $Res call(
      {String id,
      String date,
      @JsonKey(name: 'updatedAt') String updatedAt,
      BillCountCashierModel cashier,
      double beginningBalance,
      bool showBeginningBalance,
      double totalCash,
      double totalExpenses,
      double netCash,
      List<BillItemModel> bills,
      Map<String, int> billsByType,
      double billsTotal,
      double summaryStep1,
      double summaryFinal});

  $BillCountCashierModelCopyWith<$Res> get cashier;
}

/// @nodoc
class _$BillCountModelCopyWithImpl<$Res, $Val extends BillCountModel>
    implements $BillCountModelCopyWith<$Res> {
  _$BillCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? updatedAt = null,
    Object? cashier = null,
    Object? beginningBalance = null,
    Object? showBeginningBalance = null,
    Object? totalCash = null,
    Object? totalExpenses = null,
    Object? netCash = null,
    Object? bills = null,
    Object? billsByType = null,
    Object? billsTotal = null,
    Object? summaryStep1 = null,
    Object? summaryFinal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      cashier: null == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as BillCountCashierModel,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      showBeginningBalance: null == showBeginningBalance
          ? _value.showBeginningBalance
          : showBeginningBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCash: null == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netCash: null == netCash
          ? _value.netCash
          : netCash // ignore: cast_nullable_to_non_nullable
              as double,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<BillItemModel>,
      billsByType: null == billsByType
          ? _value.billsByType
          : billsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      billsTotal: null == billsTotal
          ? _value.billsTotal
          : billsTotal // ignore: cast_nullable_to_non_nullable
              as double,
      summaryStep1: null == summaryStep1
          ? _value.summaryStep1
          : summaryStep1 // ignore: cast_nullable_to_non_nullable
              as double,
      summaryFinal: null == summaryFinal
          ? _value.summaryFinal
          : summaryFinal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of BillCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BillCountCashierModelCopyWith<$Res> get cashier {
    return $BillCountCashierModelCopyWith<$Res>(_value.cashier, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillCountModelImplCopyWith<$Res>
    implements $BillCountModelCopyWith<$Res> {
  factory _$$BillCountModelImplCopyWith(_$BillCountModelImpl value,
          $Res Function(_$BillCountModelImpl) then) =
      __$$BillCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String date,
      @JsonKey(name: 'updatedAt') String updatedAt,
      BillCountCashierModel cashier,
      double beginningBalance,
      bool showBeginningBalance,
      double totalCash,
      double totalExpenses,
      double netCash,
      List<BillItemModel> bills,
      Map<String, int> billsByType,
      double billsTotal,
      double summaryStep1,
      double summaryFinal});

  @override
  $BillCountCashierModelCopyWith<$Res> get cashier;
}

/// @nodoc
class __$$BillCountModelImplCopyWithImpl<$Res>
    extends _$BillCountModelCopyWithImpl<$Res, _$BillCountModelImpl>
    implements _$$BillCountModelImplCopyWith<$Res> {
  __$$BillCountModelImplCopyWithImpl(
      _$BillCountModelImpl _value, $Res Function(_$BillCountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? updatedAt = null,
    Object? cashier = null,
    Object? beginningBalance = null,
    Object? showBeginningBalance = null,
    Object? totalCash = null,
    Object? totalExpenses = null,
    Object? netCash = null,
    Object? bills = null,
    Object? billsByType = null,
    Object? billsTotal = null,
    Object? summaryStep1 = null,
    Object? summaryFinal = null,
  }) {
    return _then(_$BillCountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      cashier: null == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as BillCountCashierModel,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      showBeginningBalance: null == showBeginningBalance
          ? _value.showBeginningBalance
          : showBeginningBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCash: null == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netCash: null == netCash
          ? _value.netCash
          : netCash // ignore: cast_nullable_to_non_nullable
              as double,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<BillItemModel>,
      billsByType: null == billsByType
          ? _value._billsByType
          : billsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      billsTotal: null == billsTotal
          ? _value.billsTotal
          : billsTotal // ignore: cast_nullable_to_non_nullable
              as double,
      summaryStep1: null == summaryStep1
          ? _value.summaryStep1
          : summaryStep1 // ignore: cast_nullable_to_non_nullable
              as double,
      summaryFinal: null == summaryFinal
          ? _value.summaryFinal
          : summaryFinal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillCountModelImpl extends _BillCountModel {
  const _$BillCountModelImpl(
      {required this.id,
      required this.date,
      @JsonKey(name: 'updatedAt') required this.updatedAt,
      required this.cashier,
      required this.beginningBalance,
      required this.showBeginningBalance,
      required this.totalCash,
      required this.totalExpenses,
      required this.netCash,
      required final List<BillItemModel> bills,
      required final Map<String, int> billsByType,
      required this.billsTotal,
      required this.summaryStep1,
      required this.summaryFinal})
      : _bills = bills,
        _billsByType = billsByType,
        super._();

  factory _$BillCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillCountModelImplFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @override
  final BillCountCashierModel cashier;
  @override
  final double beginningBalance;
  @override
  final bool showBeginningBalance;
  @override
  final double totalCash;
  @override
  final double totalExpenses;
  @override
  final double netCash;
  final List<BillItemModel> _bills;
  @override
  List<BillItemModel> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  final Map<String, int> _billsByType;
  @override
  Map<String, int> get billsByType {
    if (_billsByType is EqualUnmodifiableMapView) return _billsByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_billsByType);
  }

  @override
  final double billsTotal;
  @override
  final double summaryStep1;
  @override
  final double summaryFinal;

  @override
  String toString() {
    return 'BillCountModel(id: $id, date: $date, updatedAt: $updatedAt, cashier: $cashier, beginningBalance: $beginningBalance, showBeginningBalance: $showBeginningBalance, totalCash: $totalCash, totalExpenses: $totalExpenses, netCash: $netCash, bills: $bills, billsByType: $billsByType, billsTotal: $billsTotal, summaryStep1: $summaryStep1, summaryFinal: $summaryFinal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillCountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cashier, cashier) || other.cashier == cashier) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.showBeginningBalance, showBeginningBalance) ||
                other.showBeginningBalance == showBeginningBalance) &&
            (identical(other.totalCash, totalCash) ||
                other.totalCash == totalCash) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.netCash, netCash) || other.netCash == netCash) &&
            const DeepCollectionEquality().equals(other._bills, _bills) &&
            const DeepCollectionEquality()
                .equals(other._billsByType, _billsByType) &&
            (identical(other.billsTotal, billsTotal) ||
                other.billsTotal == billsTotal) &&
            (identical(other.summaryStep1, summaryStep1) ||
                other.summaryStep1 == summaryStep1) &&
            (identical(other.summaryFinal, summaryFinal) ||
                other.summaryFinal == summaryFinal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      updatedAt,
      cashier,
      beginningBalance,
      showBeginningBalance,
      totalCash,
      totalExpenses,
      netCash,
      const DeepCollectionEquality().hash(_bills),
      const DeepCollectionEquality().hash(_billsByType),
      billsTotal,
      summaryStep1,
      summaryFinal);

  /// Create a copy of BillCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillCountModelImplCopyWith<_$BillCountModelImpl> get copyWith =>
      __$$BillCountModelImplCopyWithImpl<_$BillCountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillCountModelImplToJson(
      this,
    );
  }
}

abstract class _BillCountModel extends BillCountModel {
  const factory _BillCountModel(
      {required final String id,
      required final String date,
      @JsonKey(name: 'updatedAt') required final String updatedAt,
      required final BillCountCashierModel cashier,
      required final double beginningBalance,
      required final bool showBeginningBalance,
      required final double totalCash,
      required final double totalExpenses,
      required final double netCash,
      required final List<BillItemModel> bills,
      required final Map<String, int> billsByType,
      required final double billsTotal,
      required final double summaryStep1,
      required final double summaryFinal}) = _$BillCountModelImpl;
  const _BillCountModel._() : super._();

  factory _BillCountModel.fromJson(Map<String, dynamic> json) =
      _$BillCountModelImpl.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  @JsonKey(name: 'updatedAt')
  String get updatedAt;
  @override
  BillCountCashierModel get cashier;
  @override
  double get beginningBalance;
  @override
  bool get showBeginningBalance;
  @override
  double get totalCash;
  @override
  double get totalExpenses;
  @override
  double get netCash;
  @override
  List<BillItemModel> get bills;
  @override
  Map<String, int> get billsByType;
  @override
  double get billsTotal;
  @override
  double get summaryStep1;
  @override
  double get summaryFinal;

  /// Create a copy of BillCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillCountModelImplCopyWith<_$BillCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateBillCountRequest _$CreateBillCountRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateBillCountRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBillCountRequest {
  double get beginningBalance => throw _privateConstructorUsedError;
  bool get showBeginningBalance => throw _privateConstructorUsedError;
  List<BillItemRequest>? get bills => throw _privateConstructorUsedError;

  /// Serializes this CreateBillCountRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBillCountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBillCountRequestCopyWith<CreateBillCountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBillCountRequestCopyWith<$Res> {
  factory $CreateBillCountRequestCopyWith(CreateBillCountRequest value,
          $Res Function(CreateBillCountRequest) then) =
      _$CreateBillCountRequestCopyWithImpl<$Res, CreateBillCountRequest>;
  @useResult
  $Res call(
      {double beginningBalance,
      bool showBeginningBalance,
      List<BillItemRequest>? bills});
}

/// @nodoc
class _$CreateBillCountRequestCopyWithImpl<$Res,
        $Val extends CreateBillCountRequest>
    implements $CreateBillCountRequestCopyWith<$Res> {
  _$CreateBillCountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBillCountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beginningBalance = null,
    Object? showBeginningBalance = null,
    Object? bills = freezed,
  }) {
    return _then(_value.copyWith(
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      showBeginningBalance: null == showBeginningBalance
          ? _value.showBeginningBalance
          : showBeginningBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      bills: freezed == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<BillItemRequest>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBillCountRequestImplCopyWith<$Res>
    implements $CreateBillCountRequestCopyWith<$Res> {
  factory _$$CreateBillCountRequestImplCopyWith(
          _$CreateBillCountRequestImpl value,
          $Res Function(_$CreateBillCountRequestImpl) then) =
      __$$CreateBillCountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double beginningBalance,
      bool showBeginningBalance,
      List<BillItemRequest>? bills});
}

/// @nodoc
class __$$CreateBillCountRequestImplCopyWithImpl<$Res>
    extends _$CreateBillCountRequestCopyWithImpl<$Res,
        _$CreateBillCountRequestImpl>
    implements _$$CreateBillCountRequestImplCopyWith<$Res> {
  __$$CreateBillCountRequestImplCopyWithImpl(
      _$CreateBillCountRequestImpl _value,
      $Res Function(_$CreateBillCountRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBillCountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beginningBalance = null,
    Object? showBeginningBalance = null,
    Object? bills = freezed,
  }) {
    return _then(_$CreateBillCountRequestImpl(
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      showBeginningBalance: null == showBeginningBalance
          ? _value.showBeginningBalance
          : showBeginningBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      bills: freezed == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<BillItemRequest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBillCountRequestImpl extends _CreateBillCountRequest {
  const _$CreateBillCountRequestImpl(
      {this.beginningBalance = 0,
      this.showBeginningBalance = false,
      final List<BillItemRequest>? bills})
      : _bills = bills,
        super._();

  factory _$CreateBillCountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBillCountRequestImplFromJson(json);

  @override
  @JsonKey()
  final double beginningBalance;
  @override
  @JsonKey()
  final bool showBeginningBalance;
  final List<BillItemRequest>? _bills;
  @override
  List<BillItemRequest>? get bills {
    final value = _bills;
    if (value == null) return null;
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateBillCountRequest(beginningBalance: $beginningBalance, showBeginningBalance: $showBeginningBalance, bills: $bills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBillCountRequestImpl &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.showBeginningBalance, showBeginningBalance) ||
                other.showBeginningBalance == showBeginningBalance) &&
            const DeepCollectionEquality().equals(other._bills, _bills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, beginningBalance,
      showBeginningBalance, const DeepCollectionEquality().hash(_bills));

  /// Create a copy of CreateBillCountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBillCountRequestImplCopyWith<_$CreateBillCountRequestImpl>
      get copyWith => __$$CreateBillCountRequestImplCopyWithImpl<
          _$CreateBillCountRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBillCountRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBillCountRequest extends CreateBillCountRequest {
  const factory _CreateBillCountRequest(
      {final double beginningBalance,
      final bool showBeginningBalance,
      final List<BillItemRequest>? bills}) = _$CreateBillCountRequestImpl;
  const _CreateBillCountRequest._() : super._();

  factory _CreateBillCountRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBillCountRequestImpl.fromJson;

  @override
  double get beginningBalance;
  @override
  bool get showBeginningBalance;
  @override
  List<BillItemRequest>? get bills;

  /// Create a copy of CreateBillCountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBillCountRequestImplCopyWith<_$CreateBillCountRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BillItemRequest _$BillItemRequestFromJson(Map<String, dynamic> json) {
  return _BillItemRequest.fromJson(json);
}

/// @nodoc
mixin _$BillItemRequest {
  String get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  /// Serializes this BillItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillItemRequestCopyWith<BillItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemRequestCopyWith<$Res> {
  factory $BillItemRequestCopyWith(
          BillItemRequest value, $Res Function(BillItemRequest) then) =
      _$BillItemRequestCopyWithImpl<$Res, BillItemRequest>;
  @useResult
  $Res call({String type, int amount});
}

/// @nodoc
class _$BillItemRequestCopyWithImpl<$Res, $Val extends BillItemRequest>
    implements $BillItemRequestCopyWith<$Res> {
  _$BillItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillItemRequestImplCopyWith<$Res>
    implements $BillItemRequestCopyWith<$Res> {
  factory _$$BillItemRequestImplCopyWith(_$BillItemRequestImpl value,
          $Res Function(_$BillItemRequestImpl) then) =
      __$$BillItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, int amount});
}

/// @nodoc
class __$$BillItemRequestImplCopyWithImpl<$Res>
    extends _$BillItemRequestCopyWithImpl<$Res, _$BillItemRequestImpl>
    implements _$$BillItemRequestImplCopyWith<$Res> {
  __$$BillItemRequestImplCopyWithImpl(
      _$BillItemRequestImpl _value, $Res Function(_$BillItemRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$BillItemRequestImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillItemRequestImpl extends _BillItemRequest {
  const _$BillItemRequestImpl({required this.type, required this.amount})
      : super._();

  factory _$BillItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillItemRequestImplFromJson(json);

  @override
  final String type;
  @override
  final int amount;

  @override
  String toString() {
    return 'BillItemRequest(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, amount);

  /// Create a copy of BillItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemRequestImplCopyWith<_$BillItemRequestImpl> get copyWith =>
      __$$BillItemRequestImplCopyWithImpl<_$BillItemRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillItemRequestImplToJson(
      this,
    );
  }
}

abstract class _BillItemRequest extends BillItemRequest {
  const factory _BillItemRequest(
      {required final String type,
      required final int amount}) = _$BillItemRequestImpl;
  const _BillItemRequest._() : super._();

  factory _BillItemRequest.fromJson(Map<String, dynamic> json) =
      _$BillItemRequestImpl.fromJson;

  @override
  String get type;
  @override
  int get amount;

  /// Create a copy of BillItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillItemRequestImplCopyWith<_$BillItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
