# Database Guide (Drift)

## Overview

This project uses **Drift** (formerly Moor) for local SQLite database with type-safe queries and offline support.

## Database Setup

The database is configured in `lib/core/database/app_database.dart`.

### Defining Tables

```dart
@DataClassName('Product')
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get sku => text()();
  RealColumn get price => real()();
  TextColumn get description => text().nullable()();
  IntColumn get stockQuantity => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
```

### Column Types

| Dart Type | Drift Column | SQL Type |
|-----------|--------------|----------|
| `int` | `integer()` | INTEGER |
| `double` | `real()` | REAL |
| `String` | `text()` | TEXT |
| `bool` | `boolean()` | INTEGER (0/1) |
| `DateTime` | `dateTime()` | TEXT (ISO8601) |
| `Uint8List` | `blob()` | BLOB |

### Column Modifiers

```dart
// Nullable column
TextColumn get description => text().nullable()();

// Default value
IntColumn get quantity => integer().withDefault(const Constant(0))();

// Auto-increment
IntColumn get id => integer().autoIncrement()();

// Unique constraint
TextColumn get sku => text().unique()();

// Custom constraint
TextColumn get email => text().check(email.contains('@'))();
```

## Database Class

```dart
@DriftDatabase(tables: [Products, Orders, OrderItems, Customers, SyncQueue])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
    onUpgrade: (m, from, to) async {
      // Handle migrations
      if (from < 2) {
        await m.addColumn(products, products.newColumn);
      }
    },
  );
}
```

## CRUD Operations

### Create

```dart
Future<int> insertProduct(ProductsCompanion product) {
  return into(products).insert(product);
}

// Usage
await db.insertProduct(ProductsCompanion.insert(
  id: 'prod-123',
  name: 'Widget',
  sku: 'WGT-001',
  price: 29.99,
));
```

### Read

```dart
// Get all
Future<List<Product>> getAllProducts() {
  return select(products).get();
}

// Get by ID
Future<Product?> getProductById(String id) {
  return (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();
}

// Query with filters
Future<List<Product>> getActiveProducts() {
  return (select(products)
    ..where((p) => p.isActive.equals(true))
    ..orderBy([(p) => OrderingTerm.asc(p.name)]))
    .get();
}

// Watch for changes (returns Stream)
Stream<List<Product>> watchProducts() {
  return select(products).watch();
}
```

### Update

```dart
Future<bool> updateProduct(Product product) {
  return update(products).replace(product);
}

// Partial update
Future<int> updateProductPrice(String id, double newPrice) {
  return (update(products)..where((p) => p.id.equals(id)))
      .write(ProductsCompanion(price: Value(newPrice)));
}
```

### Delete

```dart
Future<int> deleteProduct(String id) {
  return (delete(products)..where((p) => p.id.equals(id))).go();
}

Future<int> deleteAllProducts() {
  return delete(products).go();
}
```

## Sync Queue

The `SyncQueue` table tracks offline changes for later synchronization:

```dart
@DataClassName('SyncQueueItem')
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tableName => text()();
  TextColumn get operation => text()(); // 'create', 'update', 'delete'
  TextColumn get recordId => text()();
  TextColumn get payload => text()(); // JSON data
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get syncedAt => dateTime().nullable()();
}
```

### Adding to Sync Queue

```dart
Future<int> addToSyncQueue({
  required String tableName,
  required String operation,
  required String recordId,
  required String payload,
}) {
  return into(syncQueue).insert(SyncQueueCompanion.insert(
    tableName: tableName,
    operation: operation,
    recordId: recordId,
    payload: payload,
  ));
}
```

### Processing Sync Queue

```dart
Future<void> syncPendingChanges() async {
  final pending = await getUnsyncedItems();
  
  for (final item in pending) {
    try {
      switch (item.operation) {
        case 'create':
          await _remote.create(item.tableName, jsonDecode(item.payload));
          break;
        case 'update':
          await _remote.update(item.tableName, item.recordId, jsonDecode(item.payload));
          break;
        case 'delete':
          await _remote.delete(item.tableName, item.recordId);
          break;
      }
      await markAsSynced(item.id);
    } catch (e) {
      // Log error, will retry on next sync
    }
  }
}
```

## Offline-First Pattern

### Repository Implementation

```dart
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;
  final AppDatabase _db;

  @override
  Future<(Failure?, List<Product>?)> getProducts() async {
    try {
      // Try remote first
      final remoteProducts = await _remote.getProducts();
      
      // Cache locally
      for (final product in remoteProducts) {
        await _db.insertOrUpdateProduct(product.toDbModel());
      }
      
      return (null, remoteProducts.map((p) => p.toEntity()).toList());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        // Return cached data on network error
        final cached = await _db.getAllProducts();
        return (null, cached.map((p) => p.toEntity()).toList());
      }
      return (e.toAppException().toFailure(), null);
    }
  }

  @override
  Future<(Failure?, Product?)> createProduct(Product product) async {
    // Save locally first
    final dbModel = product.toDbModel();
    await _db.insertProduct(dbModel);
    
    try {
      // Sync to remote
      final remote = await _remote.createProduct(product.toApiModel());
      return (null, remote.toEntity());
    } on DioException {
      // Queue for later sync
      await _db.addToSyncQueue(
        tableName: 'products',
        operation: 'create',
        recordId: product.id,
        payload: jsonEncode(product.toApiModel().toJson()),
      );
      return (null, product);
    }
  }
}
```

## Transactions

```dart
Future<void> createOrderWithItems(Order order, List<OrderItem> items) async {
  await db.transaction(() async {
    await db.insertOrder(order);
    for (final item in items) {
      await db.insertOrderItem(item);
    }
    // Update stock quantities
    for (final item in items) {
      await db.decrementProductStock(item.productId, item.quantity);
    }
  });
}
```

## Joins

```dart
Future<List<OrderWithItems>> getOrdersWithItems() async {
  final query = select(orders).join([
    leftOuterJoin(orderItems, orderItems.orderId.equalsExp(orders.id)),
    leftOuterJoin(products, products.id.equalsExp(orderItems.productId)),
  ]);
  
  final results = await query.get();
  // Process and return
}
```

## Custom Queries

```dart
Future<double> getTotalSalesForDay(DateTime date) async {
  final startOfDay = DateTime(date.year, date.month, date.day);
  final endOfDay = startOfDay.add(const Duration(days: 1));
  
  final result = await customSelect(
    'SELECT SUM(total) as total FROM orders WHERE created_at >= ? AND created_at < ?',
    variables: [
      Variable.withDateTime(startOfDay),
      Variable.withDateTime(endOfDay),
    ],
  ).getSingle();
  
  return result.read<double?>('total') ?? 0.0;
}
```

## Code Generation

After modifying tables, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Agent Instructions

When working with database:

1. **Add tables to @DriftDatabase** - Include in tables list
2. **Use companion classes for inserts** - `ProductsCompanion.insert(...)`
3. **Handle migrations** - Increment schemaVersion, add migration logic
4. **Use transactions for multi-table updates** - Ensure consistency
5. **Cache remote data locally** - Support offline access
6. **Queue offline changes** - Use SyncQueue for later sync
7. **Watch for reactive updates** - Use `.watch()` for live data
