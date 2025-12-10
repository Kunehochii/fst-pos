import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/bill_count/data/datasources/bill_count_tables.dart';
import '../../features/delivery/data/datasources/delivery_tables.dart';
import '../../features/product/data/datasources/product_tables.dart';
import '../../features/sales/data/datasources/sales_tables.dart';
import '../../features/sheet/data/datasources/sheet_tables.dart';
import '../../features/stock/data/datasources/stock_tables.dart';

part 'app_database.g.dart';

/// Provides the application database instance.
///
/// Usage:
/// ```dart
/// final database = ref.watch(appDatabaseProvider);
/// ```
@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

/// Example table - replace with your actual tables
///
/// Tables should be defined here or imported from feature modules.
/// Use @DataClassName to customize the generated class name.
@DataClassName('SyncQueueItem')
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get targetTable => text()();
  TextColumn get operation => text()(); // 'create', 'update', 'delete'
  TextColumn get recordId => text()();
  TextColumn get payload => text()(); // JSON stringified data
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get syncedAt => dateTime().nullable()();
}

/// Main application database.
///
/// Add your tables to the `tables` list.
/// Increment `schemaVersion` when making schema changes.
///
/// For offline sync, use the SyncQueue table to queue changes
/// and sync them when the device is online.
@DriftDatabase(tables: [
  SyncQueue,
  CachedProducts,
  ProductCacheMeta,
  CachedSales,
  PendingSaleSync,
  LocalStockAdjustments,
  // Delivery tables
  CachedDeliveries,
  DeliveryCacheMeta,
  PendingDeliverySync,
  DeliveryStockAdjustments,
  // Stock/Transfer tables
  CachedTransfers,
  TransferCacheMeta,
  PendingTransferSync,
  TransferStockAdjustments,
  // Bill count tables
  CachedBillCounts,
  PendingBillCountSync,
  BillCountCacheMeta,
  // Sheet tables
  CachedSheets,
  SheetCacheMeta,
  PendingSheetRowSync,
  PendingSheetCellSync,
  SheetRowIdMappings,
  SheetCellIdMappings,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations here
        if (from < 2) {
          // Add product caching tables
          await m.createTable(cachedProducts);
          await m.createTable(productCacheMeta);
        }
        if (from < 3) {
          // Add sales caching tables
          await m.createTable(cachedSales);
          await m.createTable(pendingSaleSync);
          await m.createTable(localStockAdjustments);
        }
        if (from < 4) {
          // Add delivery caching tables
          await m.createTable(cachedDeliveries);
          await m.createTable(deliveryCacheMeta);
          await m.createTable(pendingDeliverySync);
          await m.createTable(deliveryStockAdjustments);
        }
        if (from < 5) {
          // Add transfer caching tables
          await m.createTable(cachedTransfers);
          await m.createTable(transferCacheMeta);
          await m.createTable(pendingTransferSync);
          await m.createTable(transferStockAdjustments);
        }
        if (from < 6) {
          // Add bill count caching tables
          await m.createTable(cachedBillCounts);
          await m.createTable(pendingBillCountSync);
          await m.createTable(billCountCacheMeta);
        }
        if (from < 7) {
          // Add sheet caching tables
          await m.createTable(cachedSheets);
          await m.createTable(sheetCacheMeta);
          await m.createTable(pendingSheetRowSync);
          await m.createTable(pendingSheetCellSync);
          await m.createTable(sheetRowIdMappings);
          await m.createTable(sheetCellIdMappings);
        }
      },
      beforeOpen: (details) async {
        // Run any initialization logic here
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  // ==================== Sync Queue Operations ====================

  /// Add an item to the sync queue.
  Future<int> addToSyncQueue({
    required String targetTable,
    required String operation,
    required String recordId,
    required String payload,
  }) async {
    return into(syncQueue).insert(SyncQueueCompanion.insert(
      targetTable: targetTable,
      operation: operation,
      recordId: recordId,
      payload: payload,
    ));
  }

  /// Get all unsynced items.
  Future<List<SyncQueueItem>> getUnsyncedItems() async {
    return (select(syncQueue)..where((t) => t.synced.equals(false))).get();
  }

  /// Mark an item as synced.
  Future<void> markAsSynced(int id) async {
    await (update(syncQueue)..where((t) => t.id.equals(id))).write(
      SyncQueueCompanion(
        synced: const Value(true),
        syncedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Clear synced items older than the specified duration.
  Future<int> clearOldSyncedItems(
      {Duration olderThan = const Duration(days: 7)}) async {
    final cutoff = DateTime.now().subtract(olderThan);
    return (delete(syncQueue)
          ..where((t) => t.synced.equals(true))
          ..where((t) => t.syncedAt.isSmallerThanValue(cutoff)))
        .go();
  }
}

/// Opens the database connection.
///
/// Uses different paths for web and native platforms.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fst_pos.db'));
    return NativeDatabase.createInBackground(file);
  });
}
