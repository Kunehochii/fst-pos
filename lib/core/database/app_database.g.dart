// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _targetTableMeta =
      const VerificationMeta('targetTable');
  @override
  late final GeneratedColumn<String> targetTable = GeneratedColumn<String>(
      'target_table', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncedAtMeta =
      const VerificationMeta('syncedAt');
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
      'synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        targetTable,
        operation,
        recordId,
        payload,
        createdAt,
        synced,
        syncedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('target_table')) {
      context.handle(
          _targetTableMeta,
          targetTable.isAcceptableOrUnknown(
              data['target_table']!, _targetTableMeta));
    } else if (isInserting) {
      context.missing(_targetTableMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('synced_at')) {
      context.handle(_syncedAtMeta,
          syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      targetTable: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_table'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      syncedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}synced_at']),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueItem extends DataClass implements Insertable<SyncQueueItem> {
  final int id;
  final String targetTable;
  final String operation;
  final String recordId;
  final String payload;
  final DateTime createdAt;
  final bool synced;
  final DateTime? syncedAt;
  const SyncQueueItem(
      {required this.id,
      required this.targetTable,
      required this.operation,
      required this.recordId,
      required this.payload,
      required this.createdAt,
      required this.synced,
      this.syncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['target_table'] = Variable<String>(targetTable);
    map['operation'] = Variable<String>(operation);
    map['record_id'] = Variable<String>(recordId);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['synced'] = Variable<bool>(synced);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<DateTime>(syncedAt);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      targetTable: Value(targetTable),
      operation: Value(operation),
      recordId: Value(recordId),
      payload: Value(payload),
      createdAt: Value(createdAt),
      synced: Value(synced),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
    );
  }

  factory SyncQueueItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueItem(
      id: serializer.fromJson<int>(json['id']),
      targetTable: serializer.fromJson<String>(json['targetTable']),
      operation: serializer.fromJson<String>(json['operation']),
      recordId: serializer.fromJson<String>(json['recordId']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      synced: serializer.fromJson<bool>(json['synced']),
      syncedAt: serializer.fromJson<DateTime?>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'targetTable': serializer.toJson<String>(targetTable),
      'operation': serializer.toJson<String>(operation),
      'recordId': serializer.toJson<String>(recordId),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'synced': serializer.toJson<bool>(synced),
      'syncedAt': serializer.toJson<DateTime?>(syncedAt),
    };
  }

  SyncQueueItem copyWith(
          {int? id,
          String? targetTable,
          String? operation,
          String? recordId,
          String? payload,
          DateTime? createdAt,
          bool? synced,
          Value<DateTime?> syncedAt = const Value.absent()}) =>
      SyncQueueItem(
        id: id ?? this.id,
        targetTable: targetTable ?? this.targetTable,
        operation: operation ?? this.operation,
        recordId: recordId ?? this.recordId,
        payload: payload ?? this.payload,
        createdAt: createdAt ?? this.createdAt,
        synced: synced ?? this.synced,
        syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
      );
  SyncQueueItem copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueItem(
      id: data.id.present ? data.id.value : this.id,
      targetTable:
          data.targetTable.present ? data.targetTable.value : this.targetTable,
      operation: data.operation.present ? data.operation.value : this.operation,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      synced: data.synced.present ? data.synced.value : this.synced,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueItem(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('operation: $operation, ')
          ..write('recordId: $recordId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('synced: $synced, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, targetTable, operation, recordId, payload,
      createdAt, synced, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueItem &&
          other.id == this.id &&
          other.targetTable == this.targetTable &&
          other.operation == this.operation &&
          other.recordId == this.recordId &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.synced == this.synced &&
          other.syncedAt == this.syncedAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueItem> {
  final Value<int> id;
  final Value<String> targetTable;
  final Value<String> operation;
  final Value<String> recordId;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<bool> synced;
  final Value<DateTime?> syncedAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.targetTable = const Value.absent(),
    this.operation = const Value.absent(),
    this.recordId = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.synced = const Value.absent(),
    this.syncedAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String targetTable,
    required String operation,
    required String recordId,
    required String payload,
    this.createdAt = const Value.absent(),
    this.synced = const Value.absent(),
    this.syncedAt = const Value.absent(),
  })  : targetTable = Value(targetTable),
        operation = Value(operation),
        recordId = Value(recordId),
        payload = Value(payload);
  static Insertable<SyncQueueItem> custom({
    Expression<int>? id,
    Expression<String>? targetTable,
    Expression<String>? operation,
    Expression<String>? recordId,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<bool>? synced,
    Expression<DateTime>? syncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetTable != null) 'target_table': targetTable,
      if (operation != null) 'operation': operation,
      if (recordId != null) 'record_id': recordId,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (synced != null) 'synced': synced,
      if (syncedAt != null) 'synced_at': syncedAt,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? targetTable,
      Value<String>? operation,
      Value<String>? recordId,
      Value<String>? payload,
      Value<DateTime>? createdAt,
      Value<bool>? synced,
      Value<DateTime?>? syncedAt}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      targetTable: targetTable ?? this.targetTable,
      operation: operation ?? this.operation,
      recordId: recordId ?? this.recordId,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      synced: synced ?? this.synced,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (targetTable.present) {
      map['target_table'] = Variable<String>(targetTable.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('operation: $operation, ')
          ..write('recordId: $recordId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('synced: $synced, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }
}

class $CachedProductsTable extends CachedProducts
    with TableInfo<$CachedProductsTable, CachedProductRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pictureMeta =
      const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String> picture = GeneratedColumn<String>(
      'picture', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cashierId, name, picture, category, data, cachedAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_products';
  @override
  VerificationContext validateIntegrity(Insertable<CachedProductRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    } else if (isInserting) {
      context.missing(_pictureMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedProductRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedProductRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      picture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}picture'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CachedProductsTable createAlias(String alias) {
    return $CachedProductsTable(attachedDatabase, alias);
  }
}

class CachedProductRow extends DataClass
    implements Insertable<CachedProductRow> {
  /// Product ID from the server.
  final String id;

  /// Cashier ID who owns this product.
  final String cashierId;

  /// Product name.
  final String name;

  /// Product picture URL.
  final String picture;

  /// Product category (NORMAL, ASIN, PLASTIC).
  final String category;

  /// Complete product data as JSON (includes pricing, etc.).
  final String data;

  /// When the cache entry was created.
  final DateTime cachedAt;

  /// When the cache entry was last updated.
  final DateTime updatedAt;
  const CachedProductRow(
      {required this.id,
      required this.cashierId,
      required this.name,
      required this.picture,
      required this.category,
      required this.data,
      required this.cachedAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['cashier_id'] = Variable<String>(cashierId);
    map['name'] = Variable<String>(name);
    map['picture'] = Variable<String>(picture);
    map['category'] = Variable<String>(category);
    map['data'] = Variable<String>(data);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedProductsCompanion toCompanion(bool nullToAbsent) {
    return CachedProductsCompanion(
      id: Value(id),
      cashierId: Value(cashierId),
      name: Value(name),
      picture: Value(picture),
      category: Value(category),
      data: Value(data),
      cachedAt: Value(cachedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedProductRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedProductRow(
      id: serializer.fromJson<String>(json['id']),
      cashierId: serializer.fromJson<String>(json['cashierId']),
      name: serializer.fromJson<String>(json['name']),
      picture: serializer.fromJson<String>(json['picture']),
      category: serializer.fromJson<String>(json['category']),
      data: serializer.fromJson<String>(json['data']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cashierId': serializer.toJson<String>(cashierId),
      'name': serializer.toJson<String>(name),
      'picture': serializer.toJson<String>(picture),
      'category': serializer.toJson<String>(category),
      'data': serializer.toJson<String>(data),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedProductRow copyWith(
          {String? id,
          String? cashierId,
          String? name,
          String? picture,
          String? category,
          String? data,
          DateTime? cachedAt,
          DateTime? updatedAt}) =>
      CachedProductRow(
        id: id ?? this.id,
        cashierId: cashierId ?? this.cashierId,
        name: name ?? this.name,
        picture: picture ?? this.picture,
        category: category ?? this.category,
        data: data ?? this.data,
        cachedAt: cachedAt ?? this.cachedAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CachedProductRow copyWithCompanion(CachedProductsCompanion data) {
    return CachedProductRow(
      id: data.id.present ? data.id.value : this.id,
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      name: data.name.present ? data.name.value : this.name,
      picture: data.picture.present ? data.picture.value : this.picture,
      category: data.category.present ? data.category.value : this.category,
      data: data.data.present ? data.data.value : this.data,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedProductRow(')
          ..write('id: $id, ')
          ..write('cashierId: $cashierId, ')
          ..write('name: $name, ')
          ..write('picture: $picture, ')
          ..write('category: $category, ')
          ..write('data: $data, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, cashierId, name, picture, category, data, cachedAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedProductRow &&
          other.id == this.id &&
          other.cashierId == this.cashierId &&
          other.name == this.name &&
          other.picture == this.picture &&
          other.category == this.category &&
          other.data == this.data &&
          other.cachedAt == this.cachedAt &&
          other.updatedAt == this.updatedAt);
}

class CachedProductsCompanion extends UpdateCompanion<CachedProductRow> {
  final Value<String> id;
  final Value<String> cashierId;
  final Value<String> name;
  final Value<String> picture;
  final Value<String> category;
  final Value<String> data;
  final Value<DateTime> cachedAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedProductsCompanion({
    this.id = const Value.absent(),
    this.cashierId = const Value.absent(),
    this.name = const Value.absent(),
    this.picture = const Value.absent(),
    this.category = const Value.absent(),
    this.data = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedProductsCompanion.insert({
    required String id,
    required String cashierId,
    required String name,
    required String picture,
    required String category,
    required String data,
    this.cachedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cashierId = Value(cashierId),
        name = Value(name),
        picture = Value(picture),
        category = Value(category),
        data = Value(data);
  static Insertable<CachedProductRow> custom({
    Expression<String>? id,
    Expression<String>? cashierId,
    Expression<String>? name,
    Expression<String>? picture,
    Expression<String>? category,
    Expression<String>? data,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cashierId != null) 'cashier_id': cashierId,
      if (name != null) 'name': name,
      if (picture != null) 'picture': picture,
      if (category != null) 'category': category,
      if (data != null) 'data': data,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? cashierId,
      Value<String>? name,
      Value<String>? picture,
      Value<String>? category,
      Value<String>? data,
      Value<DateTime>? cachedAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CachedProductsCompanion(
      id: id ?? this.id,
      cashierId: cashierId ?? this.cashierId,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      category: category ?? this.category,
      data: data ?? this.data,
      cachedAt: cachedAt ?? this.cachedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedProductsCompanion(')
          ..write('id: $id, ')
          ..write('cashierId: $cashierId, ')
          ..write('name: $name, ')
          ..write('picture: $picture, ')
          ..write('category: $category, ')
          ..write('data: $data, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductCacheMetaTable extends ProductCacheMeta
    with TableInfo<$ProductCacheMetaTable, ProductCacheMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCacheMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSyncingMeta =
      const VerificationMeta('isSyncing');
  @override
  late final GeneratedColumn<bool> isSyncing = GeneratedColumn<bool>(
      'is_syncing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_syncing" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [cashierId, lastSyncedAt, isSyncing, lastError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_cache_meta';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductCacheMetaRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    if (data.containsKey('is_syncing')) {
      context.handle(_isSyncingMeta,
          isSyncing.isAcceptableOrUnknown(data['is_syncing']!, _isSyncingMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cashierId};
  @override
  ProductCacheMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCacheMetaRow(
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at'])!,
      isSyncing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_syncing'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $ProductCacheMetaTable createAlias(String alias) {
    return $ProductCacheMetaTable(attachedDatabase, alias);
  }
}

class ProductCacheMetaRow extends DataClass
    implements Insertable<ProductCacheMetaRow> {
  /// Cashier ID whose products are cached.
  final String cashierId;

  /// When the products were last synced from server.
  final DateTime lastSyncedAt;

  /// Whether a sync is currently in progress.
  final bool isSyncing;

  /// Last sync error message, if any.
  final String? lastError;
  const ProductCacheMetaRow(
      {required this.cashierId,
      required this.lastSyncedAt,
      required this.isSyncing,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cashier_id'] = Variable<String>(cashierId);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    map['is_syncing'] = Variable<bool>(isSyncing);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  ProductCacheMetaCompanion toCompanion(bool nullToAbsent) {
    return ProductCacheMetaCompanion(
      cashierId: Value(cashierId),
      lastSyncedAt: Value(lastSyncedAt),
      isSyncing: Value(isSyncing),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory ProductCacheMetaRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductCacheMetaRow(
      cashierId: serializer.fromJson<String>(json['cashierId']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
      isSyncing: serializer.fromJson<bool>(json['isSyncing']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cashierId': serializer.toJson<String>(cashierId),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
      'isSyncing': serializer.toJson<bool>(isSyncing),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  ProductCacheMetaRow copyWith(
          {String? cashierId,
          DateTime? lastSyncedAt,
          bool? isSyncing,
          Value<String?> lastError = const Value.absent()}) =>
      ProductCacheMetaRow(
        cashierId: cashierId ?? this.cashierId,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
        isSyncing: isSyncing ?? this.isSyncing,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  ProductCacheMetaRow copyWithCompanion(ProductCacheMetaCompanion data) {
    return ProductCacheMetaRow(
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      isSyncing: data.isSyncing.present ? data.isSyncing.value : this.isSyncing,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductCacheMetaRow(')
          ..write('cashierId: $cashierId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cashierId, lastSyncedAt, isSyncing, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductCacheMetaRow &&
          other.cashierId == this.cashierId &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.isSyncing == this.isSyncing &&
          other.lastError == this.lastError);
}

class ProductCacheMetaCompanion extends UpdateCompanion<ProductCacheMetaRow> {
  final Value<String> cashierId;
  final Value<DateTime> lastSyncedAt;
  final Value<bool> isSyncing;
  final Value<String?> lastError;
  final Value<int> rowid;
  const ProductCacheMetaCompanion({
    this.cashierId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isSyncing = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCacheMetaCompanion.insert({
    required String cashierId,
    required DateTime lastSyncedAt,
    this.isSyncing = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : cashierId = Value(cashierId),
        lastSyncedAt = Value(lastSyncedAt);
  static Insertable<ProductCacheMetaRow> custom({
    Expression<String>? cashierId,
    Expression<DateTime>? lastSyncedAt,
    Expression<bool>? isSyncing,
    Expression<String>? lastError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cashierId != null) 'cashier_id': cashierId,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (isSyncing != null) 'is_syncing': isSyncing,
      if (lastError != null) 'last_error': lastError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCacheMetaCompanion copyWith(
      {Value<String>? cashierId,
      Value<DateTime>? lastSyncedAt,
      Value<bool>? isSyncing,
      Value<String?>? lastError,
      Value<int>? rowid}) {
    return ProductCacheMetaCompanion(
      cashierId: cashierId ?? this.cashierId,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      isSyncing: isSyncing ?? this.isSyncing,
      lastError: lastError ?? this.lastError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (isSyncing.present) {
      map['is_syncing'] = Variable<bool>(isSyncing.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCacheMetaCompanion(')
          ..write('cashierId: $cashierId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('lastError: $lastError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedSalesTable extends CachedSales
    with TableInfo<$CachedSalesTable, CachedSaleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedSalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
      'local_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isVoidMeta = const VerificationMeta('isVoid');
  @override
  late final GeneratedColumn<bool> isVoid = GeneratedColumn<bool>(
      'is_void', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_void" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _voidedAtMeta =
      const VerificationMeta('voidedAt');
  @override
  late final GeneratedColumn<DateTime> voidedAt = GeneratedColumn<DateTime>(
      'voided_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
      'order_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localId,
        cashierId,
        totalAmount,
        paymentMethod,
        isVoid,
        voidedAt,
        orderId,
        data,
        isSynced,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_sales';
  @override
  VerificationContext validateIntegrity(Insertable<CachedSaleRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('is_void')) {
      context.handle(_isVoidMeta,
          isVoid.isAcceptableOrUnknown(data['is_void']!, _isVoidMeta));
    }
    if (data.containsKey('voided_at')) {
      context.handle(_voidedAtMeta,
          voidedAt.isAcceptableOrUnknown(data['voided_at']!, _voidedAtMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedSaleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedSaleRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_id']),
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      isVoid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_void'])!,
      voidedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}voided_at']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_id']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CachedSalesTable createAlias(String alias) {
    return $CachedSalesTable(attachedDatabase, alias);
  }
}

class CachedSaleRow extends DataClass implements Insertable<CachedSaleRow> {
  /// Sale ID from the server (or local UUID if not synced).
  final String id;

  /// Local UUID for tracking before server sync.
  final String? localId;

  /// Cashier ID who made the sale.
  final String cashierId;

  /// Total sale amount.
  final double totalAmount;

  /// Payment method (CASH, BANK_TRANSFER, CHECK).
  final String paymentMethod;

  /// Whether the sale is voided.
  final bool isVoid;

  /// When the sale was voided.
  final DateTime? voidedAt;

  /// Optional order ID.
  final String? orderId;

  /// Complete sale data as JSON (includes items, etc.).
  final String data;

  /// Whether this sale has been synced to the server.
  final bool isSynced;

  /// When the sale was created.
  final DateTime createdAt;

  /// When the sale was last updated.
  final DateTime updatedAt;
  const CachedSaleRow(
      {required this.id,
      this.localId,
      required this.cashierId,
      required this.totalAmount,
      required this.paymentMethod,
      required this.isVoid,
      this.voidedAt,
      this.orderId,
      required this.data,
      required this.isSynced,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<String>(localId);
    }
    map['cashier_id'] = Variable<String>(cashierId);
    map['total_amount'] = Variable<double>(totalAmount);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['is_void'] = Variable<bool>(isVoid);
    if (!nullToAbsent || voidedAt != null) {
      map['voided_at'] = Variable<DateTime>(voidedAt);
    }
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<String>(orderId);
    }
    map['data'] = Variable<String>(data);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedSalesCompanion toCompanion(bool nullToAbsent) {
    return CachedSalesCompanion(
      id: Value(id),
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      cashierId: Value(cashierId),
      totalAmount: Value(totalAmount),
      paymentMethod: Value(paymentMethod),
      isVoid: Value(isVoid),
      voidedAt: voidedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(voidedAt),
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      data: Value(data),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedSaleRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedSaleRow(
      id: serializer.fromJson<String>(json['id']),
      localId: serializer.fromJson<String?>(json['localId']),
      cashierId: serializer.fromJson<String>(json['cashierId']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      isVoid: serializer.fromJson<bool>(json['isVoid']),
      voidedAt: serializer.fromJson<DateTime?>(json['voidedAt']),
      orderId: serializer.fromJson<String?>(json['orderId']),
      data: serializer.fromJson<String>(json['data']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'localId': serializer.toJson<String?>(localId),
      'cashierId': serializer.toJson<String>(cashierId),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'isVoid': serializer.toJson<bool>(isVoid),
      'voidedAt': serializer.toJson<DateTime?>(voidedAt),
      'orderId': serializer.toJson<String?>(orderId),
      'data': serializer.toJson<String>(data),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedSaleRow copyWith(
          {String? id,
          Value<String?> localId = const Value.absent(),
          String? cashierId,
          double? totalAmount,
          String? paymentMethod,
          bool? isVoid,
          Value<DateTime?> voidedAt = const Value.absent(),
          Value<String?> orderId = const Value.absent(),
          String? data,
          bool? isSynced,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CachedSaleRow(
        id: id ?? this.id,
        localId: localId.present ? localId.value : this.localId,
        cashierId: cashierId ?? this.cashierId,
        totalAmount: totalAmount ?? this.totalAmount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        isVoid: isVoid ?? this.isVoid,
        voidedAt: voidedAt.present ? voidedAt.value : this.voidedAt,
        orderId: orderId.present ? orderId.value : this.orderId,
        data: data ?? this.data,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CachedSaleRow copyWithCompanion(CachedSalesCompanion data) {
    return CachedSaleRow(
      id: data.id.present ? data.id.value : this.id,
      localId: data.localId.present ? data.localId.value : this.localId,
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      isVoid: data.isVoid.present ? data.isVoid.value : this.isVoid,
      voidedAt: data.voidedAt.present ? data.voidedAt.value : this.voidedAt,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      data: data.data.present ? data.data.value : this.data,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedSaleRow(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('isVoid: $isVoid, ')
          ..write('voidedAt: $voidedAt, ')
          ..write('orderId: $orderId, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      localId,
      cashierId,
      totalAmount,
      paymentMethod,
      isVoid,
      voidedAt,
      orderId,
      data,
      isSynced,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedSaleRow &&
          other.id == this.id &&
          other.localId == this.localId &&
          other.cashierId == this.cashierId &&
          other.totalAmount == this.totalAmount &&
          other.paymentMethod == this.paymentMethod &&
          other.isVoid == this.isVoid &&
          other.voidedAt == this.voidedAt &&
          other.orderId == this.orderId &&
          other.data == this.data &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CachedSalesCompanion extends UpdateCompanion<CachedSaleRow> {
  final Value<String> id;
  final Value<String?> localId;
  final Value<String> cashierId;
  final Value<double> totalAmount;
  final Value<String> paymentMethod;
  final Value<bool> isVoid;
  final Value<DateTime?> voidedAt;
  final Value<String?> orderId;
  final Value<String> data;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedSalesCompanion({
    this.id = const Value.absent(),
    this.localId = const Value.absent(),
    this.cashierId = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.isVoid = const Value.absent(),
    this.voidedAt = const Value.absent(),
    this.orderId = const Value.absent(),
    this.data = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedSalesCompanion.insert({
    required String id,
    this.localId = const Value.absent(),
    required String cashierId,
    required double totalAmount,
    required String paymentMethod,
    this.isVoid = const Value.absent(),
    this.voidedAt = const Value.absent(),
    this.orderId = const Value.absent(),
    required String data,
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cashierId = Value(cashierId),
        totalAmount = Value(totalAmount),
        paymentMethod = Value(paymentMethod),
        data = Value(data);
  static Insertable<CachedSaleRow> custom({
    Expression<String>? id,
    Expression<String>? localId,
    Expression<String>? cashierId,
    Expression<double>? totalAmount,
    Expression<String>? paymentMethod,
    Expression<bool>? isVoid,
    Expression<DateTime>? voidedAt,
    Expression<String>? orderId,
    Expression<String>? data,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localId != null) 'local_id': localId,
      if (cashierId != null) 'cashier_id': cashierId,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (isVoid != null) 'is_void': isVoid,
      if (voidedAt != null) 'voided_at': voidedAt,
      if (orderId != null) 'order_id': orderId,
      if (data != null) 'data': data,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedSalesCompanion copyWith(
      {Value<String>? id,
      Value<String?>? localId,
      Value<String>? cashierId,
      Value<double>? totalAmount,
      Value<String>? paymentMethod,
      Value<bool>? isVoid,
      Value<DateTime?>? voidedAt,
      Value<String?>? orderId,
      Value<String>? data,
      Value<bool>? isSynced,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CachedSalesCompanion(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      cashierId: cashierId ?? this.cashierId,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      isVoid: isVoid ?? this.isVoid,
      voidedAt: voidedAt ?? this.voidedAt,
      orderId: orderId ?? this.orderId,
      data: data ?? this.data,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (isVoid.present) {
      map['is_void'] = Variable<bool>(isVoid.value);
    }
    if (voidedAt.present) {
      map['voided_at'] = Variable<DateTime>(voidedAt.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedSalesCompanion(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('isVoid: $isVoid, ')
          ..write('voidedAt: $voidedAt, ')
          ..write('orderId: $orderId, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingSaleSyncTable extends PendingSaleSync
    with TableInfo<$PendingSaleSyncTable, PendingSaleSyncRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingSaleSyncTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _localSaleIdMeta =
      const VerificationMeta('localSaleId');
  @override
  late final GeneratedColumn<String> localSaleId = GeneratedColumn<String>(
      'local_sale_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastAttemptAtMeta =
      const VerificationMeta('lastAttemptAt');
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>('last_attempt_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localSaleId,
        operation,
        payload,
        attempts,
        lastError,
        createdAt,
        lastAttemptAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_sale_sync';
  @override
  VerificationContext validateIntegrity(Insertable<PendingSaleSyncRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('local_sale_id')) {
      context.handle(
          _localSaleIdMeta,
          localSaleId.isAcceptableOrUnknown(
              data['local_sale_id']!, _localSaleIdMeta));
    } else if (isInserting) {
      context.missing(_localSaleIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
          _lastAttemptAtMeta,
          lastAttemptAt.isAcceptableOrUnknown(
              data['last_attempt_at']!, _lastAttemptAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingSaleSyncRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingSaleSyncRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      localSaleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_sale_id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_attempt_at']),
    );
  }

  @override
  $PendingSaleSyncTable createAlias(String alias) {
    return $PendingSaleSyncTable(attachedDatabase, alias);
  }
}

class PendingSaleSyncRow extends DataClass
    implements Insertable<PendingSaleSyncRow> {
  /// Auto-increment ID.
  final int id;

  /// The local sale ID.
  final String localSaleId;

  /// Operation type: 'create' or 'void'.
  final String operation;

  /// The sale data as JSON for creation.
  final String payload;

  /// Number of sync attempts.
  final int attempts;

  /// Last sync error message.
  final String? lastError;

  /// When the sync operation was queued.
  final DateTime createdAt;

  /// When the sync was last attempted.
  final DateTime? lastAttemptAt;
  const PendingSaleSyncRow(
      {required this.id,
      required this.localSaleId,
      required this.operation,
      required this.payload,
      required this.attempts,
      this.lastError,
      required this.createdAt,
      this.lastAttemptAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['local_sale_id'] = Variable<String>(localSaleId);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  PendingSaleSyncCompanion toCompanion(bool nullToAbsent) {
    return PendingSaleSyncCompanion(
      id: Value(id),
      localSaleId: Value(localSaleId),
      operation: Value(operation),
      payload: Value(payload),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory PendingSaleSyncRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingSaleSyncRow(
      id: serializer.fromJson<int>(json['id']),
      localSaleId: serializer.fromJson<String>(json['localSaleId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'localSaleId': serializer.toJson<String>(localSaleId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  PendingSaleSyncRow copyWith(
          {int? id,
          String? localSaleId,
          String? operation,
          String? payload,
          int? attempts,
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> lastAttemptAt = const Value.absent()}) =>
      PendingSaleSyncRow(
        id: id ?? this.id,
        localSaleId: localSaleId ?? this.localSaleId,
        operation: operation ?? this.operation,
        payload: payload ?? this.payload,
        attempts: attempts ?? this.attempts,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
        lastAttemptAt:
            lastAttemptAt.present ? lastAttemptAt.value : this.lastAttemptAt,
      );
  PendingSaleSyncRow copyWithCompanion(PendingSaleSyncCompanion data) {
    return PendingSaleSyncRow(
      id: data.id.present ? data.id.value : this.id,
      localSaleId:
          data.localSaleId.present ? data.localSaleId.value : this.localSaleId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingSaleSyncRow(')
          ..write('id: $id, ')
          ..write('localSaleId: $localSaleId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localSaleId, operation, payload, attempts,
      lastError, createdAt, lastAttemptAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingSaleSyncRow &&
          other.id == this.id &&
          other.localSaleId == this.localSaleId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class PendingSaleSyncCompanion extends UpdateCompanion<PendingSaleSyncRow> {
  final Value<int> id;
  final Value<String> localSaleId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<int> attempts;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastAttemptAt;
  const PendingSaleSyncCompanion({
    this.id = const Value.absent(),
    this.localSaleId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  });
  PendingSaleSyncCompanion.insert({
    this.id = const Value.absent(),
    required String localSaleId,
    required String operation,
    required String payload,
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  })  : localSaleId = Value(localSaleId),
        operation = Value(operation),
        payload = Value(payload);
  static Insertable<PendingSaleSyncRow> custom({
    Expression<int>? id,
    Expression<String>? localSaleId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<int>? attempts,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastAttemptAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localSaleId != null) 'local_sale_id': localSaleId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
    });
  }

  PendingSaleSyncCompanion copyWith(
      {Value<int>? id,
      Value<String>? localSaleId,
      Value<String>? operation,
      Value<String>? payload,
      Value<int>? attempts,
      Value<String?>? lastError,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastAttemptAt}) {
    return PendingSaleSyncCompanion(
      id: id ?? this.id,
      localSaleId: localSaleId ?? this.localSaleId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (localSaleId.present) {
      map['local_sale_id'] = Variable<String>(localSaleId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingSaleSyncCompanion(')
          ..write('id: $id, ')
          ..write('localSaleId: $localSaleId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }
}

class $LocalStockAdjustmentsTable extends LocalStockAdjustments
    with TableInfo<$LocalStockAdjustmentsTable, LocalStockAdjustmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalStockAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceTypeMeta =
      const VerificationMeta('priceType');
  @override
  late final GeneratedColumn<String> priceType = GeneratedColumn<String>(
      'price_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sackPriceIdMeta =
      const VerificationMeta('sackPriceId');
  @override
  late final GeneratedColumn<String> sackPriceId = GeneratedColumn<String>(
      'sack_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _perKiloPriceIdMeta =
      const VerificationMeta('perKiloPriceId');
  @override
  late final GeneratedColumn<String> perKiloPriceId = GeneratedColumn<String>(
      'per_kilo_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityChangeMeta =
      const VerificationMeta('quantityChange');
  @override
  late final GeneratedColumn<double> quantityChange = GeneratedColumn<double>(
      'quantity_change', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
      'sale_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        priceType,
        sackPriceId,
        perKiloPriceId,
        quantityChange,
        saleId,
        isSynced,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_stock_adjustments';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalStockAdjustmentRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('price_type')) {
      context.handle(_priceTypeMeta,
          priceType.isAcceptableOrUnknown(data['price_type']!, _priceTypeMeta));
    } else if (isInserting) {
      context.missing(_priceTypeMeta);
    }
    if (data.containsKey('sack_price_id')) {
      context.handle(
          _sackPriceIdMeta,
          sackPriceId.isAcceptableOrUnknown(
              data['sack_price_id']!, _sackPriceIdMeta));
    }
    if (data.containsKey('per_kilo_price_id')) {
      context.handle(
          _perKiloPriceIdMeta,
          perKiloPriceId.isAcceptableOrUnknown(
              data['per_kilo_price_id']!, _perKiloPriceIdMeta));
    }
    if (data.containsKey('quantity_change')) {
      context.handle(
          _quantityChangeMeta,
          quantityChange.isAcceptableOrUnknown(
              data['quantity_change']!, _quantityChangeMeta));
    } else if (isInserting) {
      context.missing(_quantityChangeMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(_saleIdMeta,
          saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta));
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalStockAdjustmentRow map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalStockAdjustmentRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      priceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price_type'])!,
      sackPriceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sack_price_id']),
      perKiloPriceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}per_kilo_price_id']),
      quantityChange: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_change'])!,
      saleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sale_id'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LocalStockAdjustmentsTable createAlias(String alias) {
    return $LocalStockAdjustmentsTable(attachedDatabase, alias);
  }
}

class LocalStockAdjustmentRow extends DataClass
    implements Insertable<LocalStockAdjustmentRow> {
  /// Auto-increment ID.
  final int id;

  /// Product ID.
  final String productId;

  /// Price type: 'perKilo' or 'sack'.
  final String priceType;

  /// Sack price ID if applicable.
  final String? sackPriceId;

  /// Per kilo price ID if applicable.
  final String? perKiloPriceId;

  /// Quantity change (negative for sales, positive for voids).
  final double quantityChange;

  /// Related sale ID.
  final String saleId;

  /// Whether this adjustment has been synced.
  final bool isSynced;

  /// When the adjustment was made.
  final DateTime createdAt;
  const LocalStockAdjustmentRow(
      {required this.id,
      required this.productId,
      required this.priceType,
      this.sackPriceId,
      this.perKiloPriceId,
      required this.quantityChange,
      required this.saleId,
      required this.isSynced,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['price_type'] = Variable<String>(priceType);
    if (!nullToAbsent || sackPriceId != null) {
      map['sack_price_id'] = Variable<String>(sackPriceId);
    }
    if (!nullToAbsent || perKiloPriceId != null) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId);
    }
    map['quantity_change'] = Variable<double>(quantityChange);
    map['sale_id'] = Variable<String>(saleId);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LocalStockAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return LocalStockAdjustmentsCompanion(
      id: Value(id),
      productId: Value(productId),
      priceType: Value(priceType),
      sackPriceId: sackPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sackPriceId),
      perKiloPriceId: perKiloPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(perKiloPriceId),
      quantityChange: Value(quantityChange),
      saleId: Value(saleId),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
    );
  }

  factory LocalStockAdjustmentRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalStockAdjustmentRow(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      priceType: serializer.fromJson<String>(json['priceType']),
      sackPriceId: serializer.fromJson<String?>(json['sackPriceId']),
      perKiloPriceId: serializer.fromJson<String?>(json['perKiloPriceId']),
      quantityChange: serializer.fromJson<double>(json['quantityChange']),
      saleId: serializer.fromJson<String>(json['saleId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'priceType': serializer.toJson<String>(priceType),
      'sackPriceId': serializer.toJson<String?>(sackPriceId),
      'perKiloPriceId': serializer.toJson<String?>(perKiloPriceId),
      'quantityChange': serializer.toJson<double>(quantityChange),
      'saleId': serializer.toJson<String>(saleId),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalStockAdjustmentRow copyWith(
          {int? id,
          String? productId,
          String? priceType,
          Value<String?> sackPriceId = const Value.absent(),
          Value<String?> perKiloPriceId = const Value.absent(),
          double? quantityChange,
          String? saleId,
          bool? isSynced,
          DateTime? createdAt}) =>
      LocalStockAdjustmentRow(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        priceType: priceType ?? this.priceType,
        sackPriceId: sackPriceId.present ? sackPriceId.value : this.sackPriceId,
        perKiloPriceId:
            perKiloPriceId.present ? perKiloPriceId.value : this.perKiloPriceId,
        quantityChange: quantityChange ?? this.quantityChange,
        saleId: saleId ?? this.saleId,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
      );
  LocalStockAdjustmentRow copyWithCompanion(
      LocalStockAdjustmentsCompanion data) {
    return LocalStockAdjustmentRow(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      priceType: data.priceType.present ? data.priceType.value : this.priceType,
      sackPriceId:
          data.sackPriceId.present ? data.sackPriceId.value : this.sackPriceId,
      perKiloPriceId: data.perKiloPriceId.present
          ? data.perKiloPriceId.value
          : this.perKiloPriceId,
      quantityChange: data.quantityChange.present
          ? data.quantityChange.value
          : this.quantityChange,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalStockAdjustmentRow(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('priceType: $priceType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('saleId: $saleId, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, priceType, sackPriceId,
      perKiloPriceId, quantityChange, saleId, isSynced, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalStockAdjustmentRow &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.priceType == this.priceType &&
          other.sackPriceId == this.sackPriceId &&
          other.perKiloPriceId == this.perKiloPriceId &&
          other.quantityChange == this.quantityChange &&
          other.saleId == this.saleId &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt);
}

class LocalStockAdjustmentsCompanion
    extends UpdateCompanion<LocalStockAdjustmentRow> {
  final Value<int> id;
  final Value<String> productId;
  final Value<String> priceType;
  final Value<String?> sackPriceId;
  final Value<String?> perKiloPriceId;
  final Value<double> quantityChange;
  final Value<String> saleId;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  const LocalStockAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.priceType = const Value.absent(),
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.saleId = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LocalStockAdjustmentsCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String priceType,
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    required double quantityChange,
    required String saleId,
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : productId = Value(productId),
        priceType = Value(priceType),
        quantityChange = Value(quantityChange),
        saleId = Value(saleId);
  static Insertable<LocalStockAdjustmentRow> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? priceType,
    Expression<String>? sackPriceId,
    Expression<String>? perKiloPriceId,
    Expression<double>? quantityChange,
    Expression<String>? saleId,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (priceType != null) 'price_type': priceType,
      if (sackPriceId != null) 'sack_price_id': sackPriceId,
      if (perKiloPriceId != null) 'per_kilo_price_id': perKiloPriceId,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (saleId != null) 'sale_id': saleId,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LocalStockAdjustmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? productId,
      Value<String>? priceType,
      Value<String?>? sackPriceId,
      Value<String?>? perKiloPriceId,
      Value<double>? quantityChange,
      Value<String>? saleId,
      Value<bool>? isSynced,
      Value<DateTime>? createdAt}) {
    return LocalStockAdjustmentsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      priceType: priceType ?? this.priceType,
      sackPriceId: sackPriceId ?? this.sackPriceId,
      perKiloPriceId: perKiloPriceId ?? this.perKiloPriceId,
      quantityChange: quantityChange ?? this.quantityChange,
      saleId: saleId ?? this.saleId,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (priceType.present) {
      map['price_type'] = Variable<String>(priceType.value);
    }
    if (sackPriceId.present) {
      map['sack_price_id'] = Variable<String>(sackPriceId.value);
    }
    if (perKiloPriceId.present) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<double>(quantityChange.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalStockAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('priceType: $priceType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('saleId: $saleId, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CachedDeliveriesTable extends CachedDeliveries
    with TableInfo<$CachedDeliveriesTable, CachedDeliveryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedDeliveriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
      'local_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _driverNameMeta =
      const VerificationMeta('driverName');
  @override
  late final GeneratedColumn<String> driverName = GeneratedColumn<String>(
      'driver_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deliveryTimeStartMeta =
      const VerificationMeta('deliveryTimeStart');
  @override
  late final GeneratedColumn<DateTime> deliveryTimeStart =
      GeneratedColumn<DateTime>('delivery_time_start', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localId,
        cashierId,
        driverName,
        deliveryTimeStart,
        data,
        isSynced,
        isDeleted,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_deliveries';
  @override
  VerificationContext validateIntegrity(Insertable<CachedDeliveryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('driver_name')) {
      context.handle(
          _driverNameMeta,
          driverName.isAcceptableOrUnknown(
              data['driver_name']!, _driverNameMeta));
    } else if (isInserting) {
      context.missing(_driverNameMeta);
    }
    if (data.containsKey('delivery_time_start')) {
      context.handle(
          _deliveryTimeStartMeta,
          deliveryTimeStart.isAcceptableOrUnknown(
              data['delivery_time_start']!, _deliveryTimeStartMeta));
    } else if (isInserting) {
      context.missing(_deliveryTimeStartMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedDeliveryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedDeliveryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_id']),
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      driverName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}driver_name'])!,
      deliveryTimeStart: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}delivery_time_start'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CachedDeliveriesTable createAlias(String alias) {
    return $CachedDeliveriesTable(attachedDatabase, alias);
  }
}

class CachedDeliveryRow extends DataClass
    implements Insertable<CachedDeliveryRow> {
  /// Delivery ID from the server (or local UUID if not synced).
  final String id;

  /// Local UUID for tracking before server sync.
  final String? localId;

  /// Cashier ID who received this delivery.
  final String cashierId;

  /// Driver name who delivered.
  final String driverName;

  /// When the delivery started/arrived.
  final DateTime deliveryTimeStart;

  /// Complete delivery data as JSON (includes items, etc.).
  final String data;

  /// Whether this delivery has been synced to the server.
  final bool isSynced;

  /// Whether this delivery is marked for deletion.
  final bool isDeleted;

  /// When the delivery was created.
  final DateTime createdAt;

  /// When the delivery was last updated.
  final DateTime updatedAt;
  const CachedDeliveryRow(
      {required this.id,
      this.localId,
      required this.cashierId,
      required this.driverName,
      required this.deliveryTimeStart,
      required this.data,
      required this.isSynced,
      required this.isDeleted,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<String>(localId);
    }
    map['cashier_id'] = Variable<String>(cashierId);
    map['driver_name'] = Variable<String>(driverName);
    map['delivery_time_start'] = Variable<DateTime>(deliveryTimeStart);
    map['data'] = Variable<String>(data);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedDeliveriesCompanion toCompanion(bool nullToAbsent) {
    return CachedDeliveriesCompanion(
      id: Value(id),
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      cashierId: Value(cashierId),
      driverName: Value(driverName),
      deliveryTimeStart: Value(deliveryTimeStart),
      data: Value(data),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedDeliveryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedDeliveryRow(
      id: serializer.fromJson<String>(json['id']),
      localId: serializer.fromJson<String?>(json['localId']),
      cashierId: serializer.fromJson<String>(json['cashierId']),
      driverName: serializer.fromJson<String>(json['driverName']),
      deliveryTimeStart:
          serializer.fromJson<DateTime>(json['deliveryTimeStart']),
      data: serializer.fromJson<String>(json['data']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'localId': serializer.toJson<String?>(localId),
      'cashierId': serializer.toJson<String>(cashierId),
      'driverName': serializer.toJson<String>(driverName),
      'deliveryTimeStart': serializer.toJson<DateTime>(deliveryTimeStart),
      'data': serializer.toJson<String>(data),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedDeliveryRow copyWith(
          {String? id,
          Value<String?> localId = const Value.absent(),
          String? cashierId,
          String? driverName,
          DateTime? deliveryTimeStart,
          String? data,
          bool? isSynced,
          bool? isDeleted,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CachedDeliveryRow(
        id: id ?? this.id,
        localId: localId.present ? localId.value : this.localId,
        cashierId: cashierId ?? this.cashierId,
        driverName: driverName ?? this.driverName,
        deliveryTimeStart: deliveryTimeStart ?? this.deliveryTimeStart,
        data: data ?? this.data,
        isSynced: isSynced ?? this.isSynced,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CachedDeliveryRow copyWithCompanion(CachedDeliveriesCompanion data) {
    return CachedDeliveryRow(
      id: data.id.present ? data.id.value : this.id,
      localId: data.localId.present ? data.localId.value : this.localId,
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      driverName:
          data.driverName.present ? data.driverName.value : this.driverName,
      deliveryTimeStart: data.deliveryTimeStart.present
          ? data.deliveryTimeStart.value
          : this.deliveryTimeStart,
      data: data.data.present ? data.data.value : this.data,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedDeliveryRow(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('driverName: $driverName, ')
          ..write('deliveryTimeStart: $deliveryTimeStart, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localId, cashierId, driverName,
      deliveryTimeStart, data, isSynced, isDeleted, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedDeliveryRow &&
          other.id == this.id &&
          other.localId == this.localId &&
          other.cashierId == this.cashierId &&
          other.driverName == this.driverName &&
          other.deliveryTimeStart == this.deliveryTimeStart &&
          other.data == this.data &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CachedDeliveriesCompanion extends UpdateCompanion<CachedDeliveryRow> {
  final Value<String> id;
  final Value<String?> localId;
  final Value<String> cashierId;
  final Value<String> driverName;
  final Value<DateTime> deliveryTimeStart;
  final Value<String> data;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedDeliveriesCompanion({
    this.id = const Value.absent(),
    this.localId = const Value.absent(),
    this.cashierId = const Value.absent(),
    this.driverName = const Value.absent(),
    this.deliveryTimeStart = const Value.absent(),
    this.data = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedDeliveriesCompanion.insert({
    required String id,
    this.localId = const Value.absent(),
    required String cashierId,
    required String driverName,
    required DateTime deliveryTimeStart,
    required String data,
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cashierId = Value(cashierId),
        driverName = Value(driverName),
        deliveryTimeStart = Value(deliveryTimeStart),
        data = Value(data);
  static Insertable<CachedDeliveryRow> custom({
    Expression<String>? id,
    Expression<String>? localId,
    Expression<String>? cashierId,
    Expression<String>? driverName,
    Expression<DateTime>? deliveryTimeStart,
    Expression<String>? data,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localId != null) 'local_id': localId,
      if (cashierId != null) 'cashier_id': cashierId,
      if (driverName != null) 'driver_name': driverName,
      if (deliveryTimeStart != null) 'delivery_time_start': deliveryTimeStart,
      if (data != null) 'data': data,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedDeliveriesCompanion copyWith(
      {Value<String>? id,
      Value<String?>? localId,
      Value<String>? cashierId,
      Value<String>? driverName,
      Value<DateTime>? deliveryTimeStart,
      Value<String>? data,
      Value<bool>? isSynced,
      Value<bool>? isDeleted,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CachedDeliveriesCompanion(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      cashierId: cashierId ?? this.cashierId,
      driverName: driverName ?? this.driverName,
      deliveryTimeStart: deliveryTimeStart ?? this.deliveryTimeStart,
      data: data ?? this.data,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (driverName.present) {
      map['driver_name'] = Variable<String>(driverName.value);
    }
    if (deliveryTimeStart.present) {
      map['delivery_time_start'] = Variable<DateTime>(deliveryTimeStart.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedDeliveriesCompanion(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('driverName: $driverName, ')
          ..write('deliveryTimeStart: $deliveryTimeStart, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DeliveryCacheMetaTable extends DeliveryCacheMeta
    with TableInfo<$DeliveryCacheMetaTable, DeliveryCacheMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeliveryCacheMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSyncingMeta =
      const VerificationMeta('isSyncing');
  @override
  late final GeneratedColumn<bool> isSyncing = GeneratedColumn<bool>(
      'is_syncing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_syncing" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [cashierId, lastSyncedAt, isSyncing, lastError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'delivery_cache_meta';
  @override
  VerificationContext validateIntegrity(
      Insertable<DeliveryCacheMetaRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    if (data.containsKey('is_syncing')) {
      context.handle(_isSyncingMeta,
          isSyncing.isAcceptableOrUnknown(data['is_syncing']!, _isSyncingMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cashierId};
  @override
  DeliveryCacheMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeliveryCacheMetaRow(
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at'])!,
      isSyncing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_syncing'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $DeliveryCacheMetaTable createAlias(String alias) {
    return $DeliveryCacheMetaTable(attachedDatabase, alias);
  }
}

class DeliveryCacheMetaRow extends DataClass
    implements Insertable<DeliveryCacheMetaRow> {
  /// Cashier ID whose deliveries are cached.
  final String cashierId;

  /// When the deliveries were last synced from server.
  final DateTime lastSyncedAt;

  /// Whether a sync is currently in progress.
  final bool isSyncing;

  /// Last sync error message, if any.
  final String? lastError;
  const DeliveryCacheMetaRow(
      {required this.cashierId,
      required this.lastSyncedAt,
      required this.isSyncing,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cashier_id'] = Variable<String>(cashierId);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    map['is_syncing'] = Variable<bool>(isSyncing);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  DeliveryCacheMetaCompanion toCompanion(bool nullToAbsent) {
    return DeliveryCacheMetaCompanion(
      cashierId: Value(cashierId),
      lastSyncedAt: Value(lastSyncedAt),
      isSyncing: Value(isSyncing),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory DeliveryCacheMetaRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeliveryCacheMetaRow(
      cashierId: serializer.fromJson<String>(json['cashierId']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
      isSyncing: serializer.fromJson<bool>(json['isSyncing']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cashierId': serializer.toJson<String>(cashierId),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
      'isSyncing': serializer.toJson<bool>(isSyncing),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  DeliveryCacheMetaRow copyWith(
          {String? cashierId,
          DateTime? lastSyncedAt,
          bool? isSyncing,
          Value<String?> lastError = const Value.absent()}) =>
      DeliveryCacheMetaRow(
        cashierId: cashierId ?? this.cashierId,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
        isSyncing: isSyncing ?? this.isSyncing,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  DeliveryCacheMetaRow copyWithCompanion(DeliveryCacheMetaCompanion data) {
    return DeliveryCacheMetaRow(
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      isSyncing: data.isSyncing.present ? data.isSyncing.value : this.isSyncing,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryCacheMetaRow(')
          ..write('cashierId: $cashierId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cashierId, lastSyncedAt, isSyncing, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeliveryCacheMetaRow &&
          other.cashierId == this.cashierId &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.isSyncing == this.isSyncing &&
          other.lastError == this.lastError);
}

class DeliveryCacheMetaCompanion extends UpdateCompanion<DeliveryCacheMetaRow> {
  final Value<String> cashierId;
  final Value<DateTime> lastSyncedAt;
  final Value<bool> isSyncing;
  final Value<String?> lastError;
  final Value<int> rowid;
  const DeliveryCacheMetaCompanion({
    this.cashierId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isSyncing = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeliveryCacheMetaCompanion.insert({
    required String cashierId,
    required DateTime lastSyncedAt,
    this.isSyncing = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : cashierId = Value(cashierId),
        lastSyncedAt = Value(lastSyncedAt);
  static Insertable<DeliveryCacheMetaRow> custom({
    Expression<String>? cashierId,
    Expression<DateTime>? lastSyncedAt,
    Expression<bool>? isSyncing,
    Expression<String>? lastError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cashierId != null) 'cashier_id': cashierId,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (isSyncing != null) 'is_syncing': isSyncing,
      if (lastError != null) 'last_error': lastError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeliveryCacheMetaCompanion copyWith(
      {Value<String>? cashierId,
      Value<DateTime>? lastSyncedAt,
      Value<bool>? isSyncing,
      Value<String?>? lastError,
      Value<int>? rowid}) {
    return DeliveryCacheMetaCompanion(
      cashierId: cashierId ?? this.cashierId,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      isSyncing: isSyncing ?? this.isSyncing,
      lastError: lastError ?? this.lastError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (isSyncing.present) {
      map['is_syncing'] = Variable<bool>(isSyncing.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryCacheMetaCompanion(')
          ..write('cashierId: $cashierId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('lastError: $lastError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingDeliverySyncTable extends PendingDeliverySync
    with TableInfo<$PendingDeliverySyncTable, PendingDeliverySyncRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingDeliverySyncTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _localDeliveryIdMeta =
      const VerificationMeta('localDeliveryId');
  @override
  late final GeneratedColumn<String> localDeliveryId = GeneratedColumn<String>(
      'local_delivery_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _serverDeliveryIdMeta =
      const VerificationMeta('serverDeliveryId');
  @override
  late final GeneratedColumn<String> serverDeliveryId = GeneratedColumn<String>(
      'server_delivery_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastAttemptAtMeta =
      const VerificationMeta('lastAttemptAt');
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>('last_attempt_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localDeliveryId,
        serverDeliveryId,
        operation,
        payload,
        attempts,
        lastError,
        createdAt,
        lastAttemptAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_delivery_sync';
  @override
  VerificationContext validateIntegrity(
      Insertable<PendingDeliverySyncRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('local_delivery_id')) {
      context.handle(
          _localDeliveryIdMeta,
          localDeliveryId.isAcceptableOrUnknown(
              data['local_delivery_id']!, _localDeliveryIdMeta));
    } else if (isInserting) {
      context.missing(_localDeliveryIdMeta);
    }
    if (data.containsKey('server_delivery_id')) {
      context.handle(
          _serverDeliveryIdMeta,
          serverDeliveryId.isAcceptableOrUnknown(
              data['server_delivery_id']!, _serverDeliveryIdMeta));
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
          _lastAttemptAtMeta,
          lastAttemptAt.isAcceptableOrUnknown(
              data['last_attempt_at']!, _lastAttemptAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingDeliverySyncRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingDeliverySyncRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      localDeliveryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_delivery_id'])!,
      serverDeliveryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}server_delivery_id']),
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_attempt_at']),
    );
  }

  @override
  $PendingDeliverySyncTable createAlias(String alias) {
    return $PendingDeliverySyncTable(attachedDatabase, alias);
  }
}

class PendingDeliverySyncRow extends DataClass
    implements Insertable<PendingDeliverySyncRow> {
  /// Auto-increment ID.
  final int id;

  /// The local delivery ID.
  final String localDeliveryId;

  /// The server delivery ID (null for creates, set for updates/deletes).
  final String? serverDeliveryId;

  /// Operation type: 'create', 'update', or 'delete'.
  final String operation;

  /// The delivery data as JSON for creation/update.
  final String payload;

  /// Number of sync attempts.
  final int attempts;

  /// Last sync error message.
  final String? lastError;

  /// When the sync operation was queued.
  final DateTime createdAt;

  /// When the sync was last attempted.
  final DateTime? lastAttemptAt;
  const PendingDeliverySyncRow(
      {required this.id,
      required this.localDeliveryId,
      this.serverDeliveryId,
      required this.operation,
      required this.payload,
      required this.attempts,
      this.lastError,
      required this.createdAt,
      this.lastAttemptAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['local_delivery_id'] = Variable<String>(localDeliveryId);
    if (!nullToAbsent || serverDeliveryId != null) {
      map['server_delivery_id'] = Variable<String>(serverDeliveryId);
    }
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  PendingDeliverySyncCompanion toCompanion(bool nullToAbsent) {
    return PendingDeliverySyncCompanion(
      id: Value(id),
      localDeliveryId: Value(localDeliveryId),
      serverDeliveryId: serverDeliveryId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverDeliveryId),
      operation: Value(operation),
      payload: Value(payload),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory PendingDeliverySyncRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingDeliverySyncRow(
      id: serializer.fromJson<int>(json['id']),
      localDeliveryId: serializer.fromJson<String>(json['localDeliveryId']),
      serverDeliveryId: serializer.fromJson<String?>(json['serverDeliveryId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'localDeliveryId': serializer.toJson<String>(localDeliveryId),
      'serverDeliveryId': serializer.toJson<String?>(serverDeliveryId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  PendingDeliverySyncRow copyWith(
          {int? id,
          String? localDeliveryId,
          Value<String?> serverDeliveryId = const Value.absent(),
          String? operation,
          String? payload,
          int? attempts,
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> lastAttemptAt = const Value.absent()}) =>
      PendingDeliverySyncRow(
        id: id ?? this.id,
        localDeliveryId: localDeliveryId ?? this.localDeliveryId,
        serverDeliveryId: serverDeliveryId.present
            ? serverDeliveryId.value
            : this.serverDeliveryId,
        operation: operation ?? this.operation,
        payload: payload ?? this.payload,
        attempts: attempts ?? this.attempts,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
        lastAttemptAt:
            lastAttemptAt.present ? lastAttemptAt.value : this.lastAttemptAt,
      );
  PendingDeliverySyncRow copyWithCompanion(PendingDeliverySyncCompanion data) {
    return PendingDeliverySyncRow(
      id: data.id.present ? data.id.value : this.id,
      localDeliveryId: data.localDeliveryId.present
          ? data.localDeliveryId.value
          : this.localDeliveryId,
      serverDeliveryId: data.serverDeliveryId.present
          ? data.serverDeliveryId.value
          : this.serverDeliveryId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingDeliverySyncRow(')
          ..write('id: $id, ')
          ..write('localDeliveryId: $localDeliveryId, ')
          ..write('serverDeliveryId: $serverDeliveryId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localDeliveryId, serverDeliveryId,
      operation, payload, attempts, lastError, createdAt, lastAttemptAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingDeliverySyncRow &&
          other.id == this.id &&
          other.localDeliveryId == this.localDeliveryId &&
          other.serverDeliveryId == this.serverDeliveryId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class PendingDeliverySyncCompanion
    extends UpdateCompanion<PendingDeliverySyncRow> {
  final Value<int> id;
  final Value<String> localDeliveryId;
  final Value<String?> serverDeliveryId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<int> attempts;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastAttemptAt;
  const PendingDeliverySyncCompanion({
    this.id = const Value.absent(),
    this.localDeliveryId = const Value.absent(),
    this.serverDeliveryId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  });
  PendingDeliverySyncCompanion.insert({
    this.id = const Value.absent(),
    required String localDeliveryId,
    this.serverDeliveryId = const Value.absent(),
    required String operation,
    required String payload,
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  })  : localDeliveryId = Value(localDeliveryId),
        operation = Value(operation),
        payload = Value(payload);
  static Insertable<PendingDeliverySyncRow> custom({
    Expression<int>? id,
    Expression<String>? localDeliveryId,
    Expression<String>? serverDeliveryId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<int>? attempts,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastAttemptAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localDeliveryId != null) 'local_delivery_id': localDeliveryId,
      if (serverDeliveryId != null) 'server_delivery_id': serverDeliveryId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
    });
  }

  PendingDeliverySyncCompanion copyWith(
      {Value<int>? id,
      Value<String>? localDeliveryId,
      Value<String?>? serverDeliveryId,
      Value<String>? operation,
      Value<String>? payload,
      Value<int>? attempts,
      Value<String?>? lastError,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastAttemptAt}) {
    return PendingDeliverySyncCompanion(
      id: id ?? this.id,
      localDeliveryId: localDeliveryId ?? this.localDeliveryId,
      serverDeliveryId: serverDeliveryId ?? this.serverDeliveryId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (localDeliveryId.present) {
      map['local_delivery_id'] = Variable<String>(localDeliveryId.value);
    }
    if (serverDeliveryId.present) {
      map['server_delivery_id'] = Variable<String>(serverDeliveryId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingDeliverySyncCompanion(')
          ..write('id: $id, ')
          ..write('localDeliveryId: $localDeliveryId, ')
          ..write('serverDeliveryId: $serverDeliveryId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }
}

class $DeliveryStockAdjustmentsTable extends DeliveryStockAdjustments
    with TableInfo<$DeliveryStockAdjustmentsTable, DeliveryStockAdjustmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeliveryStockAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceTypeMeta =
      const VerificationMeta('priceType');
  @override
  late final GeneratedColumn<String> priceType = GeneratedColumn<String>(
      'price_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sackPriceIdMeta =
      const VerificationMeta('sackPriceId');
  @override
  late final GeneratedColumn<String> sackPriceId = GeneratedColumn<String>(
      'sack_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _perKiloPriceIdMeta =
      const VerificationMeta('perKiloPriceId');
  @override
  late final GeneratedColumn<String> perKiloPriceId = GeneratedColumn<String>(
      'per_kilo_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityChangeMeta =
      const VerificationMeta('quantityChange');
  @override
  late final GeneratedColumn<double> quantityChange = GeneratedColumn<double>(
      'quantity_change', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deliveryIdMeta =
      const VerificationMeta('deliveryId');
  @override
  late final GeneratedColumn<String> deliveryId = GeneratedColumn<String>(
      'delivery_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        priceType,
        sackPriceId,
        perKiloPriceId,
        quantityChange,
        deliveryId,
        isSynced,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'delivery_stock_adjustments';
  @override
  VerificationContext validateIntegrity(
      Insertable<DeliveryStockAdjustmentRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('price_type')) {
      context.handle(_priceTypeMeta,
          priceType.isAcceptableOrUnknown(data['price_type']!, _priceTypeMeta));
    } else if (isInserting) {
      context.missing(_priceTypeMeta);
    }
    if (data.containsKey('sack_price_id')) {
      context.handle(
          _sackPriceIdMeta,
          sackPriceId.isAcceptableOrUnknown(
              data['sack_price_id']!, _sackPriceIdMeta));
    }
    if (data.containsKey('per_kilo_price_id')) {
      context.handle(
          _perKiloPriceIdMeta,
          perKiloPriceId.isAcceptableOrUnknown(
              data['per_kilo_price_id']!, _perKiloPriceIdMeta));
    }
    if (data.containsKey('quantity_change')) {
      context.handle(
          _quantityChangeMeta,
          quantityChange.isAcceptableOrUnknown(
              data['quantity_change']!, _quantityChangeMeta));
    } else if (isInserting) {
      context.missing(_quantityChangeMeta);
    }
    if (data.containsKey('delivery_id')) {
      context.handle(
          _deliveryIdMeta,
          deliveryId.isAcceptableOrUnknown(
              data['delivery_id']!, _deliveryIdMeta));
    } else if (isInserting) {
      context.missing(_deliveryIdMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeliveryStockAdjustmentRow map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeliveryStockAdjustmentRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      priceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price_type'])!,
      sackPriceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sack_price_id']),
      perKiloPriceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}per_kilo_price_id']),
      quantityChange: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_change'])!,
      deliveryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}delivery_id'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DeliveryStockAdjustmentsTable createAlias(String alias) {
    return $DeliveryStockAdjustmentsTable(attachedDatabase, alias);
  }
}

class DeliveryStockAdjustmentRow extends DataClass
    implements Insertable<DeliveryStockAdjustmentRow> {
  /// Auto-increment ID.
  final int id;

  /// Product ID.
  final String productId;

  /// Price type: 'perKilo' or 'sack'.
  final String priceType;

  /// Sack price ID if applicable.
  final String? sackPriceId;

  /// Per kilo price ID if applicable.
  final String? perKiloPriceId;

  /// Quantity change (positive for deliveries, negative for void).
  final double quantityChange;

  /// Related delivery ID.
  final String deliveryId;

  /// Whether this adjustment has been synced.
  final bool isSynced;

  /// When the adjustment was made.
  final DateTime createdAt;
  const DeliveryStockAdjustmentRow(
      {required this.id,
      required this.productId,
      required this.priceType,
      this.sackPriceId,
      this.perKiloPriceId,
      required this.quantityChange,
      required this.deliveryId,
      required this.isSynced,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['price_type'] = Variable<String>(priceType);
    if (!nullToAbsent || sackPriceId != null) {
      map['sack_price_id'] = Variable<String>(sackPriceId);
    }
    if (!nullToAbsent || perKiloPriceId != null) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId);
    }
    map['quantity_change'] = Variable<double>(quantityChange);
    map['delivery_id'] = Variable<String>(deliveryId);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DeliveryStockAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return DeliveryStockAdjustmentsCompanion(
      id: Value(id),
      productId: Value(productId),
      priceType: Value(priceType),
      sackPriceId: sackPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sackPriceId),
      perKiloPriceId: perKiloPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(perKiloPriceId),
      quantityChange: Value(quantityChange),
      deliveryId: Value(deliveryId),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
    );
  }

  factory DeliveryStockAdjustmentRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeliveryStockAdjustmentRow(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      priceType: serializer.fromJson<String>(json['priceType']),
      sackPriceId: serializer.fromJson<String?>(json['sackPriceId']),
      perKiloPriceId: serializer.fromJson<String?>(json['perKiloPriceId']),
      quantityChange: serializer.fromJson<double>(json['quantityChange']),
      deliveryId: serializer.fromJson<String>(json['deliveryId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'priceType': serializer.toJson<String>(priceType),
      'sackPriceId': serializer.toJson<String?>(sackPriceId),
      'perKiloPriceId': serializer.toJson<String?>(perKiloPriceId),
      'quantityChange': serializer.toJson<double>(quantityChange),
      'deliveryId': serializer.toJson<String>(deliveryId),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DeliveryStockAdjustmentRow copyWith(
          {int? id,
          String? productId,
          String? priceType,
          Value<String?> sackPriceId = const Value.absent(),
          Value<String?> perKiloPriceId = const Value.absent(),
          double? quantityChange,
          String? deliveryId,
          bool? isSynced,
          DateTime? createdAt}) =>
      DeliveryStockAdjustmentRow(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        priceType: priceType ?? this.priceType,
        sackPriceId: sackPriceId.present ? sackPriceId.value : this.sackPriceId,
        perKiloPriceId:
            perKiloPriceId.present ? perKiloPriceId.value : this.perKiloPriceId,
        quantityChange: quantityChange ?? this.quantityChange,
        deliveryId: deliveryId ?? this.deliveryId,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
      );
  DeliveryStockAdjustmentRow copyWithCompanion(
      DeliveryStockAdjustmentsCompanion data) {
    return DeliveryStockAdjustmentRow(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      priceType: data.priceType.present ? data.priceType.value : this.priceType,
      sackPriceId:
          data.sackPriceId.present ? data.sackPriceId.value : this.sackPriceId,
      perKiloPriceId: data.perKiloPriceId.present
          ? data.perKiloPriceId.value
          : this.perKiloPriceId,
      quantityChange: data.quantityChange.present
          ? data.quantityChange.value
          : this.quantityChange,
      deliveryId:
          data.deliveryId.present ? data.deliveryId.value : this.deliveryId,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryStockAdjustmentRow(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('priceType: $priceType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('deliveryId: $deliveryId, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, priceType, sackPriceId,
      perKiloPriceId, quantityChange, deliveryId, isSynced, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeliveryStockAdjustmentRow &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.priceType == this.priceType &&
          other.sackPriceId == this.sackPriceId &&
          other.perKiloPriceId == this.perKiloPriceId &&
          other.quantityChange == this.quantityChange &&
          other.deliveryId == this.deliveryId &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt);
}

class DeliveryStockAdjustmentsCompanion
    extends UpdateCompanion<DeliveryStockAdjustmentRow> {
  final Value<int> id;
  final Value<String> productId;
  final Value<String> priceType;
  final Value<String?> sackPriceId;
  final Value<String?> perKiloPriceId;
  final Value<double> quantityChange;
  final Value<String> deliveryId;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  const DeliveryStockAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.priceType = const Value.absent(),
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.deliveryId = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DeliveryStockAdjustmentsCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String priceType,
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    required double quantityChange,
    required String deliveryId,
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : productId = Value(productId),
        priceType = Value(priceType),
        quantityChange = Value(quantityChange),
        deliveryId = Value(deliveryId);
  static Insertable<DeliveryStockAdjustmentRow> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? priceType,
    Expression<String>? sackPriceId,
    Expression<String>? perKiloPriceId,
    Expression<double>? quantityChange,
    Expression<String>? deliveryId,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (priceType != null) 'price_type': priceType,
      if (sackPriceId != null) 'sack_price_id': sackPriceId,
      if (perKiloPriceId != null) 'per_kilo_price_id': perKiloPriceId,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (deliveryId != null) 'delivery_id': deliveryId,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DeliveryStockAdjustmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? productId,
      Value<String>? priceType,
      Value<String?>? sackPriceId,
      Value<String?>? perKiloPriceId,
      Value<double>? quantityChange,
      Value<String>? deliveryId,
      Value<bool>? isSynced,
      Value<DateTime>? createdAt}) {
    return DeliveryStockAdjustmentsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      priceType: priceType ?? this.priceType,
      sackPriceId: sackPriceId ?? this.sackPriceId,
      perKiloPriceId: perKiloPriceId ?? this.perKiloPriceId,
      quantityChange: quantityChange ?? this.quantityChange,
      deliveryId: deliveryId ?? this.deliveryId,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (priceType.present) {
      map['price_type'] = Variable<String>(priceType.value);
    }
    if (sackPriceId.present) {
      map['sack_price_id'] = Variable<String>(sackPriceId.value);
    }
    if (perKiloPriceId.present) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<double>(quantityChange.value);
    }
    if (deliveryId.present) {
      map['delivery_id'] = Variable<String>(deliveryId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeliveryStockAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('priceType: $priceType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('deliveryId: $deliveryId, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CachedTransfersTable extends CachedTransfers
    with TableInfo<$CachedTransfersTable, CachedTransferRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedTransfersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
      'local_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sackTypeMeta =
      const VerificationMeta('sackType');
  @override
  late final GeneratedColumn<String> sackType = GeneratedColumn<String>(
      'sack_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sackPriceIdMeta =
      const VerificationMeta('sackPriceId');
  @override
  late final GeneratedColumn<String> sackPriceId = GeneratedColumn<String>(
      'sack_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _perKiloPriceIdMeta =
      const VerificationMeta('perKiloPriceId');
  @override
  late final GeneratedColumn<String> perKiloPriceId = GeneratedColumn<String>(
      'per_kilo_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localId,
        cashierId,
        productId,
        type,
        quantity,
        sackType,
        sackPriceId,
        perKiloPriceId,
        data,
        isSynced,
        isDeleted,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_transfers';
  @override
  VerificationContext validateIntegrity(Insertable<CachedTransferRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('sack_type')) {
      context.handle(_sackTypeMeta,
          sackType.isAcceptableOrUnknown(data['sack_type']!, _sackTypeMeta));
    }
    if (data.containsKey('sack_price_id')) {
      context.handle(
          _sackPriceIdMeta,
          sackPriceId.isAcceptableOrUnknown(
              data['sack_price_id']!, _sackPriceIdMeta));
    }
    if (data.containsKey('per_kilo_price_id')) {
      context.handle(
          _perKiloPriceIdMeta,
          perKiloPriceId.isAcceptableOrUnknown(
              data['per_kilo_price_id']!, _perKiloPriceIdMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedTransferRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedTransferRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_id']),
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      sackType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sack_type']),
      sackPriceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sack_price_id']),
      perKiloPriceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}per_kilo_price_id']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CachedTransfersTable createAlias(String alias) {
    return $CachedTransfersTable(attachedDatabase, alias);
  }
}

class CachedTransferRow extends DataClass
    implements Insertable<CachedTransferRow> {
  /// Transfer ID from the server (or local UUID if not synced).
  final String id;

  /// Local UUID for tracking before server sync.
  final String? localId;

  /// Cashier ID who made this transfer.
  final String cashierId;

  /// Product ID that was transferred.
  final String productId;

  /// Transfer type (KAHON, BUTAS, SALES_MAID, MANUAL_ADJUST).
  final String type;

  /// Quantity transferred.
  final double quantity;

  /// Sack type if applicable (FIFTY_KG, TWENTY_FIVE_KG, FIVE_KG).
  final String? sackType;

  /// Sack price ID if applicable.
  final String? sackPriceId;

  /// Per kilo price ID if applicable.
  final String? perKiloPriceId;

  /// Complete transfer data as JSON (includes product info, etc.).
  final String data;

  /// Whether this transfer has been synced to the server.
  final bool isSynced;

  /// Whether this transfer is marked for deletion.
  final bool isDeleted;

  /// When the transfer was created.
  final DateTime createdAt;

  /// When the transfer was last updated.
  final DateTime updatedAt;
  const CachedTransferRow(
      {required this.id,
      this.localId,
      required this.cashierId,
      required this.productId,
      required this.type,
      required this.quantity,
      this.sackType,
      this.sackPriceId,
      this.perKiloPriceId,
      required this.data,
      required this.isSynced,
      required this.isDeleted,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<String>(localId);
    }
    map['cashier_id'] = Variable<String>(cashierId);
    map['product_id'] = Variable<String>(productId);
    map['type'] = Variable<String>(type);
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || sackType != null) {
      map['sack_type'] = Variable<String>(sackType);
    }
    if (!nullToAbsent || sackPriceId != null) {
      map['sack_price_id'] = Variable<String>(sackPriceId);
    }
    if (!nullToAbsent || perKiloPriceId != null) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId);
    }
    map['data'] = Variable<String>(data);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedTransfersCompanion toCompanion(bool nullToAbsent) {
    return CachedTransfersCompanion(
      id: Value(id),
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      cashierId: Value(cashierId),
      productId: Value(productId),
      type: Value(type),
      quantity: Value(quantity),
      sackType: sackType == null && nullToAbsent
          ? const Value.absent()
          : Value(sackType),
      sackPriceId: sackPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sackPriceId),
      perKiloPriceId: perKiloPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(perKiloPriceId),
      data: Value(data),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedTransferRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedTransferRow(
      id: serializer.fromJson<String>(json['id']),
      localId: serializer.fromJson<String?>(json['localId']),
      cashierId: serializer.fromJson<String>(json['cashierId']),
      productId: serializer.fromJson<String>(json['productId']),
      type: serializer.fromJson<String>(json['type']),
      quantity: serializer.fromJson<double>(json['quantity']),
      sackType: serializer.fromJson<String?>(json['sackType']),
      sackPriceId: serializer.fromJson<String?>(json['sackPriceId']),
      perKiloPriceId: serializer.fromJson<String?>(json['perKiloPriceId']),
      data: serializer.fromJson<String>(json['data']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'localId': serializer.toJson<String?>(localId),
      'cashierId': serializer.toJson<String>(cashierId),
      'productId': serializer.toJson<String>(productId),
      'type': serializer.toJson<String>(type),
      'quantity': serializer.toJson<double>(quantity),
      'sackType': serializer.toJson<String?>(sackType),
      'sackPriceId': serializer.toJson<String?>(sackPriceId),
      'perKiloPriceId': serializer.toJson<String?>(perKiloPriceId),
      'data': serializer.toJson<String>(data),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedTransferRow copyWith(
          {String? id,
          Value<String?> localId = const Value.absent(),
          String? cashierId,
          String? productId,
          String? type,
          double? quantity,
          Value<String?> sackType = const Value.absent(),
          Value<String?> sackPriceId = const Value.absent(),
          Value<String?> perKiloPriceId = const Value.absent(),
          String? data,
          bool? isSynced,
          bool? isDeleted,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CachedTransferRow(
        id: id ?? this.id,
        localId: localId.present ? localId.value : this.localId,
        cashierId: cashierId ?? this.cashierId,
        productId: productId ?? this.productId,
        type: type ?? this.type,
        quantity: quantity ?? this.quantity,
        sackType: sackType.present ? sackType.value : this.sackType,
        sackPriceId: sackPriceId.present ? sackPriceId.value : this.sackPriceId,
        perKiloPriceId:
            perKiloPriceId.present ? perKiloPriceId.value : this.perKiloPriceId,
        data: data ?? this.data,
        isSynced: isSynced ?? this.isSynced,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CachedTransferRow copyWithCompanion(CachedTransfersCompanion data) {
    return CachedTransferRow(
      id: data.id.present ? data.id.value : this.id,
      localId: data.localId.present ? data.localId.value : this.localId,
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      productId: data.productId.present ? data.productId.value : this.productId,
      type: data.type.present ? data.type.value : this.type,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      sackType: data.sackType.present ? data.sackType.value : this.sackType,
      sackPriceId:
          data.sackPriceId.present ? data.sackPriceId.value : this.sackPriceId,
      perKiloPriceId: data.perKiloPriceId.present
          ? data.perKiloPriceId.value
          : this.perKiloPriceId,
      data: data.data.present ? data.data.value : this.data,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedTransferRow(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('productId: $productId, ')
          ..write('type: $type, ')
          ..write('quantity: $quantity, ')
          ..write('sackType: $sackType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      localId,
      cashierId,
      productId,
      type,
      quantity,
      sackType,
      sackPriceId,
      perKiloPriceId,
      data,
      isSynced,
      isDeleted,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedTransferRow &&
          other.id == this.id &&
          other.localId == this.localId &&
          other.cashierId == this.cashierId &&
          other.productId == this.productId &&
          other.type == this.type &&
          other.quantity == this.quantity &&
          other.sackType == this.sackType &&
          other.sackPriceId == this.sackPriceId &&
          other.perKiloPriceId == this.perKiloPriceId &&
          other.data == this.data &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CachedTransfersCompanion extends UpdateCompanion<CachedTransferRow> {
  final Value<String> id;
  final Value<String?> localId;
  final Value<String> cashierId;
  final Value<String> productId;
  final Value<String> type;
  final Value<double> quantity;
  final Value<String?> sackType;
  final Value<String?> sackPriceId;
  final Value<String?> perKiloPriceId;
  final Value<String> data;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedTransfersCompanion({
    this.id = const Value.absent(),
    this.localId = const Value.absent(),
    this.cashierId = const Value.absent(),
    this.productId = const Value.absent(),
    this.type = const Value.absent(),
    this.quantity = const Value.absent(),
    this.sackType = const Value.absent(),
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    this.data = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedTransfersCompanion.insert({
    required String id,
    this.localId = const Value.absent(),
    required String cashierId,
    required String productId,
    required String type,
    required double quantity,
    this.sackType = const Value.absent(),
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    required String data,
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cashierId = Value(cashierId),
        productId = Value(productId),
        type = Value(type),
        quantity = Value(quantity),
        data = Value(data);
  static Insertable<CachedTransferRow> custom({
    Expression<String>? id,
    Expression<String>? localId,
    Expression<String>? cashierId,
    Expression<String>? productId,
    Expression<String>? type,
    Expression<double>? quantity,
    Expression<String>? sackType,
    Expression<String>? sackPriceId,
    Expression<String>? perKiloPriceId,
    Expression<String>? data,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localId != null) 'local_id': localId,
      if (cashierId != null) 'cashier_id': cashierId,
      if (productId != null) 'product_id': productId,
      if (type != null) 'type': type,
      if (quantity != null) 'quantity': quantity,
      if (sackType != null) 'sack_type': sackType,
      if (sackPriceId != null) 'sack_price_id': sackPriceId,
      if (perKiloPriceId != null) 'per_kilo_price_id': perKiloPriceId,
      if (data != null) 'data': data,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedTransfersCompanion copyWith(
      {Value<String>? id,
      Value<String?>? localId,
      Value<String>? cashierId,
      Value<String>? productId,
      Value<String>? type,
      Value<double>? quantity,
      Value<String?>? sackType,
      Value<String?>? sackPriceId,
      Value<String?>? perKiloPriceId,
      Value<String>? data,
      Value<bool>? isSynced,
      Value<bool>? isDeleted,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CachedTransfersCompanion(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      cashierId: cashierId ?? this.cashierId,
      productId: productId ?? this.productId,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      sackType: sackType ?? this.sackType,
      sackPriceId: sackPriceId ?? this.sackPriceId,
      perKiloPriceId: perKiloPriceId ?? this.perKiloPriceId,
      data: data ?? this.data,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (sackType.present) {
      map['sack_type'] = Variable<String>(sackType.value);
    }
    if (sackPriceId.present) {
      map['sack_price_id'] = Variable<String>(sackPriceId.value);
    }
    if (perKiloPriceId.present) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedTransfersCompanion(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('productId: $productId, ')
          ..write('type: $type, ')
          ..write('quantity: $quantity, ')
          ..write('sackType: $sackType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransferCacheMetaTable extends TransferCacheMeta
    with TableInfo<$TransferCacheMetaTable, TransferCacheMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransferCacheMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSyncingMeta =
      const VerificationMeta('isSyncing');
  @override
  late final GeneratedColumn<bool> isSyncing = GeneratedColumn<bool>(
      'is_syncing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_syncing" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [cashierId, lastSyncedAt, isSyncing, lastError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transfer_cache_meta';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransferCacheMetaRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    if (data.containsKey('is_syncing')) {
      context.handle(_isSyncingMeta,
          isSyncing.isAcceptableOrUnknown(data['is_syncing']!, _isSyncingMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cashierId};
  @override
  TransferCacheMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransferCacheMetaRow(
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at'])!,
      isSyncing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_syncing'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $TransferCacheMetaTable createAlias(String alias) {
    return $TransferCacheMetaTable(attachedDatabase, alias);
  }
}

class TransferCacheMetaRow extends DataClass
    implements Insertable<TransferCacheMetaRow> {
  /// Cashier ID whose transfers are cached.
  final String cashierId;

  /// When the transfers were last synced from server.
  final DateTime lastSyncedAt;

  /// Whether a sync is currently in progress.
  final bool isSyncing;

  /// Last sync error message, if any.
  final String? lastError;
  const TransferCacheMetaRow(
      {required this.cashierId,
      required this.lastSyncedAt,
      required this.isSyncing,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cashier_id'] = Variable<String>(cashierId);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    map['is_syncing'] = Variable<bool>(isSyncing);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  TransferCacheMetaCompanion toCompanion(bool nullToAbsent) {
    return TransferCacheMetaCompanion(
      cashierId: Value(cashierId),
      lastSyncedAt: Value(lastSyncedAt),
      isSyncing: Value(isSyncing),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory TransferCacheMetaRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransferCacheMetaRow(
      cashierId: serializer.fromJson<String>(json['cashierId']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
      isSyncing: serializer.fromJson<bool>(json['isSyncing']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cashierId': serializer.toJson<String>(cashierId),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
      'isSyncing': serializer.toJson<bool>(isSyncing),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  TransferCacheMetaRow copyWith(
          {String? cashierId,
          DateTime? lastSyncedAt,
          bool? isSyncing,
          Value<String?> lastError = const Value.absent()}) =>
      TransferCacheMetaRow(
        cashierId: cashierId ?? this.cashierId,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
        isSyncing: isSyncing ?? this.isSyncing,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  TransferCacheMetaRow copyWithCompanion(TransferCacheMetaCompanion data) {
    return TransferCacheMetaRow(
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      isSyncing: data.isSyncing.present ? data.isSyncing.value : this.isSyncing,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransferCacheMetaRow(')
          ..write('cashierId: $cashierId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cashierId, lastSyncedAt, isSyncing, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransferCacheMetaRow &&
          other.cashierId == this.cashierId &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.isSyncing == this.isSyncing &&
          other.lastError == this.lastError);
}

class TransferCacheMetaCompanion extends UpdateCompanion<TransferCacheMetaRow> {
  final Value<String> cashierId;
  final Value<DateTime> lastSyncedAt;
  final Value<bool> isSyncing;
  final Value<String?> lastError;
  final Value<int> rowid;
  const TransferCacheMetaCompanion({
    this.cashierId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isSyncing = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransferCacheMetaCompanion.insert({
    required String cashierId,
    required DateTime lastSyncedAt,
    this.isSyncing = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : cashierId = Value(cashierId),
        lastSyncedAt = Value(lastSyncedAt);
  static Insertable<TransferCacheMetaRow> custom({
    Expression<String>? cashierId,
    Expression<DateTime>? lastSyncedAt,
    Expression<bool>? isSyncing,
    Expression<String>? lastError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cashierId != null) 'cashier_id': cashierId,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (isSyncing != null) 'is_syncing': isSyncing,
      if (lastError != null) 'last_error': lastError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransferCacheMetaCompanion copyWith(
      {Value<String>? cashierId,
      Value<DateTime>? lastSyncedAt,
      Value<bool>? isSyncing,
      Value<String?>? lastError,
      Value<int>? rowid}) {
    return TransferCacheMetaCompanion(
      cashierId: cashierId ?? this.cashierId,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      isSyncing: isSyncing ?? this.isSyncing,
      lastError: lastError ?? this.lastError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (isSyncing.present) {
      map['is_syncing'] = Variable<bool>(isSyncing.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransferCacheMetaCompanion(')
          ..write('cashierId: $cashierId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('lastError: $lastError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingTransferSyncTable extends PendingTransferSync
    with TableInfo<$PendingTransferSyncTable, PendingTransferSyncRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingTransferSyncTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _localTransferIdMeta =
      const VerificationMeta('localTransferId');
  @override
  late final GeneratedColumn<String> localTransferId = GeneratedColumn<String>(
      'local_transfer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _serverTransferIdMeta =
      const VerificationMeta('serverTransferId');
  @override
  late final GeneratedColumn<String> serverTransferId = GeneratedColumn<String>(
      'server_transfer_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastAttemptAtMeta =
      const VerificationMeta('lastAttemptAt');
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>('last_attempt_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localTransferId,
        serverTransferId,
        operation,
        payload,
        attempts,
        lastError,
        createdAt,
        lastAttemptAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_transfer_sync';
  @override
  VerificationContext validateIntegrity(
      Insertable<PendingTransferSyncRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('local_transfer_id')) {
      context.handle(
          _localTransferIdMeta,
          localTransferId.isAcceptableOrUnknown(
              data['local_transfer_id']!, _localTransferIdMeta));
    } else if (isInserting) {
      context.missing(_localTransferIdMeta);
    }
    if (data.containsKey('server_transfer_id')) {
      context.handle(
          _serverTransferIdMeta,
          serverTransferId.isAcceptableOrUnknown(
              data['server_transfer_id']!, _serverTransferIdMeta));
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
          _lastAttemptAtMeta,
          lastAttemptAt.isAcceptableOrUnknown(
              data['last_attempt_at']!, _lastAttemptAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingTransferSyncRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingTransferSyncRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      localTransferId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_transfer_id'])!,
      serverTransferId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}server_transfer_id']),
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_attempt_at']),
    );
  }

  @override
  $PendingTransferSyncTable createAlias(String alias) {
    return $PendingTransferSyncTable(attachedDatabase, alias);
  }
}

class PendingTransferSyncRow extends DataClass
    implements Insertable<PendingTransferSyncRow> {
  /// Auto-increment ID.
  final int id;

  /// The local transfer ID.
  final String localTransferId;

  /// The server transfer ID (null for creates, set for updates/deletes).
  final String? serverTransferId;

  /// Operation type: 'create', 'update', or 'delete'.
  final String operation;

  /// The transfer data as JSON for creation/update.
  final String payload;

  /// Number of sync attempts.
  final int attempts;

  /// Last sync error message.
  final String? lastError;

  /// When the sync operation was queued.
  final DateTime createdAt;

  /// When the sync was last attempted.
  final DateTime? lastAttemptAt;
  const PendingTransferSyncRow(
      {required this.id,
      required this.localTransferId,
      this.serverTransferId,
      required this.operation,
      required this.payload,
      required this.attempts,
      this.lastError,
      required this.createdAt,
      this.lastAttemptAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['local_transfer_id'] = Variable<String>(localTransferId);
    if (!nullToAbsent || serverTransferId != null) {
      map['server_transfer_id'] = Variable<String>(serverTransferId);
    }
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  PendingTransferSyncCompanion toCompanion(bool nullToAbsent) {
    return PendingTransferSyncCompanion(
      id: Value(id),
      localTransferId: Value(localTransferId),
      serverTransferId: serverTransferId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverTransferId),
      operation: Value(operation),
      payload: Value(payload),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory PendingTransferSyncRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingTransferSyncRow(
      id: serializer.fromJson<int>(json['id']),
      localTransferId: serializer.fromJson<String>(json['localTransferId']),
      serverTransferId: serializer.fromJson<String?>(json['serverTransferId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'localTransferId': serializer.toJson<String>(localTransferId),
      'serverTransferId': serializer.toJson<String?>(serverTransferId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  PendingTransferSyncRow copyWith(
          {int? id,
          String? localTransferId,
          Value<String?> serverTransferId = const Value.absent(),
          String? operation,
          String? payload,
          int? attempts,
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> lastAttemptAt = const Value.absent()}) =>
      PendingTransferSyncRow(
        id: id ?? this.id,
        localTransferId: localTransferId ?? this.localTransferId,
        serverTransferId: serverTransferId.present
            ? serverTransferId.value
            : this.serverTransferId,
        operation: operation ?? this.operation,
        payload: payload ?? this.payload,
        attempts: attempts ?? this.attempts,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
        lastAttemptAt:
            lastAttemptAt.present ? lastAttemptAt.value : this.lastAttemptAt,
      );
  PendingTransferSyncRow copyWithCompanion(PendingTransferSyncCompanion data) {
    return PendingTransferSyncRow(
      id: data.id.present ? data.id.value : this.id,
      localTransferId: data.localTransferId.present
          ? data.localTransferId.value
          : this.localTransferId,
      serverTransferId: data.serverTransferId.present
          ? data.serverTransferId.value
          : this.serverTransferId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingTransferSyncRow(')
          ..write('id: $id, ')
          ..write('localTransferId: $localTransferId, ')
          ..write('serverTransferId: $serverTransferId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localTransferId, serverTransferId,
      operation, payload, attempts, lastError, createdAt, lastAttemptAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingTransferSyncRow &&
          other.id == this.id &&
          other.localTransferId == this.localTransferId &&
          other.serverTransferId == this.serverTransferId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class PendingTransferSyncCompanion
    extends UpdateCompanion<PendingTransferSyncRow> {
  final Value<int> id;
  final Value<String> localTransferId;
  final Value<String?> serverTransferId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<int> attempts;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastAttemptAt;
  const PendingTransferSyncCompanion({
    this.id = const Value.absent(),
    this.localTransferId = const Value.absent(),
    this.serverTransferId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  });
  PendingTransferSyncCompanion.insert({
    this.id = const Value.absent(),
    required String localTransferId,
    this.serverTransferId = const Value.absent(),
    required String operation,
    required String payload,
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  })  : localTransferId = Value(localTransferId),
        operation = Value(operation),
        payload = Value(payload);
  static Insertable<PendingTransferSyncRow> custom({
    Expression<int>? id,
    Expression<String>? localTransferId,
    Expression<String>? serverTransferId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<int>? attempts,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastAttemptAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localTransferId != null) 'local_transfer_id': localTransferId,
      if (serverTransferId != null) 'server_transfer_id': serverTransferId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
    });
  }

  PendingTransferSyncCompanion copyWith(
      {Value<int>? id,
      Value<String>? localTransferId,
      Value<String?>? serverTransferId,
      Value<String>? operation,
      Value<String>? payload,
      Value<int>? attempts,
      Value<String?>? lastError,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastAttemptAt}) {
    return PendingTransferSyncCompanion(
      id: id ?? this.id,
      localTransferId: localTransferId ?? this.localTransferId,
      serverTransferId: serverTransferId ?? this.serverTransferId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (localTransferId.present) {
      map['local_transfer_id'] = Variable<String>(localTransferId.value);
    }
    if (serverTransferId.present) {
      map['server_transfer_id'] = Variable<String>(serverTransferId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingTransferSyncCompanion(')
          ..write('id: $id, ')
          ..write('localTransferId: $localTransferId, ')
          ..write('serverTransferId: $serverTransferId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }
}

class $TransferStockAdjustmentsTable extends TransferStockAdjustments
    with TableInfo<$TransferStockAdjustmentsTable, TransferStockAdjustmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransferStockAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceTypeMeta =
      const VerificationMeta('priceType');
  @override
  late final GeneratedColumn<String> priceType = GeneratedColumn<String>(
      'price_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sackPriceIdMeta =
      const VerificationMeta('sackPriceId');
  @override
  late final GeneratedColumn<String> sackPriceId = GeneratedColumn<String>(
      'sack_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _perKiloPriceIdMeta =
      const VerificationMeta('perKiloPriceId');
  @override
  late final GeneratedColumn<String> perKiloPriceId = GeneratedColumn<String>(
      'per_kilo_price_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityChangeMeta =
      const VerificationMeta('quantityChange');
  @override
  late final GeneratedColumn<double> quantityChange = GeneratedColumn<double>(
      'quantity_change', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _transferIdMeta =
      const VerificationMeta('transferId');
  @override
  late final GeneratedColumn<String> transferId = GeneratedColumn<String>(
      'transfer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        priceType,
        sackPriceId,
        perKiloPriceId,
        quantityChange,
        transferId,
        isSynced,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transfer_stock_adjustments';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransferStockAdjustmentRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('price_type')) {
      context.handle(_priceTypeMeta,
          priceType.isAcceptableOrUnknown(data['price_type']!, _priceTypeMeta));
    } else if (isInserting) {
      context.missing(_priceTypeMeta);
    }
    if (data.containsKey('sack_price_id')) {
      context.handle(
          _sackPriceIdMeta,
          sackPriceId.isAcceptableOrUnknown(
              data['sack_price_id']!, _sackPriceIdMeta));
    }
    if (data.containsKey('per_kilo_price_id')) {
      context.handle(
          _perKiloPriceIdMeta,
          perKiloPriceId.isAcceptableOrUnknown(
              data['per_kilo_price_id']!, _perKiloPriceIdMeta));
    }
    if (data.containsKey('quantity_change')) {
      context.handle(
          _quantityChangeMeta,
          quantityChange.isAcceptableOrUnknown(
              data['quantity_change']!, _quantityChangeMeta));
    } else if (isInserting) {
      context.missing(_quantityChangeMeta);
    }
    if (data.containsKey('transfer_id')) {
      context.handle(
          _transferIdMeta,
          transferId.isAcceptableOrUnknown(
              data['transfer_id']!, _transferIdMeta));
    } else if (isInserting) {
      context.missing(_transferIdMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransferStockAdjustmentRow map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransferStockAdjustmentRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      priceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price_type'])!,
      sackPriceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sack_price_id']),
      perKiloPriceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}per_kilo_price_id']),
      quantityChange: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_change'])!,
      transferId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transfer_id'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransferStockAdjustmentsTable createAlias(String alias) {
    return $TransferStockAdjustmentsTable(attachedDatabase, alias);
  }
}

class TransferStockAdjustmentRow extends DataClass
    implements Insertable<TransferStockAdjustmentRow> {
  /// Auto-increment ID.
  final int id;

  /// Product ID.
  final String productId;

  /// Price type: 'perKilo' or 'sack'.
  final String priceType;

  /// Sack price ID if applicable.
  final String? sackPriceId;

  /// Per kilo price ID if applicable.
  final String? perKiloPriceId;

  /// Quantity change (negative for transfers, positive for void).
  final double quantityChange;

  /// Related transfer ID.
  final String transferId;

  /// Whether this adjustment has been synced.
  final bool isSynced;

  /// When the adjustment was made.
  final DateTime createdAt;
  const TransferStockAdjustmentRow(
      {required this.id,
      required this.productId,
      required this.priceType,
      this.sackPriceId,
      this.perKiloPriceId,
      required this.quantityChange,
      required this.transferId,
      required this.isSynced,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['price_type'] = Variable<String>(priceType);
    if (!nullToAbsent || sackPriceId != null) {
      map['sack_price_id'] = Variable<String>(sackPriceId);
    }
    if (!nullToAbsent || perKiloPriceId != null) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId);
    }
    map['quantity_change'] = Variable<double>(quantityChange);
    map['transfer_id'] = Variable<String>(transferId);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransferStockAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return TransferStockAdjustmentsCompanion(
      id: Value(id),
      productId: Value(productId),
      priceType: Value(priceType),
      sackPriceId: sackPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sackPriceId),
      perKiloPriceId: perKiloPriceId == null && nullToAbsent
          ? const Value.absent()
          : Value(perKiloPriceId),
      quantityChange: Value(quantityChange),
      transferId: Value(transferId),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
    );
  }

  factory TransferStockAdjustmentRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransferStockAdjustmentRow(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      priceType: serializer.fromJson<String>(json['priceType']),
      sackPriceId: serializer.fromJson<String?>(json['sackPriceId']),
      perKiloPriceId: serializer.fromJson<String?>(json['perKiloPriceId']),
      quantityChange: serializer.fromJson<double>(json['quantityChange']),
      transferId: serializer.fromJson<String>(json['transferId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'priceType': serializer.toJson<String>(priceType),
      'sackPriceId': serializer.toJson<String?>(sackPriceId),
      'perKiloPriceId': serializer.toJson<String?>(perKiloPriceId),
      'quantityChange': serializer.toJson<double>(quantityChange),
      'transferId': serializer.toJson<String>(transferId),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransferStockAdjustmentRow copyWith(
          {int? id,
          String? productId,
          String? priceType,
          Value<String?> sackPriceId = const Value.absent(),
          Value<String?> perKiloPriceId = const Value.absent(),
          double? quantityChange,
          String? transferId,
          bool? isSynced,
          DateTime? createdAt}) =>
      TransferStockAdjustmentRow(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        priceType: priceType ?? this.priceType,
        sackPriceId: sackPriceId.present ? sackPriceId.value : this.sackPriceId,
        perKiloPriceId:
            perKiloPriceId.present ? perKiloPriceId.value : this.perKiloPriceId,
        quantityChange: quantityChange ?? this.quantityChange,
        transferId: transferId ?? this.transferId,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
      );
  TransferStockAdjustmentRow copyWithCompanion(
      TransferStockAdjustmentsCompanion data) {
    return TransferStockAdjustmentRow(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      priceType: data.priceType.present ? data.priceType.value : this.priceType,
      sackPriceId:
          data.sackPriceId.present ? data.sackPriceId.value : this.sackPriceId,
      perKiloPriceId: data.perKiloPriceId.present
          ? data.perKiloPriceId.value
          : this.perKiloPriceId,
      quantityChange: data.quantityChange.present
          ? data.quantityChange.value
          : this.quantityChange,
      transferId:
          data.transferId.present ? data.transferId.value : this.transferId,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransferStockAdjustmentRow(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('priceType: $priceType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('transferId: $transferId, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, priceType, sackPriceId,
      perKiloPriceId, quantityChange, transferId, isSynced, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransferStockAdjustmentRow &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.priceType == this.priceType &&
          other.sackPriceId == this.sackPriceId &&
          other.perKiloPriceId == this.perKiloPriceId &&
          other.quantityChange == this.quantityChange &&
          other.transferId == this.transferId &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt);
}

class TransferStockAdjustmentsCompanion
    extends UpdateCompanion<TransferStockAdjustmentRow> {
  final Value<int> id;
  final Value<String> productId;
  final Value<String> priceType;
  final Value<String?> sackPriceId;
  final Value<String?> perKiloPriceId;
  final Value<double> quantityChange;
  final Value<String> transferId;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  const TransferStockAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.priceType = const Value.absent(),
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.transferId = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransferStockAdjustmentsCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String priceType,
    this.sackPriceId = const Value.absent(),
    this.perKiloPriceId = const Value.absent(),
    required double quantityChange,
    required String transferId,
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : productId = Value(productId),
        priceType = Value(priceType),
        quantityChange = Value(quantityChange),
        transferId = Value(transferId);
  static Insertable<TransferStockAdjustmentRow> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? priceType,
    Expression<String>? sackPriceId,
    Expression<String>? perKiloPriceId,
    Expression<double>? quantityChange,
    Expression<String>? transferId,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (priceType != null) 'price_type': priceType,
      if (sackPriceId != null) 'sack_price_id': sackPriceId,
      if (perKiloPriceId != null) 'per_kilo_price_id': perKiloPriceId,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (transferId != null) 'transfer_id': transferId,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransferStockAdjustmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? productId,
      Value<String>? priceType,
      Value<String?>? sackPriceId,
      Value<String?>? perKiloPriceId,
      Value<double>? quantityChange,
      Value<String>? transferId,
      Value<bool>? isSynced,
      Value<DateTime>? createdAt}) {
    return TransferStockAdjustmentsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      priceType: priceType ?? this.priceType,
      sackPriceId: sackPriceId ?? this.sackPriceId,
      perKiloPriceId: perKiloPriceId ?? this.perKiloPriceId,
      quantityChange: quantityChange ?? this.quantityChange,
      transferId: transferId ?? this.transferId,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (priceType.present) {
      map['price_type'] = Variable<String>(priceType.value);
    }
    if (sackPriceId.present) {
      map['sack_price_id'] = Variable<String>(sackPriceId.value);
    }
    if (perKiloPriceId.present) {
      map['per_kilo_price_id'] = Variable<String>(perKiloPriceId.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<double>(quantityChange.value);
    }
    if (transferId.present) {
      map['transfer_id'] = Variable<String>(transferId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransferStockAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('priceType: $priceType, ')
          ..write('sackPriceId: $sackPriceId, ')
          ..write('perKiloPriceId: $perKiloPriceId, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('transferId: $transferId, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CachedBillCountsTable extends CachedBillCounts
    with TableInfo<$CachedBillCountsTable, CachedBillCountRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedBillCountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
      'local_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cashierIdMeta =
      const VerificationMeta('cashierId');
  @override
  late final GeneratedColumn<String> cashierId = GeneratedColumn<String>(
      'cashier_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cashierUsernameMeta =
      const VerificationMeta('cashierUsername');
  @override
  late final GeneratedColumn<String> cashierUsername = GeneratedColumn<String>(
      'cashier_username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cashierBranchNameMeta =
      const VerificationMeta('cashierBranchName');
  @override
  late final GeneratedColumn<String> cashierBranchName =
      GeneratedColumn<String>('cashier_branch_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _beginningBalanceMeta =
      const VerificationMeta('beginningBalance');
  @override
  late final GeneratedColumn<double> beginningBalance = GeneratedColumn<double>(
      'beginning_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _showBeginningBalanceMeta =
      const VerificationMeta('showBeginningBalance');
  @override
  late final GeneratedColumn<bool> showBeginningBalance = GeneratedColumn<bool>(
      'show_beginning_balance', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_beginning_balance" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localId,
        cashierId,
        cashierUsername,
        cashierBranchName,
        beginningBalance,
        showBeginningBalance,
        date,
        data,
        isSynced,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_bill_counts';
  @override
  VerificationContext validateIntegrity(Insertable<CachedBillCountRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('cashier_id')) {
      context.handle(_cashierIdMeta,
          cashierId.isAcceptableOrUnknown(data['cashier_id']!, _cashierIdMeta));
    } else if (isInserting) {
      context.missing(_cashierIdMeta);
    }
    if (data.containsKey('cashier_username')) {
      context.handle(
          _cashierUsernameMeta,
          cashierUsername.isAcceptableOrUnknown(
              data['cashier_username']!, _cashierUsernameMeta));
    } else if (isInserting) {
      context.missing(_cashierUsernameMeta);
    }
    if (data.containsKey('cashier_branch_name')) {
      context.handle(
          _cashierBranchNameMeta,
          cashierBranchName.isAcceptableOrUnknown(
              data['cashier_branch_name']!, _cashierBranchNameMeta));
    } else if (isInserting) {
      context.missing(_cashierBranchNameMeta);
    }
    if (data.containsKey('beginning_balance')) {
      context.handle(
          _beginningBalanceMeta,
          beginningBalance.isAcceptableOrUnknown(
              data['beginning_balance']!, _beginningBalanceMeta));
    }
    if (data.containsKey('show_beginning_balance')) {
      context.handle(
          _showBeginningBalanceMeta,
          showBeginningBalance.isAcceptableOrUnknown(
              data['show_beginning_balance']!, _showBeginningBalanceMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedBillCountRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedBillCountRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_id']),
      cashierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_id'])!,
      cashierUsername: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cashier_username'])!,
      cashierBranchName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cashier_branch_name'])!,
      beginningBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}beginning_balance'])!,
      showBeginningBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}show_beginning_balance'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CachedBillCountsTable createAlias(String alias) {
    return $CachedBillCountsTable(attachedDatabase, alias);
  }
}

class CachedBillCountRow extends DataClass
    implements Insertable<CachedBillCountRow> {
  /// Bill count ID from the server (or local UUID if not synced).
  final String id;

  /// Local UUID for tracking before server sync.
  final String? localId;

  /// Cashier ID who created the bill count.
  final String cashierId;

  /// Username of the cashier.
  final String cashierUsername;

  /// Branch name of the cashier.
  final String cashierBranchName;

  /// Beginning balance amount.
  final double beginningBalance;

  /// Whether to show beginning balance.
  final bool showBeginningBalance;

  /// The date this bill count is for (stored as start of day in UTC).
  final DateTime date;

  /// Complete bill count data as JSON (includes bills, calculated fields, etc.).
  final String data;

  /// Whether this bill count has been synced to the server.
  final bool isSynced;

  /// When the bill count was created.
  final DateTime createdAt;

  /// When the bill count was last updated.
  final DateTime updatedAt;
  const CachedBillCountRow(
      {required this.id,
      this.localId,
      required this.cashierId,
      required this.cashierUsername,
      required this.cashierBranchName,
      required this.beginningBalance,
      required this.showBeginningBalance,
      required this.date,
      required this.data,
      required this.isSynced,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<String>(localId);
    }
    map['cashier_id'] = Variable<String>(cashierId);
    map['cashier_username'] = Variable<String>(cashierUsername);
    map['cashier_branch_name'] = Variable<String>(cashierBranchName);
    map['beginning_balance'] = Variable<double>(beginningBalance);
    map['show_beginning_balance'] = Variable<bool>(showBeginningBalance);
    map['date'] = Variable<DateTime>(date);
    map['data'] = Variable<String>(data);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedBillCountsCompanion toCompanion(bool nullToAbsent) {
    return CachedBillCountsCompanion(
      id: Value(id),
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      cashierId: Value(cashierId),
      cashierUsername: Value(cashierUsername),
      cashierBranchName: Value(cashierBranchName),
      beginningBalance: Value(beginningBalance),
      showBeginningBalance: Value(showBeginningBalance),
      date: Value(date),
      data: Value(data),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedBillCountRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedBillCountRow(
      id: serializer.fromJson<String>(json['id']),
      localId: serializer.fromJson<String?>(json['localId']),
      cashierId: serializer.fromJson<String>(json['cashierId']),
      cashierUsername: serializer.fromJson<String>(json['cashierUsername']),
      cashierBranchName: serializer.fromJson<String>(json['cashierBranchName']),
      beginningBalance: serializer.fromJson<double>(json['beginningBalance']),
      showBeginningBalance:
          serializer.fromJson<bool>(json['showBeginningBalance']),
      date: serializer.fromJson<DateTime>(json['date']),
      data: serializer.fromJson<String>(json['data']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'localId': serializer.toJson<String?>(localId),
      'cashierId': serializer.toJson<String>(cashierId),
      'cashierUsername': serializer.toJson<String>(cashierUsername),
      'cashierBranchName': serializer.toJson<String>(cashierBranchName),
      'beginningBalance': serializer.toJson<double>(beginningBalance),
      'showBeginningBalance': serializer.toJson<bool>(showBeginningBalance),
      'date': serializer.toJson<DateTime>(date),
      'data': serializer.toJson<String>(data),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedBillCountRow copyWith(
          {String? id,
          Value<String?> localId = const Value.absent(),
          String? cashierId,
          String? cashierUsername,
          String? cashierBranchName,
          double? beginningBalance,
          bool? showBeginningBalance,
          DateTime? date,
          String? data,
          bool? isSynced,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CachedBillCountRow(
        id: id ?? this.id,
        localId: localId.present ? localId.value : this.localId,
        cashierId: cashierId ?? this.cashierId,
        cashierUsername: cashierUsername ?? this.cashierUsername,
        cashierBranchName: cashierBranchName ?? this.cashierBranchName,
        beginningBalance: beginningBalance ?? this.beginningBalance,
        showBeginningBalance: showBeginningBalance ?? this.showBeginningBalance,
        date: date ?? this.date,
        data: data ?? this.data,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CachedBillCountRow copyWithCompanion(CachedBillCountsCompanion data) {
    return CachedBillCountRow(
      id: data.id.present ? data.id.value : this.id,
      localId: data.localId.present ? data.localId.value : this.localId,
      cashierId: data.cashierId.present ? data.cashierId.value : this.cashierId,
      cashierUsername: data.cashierUsername.present
          ? data.cashierUsername.value
          : this.cashierUsername,
      cashierBranchName: data.cashierBranchName.present
          ? data.cashierBranchName.value
          : this.cashierBranchName,
      beginningBalance: data.beginningBalance.present
          ? data.beginningBalance.value
          : this.beginningBalance,
      showBeginningBalance: data.showBeginningBalance.present
          ? data.showBeginningBalance.value
          : this.showBeginningBalance,
      date: data.date.present ? data.date.value : this.date,
      data: data.data.present ? data.data.value : this.data,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedBillCountRow(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('cashierUsername: $cashierUsername, ')
          ..write('cashierBranchName: $cashierBranchName, ')
          ..write('beginningBalance: $beginningBalance, ')
          ..write('showBeginningBalance: $showBeginningBalance, ')
          ..write('date: $date, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      localId,
      cashierId,
      cashierUsername,
      cashierBranchName,
      beginningBalance,
      showBeginningBalance,
      date,
      data,
      isSynced,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedBillCountRow &&
          other.id == this.id &&
          other.localId == this.localId &&
          other.cashierId == this.cashierId &&
          other.cashierUsername == this.cashierUsername &&
          other.cashierBranchName == this.cashierBranchName &&
          other.beginningBalance == this.beginningBalance &&
          other.showBeginningBalance == this.showBeginningBalance &&
          other.date == this.date &&
          other.data == this.data &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CachedBillCountsCompanion extends UpdateCompanion<CachedBillCountRow> {
  final Value<String> id;
  final Value<String?> localId;
  final Value<String> cashierId;
  final Value<String> cashierUsername;
  final Value<String> cashierBranchName;
  final Value<double> beginningBalance;
  final Value<bool> showBeginningBalance;
  final Value<DateTime> date;
  final Value<String> data;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedBillCountsCompanion({
    this.id = const Value.absent(),
    this.localId = const Value.absent(),
    this.cashierId = const Value.absent(),
    this.cashierUsername = const Value.absent(),
    this.cashierBranchName = const Value.absent(),
    this.beginningBalance = const Value.absent(),
    this.showBeginningBalance = const Value.absent(),
    this.date = const Value.absent(),
    this.data = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedBillCountsCompanion.insert({
    required String id,
    this.localId = const Value.absent(),
    required String cashierId,
    required String cashierUsername,
    required String cashierBranchName,
    this.beginningBalance = const Value.absent(),
    this.showBeginningBalance = const Value.absent(),
    required DateTime date,
    required String data,
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cashierId = Value(cashierId),
        cashierUsername = Value(cashierUsername),
        cashierBranchName = Value(cashierBranchName),
        date = Value(date),
        data = Value(data);
  static Insertable<CachedBillCountRow> custom({
    Expression<String>? id,
    Expression<String>? localId,
    Expression<String>? cashierId,
    Expression<String>? cashierUsername,
    Expression<String>? cashierBranchName,
    Expression<double>? beginningBalance,
    Expression<bool>? showBeginningBalance,
    Expression<DateTime>? date,
    Expression<String>? data,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localId != null) 'local_id': localId,
      if (cashierId != null) 'cashier_id': cashierId,
      if (cashierUsername != null) 'cashier_username': cashierUsername,
      if (cashierBranchName != null) 'cashier_branch_name': cashierBranchName,
      if (beginningBalance != null) 'beginning_balance': beginningBalance,
      if (showBeginningBalance != null)
        'show_beginning_balance': showBeginningBalance,
      if (date != null) 'date': date,
      if (data != null) 'data': data,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedBillCountsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? localId,
      Value<String>? cashierId,
      Value<String>? cashierUsername,
      Value<String>? cashierBranchName,
      Value<double>? beginningBalance,
      Value<bool>? showBeginningBalance,
      Value<DateTime>? date,
      Value<String>? data,
      Value<bool>? isSynced,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CachedBillCountsCompanion(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      cashierId: cashierId ?? this.cashierId,
      cashierUsername: cashierUsername ?? this.cashierUsername,
      cashierBranchName: cashierBranchName ?? this.cashierBranchName,
      beginningBalance: beginningBalance ?? this.beginningBalance,
      showBeginningBalance: showBeginningBalance ?? this.showBeginningBalance,
      date: date ?? this.date,
      data: data ?? this.data,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (cashierId.present) {
      map['cashier_id'] = Variable<String>(cashierId.value);
    }
    if (cashierUsername.present) {
      map['cashier_username'] = Variable<String>(cashierUsername.value);
    }
    if (cashierBranchName.present) {
      map['cashier_branch_name'] = Variable<String>(cashierBranchName.value);
    }
    if (beginningBalance.present) {
      map['beginning_balance'] = Variable<double>(beginningBalance.value);
    }
    if (showBeginningBalance.present) {
      map['show_beginning_balance'] =
          Variable<bool>(showBeginningBalance.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedBillCountsCompanion(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('cashierId: $cashierId, ')
          ..write('cashierUsername: $cashierUsername, ')
          ..write('cashierBranchName: $cashierBranchName, ')
          ..write('beginningBalance: $beginningBalance, ')
          ..write('showBeginningBalance: $showBeginningBalance, ')
          ..write('date: $date, ')
          ..write('data: $data, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingBillCountSyncTable extends PendingBillCountSync
    with TableInfo<$PendingBillCountSyncTable, PendingBillCountSyncRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingBillCountSyncTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _localBillCountIdMeta =
      const VerificationMeta('localBillCountId');
  @override
  late final GeneratedColumn<String> localBillCountId = GeneratedColumn<String>(
      'local_bill_count_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateFilterMeta =
      const VerificationMeta('dateFilter');
  @override
  late final GeneratedColumn<String> dateFilter = GeneratedColumn<String>(
      'date_filter', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastAttemptAtMeta =
      const VerificationMeta('lastAttemptAt');
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>('last_attempt_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        localBillCountId,
        operation,
        payload,
        dateFilter,
        attempts,
        lastError,
        createdAt,
        lastAttemptAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_bill_count_sync';
  @override
  VerificationContext validateIntegrity(
      Insertable<PendingBillCountSyncRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('local_bill_count_id')) {
      context.handle(
          _localBillCountIdMeta,
          localBillCountId.isAcceptableOrUnknown(
              data['local_bill_count_id']!, _localBillCountIdMeta));
    } else if (isInserting) {
      context.missing(_localBillCountIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('date_filter')) {
      context.handle(
          _dateFilterMeta,
          dateFilter.isAcceptableOrUnknown(
              data['date_filter']!, _dateFilterMeta));
    } else if (isInserting) {
      context.missing(_dateFilterMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
          _lastAttemptAtMeta,
          lastAttemptAt.isAcceptableOrUnknown(
              data['last_attempt_at']!, _lastAttemptAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingBillCountSyncRow map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingBillCountSyncRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      localBillCountId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_bill_count_id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      dateFilter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_filter'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_attempt_at']),
    );
  }

  @override
  $PendingBillCountSyncTable createAlias(String alias) {
    return $PendingBillCountSyncTable(attachedDatabase, alias);
  }
}

class PendingBillCountSyncRow extends DataClass
    implements Insertable<PendingBillCountSyncRow> {
  /// Auto-increment ID.
  final int id;

  /// The local bill count ID.
  final String localBillCountId;

  /// Operation type: 'create' or 'update'.
  final String operation;

  /// The bill count data as JSON for syncing.
  final String payload;

  /// The date filter for syncing (ISO 8601 UTC).
  final String dateFilter;

  /// Number of sync attempts.
  final int attempts;

  /// Last sync error message.
  final String? lastError;

  /// When the sync operation was queued.
  final DateTime createdAt;

  /// When the sync was last attempted.
  final DateTime? lastAttemptAt;
  const PendingBillCountSyncRow(
      {required this.id,
      required this.localBillCountId,
      required this.operation,
      required this.payload,
      required this.dateFilter,
      required this.attempts,
      this.lastError,
      required this.createdAt,
      this.lastAttemptAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['local_bill_count_id'] = Variable<String>(localBillCountId);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['date_filter'] = Variable<String>(dateFilter);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  PendingBillCountSyncCompanion toCompanion(bool nullToAbsent) {
    return PendingBillCountSyncCompanion(
      id: Value(id),
      localBillCountId: Value(localBillCountId),
      operation: Value(operation),
      payload: Value(payload),
      dateFilter: Value(dateFilter),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory PendingBillCountSyncRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingBillCountSyncRow(
      id: serializer.fromJson<int>(json['id']),
      localBillCountId: serializer.fromJson<String>(json['localBillCountId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      dateFilter: serializer.fromJson<String>(json['dateFilter']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'localBillCountId': serializer.toJson<String>(localBillCountId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'dateFilter': serializer.toJson<String>(dateFilter),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  PendingBillCountSyncRow copyWith(
          {int? id,
          String? localBillCountId,
          String? operation,
          String? payload,
          String? dateFilter,
          int? attempts,
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> lastAttemptAt = const Value.absent()}) =>
      PendingBillCountSyncRow(
        id: id ?? this.id,
        localBillCountId: localBillCountId ?? this.localBillCountId,
        operation: operation ?? this.operation,
        payload: payload ?? this.payload,
        dateFilter: dateFilter ?? this.dateFilter,
        attempts: attempts ?? this.attempts,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
        lastAttemptAt:
            lastAttemptAt.present ? lastAttemptAt.value : this.lastAttemptAt,
      );
  PendingBillCountSyncRow copyWithCompanion(
      PendingBillCountSyncCompanion data) {
    return PendingBillCountSyncRow(
      id: data.id.present ? data.id.value : this.id,
      localBillCountId: data.localBillCountId.present
          ? data.localBillCountId.value
          : this.localBillCountId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      dateFilter:
          data.dateFilter.present ? data.dateFilter.value : this.dateFilter,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingBillCountSyncRow(')
          ..write('id: $id, ')
          ..write('localBillCountId: $localBillCountId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('dateFilter: $dateFilter, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, localBillCountId, operation, payload,
      dateFilter, attempts, lastError, createdAt, lastAttemptAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingBillCountSyncRow &&
          other.id == this.id &&
          other.localBillCountId == this.localBillCountId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.dateFilter == this.dateFilter &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class PendingBillCountSyncCompanion
    extends UpdateCompanion<PendingBillCountSyncRow> {
  final Value<int> id;
  final Value<String> localBillCountId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<String> dateFilter;
  final Value<int> attempts;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastAttemptAt;
  const PendingBillCountSyncCompanion({
    this.id = const Value.absent(),
    this.localBillCountId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.dateFilter = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  });
  PendingBillCountSyncCompanion.insert({
    this.id = const Value.absent(),
    required String localBillCountId,
    required String operation,
    required String payload,
    required String dateFilter,
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  })  : localBillCountId = Value(localBillCountId),
        operation = Value(operation),
        payload = Value(payload),
        dateFilter = Value(dateFilter);
  static Insertable<PendingBillCountSyncRow> custom({
    Expression<int>? id,
    Expression<String>? localBillCountId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<String>? dateFilter,
    Expression<int>? attempts,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastAttemptAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localBillCountId != null) 'local_bill_count_id': localBillCountId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (dateFilter != null) 'date_filter': dateFilter,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
    });
  }

  PendingBillCountSyncCompanion copyWith(
      {Value<int>? id,
      Value<String>? localBillCountId,
      Value<String>? operation,
      Value<String>? payload,
      Value<String>? dateFilter,
      Value<int>? attempts,
      Value<String?>? lastError,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastAttemptAt}) {
    return PendingBillCountSyncCompanion(
      id: id ?? this.id,
      localBillCountId: localBillCountId ?? this.localBillCountId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      dateFilter: dateFilter ?? this.dateFilter,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (localBillCountId.present) {
      map['local_bill_count_id'] = Variable<String>(localBillCountId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (dateFilter.present) {
      map['date_filter'] = Variable<String>(dateFilter.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingBillCountSyncCompanion(')
          ..write('id: $id, ')
          ..write('localBillCountId: $localBillCountId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('dateFilter: $dateFilter, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }
}

class $BillCountCacheMetaTable extends BillCountCacheMeta
    with TableInfo<$BillCountCacheMetaTable, BillCountCacheMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillCountCacheMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncAtMeta =
      const VerificationMeta('lastSyncAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncAt = GeneratedColumn<DateTime>(
      'last_sync_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [key, lastSyncAt, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bill_count_cache_meta';
  @override
  VerificationContext validateIntegrity(
      Insertable<BillCountCacheMetaRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('last_sync_at')) {
      context.handle(
          _lastSyncAtMeta,
          lastSyncAt.isAcceptableOrUnknown(
              data['last_sync_at']!, _lastSyncAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  BillCountCacheMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillCountCacheMetaRow(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      lastSyncAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_sync_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BillCountCacheMetaTable createAlias(String alias) {
    return $BillCountCacheMetaTable(attachedDatabase, alias);
  }
}

class BillCountCacheMetaRow extends DataClass
    implements Insertable<BillCountCacheMetaRow> {
  /// Unique key for the cache entry (e.g., 'cashier_<id>_<date>').
  final String key;

  /// When the cache was last synced from server.
  final DateTime? lastSyncAt;

  /// When the cache entry was created.
  final DateTime createdAt;
  const BillCountCacheMetaRow(
      {required this.key, this.lastSyncAt, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BillCountCacheMetaCompanion toCompanion(bool nullToAbsent) {
    return BillCountCacheMetaCompanion(
      key: Value(key),
      lastSyncAt: lastSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAt),
      createdAt: Value(createdAt),
    );
  }

  factory BillCountCacheMetaRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillCountCacheMetaRow(
      key: serializer.fromJson<String>(json['key']),
      lastSyncAt: serializer.fromJson<DateTime?>(json['lastSyncAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'lastSyncAt': serializer.toJson<DateTime?>(lastSyncAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BillCountCacheMetaRow copyWith(
          {String? key,
          Value<DateTime?> lastSyncAt = const Value.absent(),
          DateTime? createdAt}) =>
      BillCountCacheMetaRow(
        key: key ?? this.key,
        lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
        createdAt: createdAt ?? this.createdAt,
      );
  BillCountCacheMetaRow copyWithCompanion(BillCountCacheMetaCompanion data) {
    return BillCountCacheMetaRow(
      key: data.key.present ? data.key.value : this.key,
      lastSyncAt:
          data.lastSyncAt.present ? data.lastSyncAt.value : this.lastSyncAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BillCountCacheMetaRow(')
          ..write('key: $key, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, lastSyncAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillCountCacheMetaRow &&
          other.key == this.key &&
          other.lastSyncAt == this.lastSyncAt &&
          other.createdAt == this.createdAt);
}

class BillCountCacheMetaCompanion
    extends UpdateCompanion<BillCountCacheMetaRow> {
  final Value<String> key;
  final Value<DateTime?> lastSyncAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BillCountCacheMetaCompanion({
    this.key = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BillCountCacheMetaCompanion.insert({
    required String key,
    this.lastSyncAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<BillCountCacheMetaRow> custom({
    Expression<String>? key,
    Expression<DateTime>? lastSyncAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BillCountCacheMetaCompanion copyWith(
      {Value<String>? key,
      Value<DateTime?>? lastSyncAt,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return BillCountCacheMetaCompanion(
      key: key ?? this.key,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillCountCacheMetaCompanion(')
          ..write('key: $key, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $CachedProductsTable cachedProducts = $CachedProductsTable(this);
  late final $ProductCacheMetaTable productCacheMeta =
      $ProductCacheMetaTable(this);
  late final $CachedSalesTable cachedSales = $CachedSalesTable(this);
  late final $PendingSaleSyncTable pendingSaleSync =
      $PendingSaleSyncTable(this);
  late final $LocalStockAdjustmentsTable localStockAdjustments =
      $LocalStockAdjustmentsTable(this);
  late final $CachedDeliveriesTable cachedDeliveries =
      $CachedDeliveriesTable(this);
  late final $DeliveryCacheMetaTable deliveryCacheMeta =
      $DeliveryCacheMetaTable(this);
  late final $PendingDeliverySyncTable pendingDeliverySync =
      $PendingDeliverySyncTable(this);
  late final $DeliveryStockAdjustmentsTable deliveryStockAdjustments =
      $DeliveryStockAdjustmentsTable(this);
  late final $CachedTransfersTable cachedTransfers =
      $CachedTransfersTable(this);
  late final $TransferCacheMetaTable transferCacheMeta =
      $TransferCacheMetaTable(this);
  late final $PendingTransferSyncTable pendingTransferSync =
      $PendingTransferSyncTable(this);
  late final $TransferStockAdjustmentsTable transferStockAdjustments =
      $TransferStockAdjustmentsTable(this);
  late final $CachedBillCountsTable cachedBillCounts =
      $CachedBillCountsTable(this);
  late final $PendingBillCountSyncTable pendingBillCountSync =
      $PendingBillCountSyncTable(this);
  late final $BillCountCacheMetaTable billCountCacheMeta =
      $BillCountCacheMetaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        syncQueue,
        cachedProducts,
        productCacheMeta,
        cachedSales,
        pendingSaleSync,
        localStockAdjustments,
        cachedDeliveries,
        deliveryCacheMeta,
        pendingDeliverySync,
        deliveryStockAdjustments,
        cachedTransfers,
        transferCacheMeta,
        pendingTransferSync,
        transferStockAdjustments,
        cachedBillCounts,
        pendingBillCountSync,
        billCountCacheMeta
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String targetTable,
  required String operation,
  required String recordId,
  required String payload,
  Value<DateTime> createdAt,
  Value<bool> synced,
  Value<DateTime?> syncedAt,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> targetTable,
  Value<String> operation,
  Value<String> recordId,
  Value<String> payload,
  Value<DateTime> createdAt,
  Value<bool> synced,
  Value<DateTime?> syncedAt,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetTable => $composableBuilder(
      column: $table.targetTable, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetTable => $composableBuilder(
      column: $table.targetTable, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetTable => $composableBuilder(
      column: $table.targetTable, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueItem,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueItem,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueItem>
    ),
    SyncQueueItem,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> targetTable = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> recordId = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<DateTime?> syncedAt = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            targetTable: targetTable,
            operation: operation,
            recordId: recordId,
            payload: payload,
            createdAt: createdAt,
            synced: synced,
            syncedAt: syncedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String targetTable,
            required String operation,
            required String recordId,
            required String payload,
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<DateTime?> syncedAt = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            targetTable: targetTable,
            operation: operation,
            recordId: recordId,
            payload: payload,
            createdAt: createdAt,
            synced: synced,
            syncedAt: syncedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueItem,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueItem,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueItem>
    ),
    SyncQueueItem,
    PrefetchHooks Function()>;
typedef $$CachedProductsTableCreateCompanionBuilder = CachedProductsCompanion
    Function({
  required String id,
  required String cashierId,
  required String name,
  required String picture,
  required String category,
  required String data,
  Value<DateTime> cachedAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CachedProductsTableUpdateCompanionBuilder = CachedProductsCompanion
    Function({
  Value<String> id,
  Value<String> cashierId,
  Value<String> name,
  Value<String> picture,
  Value<String> category,
  Value<String> data,
  Value<DateTime> cachedAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CachedProductsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedProductsTable> {
  $$CachedProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get picture => $composableBuilder(
      column: $table.picture, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedProductsTable> {
  $$CachedProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get picture => $composableBuilder(
      column: $table.picture, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedProductsTable> {
  $$CachedProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedProductsTable,
    CachedProductRow,
    $$CachedProductsTableFilterComposer,
    $$CachedProductsTableOrderingComposer,
    $$CachedProductsTableAnnotationComposer,
    $$CachedProductsTableCreateCompanionBuilder,
    $$CachedProductsTableUpdateCompanionBuilder,
    (
      CachedProductRow,
      BaseReferences<_$AppDatabase, $CachedProductsTable, CachedProductRow>
    ),
    CachedProductRow,
    PrefetchHooks Function()> {
  $$CachedProductsTableTableManager(
      _$AppDatabase db, $CachedProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> cashierId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> picture = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedProductsCompanion(
            id: id,
            cashierId: cashierId,
            name: name,
            picture: picture,
            category: category,
            data: data,
            cachedAt: cachedAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String cashierId,
            required String name,
            required String picture,
            required String category,
            required String data,
            Value<DateTime> cachedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedProductsCompanion.insert(
            id: id,
            cashierId: cashierId,
            name: name,
            picture: picture,
            category: category,
            data: data,
            cachedAt: cachedAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedProductsTable,
    CachedProductRow,
    $$CachedProductsTableFilterComposer,
    $$CachedProductsTableOrderingComposer,
    $$CachedProductsTableAnnotationComposer,
    $$CachedProductsTableCreateCompanionBuilder,
    $$CachedProductsTableUpdateCompanionBuilder,
    (
      CachedProductRow,
      BaseReferences<_$AppDatabase, $CachedProductsTable, CachedProductRow>
    ),
    CachedProductRow,
    PrefetchHooks Function()>;
typedef $$ProductCacheMetaTableCreateCompanionBuilder
    = ProductCacheMetaCompanion Function({
  required String cashierId,
  required DateTime lastSyncedAt,
  Value<bool> isSyncing,
  Value<String?> lastError,
  Value<int> rowid,
});
typedef $$ProductCacheMetaTableUpdateCompanionBuilder
    = ProductCacheMetaCompanion Function({
  Value<String> cashierId,
  Value<DateTime> lastSyncedAt,
  Value<bool> isSyncing,
  Value<String?> lastError,
  Value<int> rowid,
});

class $$ProductCacheMetaTableFilterComposer
    extends Composer<_$AppDatabase, $ProductCacheMetaTable> {
  $$ProductCacheMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSyncing => $composableBuilder(
      column: $table.isSyncing, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $$ProductCacheMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductCacheMetaTable> {
  $$ProductCacheMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSyncing => $composableBuilder(
      column: $table.isSyncing, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $$ProductCacheMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductCacheMetaTable> {
  $$ProductCacheMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSyncing =>
      $composableBuilder(column: $table.isSyncing, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$ProductCacheMetaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductCacheMetaTable,
    ProductCacheMetaRow,
    $$ProductCacheMetaTableFilterComposer,
    $$ProductCacheMetaTableOrderingComposer,
    $$ProductCacheMetaTableAnnotationComposer,
    $$ProductCacheMetaTableCreateCompanionBuilder,
    $$ProductCacheMetaTableUpdateCompanionBuilder,
    (
      ProductCacheMetaRow,
      BaseReferences<_$AppDatabase, $ProductCacheMetaTable, ProductCacheMetaRow>
    ),
    ProductCacheMetaRow,
    PrefetchHooks Function()> {
  $$ProductCacheMetaTableTableManager(
      _$AppDatabase db, $ProductCacheMetaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductCacheMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductCacheMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductCacheMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> cashierId = const Value.absent(),
            Value<DateTime> lastSyncedAt = const Value.absent(),
            Value<bool> isSyncing = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductCacheMetaCompanion(
            cashierId: cashierId,
            lastSyncedAt: lastSyncedAt,
            isSyncing: isSyncing,
            lastError: lastError,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cashierId,
            required DateTime lastSyncedAt,
            Value<bool> isSyncing = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductCacheMetaCompanion.insert(
            cashierId: cashierId,
            lastSyncedAt: lastSyncedAt,
            isSyncing: isSyncing,
            lastError: lastError,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductCacheMetaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductCacheMetaTable,
    ProductCacheMetaRow,
    $$ProductCacheMetaTableFilterComposer,
    $$ProductCacheMetaTableOrderingComposer,
    $$ProductCacheMetaTableAnnotationComposer,
    $$ProductCacheMetaTableCreateCompanionBuilder,
    $$ProductCacheMetaTableUpdateCompanionBuilder,
    (
      ProductCacheMetaRow,
      BaseReferences<_$AppDatabase, $ProductCacheMetaTable, ProductCacheMetaRow>
    ),
    ProductCacheMetaRow,
    PrefetchHooks Function()>;
typedef $$CachedSalesTableCreateCompanionBuilder = CachedSalesCompanion
    Function({
  required String id,
  Value<String?> localId,
  required String cashierId,
  required double totalAmount,
  required String paymentMethod,
  Value<bool> isVoid,
  Value<DateTime?> voidedAt,
  Value<String?> orderId,
  required String data,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CachedSalesTableUpdateCompanionBuilder = CachedSalesCompanion
    Function({
  Value<String> id,
  Value<String?> localId,
  Value<String> cashierId,
  Value<double> totalAmount,
  Value<String> paymentMethod,
  Value<bool> isVoid,
  Value<DateTime?> voidedAt,
  Value<String?> orderId,
  Value<String> data,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CachedSalesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedSalesTable> {
  $$CachedSalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVoid => $composableBuilder(
      column: $table.isVoid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get voidedAt => $composableBuilder(
      column: $table.voidedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedSalesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedSalesTable> {
  $$CachedSalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVoid => $composableBuilder(
      column: $table.isVoid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get voidedAt => $composableBuilder(
      column: $table.voidedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedSalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedSalesTable> {
  $$CachedSalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<bool> get isVoid =>
      $composableBuilder(column: $table.isVoid, builder: (column) => column);

  GeneratedColumn<DateTime> get voidedAt =>
      $composableBuilder(column: $table.voidedAt, builder: (column) => column);

  GeneratedColumn<String> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedSalesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedSalesTable,
    CachedSaleRow,
    $$CachedSalesTableFilterComposer,
    $$CachedSalesTableOrderingComposer,
    $$CachedSalesTableAnnotationComposer,
    $$CachedSalesTableCreateCompanionBuilder,
    $$CachedSalesTableUpdateCompanionBuilder,
    (
      CachedSaleRow,
      BaseReferences<_$AppDatabase, $CachedSalesTable, CachedSaleRow>
    ),
    CachedSaleRow,
    PrefetchHooks Function()> {
  $$CachedSalesTableTableManager(_$AppDatabase db, $CachedSalesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedSalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedSalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedSalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> localId = const Value.absent(),
            Value<String> cashierId = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<bool> isVoid = const Value.absent(),
            Value<DateTime?> voidedAt = const Value.absent(),
            Value<String?> orderId = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedSalesCompanion(
            id: id,
            localId: localId,
            cashierId: cashierId,
            totalAmount: totalAmount,
            paymentMethod: paymentMethod,
            isVoid: isVoid,
            voidedAt: voidedAt,
            orderId: orderId,
            data: data,
            isSynced: isSynced,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> localId = const Value.absent(),
            required String cashierId,
            required double totalAmount,
            required String paymentMethod,
            Value<bool> isVoid = const Value.absent(),
            Value<DateTime?> voidedAt = const Value.absent(),
            Value<String?> orderId = const Value.absent(),
            required String data,
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedSalesCompanion.insert(
            id: id,
            localId: localId,
            cashierId: cashierId,
            totalAmount: totalAmount,
            paymentMethod: paymentMethod,
            isVoid: isVoid,
            voidedAt: voidedAt,
            orderId: orderId,
            data: data,
            isSynced: isSynced,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedSalesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedSalesTable,
    CachedSaleRow,
    $$CachedSalesTableFilterComposer,
    $$CachedSalesTableOrderingComposer,
    $$CachedSalesTableAnnotationComposer,
    $$CachedSalesTableCreateCompanionBuilder,
    $$CachedSalesTableUpdateCompanionBuilder,
    (
      CachedSaleRow,
      BaseReferences<_$AppDatabase, $CachedSalesTable, CachedSaleRow>
    ),
    CachedSaleRow,
    PrefetchHooks Function()>;
typedef $$PendingSaleSyncTableCreateCompanionBuilder = PendingSaleSyncCompanion
    Function({
  Value<int> id,
  required String localSaleId,
  required String operation,
  required String payload,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});
typedef $$PendingSaleSyncTableUpdateCompanionBuilder = PendingSaleSyncCompanion
    Function({
  Value<int> id,
  Value<String> localSaleId,
  Value<String> operation,
  Value<String> payload,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});

class $$PendingSaleSyncTableFilterComposer
    extends Composer<_$AppDatabase, $PendingSaleSyncTable> {
  $$PendingSaleSyncTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localSaleId => $composableBuilder(
      column: $table.localSaleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => ColumnFilters(column));
}

class $$PendingSaleSyncTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingSaleSyncTable> {
  $$PendingSaleSyncTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localSaleId => $composableBuilder(
      column: $table.localSaleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt,
      builder: (column) => ColumnOrderings(column));
}

class $$PendingSaleSyncTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingSaleSyncTable> {
  $$PendingSaleSyncTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localSaleId => $composableBuilder(
      column: $table.localSaleId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => column);
}

class $$PendingSaleSyncTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PendingSaleSyncTable,
    PendingSaleSyncRow,
    $$PendingSaleSyncTableFilterComposer,
    $$PendingSaleSyncTableOrderingComposer,
    $$PendingSaleSyncTableAnnotationComposer,
    $$PendingSaleSyncTableCreateCompanionBuilder,
    $$PendingSaleSyncTableUpdateCompanionBuilder,
    (
      PendingSaleSyncRow,
      BaseReferences<_$AppDatabase, $PendingSaleSyncTable, PendingSaleSyncRow>
    ),
    PendingSaleSyncRow,
    PrefetchHooks Function()> {
  $$PendingSaleSyncTableTableManager(
      _$AppDatabase db, $PendingSaleSyncTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingSaleSyncTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingSaleSyncTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingSaleSyncTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> localSaleId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingSaleSyncCompanion(
            id: id,
            localSaleId: localSaleId,
            operation: operation,
            payload: payload,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String localSaleId,
            required String operation,
            required String payload,
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingSaleSyncCompanion.insert(
            id: id,
            localSaleId: localSaleId,
            operation: operation,
            payload: payload,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PendingSaleSyncTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PendingSaleSyncTable,
    PendingSaleSyncRow,
    $$PendingSaleSyncTableFilterComposer,
    $$PendingSaleSyncTableOrderingComposer,
    $$PendingSaleSyncTableAnnotationComposer,
    $$PendingSaleSyncTableCreateCompanionBuilder,
    $$PendingSaleSyncTableUpdateCompanionBuilder,
    (
      PendingSaleSyncRow,
      BaseReferences<_$AppDatabase, $PendingSaleSyncTable, PendingSaleSyncRow>
    ),
    PendingSaleSyncRow,
    PrefetchHooks Function()>;
typedef $$LocalStockAdjustmentsTableCreateCompanionBuilder
    = LocalStockAdjustmentsCompanion Function({
  Value<int> id,
  required String productId,
  required String priceType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  required double quantityChange,
  required String saleId,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
});
typedef $$LocalStockAdjustmentsTableUpdateCompanionBuilder
    = LocalStockAdjustmentsCompanion Function({
  Value<int> id,
  Value<String> productId,
  Value<String> priceType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  Value<double> quantityChange,
  Value<String> saleId,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
});

class $$LocalStockAdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalStockAdjustmentsTable> {
  $$LocalStockAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priceType => $composableBuilder(
      column: $table.priceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get saleId => $composableBuilder(
      column: $table.saleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$LocalStockAdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalStockAdjustmentsTable> {
  $$LocalStockAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priceType => $composableBuilder(
      column: $table.priceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get saleId => $composableBuilder(
      column: $table.saleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$LocalStockAdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalStockAdjustmentsTable> {
  $$LocalStockAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get priceType =>
      $composableBuilder(column: $table.priceType, builder: (column) => column);

  GeneratedColumn<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => column);

  GeneratedColumn<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId, builder: (column) => column);

  GeneratedColumn<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange, builder: (column) => column);

  GeneratedColumn<String> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalStockAdjustmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalStockAdjustmentsTable,
    LocalStockAdjustmentRow,
    $$LocalStockAdjustmentsTableFilterComposer,
    $$LocalStockAdjustmentsTableOrderingComposer,
    $$LocalStockAdjustmentsTableAnnotationComposer,
    $$LocalStockAdjustmentsTableCreateCompanionBuilder,
    $$LocalStockAdjustmentsTableUpdateCompanionBuilder,
    (
      LocalStockAdjustmentRow,
      BaseReferences<_$AppDatabase, $LocalStockAdjustmentsTable,
          LocalStockAdjustmentRow>
    ),
    LocalStockAdjustmentRow,
    PrefetchHooks Function()> {
  $$LocalStockAdjustmentsTableTableManager(
      _$AppDatabase db, $LocalStockAdjustmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalStockAdjustmentsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalStockAdjustmentsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalStockAdjustmentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> priceType = const Value.absent(),
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            Value<double> quantityChange = const Value.absent(),
            Value<String> saleId = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              LocalStockAdjustmentsCompanion(
            id: id,
            productId: productId,
            priceType: priceType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            quantityChange: quantityChange,
            saleId: saleId,
            isSynced: isSynced,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productId,
            required String priceType,
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            required double quantityChange,
            required String saleId,
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              LocalStockAdjustmentsCompanion.insert(
            id: id,
            productId: productId,
            priceType: priceType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            quantityChange: quantityChange,
            saleId: saleId,
            isSynced: isSynced,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalStockAdjustmentsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LocalStockAdjustmentsTable,
        LocalStockAdjustmentRow,
        $$LocalStockAdjustmentsTableFilterComposer,
        $$LocalStockAdjustmentsTableOrderingComposer,
        $$LocalStockAdjustmentsTableAnnotationComposer,
        $$LocalStockAdjustmentsTableCreateCompanionBuilder,
        $$LocalStockAdjustmentsTableUpdateCompanionBuilder,
        (
          LocalStockAdjustmentRow,
          BaseReferences<_$AppDatabase, $LocalStockAdjustmentsTable,
              LocalStockAdjustmentRow>
        ),
        LocalStockAdjustmentRow,
        PrefetchHooks Function()>;
typedef $$CachedDeliveriesTableCreateCompanionBuilder
    = CachedDeliveriesCompanion Function({
  required String id,
  Value<String?> localId,
  required String cashierId,
  required String driverName,
  required DateTime deliveryTimeStart,
  required String data,
  Value<bool> isSynced,
  Value<bool> isDeleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CachedDeliveriesTableUpdateCompanionBuilder
    = CachedDeliveriesCompanion Function({
  Value<String> id,
  Value<String?> localId,
  Value<String> cashierId,
  Value<String> driverName,
  Value<DateTime> deliveryTimeStart,
  Value<String> data,
  Value<bool> isSynced,
  Value<bool> isDeleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CachedDeliveriesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedDeliveriesTable> {
  $$CachedDeliveriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get driverName => $composableBuilder(
      column: $table.driverName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deliveryTimeStart => $composableBuilder(
      column: $table.deliveryTimeStart,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedDeliveriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedDeliveriesTable> {
  $$CachedDeliveriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get driverName => $composableBuilder(
      column: $table.driverName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deliveryTimeStart => $composableBuilder(
      column: $table.deliveryTimeStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedDeliveriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedDeliveriesTable> {
  $$CachedDeliveriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<String> get driverName => $composableBuilder(
      column: $table.driverName, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveryTimeStart => $composableBuilder(
      column: $table.deliveryTimeStart, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedDeliveriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedDeliveriesTable,
    CachedDeliveryRow,
    $$CachedDeliveriesTableFilterComposer,
    $$CachedDeliveriesTableOrderingComposer,
    $$CachedDeliveriesTableAnnotationComposer,
    $$CachedDeliveriesTableCreateCompanionBuilder,
    $$CachedDeliveriesTableUpdateCompanionBuilder,
    (
      CachedDeliveryRow,
      BaseReferences<_$AppDatabase, $CachedDeliveriesTable, CachedDeliveryRow>
    ),
    CachedDeliveryRow,
    PrefetchHooks Function()> {
  $$CachedDeliveriesTableTableManager(
      _$AppDatabase db, $CachedDeliveriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedDeliveriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedDeliveriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedDeliveriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> localId = const Value.absent(),
            Value<String> cashierId = const Value.absent(),
            Value<String> driverName = const Value.absent(),
            Value<DateTime> deliveryTimeStart = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedDeliveriesCompanion(
            id: id,
            localId: localId,
            cashierId: cashierId,
            driverName: driverName,
            deliveryTimeStart: deliveryTimeStart,
            data: data,
            isSynced: isSynced,
            isDeleted: isDeleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> localId = const Value.absent(),
            required String cashierId,
            required String driverName,
            required DateTime deliveryTimeStart,
            required String data,
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedDeliveriesCompanion.insert(
            id: id,
            localId: localId,
            cashierId: cashierId,
            driverName: driverName,
            deliveryTimeStart: deliveryTimeStart,
            data: data,
            isSynced: isSynced,
            isDeleted: isDeleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedDeliveriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedDeliveriesTable,
    CachedDeliveryRow,
    $$CachedDeliveriesTableFilterComposer,
    $$CachedDeliveriesTableOrderingComposer,
    $$CachedDeliveriesTableAnnotationComposer,
    $$CachedDeliveriesTableCreateCompanionBuilder,
    $$CachedDeliveriesTableUpdateCompanionBuilder,
    (
      CachedDeliveryRow,
      BaseReferences<_$AppDatabase, $CachedDeliveriesTable, CachedDeliveryRow>
    ),
    CachedDeliveryRow,
    PrefetchHooks Function()>;
typedef $$DeliveryCacheMetaTableCreateCompanionBuilder
    = DeliveryCacheMetaCompanion Function({
  required String cashierId,
  required DateTime lastSyncedAt,
  Value<bool> isSyncing,
  Value<String?> lastError,
  Value<int> rowid,
});
typedef $$DeliveryCacheMetaTableUpdateCompanionBuilder
    = DeliveryCacheMetaCompanion Function({
  Value<String> cashierId,
  Value<DateTime> lastSyncedAt,
  Value<bool> isSyncing,
  Value<String?> lastError,
  Value<int> rowid,
});

class $$DeliveryCacheMetaTableFilterComposer
    extends Composer<_$AppDatabase, $DeliveryCacheMetaTable> {
  $$DeliveryCacheMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSyncing => $composableBuilder(
      column: $table.isSyncing, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $$DeliveryCacheMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $DeliveryCacheMetaTable> {
  $$DeliveryCacheMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSyncing => $composableBuilder(
      column: $table.isSyncing, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $$DeliveryCacheMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeliveryCacheMetaTable> {
  $$DeliveryCacheMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSyncing =>
      $composableBuilder(column: $table.isSyncing, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$DeliveryCacheMetaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DeliveryCacheMetaTable,
    DeliveryCacheMetaRow,
    $$DeliveryCacheMetaTableFilterComposer,
    $$DeliveryCacheMetaTableOrderingComposer,
    $$DeliveryCacheMetaTableAnnotationComposer,
    $$DeliveryCacheMetaTableCreateCompanionBuilder,
    $$DeliveryCacheMetaTableUpdateCompanionBuilder,
    (
      DeliveryCacheMetaRow,
      BaseReferences<_$AppDatabase, $DeliveryCacheMetaTable,
          DeliveryCacheMetaRow>
    ),
    DeliveryCacheMetaRow,
    PrefetchHooks Function()> {
  $$DeliveryCacheMetaTableTableManager(
      _$AppDatabase db, $DeliveryCacheMetaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeliveryCacheMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeliveryCacheMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeliveryCacheMetaTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> cashierId = const Value.absent(),
            Value<DateTime> lastSyncedAt = const Value.absent(),
            Value<bool> isSyncing = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeliveryCacheMetaCompanion(
            cashierId: cashierId,
            lastSyncedAt: lastSyncedAt,
            isSyncing: isSyncing,
            lastError: lastError,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cashierId,
            required DateTime lastSyncedAt,
            Value<bool> isSyncing = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeliveryCacheMetaCompanion.insert(
            cashierId: cashierId,
            lastSyncedAt: lastSyncedAt,
            isSyncing: isSyncing,
            lastError: lastError,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DeliveryCacheMetaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DeliveryCacheMetaTable,
    DeliveryCacheMetaRow,
    $$DeliveryCacheMetaTableFilterComposer,
    $$DeliveryCacheMetaTableOrderingComposer,
    $$DeliveryCacheMetaTableAnnotationComposer,
    $$DeliveryCacheMetaTableCreateCompanionBuilder,
    $$DeliveryCacheMetaTableUpdateCompanionBuilder,
    (
      DeliveryCacheMetaRow,
      BaseReferences<_$AppDatabase, $DeliveryCacheMetaTable,
          DeliveryCacheMetaRow>
    ),
    DeliveryCacheMetaRow,
    PrefetchHooks Function()>;
typedef $$PendingDeliverySyncTableCreateCompanionBuilder
    = PendingDeliverySyncCompanion Function({
  Value<int> id,
  required String localDeliveryId,
  Value<String?> serverDeliveryId,
  required String operation,
  required String payload,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});
typedef $$PendingDeliverySyncTableUpdateCompanionBuilder
    = PendingDeliverySyncCompanion Function({
  Value<int> id,
  Value<String> localDeliveryId,
  Value<String?> serverDeliveryId,
  Value<String> operation,
  Value<String> payload,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});

class $$PendingDeliverySyncTableFilterComposer
    extends Composer<_$AppDatabase, $PendingDeliverySyncTable> {
  $$PendingDeliverySyncTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localDeliveryId => $composableBuilder(
      column: $table.localDeliveryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serverDeliveryId => $composableBuilder(
      column: $table.serverDeliveryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => ColumnFilters(column));
}

class $$PendingDeliverySyncTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingDeliverySyncTable> {
  $$PendingDeliverySyncTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localDeliveryId => $composableBuilder(
      column: $table.localDeliveryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serverDeliveryId => $composableBuilder(
      column: $table.serverDeliveryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt,
      builder: (column) => ColumnOrderings(column));
}

class $$PendingDeliverySyncTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingDeliverySyncTable> {
  $$PendingDeliverySyncTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localDeliveryId => $composableBuilder(
      column: $table.localDeliveryId, builder: (column) => column);

  GeneratedColumn<String> get serverDeliveryId => $composableBuilder(
      column: $table.serverDeliveryId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => column);
}

class $$PendingDeliverySyncTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PendingDeliverySyncTable,
    PendingDeliverySyncRow,
    $$PendingDeliverySyncTableFilterComposer,
    $$PendingDeliverySyncTableOrderingComposer,
    $$PendingDeliverySyncTableAnnotationComposer,
    $$PendingDeliverySyncTableCreateCompanionBuilder,
    $$PendingDeliverySyncTableUpdateCompanionBuilder,
    (
      PendingDeliverySyncRow,
      BaseReferences<_$AppDatabase, $PendingDeliverySyncTable,
          PendingDeliverySyncRow>
    ),
    PendingDeliverySyncRow,
    PrefetchHooks Function()> {
  $$PendingDeliverySyncTableTableManager(
      _$AppDatabase db, $PendingDeliverySyncTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingDeliverySyncTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingDeliverySyncTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingDeliverySyncTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> localDeliveryId = const Value.absent(),
            Value<String?> serverDeliveryId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingDeliverySyncCompanion(
            id: id,
            localDeliveryId: localDeliveryId,
            serverDeliveryId: serverDeliveryId,
            operation: operation,
            payload: payload,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String localDeliveryId,
            Value<String?> serverDeliveryId = const Value.absent(),
            required String operation,
            required String payload,
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingDeliverySyncCompanion.insert(
            id: id,
            localDeliveryId: localDeliveryId,
            serverDeliveryId: serverDeliveryId,
            operation: operation,
            payload: payload,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PendingDeliverySyncTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PendingDeliverySyncTable,
    PendingDeliverySyncRow,
    $$PendingDeliverySyncTableFilterComposer,
    $$PendingDeliverySyncTableOrderingComposer,
    $$PendingDeliverySyncTableAnnotationComposer,
    $$PendingDeliverySyncTableCreateCompanionBuilder,
    $$PendingDeliverySyncTableUpdateCompanionBuilder,
    (
      PendingDeliverySyncRow,
      BaseReferences<_$AppDatabase, $PendingDeliverySyncTable,
          PendingDeliverySyncRow>
    ),
    PendingDeliverySyncRow,
    PrefetchHooks Function()>;
typedef $$DeliveryStockAdjustmentsTableCreateCompanionBuilder
    = DeliveryStockAdjustmentsCompanion Function({
  Value<int> id,
  required String productId,
  required String priceType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  required double quantityChange,
  required String deliveryId,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
});
typedef $$DeliveryStockAdjustmentsTableUpdateCompanionBuilder
    = DeliveryStockAdjustmentsCompanion Function({
  Value<int> id,
  Value<String> productId,
  Value<String> priceType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  Value<double> quantityChange,
  Value<String> deliveryId,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
});

class $$DeliveryStockAdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $DeliveryStockAdjustmentsTable> {
  $$DeliveryStockAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priceType => $composableBuilder(
      column: $table.priceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deliveryId => $composableBuilder(
      column: $table.deliveryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$DeliveryStockAdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DeliveryStockAdjustmentsTable> {
  $$DeliveryStockAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priceType => $composableBuilder(
      column: $table.priceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deliveryId => $composableBuilder(
      column: $table.deliveryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$DeliveryStockAdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeliveryStockAdjustmentsTable> {
  $$DeliveryStockAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get priceType =>
      $composableBuilder(column: $table.priceType, builder: (column) => column);

  GeneratedColumn<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => column);

  GeneratedColumn<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId, builder: (column) => column);

  GeneratedColumn<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange, builder: (column) => column);

  GeneratedColumn<String> get deliveryId => $composableBuilder(
      column: $table.deliveryId, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DeliveryStockAdjustmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DeliveryStockAdjustmentsTable,
    DeliveryStockAdjustmentRow,
    $$DeliveryStockAdjustmentsTableFilterComposer,
    $$DeliveryStockAdjustmentsTableOrderingComposer,
    $$DeliveryStockAdjustmentsTableAnnotationComposer,
    $$DeliveryStockAdjustmentsTableCreateCompanionBuilder,
    $$DeliveryStockAdjustmentsTableUpdateCompanionBuilder,
    (
      DeliveryStockAdjustmentRow,
      BaseReferences<_$AppDatabase, $DeliveryStockAdjustmentsTable,
          DeliveryStockAdjustmentRow>
    ),
    DeliveryStockAdjustmentRow,
    PrefetchHooks Function()> {
  $$DeliveryStockAdjustmentsTableTableManager(
      _$AppDatabase db, $DeliveryStockAdjustmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeliveryStockAdjustmentsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DeliveryStockAdjustmentsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeliveryStockAdjustmentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> priceType = const Value.absent(),
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            Value<double> quantityChange = const Value.absent(),
            Value<String> deliveryId = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DeliveryStockAdjustmentsCompanion(
            id: id,
            productId: productId,
            priceType: priceType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            quantityChange: quantityChange,
            deliveryId: deliveryId,
            isSynced: isSynced,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productId,
            required String priceType,
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            required double quantityChange,
            required String deliveryId,
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DeliveryStockAdjustmentsCompanion.insert(
            id: id,
            productId: productId,
            priceType: priceType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            quantityChange: quantityChange,
            deliveryId: deliveryId,
            isSynced: isSynced,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DeliveryStockAdjustmentsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $DeliveryStockAdjustmentsTable,
        DeliveryStockAdjustmentRow,
        $$DeliveryStockAdjustmentsTableFilterComposer,
        $$DeliveryStockAdjustmentsTableOrderingComposer,
        $$DeliveryStockAdjustmentsTableAnnotationComposer,
        $$DeliveryStockAdjustmentsTableCreateCompanionBuilder,
        $$DeliveryStockAdjustmentsTableUpdateCompanionBuilder,
        (
          DeliveryStockAdjustmentRow,
          BaseReferences<_$AppDatabase, $DeliveryStockAdjustmentsTable,
              DeliveryStockAdjustmentRow>
        ),
        DeliveryStockAdjustmentRow,
        PrefetchHooks Function()>;
typedef $$CachedTransfersTableCreateCompanionBuilder = CachedTransfersCompanion
    Function({
  required String id,
  Value<String?> localId,
  required String cashierId,
  required String productId,
  required String type,
  required double quantity,
  Value<String?> sackType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  required String data,
  Value<bool> isSynced,
  Value<bool> isDeleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CachedTransfersTableUpdateCompanionBuilder = CachedTransfersCompanion
    Function({
  Value<String> id,
  Value<String?> localId,
  Value<String> cashierId,
  Value<String> productId,
  Value<String> type,
  Value<double> quantity,
  Value<String?> sackType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  Value<String> data,
  Value<bool> isSynced,
  Value<bool> isDeleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CachedTransfersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedTransfersTable> {
  $$CachedTransfersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sackType => $composableBuilder(
      column: $table.sackType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedTransfersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedTransfersTable> {
  $$CachedTransfersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sackType => $composableBuilder(
      column: $table.sackType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedTransfersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedTransfersTable> {
  $$CachedTransfersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get sackType =>
      $composableBuilder(column: $table.sackType, builder: (column) => column);

  GeneratedColumn<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => column);

  GeneratedColumn<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedTransfersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedTransfersTable,
    CachedTransferRow,
    $$CachedTransfersTableFilterComposer,
    $$CachedTransfersTableOrderingComposer,
    $$CachedTransfersTableAnnotationComposer,
    $$CachedTransfersTableCreateCompanionBuilder,
    $$CachedTransfersTableUpdateCompanionBuilder,
    (
      CachedTransferRow,
      BaseReferences<_$AppDatabase, $CachedTransfersTable, CachedTransferRow>
    ),
    CachedTransferRow,
    PrefetchHooks Function()> {
  $$CachedTransfersTableTableManager(
      _$AppDatabase db, $CachedTransfersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedTransfersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedTransfersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedTransfersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> localId = const Value.absent(),
            Value<String> cashierId = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String?> sackType = const Value.absent(),
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedTransfersCompanion(
            id: id,
            localId: localId,
            cashierId: cashierId,
            productId: productId,
            type: type,
            quantity: quantity,
            sackType: sackType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            data: data,
            isSynced: isSynced,
            isDeleted: isDeleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> localId = const Value.absent(),
            required String cashierId,
            required String productId,
            required String type,
            required double quantity,
            Value<String?> sackType = const Value.absent(),
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            required String data,
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedTransfersCompanion.insert(
            id: id,
            localId: localId,
            cashierId: cashierId,
            productId: productId,
            type: type,
            quantity: quantity,
            sackType: sackType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            data: data,
            isSynced: isSynced,
            isDeleted: isDeleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedTransfersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedTransfersTable,
    CachedTransferRow,
    $$CachedTransfersTableFilterComposer,
    $$CachedTransfersTableOrderingComposer,
    $$CachedTransfersTableAnnotationComposer,
    $$CachedTransfersTableCreateCompanionBuilder,
    $$CachedTransfersTableUpdateCompanionBuilder,
    (
      CachedTransferRow,
      BaseReferences<_$AppDatabase, $CachedTransfersTable, CachedTransferRow>
    ),
    CachedTransferRow,
    PrefetchHooks Function()>;
typedef $$TransferCacheMetaTableCreateCompanionBuilder
    = TransferCacheMetaCompanion Function({
  required String cashierId,
  required DateTime lastSyncedAt,
  Value<bool> isSyncing,
  Value<String?> lastError,
  Value<int> rowid,
});
typedef $$TransferCacheMetaTableUpdateCompanionBuilder
    = TransferCacheMetaCompanion Function({
  Value<String> cashierId,
  Value<DateTime> lastSyncedAt,
  Value<bool> isSyncing,
  Value<String?> lastError,
  Value<int> rowid,
});

class $$TransferCacheMetaTableFilterComposer
    extends Composer<_$AppDatabase, $TransferCacheMetaTable> {
  $$TransferCacheMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSyncing => $composableBuilder(
      column: $table.isSyncing, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $$TransferCacheMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $TransferCacheMetaTable> {
  $$TransferCacheMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSyncing => $composableBuilder(
      column: $table.isSyncing, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $$TransferCacheMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransferCacheMetaTable> {
  $$TransferCacheMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSyncing =>
      $composableBuilder(column: $table.isSyncing, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$TransferCacheMetaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransferCacheMetaTable,
    TransferCacheMetaRow,
    $$TransferCacheMetaTableFilterComposer,
    $$TransferCacheMetaTableOrderingComposer,
    $$TransferCacheMetaTableAnnotationComposer,
    $$TransferCacheMetaTableCreateCompanionBuilder,
    $$TransferCacheMetaTableUpdateCompanionBuilder,
    (
      TransferCacheMetaRow,
      BaseReferences<_$AppDatabase, $TransferCacheMetaTable,
          TransferCacheMetaRow>
    ),
    TransferCacheMetaRow,
    PrefetchHooks Function()> {
  $$TransferCacheMetaTableTableManager(
      _$AppDatabase db, $TransferCacheMetaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransferCacheMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransferCacheMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransferCacheMetaTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> cashierId = const Value.absent(),
            Value<DateTime> lastSyncedAt = const Value.absent(),
            Value<bool> isSyncing = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransferCacheMetaCompanion(
            cashierId: cashierId,
            lastSyncedAt: lastSyncedAt,
            isSyncing: isSyncing,
            lastError: lastError,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cashierId,
            required DateTime lastSyncedAt,
            Value<bool> isSyncing = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransferCacheMetaCompanion.insert(
            cashierId: cashierId,
            lastSyncedAt: lastSyncedAt,
            isSyncing: isSyncing,
            lastError: lastError,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransferCacheMetaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransferCacheMetaTable,
    TransferCacheMetaRow,
    $$TransferCacheMetaTableFilterComposer,
    $$TransferCacheMetaTableOrderingComposer,
    $$TransferCacheMetaTableAnnotationComposer,
    $$TransferCacheMetaTableCreateCompanionBuilder,
    $$TransferCacheMetaTableUpdateCompanionBuilder,
    (
      TransferCacheMetaRow,
      BaseReferences<_$AppDatabase, $TransferCacheMetaTable,
          TransferCacheMetaRow>
    ),
    TransferCacheMetaRow,
    PrefetchHooks Function()>;
typedef $$PendingTransferSyncTableCreateCompanionBuilder
    = PendingTransferSyncCompanion Function({
  Value<int> id,
  required String localTransferId,
  Value<String?> serverTransferId,
  required String operation,
  required String payload,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});
typedef $$PendingTransferSyncTableUpdateCompanionBuilder
    = PendingTransferSyncCompanion Function({
  Value<int> id,
  Value<String> localTransferId,
  Value<String?> serverTransferId,
  Value<String> operation,
  Value<String> payload,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});

class $$PendingTransferSyncTableFilterComposer
    extends Composer<_$AppDatabase, $PendingTransferSyncTable> {
  $$PendingTransferSyncTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localTransferId => $composableBuilder(
      column: $table.localTransferId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serverTransferId => $composableBuilder(
      column: $table.serverTransferId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => ColumnFilters(column));
}

class $$PendingTransferSyncTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingTransferSyncTable> {
  $$PendingTransferSyncTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localTransferId => $composableBuilder(
      column: $table.localTransferId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serverTransferId => $composableBuilder(
      column: $table.serverTransferId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt,
      builder: (column) => ColumnOrderings(column));
}

class $$PendingTransferSyncTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingTransferSyncTable> {
  $$PendingTransferSyncTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localTransferId => $composableBuilder(
      column: $table.localTransferId, builder: (column) => column);

  GeneratedColumn<String> get serverTransferId => $composableBuilder(
      column: $table.serverTransferId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => column);
}

class $$PendingTransferSyncTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PendingTransferSyncTable,
    PendingTransferSyncRow,
    $$PendingTransferSyncTableFilterComposer,
    $$PendingTransferSyncTableOrderingComposer,
    $$PendingTransferSyncTableAnnotationComposer,
    $$PendingTransferSyncTableCreateCompanionBuilder,
    $$PendingTransferSyncTableUpdateCompanionBuilder,
    (
      PendingTransferSyncRow,
      BaseReferences<_$AppDatabase, $PendingTransferSyncTable,
          PendingTransferSyncRow>
    ),
    PendingTransferSyncRow,
    PrefetchHooks Function()> {
  $$PendingTransferSyncTableTableManager(
      _$AppDatabase db, $PendingTransferSyncTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingTransferSyncTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingTransferSyncTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingTransferSyncTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> localTransferId = const Value.absent(),
            Value<String?> serverTransferId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingTransferSyncCompanion(
            id: id,
            localTransferId: localTransferId,
            serverTransferId: serverTransferId,
            operation: operation,
            payload: payload,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String localTransferId,
            Value<String?> serverTransferId = const Value.absent(),
            required String operation,
            required String payload,
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingTransferSyncCompanion.insert(
            id: id,
            localTransferId: localTransferId,
            serverTransferId: serverTransferId,
            operation: operation,
            payload: payload,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PendingTransferSyncTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PendingTransferSyncTable,
    PendingTransferSyncRow,
    $$PendingTransferSyncTableFilterComposer,
    $$PendingTransferSyncTableOrderingComposer,
    $$PendingTransferSyncTableAnnotationComposer,
    $$PendingTransferSyncTableCreateCompanionBuilder,
    $$PendingTransferSyncTableUpdateCompanionBuilder,
    (
      PendingTransferSyncRow,
      BaseReferences<_$AppDatabase, $PendingTransferSyncTable,
          PendingTransferSyncRow>
    ),
    PendingTransferSyncRow,
    PrefetchHooks Function()>;
typedef $$TransferStockAdjustmentsTableCreateCompanionBuilder
    = TransferStockAdjustmentsCompanion Function({
  Value<int> id,
  required String productId,
  required String priceType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  required double quantityChange,
  required String transferId,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
});
typedef $$TransferStockAdjustmentsTableUpdateCompanionBuilder
    = TransferStockAdjustmentsCompanion Function({
  Value<int> id,
  Value<String> productId,
  Value<String> priceType,
  Value<String?> sackPriceId,
  Value<String?> perKiloPriceId,
  Value<double> quantityChange,
  Value<String> transferId,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
});

class $$TransferStockAdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $TransferStockAdjustmentsTable> {
  $$TransferStockAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priceType => $composableBuilder(
      column: $table.priceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transferId => $composableBuilder(
      column: $table.transferId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TransferStockAdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransferStockAdjustmentsTable> {
  $$TransferStockAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priceType => $composableBuilder(
      column: $table.priceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transferId => $composableBuilder(
      column: $table.transferId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TransferStockAdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransferStockAdjustmentsTable> {
  $$TransferStockAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get priceType =>
      $composableBuilder(column: $table.priceType, builder: (column) => column);

  GeneratedColumn<String> get sackPriceId => $composableBuilder(
      column: $table.sackPriceId, builder: (column) => column);

  GeneratedColumn<String> get perKiloPriceId => $composableBuilder(
      column: $table.perKiloPriceId, builder: (column) => column);

  GeneratedColumn<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange, builder: (column) => column);

  GeneratedColumn<String> get transferId => $composableBuilder(
      column: $table.transferId, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransferStockAdjustmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransferStockAdjustmentsTable,
    TransferStockAdjustmentRow,
    $$TransferStockAdjustmentsTableFilterComposer,
    $$TransferStockAdjustmentsTableOrderingComposer,
    $$TransferStockAdjustmentsTableAnnotationComposer,
    $$TransferStockAdjustmentsTableCreateCompanionBuilder,
    $$TransferStockAdjustmentsTableUpdateCompanionBuilder,
    (
      TransferStockAdjustmentRow,
      BaseReferences<_$AppDatabase, $TransferStockAdjustmentsTable,
          TransferStockAdjustmentRow>
    ),
    TransferStockAdjustmentRow,
    PrefetchHooks Function()> {
  $$TransferStockAdjustmentsTableTableManager(
      _$AppDatabase db, $TransferStockAdjustmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransferStockAdjustmentsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TransferStockAdjustmentsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransferStockAdjustmentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> priceType = const Value.absent(),
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            Value<double> quantityChange = const Value.absent(),
            Value<String> transferId = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TransferStockAdjustmentsCompanion(
            id: id,
            productId: productId,
            priceType: priceType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            quantityChange: quantityChange,
            transferId: transferId,
            isSynced: isSynced,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productId,
            required String priceType,
            Value<String?> sackPriceId = const Value.absent(),
            Value<String?> perKiloPriceId = const Value.absent(),
            required double quantityChange,
            required String transferId,
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TransferStockAdjustmentsCompanion.insert(
            id: id,
            productId: productId,
            priceType: priceType,
            sackPriceId: sackPriceId,
            perKiloPriceId: perKiloPriceId,
            quantityChange: quantityChange,
            transferId: transferId,
            isSynced: isSynced,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransferStockAdjustmentsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TransferStockAdjustmentsTable,
        TransferStockAdjustmentRow,
        $$TransferStockAdjustmentsTableFilterComposer,
        $$TransferStockAdjustmentsTableOrderingComposer,
        $$TransferStockAdjustmentsTableAnnotationComposer,
        $$TransferStockAdjustmentsTableCreateCompanionBuilder,
        $$TransferStockAdjustmentsTableUpdateCompanionBuilder,
        (
          TransferStockAdjustmentRow,
          BaseReferences<_$AppDatabase, $TransferStockAdjustmentsTable,
              TransferStockAdjustmentRow>
        ),
        TransferStockAdjustmentRow,
        PrefetchHooks Function()>;
typedef $$CachedBillCountsTableCreateCompanionBuilder
    = CachedBillCountsCompanion Function({
  required String id,
  Value<String?> localId,
  required String cashierId,
  required String cashierUsername,
  required String cashierBranchName,
  Value<double> beginningBalance,
  Value<bool> showBeginningBalance,
  required DateTime date,
  required String data,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CachedBillCountsTableUpdateCompanionBuilder
    = CachedBillCountsCompanion Function({
  Value<String> id,
  Value<String?> localId,
  Value<String> cashierId,
  Value<String> cashierUsername,
  Value<String> cashierBranchName,
  Value<double> beginningBalance,
  Value<bool> showBeginningBalance,
  Value<DateTime> date,
  Value<String> data,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CachedBillCountsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedBillCountsTable> {
  $$CachedBillCountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierUsername => $composableBuilder(
      column: $table.cashierUsername,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierBranchName => $composableBuilder(
      column: $table.cashierBranchName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get beginningBalance => $composableBuilder(
      column: $table.beginningBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get showBeginningBalance => $composableBuilder(
      column: $table.showBeginningBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedBillCountsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedBillCountsTable> {
  $$CachedBillCountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierId => $composableBuilder(
      column: $table.cashierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierUsername => $composableBuilder(
      column: $table.cashierUsername,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierBranchName => $composableBuilder(
      column: $table.cashierBranchName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get beginningBalance => $composableBuilder(
      column: $table.beginningBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get showBeginningBalance => $composableBuilder(
      column: $table.showBeginningBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedBillCountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedBillCountsTable> {
  $$CachedBillCountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get cashierId =>
      $composableBuilder(column: $table.cashierId, builder: (column) => column);

  GeneratedColumn<String> get cashierUsername => $composableBuilder(
      column: $table.cashierUsername, builder: (column) => column);

  GeneratedColumn<String> get cashierBranchName => $composableBuilder(
      column: $table.cashierBranchName, builder: (column) => column);

  GeneratedColumn<double> get beginningBalance => $composableBuilder(
      column: $table.beginningBalance, builder: (column) => column);

  GeneratedColumn<bool> get showBeginningBalance => $composableBuilder(
      column: $table.showBeginningBalance, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedBillCountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedBillCountsTable,
    CachedBillCountRow,
    $$CachedBillCountsTableFilterComposer,
    $$CachedBillCountsTableOrderingComposer,
    $$CachedBillCountsTableAnnotationComposer,
    $$CachedBillCountsTableCreateCompanionBuilder,
    $$CachedBillCountsTableUpdateCompanionBuilder,
    (
      CachedBillCountRow,
      BaseReferences<_$AppDatabase, $CachedBillCountsTable, CachedBillCountRow>
    ),
    CachedBillCountRow,
    PrefetchHooks Function()> {
  $$CachedBillCountsTableTableManager(
      _$AppDatabase db, $CachedBillCountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedBillCountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedBillCountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedBillCountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> localId = const Value.absent(),
            Value<String> cashierId = const Value.absent(),
            Value<String> cashierUsername = const Value.absent(),
            Value<String> cashierBranchName = const Value.absent(),
            Value<double> beginningBalance = const Value.absent(),
            Value<bool> showBeginningBalance = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedBillCountsCompanion(
            id: id,
            localId: localId,
            cashierId: cashierId,
            cashierUsername: cashierUsername,
            cashierBranchName: cashierBranchName,
            beginningBalance: beginningBalance,
            showBeginningBalance: showBeginningBalance,
            date: date,
            data: data,
            isSynced: isSynced,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> localId = const Value.absent(),
            required String cashierId,
            required String cashierUsername,
            required String cashierBranchName,
            Value<double> beginningBalance = const Value.absent(),
            Value<bool> showBeginningBalance = const Value.absent(),
            required DateTime date,
            required String data,
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedBillCountsCompanion.insert(
            id: id,
            localId: localId,
            cashierId: cashierId,
            cashierUsername: cashierUsername,
            cashierBranchName: cashierBranchName,
            beginningBalance: beginningBalance,
            showBeginningBalance: showBeginningBalance,
            date: date,
            data: data,
            isSynced: isSynced,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedBillCountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedBillCountsTable,
    CachedBillCountRow,
    $$CachedBillCountsTableFilterComposer,
    $$CachedBillCountsTableOrderingComposer,
    $$CachedBillCountsTableAnnotationComposer,
    $$CachedBillCountsTableCreateCompanionBuilder,
    $$CachedBillCountsTableUpdateCompanionBuilder,
    (
      CachedBillCountRow,
      BaseReferences<_$AppDatabase, $CachedBillCountsTable, CachedBillCountRow>
    ),
    CachedBillCountRow,
    PrefetchHooks Function()>;
typedef $$PendingBillCountSyncTableCreateCompanionBuilder
    = PendingBillCountSyncCompanion Function({
  Value<int> id,
  required String localBillCountId,
  required String operation,
  required String payload,
  required String dateFilter,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});
typedef $$PendingBillCountSyncTableUpdateCompanionBuilder
    = PendingBillCountSyncCompanion Function({
  Value<int> id,
  Value<String> localBillCountId,
  Value<String> operation,
  Value<String> payload,
  Value<String> dateFilter,
  Value<int> attempts,
  Value<String?> lastError,
  Value<DateTime> createdAt,
  Value<DateTime?> lastAttemptAt,
});

class $$PendingBillCountSyncTableFilterComposer
    extends Composer<_$AppDatabase, $PendingBillCountSyncTable> {
  $$PendingBillCountSyncTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localBillCountId => $composableBuilder(
      column: $table.localBillCountId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dateFilter => $composableBuilder(
      column: $table.dateFilter, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => ColumnFilters(column));
}

class $$PendingBillCountSyncTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingBillCountSyncTable> {
  $$PendingBillCountSyncTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localBillCountId => $composableBuilder(
      column: $table.localBillCountId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dateFilter => $composableBuilder(
      column: $table.dateFilter, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt,
      builder: (column) => ColumnOrderings(column));
}

class $$PendingBillCountSyncTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingBillCountSyncTable> {
  $$PendingBillCountSyncTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localBillCountId => $composableBuilder(
      column: $table.localBillCountId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get dateFilter => $composableBuilder(
      column: $table.dateFilter, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => column);
}

class $$PendingBillCountSyncTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PendingBillCountSyncTable,
    PendingBillCountSyncRow,
    $$PendingBillCountSyncTableFilterComposer,
    $$PendingBillCountSyncTableOrderingComposer,
    $$PendingBillCountSyncTableAnnotationComposer,
    $$PendingBillCountSyncTableCreateCompanionBuilder,
    $$PendingBillCountSyncTableUpdateCompanionBuilder,
    (
      PendingBillCountSyncRow,
      BaseReferences<_$AppDatabase, $PendingBillCountSyncTable,
          PendingBillCountSyncRow>
    ),
    PendingBillCountSyncRow,
    PrefetchHooks Function()> {
  $$PendingBillCountSyncTableTableManager(
      _$AppDatabase db, $PendingBillCountSyncTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingBillCountSyncTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingBillCountSyncTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingBillCountSyncTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> localBillCountId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<String> dateFilter = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingBillCountSyncCompanion(
            id: id,
            localBillCountId: localBillCountId,
            operation: operation,
            payload: payload,
            dateFilter: dateFilter,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String localBillCountId,
            required String operation,
            required String payload,
            required String dateFilter,
            Value<int> attempts = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastAttemptAt = const Value.absent(),
          }) =>
              PendingBillCountSyncCompanion.insert(
            id: id,
            localBillCountId: localBillCountId,
            operation: operation,
            payload: payload,
            dateFilter: dateFilter,
            attempts: attempts,
            lastError: lastError,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PendingBillCountSyncTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PendingBillCountSyncTable,
        PendingBillCountSyncRow,
        $$PendingBillCountSyncTableFilterComposer,
        $$PendingBillCountSyncTableOrderingComposer,
        $$PendingBillCountSyncTableAnnotationComposer,
        $$PendingBillCountSyncTableCreateCompanionBuilder,
        $$PendingBillCountSyncTableUpdateCompanionBuilder,
        (
          PendingBillCountSyncRow,
          BaseReferences<_$AppDatabase, $PendingBillCountSyncTable,
              PendingBillCountSyncRow>
        ),
        PendingBillCountSyncRow,
        PrefetchHooks Function()>;
typedef $$BillCountCacheMetaTableCreateCompanionBuilder
    = BillCountCacheMetaCompanion Function({
  required String key,
  Value<DateTime?> lastSyncAt,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$BillCountCacheMetaTableUpdateCompanionBuilder
    = BillCountCacheMetaCompanion Function({
  Value<String> key,
  Value<DateTime?> lastSyncAt,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$BillCountCacheMetaTableFilterComposer
    extends Composer<_$AppDatabase, $BillCountCacheMetaTable> {
  $$BillCountCacheMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncAt => $composableBuilder(
      column: $table.lastSyncAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$BillCountCacheMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $BillCountCacheMetaTable> {
  $$BillCountCacheMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncAt => $composableBuilder(
      column: $table.lastSyncAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$BillCountCacheMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $BillCountCacheMetaTable> {
  $$BillCountCacheMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAt => $composableBuilder(
      column: $table.lastSyncAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BillCountCacheMetaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BillCountCacheMetaTable,
    BillCountCacheMetaRow,
    $$BillCountCacheMetaTableFilterComposer,
    $$BillCountCacheMetaTableOrderingComposer,
    $$BillCountCacheMetaTableAnnotationComposer,
    $$BillCountCacheMetaTableCreateCompanionBuilder,
    $$BillCountCacheMetaTableUpdateCompanionBuilder,
    (
      BillCountCacheMetaRow,
      BaseReferences<_$AppDatabase, $BillCountCacheMetaTable,
          BillCountCacheMetaRow>
    ),
    BillCountCacheMetaRow,
    PrefetchHooks Function()> {
  $$BillCountCacheMetaTableTableManager(
      _$AppDatabase db, $BillCountCacheMetaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillCountCacheMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillCountCacheMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillCountCacheMetaTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<DateTime?> lastSyncAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BillCountCacheMetaCompanion(
            key: key,
            lastSyncAt: lastSyncAt,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            Value<DateTime?> lastSyncAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BillCountCacheMetaCompanion.insert(
            key: key,
            lastSyncAt: lastSyncAt,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BillCountCacheMetaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BillCountCacheMetaTable,
    BillCountCacheMetaRow,
    $$BillCountCacheMetaTableFilterComposer,
    $$BillCountCacheMetaTableOrderingComposer,
    $$BillCountCacheMetaTableAnnotationComposer,
    $$BillCountCacheMetaTableCreateCompanionBuilder,
    $$BillCountCacheMetaTableUpdateCompanionBuilder,
    (
      BillCountCacheMetaRow,
      BaseReferences<_$AppDatabase, $BillCountCacheMetaTable,
          BillCountCacheMetaRow>
    ),
    BillCountCacheMetaRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$CachedProductsTableTableManager get cachedProducts =>
      $$CachedProductsTableTableManager(_db, _db.cachedProducts);
  $$ProductCacheMetaTableTableManager get productCacheMeta =>
      $$ProductCacheMetaTableTableManager(_db, _db.productCacheMeta);
  $$CachedSalesTableTableManager get cachedSales =>
      $$CachedSalesTableTableManager(_db, _db.cachedSales);
  $$PendingSaleSyncTableTableManager get pendingSaleSync =>
      $$PendingSaleSyncTableTableManager(_db, _db.pendingSaleSync);
  $$LocalStockAdjustmentsTableTableManager get localStockAdjustments =>
      $$LocalStockAdjustmentsTableTableManager(_db, _db.localStockAdjustments);
  $$CachedDeliveriesTableTableManager get cachedDeliveries =>
      $$CachedDeliveriesTableTableManager(_db, _db.cachedDeliveries);
  $$DeliveryCacheMetaTableTableManager get deliveryCacheMeta =>
      $$DeliveryCacheMetaTableTableManager(_db, _db.deliveryCacheMeta);
  $$PendingDeliverySyncTableTableManager get pendingDeliverySync =>
      $$PendingDeliverySyncTableTableManager(_db, _db.pendingDeliverySync);
  $$DeliveryStockAdjustmentsTableTableManager get deliveryStockAdjustments =>
      $$DeliveryStockAdjustmentsTableTableManager(
          _db, _db.deliveryStockAdjustments);
  $$CachedTransfersTableTableManager get cachedTransfers =>
      $$CachedTransfersTableTableManager(_db, _db.cachedTransfers);
  $$TransferCacheMetaTableTableManager get transferCacheMeta =>
      $$TransferCacheMetaTableTableManager(_db, _db.transferCacheMeta);
  $$PendingTransferSyncTableTableManager get pendingTransferSync =>
      $$PendingTransferSyncTableTableManager(_db, _db.pendingTransferSync);
  $$TransferStockAdjustmentsTableTableManager get transferStockAdjustments =>
      $$TransferStockAdjustmentsTableTableManager(
          _db, _db.transferStockAdjustments);
  $$CachedBillCountsTableTableManager get cachedBillCounts =>
      $$CachedBillCountsTableTableManager(_db, _db.cachedBillCounts);
  $$PendingBillCountSyncTableTableManager get pendingBillCountSync =>
      $$PendingBillCountSyncTableTableManager(_db, _db.pendingBillCountSync);
  $$BillCountCacheMetaTableTableManager get billCountCacheMeta =>
      $$BillCountCacheMetaTableTableManager(_db, _db.billCountCacheMeta);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'18ce5c8c4d8ddbfe5a7d819d8fb7d5aca76bf416';

/// Provides the application database instance.
///
/// Usage:
/// ```dart
/// final database = ref.watch(appDatabaseProvider);
/// ```
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
