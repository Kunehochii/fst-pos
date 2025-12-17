// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BillItem {
  String get id => throw _privateConstructorUsedError;
  BillType get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of BillItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillItemCopyWith<BillItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemCopyWith<$Res> {
  factory $BillItemCopyWith(BillItem value, $Res Function(BillItem) then) =
      _$BillItemCopyWithImpl<$Res, BillItem>;
  @useResult
  $Res call(
      {String id,
      BillType type,
      int amount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$BillItemCopyWithImpl<$Res, $Val extends BillItem>
    implements $BillItemCopyWith<$Res> {
  _$BillItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
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
              as BillType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BillItemImplCopyWith<$Res>
    implements $BillItemCopyWith<$Res> {
  factory _$$BillItemImplCopyWith(
          _$BillItemImpl value, $Res Function(_$BillItemImpl) then) =
      __$$BillItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      BillType type,
      int amount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$BillItemImplCopyWithImpl<$Res>
    extends _$BillItemCopyWithImpl<$Res, _$BillItemImpl>
    implements _$$BillItemImplCopyWith<$Res> {
  __$$BillItemImplCopyWithImpl(
      _$BillItemImpl _value, $Res Function(_$BillItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BillItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BillType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
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

class _$BillItemImpl extends _BillItem {
  const _$BillItemImpl(
      {required this.id,
      required this.type,
      required this.amount,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  @override
  final String id;
  @override
  final BillType type;
  @override
  final int amount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BillItem(id: $id, type: $type, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, amount, createdAt, updatedAt);

  /// Create a copy of BillItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemImplCopyWith<_$BillItemImpl> get copyWith =>
      __$$BillItemImplCopyWithImpl<_$BillItemImpl>(this, _$identity);
}

abstract class _BillItem extends BillItem {
  const factory _BillItem(
      {required final String id,
      required final BillType type,
      required final int amount,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BillItemImpl;
  const _BillItem._() : super._();

  @override
  String get id;
  @override
  BillType get type;
  @override
  int get amount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of BillItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillItemImplCopyWith<_$BillItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BillCountCashier {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;

  /// Create a copy of BillCountCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillCountCashierCopyWith<BillCountCashier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCountCashierCopyWith<$Res> {
  factory $BillCountCashierCopyWith(
          BillCountCashier value, $Res Function(BillCountCashier) then) =
      _$BillCountCashierCopyWithImpl<$Res, BillCountCashier>;
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class _$BillCountCashierCopyWithImpl<$Res, $Val extends BillCountCashier>
    implements $BillCountCashierCopyWith<$Res> {
  _$BillCountCashierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillCountCashier
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
abstract class _$$BillCountCashierImplCopyWith<$Res>
    implements $BillCountCashierCopyWith<$Res> {
  factory _$$BillCountCashierImplCopyWith(_$BillCountCashierImpl value,
          $Res Function(_$BillCountCashierImpl) then) =
      __$$BillCountCashierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String branchName});
}

/// @nodoc
class __$$BillCountCashierImplCopyWithImpl<$Res>
    extends _$BillCountCashierCopyWithImpl<$Res, _$BillCountCashierImpl>
    implements _$$BillCountCashierImplCopyWith<$Res> {
  __$$BillCountCashierImplCopyWithImpl(_$BillCountCashierImpl _value,
      $Res Function(_$BillCountCashierImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillCountCashier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? branchName = null,
  }) {
    return _then(_$BillCountCashierImpl(
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

class _$BillCountCashierImpl implements _BillCountCashier {
  const _$BillCountCashierImpl(
      {required this.id, required this.username, required this.branchName});

  @override
  final String id;
  @override
  final String username;
  @override
  final String branchName;

  @override
  String toString() {
    return 'BillCountCashier(id: $id, username: $username, branchName: $branchName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillCountCashierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, username, branchName);

  /// Create a copy of BillCountCashier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillCountCashierImplCopyWith<_$BillCountCashierImpl> get copyWith =>
      __$$BillCountCashierImplCopyWithImpl<_$BillCountCashierImpl>(
          this, _$identity);
}

abstract class _BillCountCashier implements BillCountCashier {
  const factory _BillCountCashier(
      {required final String id,
      required final String username,
      required final String branchName}) = _$BillCountCashierImpl;

  @override
  String get id;
  @override
  String get username;
  @override
  String get branchName;

  /// Create a copy of BillCountCashier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillCountCashierImplCopyWith<_$BillCountCashierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BillCount {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  BillCountCashier get cashier => throw _privateConstructorUsedError;
  double get beginningBalance => throw _privateConstructorUsedError;
  bool get showBeginningBalance => throw _privateConstructorUsedError;
  double get totalCash => throw _privateConstructorUsedError;
  double get totalExpenses => throw _privateConstructorUsedError;
  double get netCash => throw _privateConstructorUsedError;
  List<BillItem> get bills => throw _privateConstructorUsedError;
  Map<BillType, int> get billsByType => throw _privateConstructorUsedError;
  double get billsTotal => throw _privateConstructorUsedError;
  double get summaryStep1 => throw _privateConstructorUsedError;
  double get summaryFinal => throw _privateConstructorUsedError;

  /// Whether this bill count has been synced to server.
  bool get isSynced => throw _privateConstructorUsedError;

  /// Local ID for tracking before server sync.
  String? get localId => throw _privateConstructorUsedError;

  /// Create a copy of BillCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillCountCopyWith<BillCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCountCopyWith<$Res> {
  factory $BillCountCopyWith(BillCount value, $Res Function(BillCount) then) =
      _$BillCountCopyWithImpl<$Res, BillCount>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      DateTime updatedAt,
      BillCountCashier cashier,
      double beginningBalance,
      bool showBeginningBalance,
      double totalCash,
      double totalExpenses,
      double netCash,
      List<BillItem> bills,
      Map<BillType, int> billsByType,
      double billsTotal,
      double summaryStep1,
      double summaryFinal,
      bool isSynced,
      String? localId});

  $BillCountCashierCopyWith<$Res> get cashier;
}

/// @nodoc
class _$BillCountCopyWithImpl<$Res, $Val extends BillCount>
    implements $BillCountCopyWith<$Res> {
  _$BillCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillCount
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
    Object? isSynced = null,
    Object? localId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashier: null == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as BillCountCashier,
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
              as List<BillItem>,
      billsByType: null == billsByType
          ? _value.billsByType
          : billsByType // ignore: cast_nullable_to_non_nullable
              as Map<BillType, int>,
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
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BillCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BillCountCashierCopyWith<$Res> get cashier {
    return $BillCountCashierCopyWith<$Res>(_value.cashier, (value) {
      return _then(_value.copyWith(cashier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillCountImplCopyWith<$Res>
    implements $BillCountCopyWith<$Res> {
  factory _$$BillCountImplCopyWith(
          _$BillCountImpl value, $Res Function(_$BillCountImpl) then) =
      __$$BillCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      DateTime updatedAt,
      BillCountCashier cashier,
      double beginningBalance,
      bool showBeginningBalance,
      double totalCash,
      double totalExpenses,
      double netCash,
      List<BillItem> bills,
      Map<BillType, int> billsByType,
      double billsTotal,
      double summaryStep1,
      double summaryFinal,
      bool isSynced,
      String? localId});

  @override
  $BillCountCashierCopyWith<$Res> get cashier;
}

/// @nodoc
class __$$BillCountImplCopyWithImpl<$Res>
    extends _$BillCountCopyWithImpl<$Res, _$BillCountImpl>
    implements _$$BillCountImplCopyWith<$Res> {
  __$$BillCountImplCopyWithImpl(
      _$BillCountImpl _value, $Res Function(_$BillCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillCount
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
    Object? isSynced = null,
    Object? localId = freezed,
  }) {
    return _then(_$BillCountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cashier: null == cashier
          ? _value.cashier
          : cashier // ignore: cast_nullable_to_non_nullable
              as BillCountCashier,
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
              as List<BillItem>,
      billsByType: null == billsByType
          ? _value._billsByType
          : billsByType // ignore: cast_nullable_to_non_nullable
              as Map<BillType, int>,
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
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BillCountImpl extends _BillCount {
  const _$BillCountImpl(
      {required this.id,
      required this.date,
      required this.updatedAt,
      required this.cashier,
      required this.beginningBalance,
      required this.showBeginningBalance,
      required this.totalCash,
      required this.totalExpenses,
      required this.netCash,
      required final List<BillItem> bills,
      required final Map<BillType, int> billsByType,
      required this.billsTotal,
      required this.summaryStep1,
      required this.summaryFinal,
      this.isSynced = true,
      this.localId})
      : _bills = bills,
        _billsByType = billsByType,
        super._();

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime updatedAt;
  @override
  final BillCountCashier cashier;
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
  final List<BillItem> _bills;
  @override
  List<BillItem> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  final Map<BillType, int> _billsByType;
  @override
  Map<BillType, int> get billsByType {
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

  /// Whether this bill count has been synced to server.
  @override
  @JsonKey()
  final bool isSynced;

  /// Local ID for tracking before server sync.
  @override
  final String? localId;

  @override
  String toString() {
    return 'BillCount(id: $id, date: $date, updatedAt: $updatedAt, cashier: $cashier, beginningBalance: $beginningBalance, showBeginningBalance: $showBeginningBalance, totalCash: $totalCash, totalExpenses: $totalExpenses, netCash: $netCash, bills: $bills, billsByType: $billsByType, billsTotal: $billsTotal, summaryStep1: $summaryStep1, summaryFinal: $summaryFinal, isSynced: $isSynced, localId: $localId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillCountImpl &&
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
                other.summaryFinal == summaryFinal) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

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
      summaryFinal,
      isSynced,
      localId);

  /// Create a copy of BillCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillCountImplCopyWith<_$BillCountImpl> get copyWith =>
      __$$BillCountImplCopyWithImpl<_$BillCountImpl>(this, _$identity);
}

abstract class _BillCount extends BillCount {
  const factory _BillCount(
      {required final String id,
      required final DateTime date,
      required final DateTime updatedAt,
      required final BillCountCashier cashier,
      required final double beginningBalance,
      required final bool showBeginningBalance,
      required final double totalCash,
      required final double totalExpenses,
      required final double netCash,
      required final List<BillItem> bills,
      required final Map<BillType, int> billsByType,
      required final double billsTotal,
      required final double summaryStep1,
      required final double summaryFinal,
      final bool isSynced,
      final String? localId}) = _$BillCountImpl;
  const _BillCount._() : super._();

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get updatedAt;
  @override
  BillCountCashier get cashier;
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
  List<BillItem> get bills;
  @override
  Map<BillType, int> get billsByType;
  @override
  double get billsTotal;
  @override
  double get summaryStep1;
  @override
  double get summaryFinal;

  /// Whether this bill count has been synced to server.
  @override
  bool get isSynced;

  /// Local ID for tracking before server sync.
  @override
  String? get localId;

  /// Create a copy of BillCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillCountImplCopyWith<_$BillCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
