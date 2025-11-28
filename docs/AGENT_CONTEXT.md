# FST POS - Complete Project Reference

> **Single-file documentation for AI agent prompting. Include this file in your context for full project understanding.**

---

## Quick Facts

| Aspect | Value |
|--------|-------|
| **Project** | FST POS (Point of Sale) |
| **Platforms** | Android, Web only |
| **State Management** | Riverpod + riverpod_generator |
| **Routing** | GoRouter + go_router_builder |
| **UI Framework** | shadcn_ui + flutter_side_menu |
| **HTTP Client** | Dio with interceptors |
| **Local Database** | Drift (SQLite) |
| **Secure Storage** | flutter_secure_storage (JWT tokens) |
| **Code Generation** | freezed, json_serializable, drift_dev |
| **Environment** | flutter_dotenv (.env files) |

---

## Project Structure

```
lib/
├── main.dart                      # App entry point (Riverpod + GoRouter + shadcn_ui)
├── core/                          # Shared infrastructure
│   ├── core.dart                  # Barrel export
│   ├── config/
│   │   └── env_config.dart        # Environment variables from .env
│   ├── database/
│   │   └── app_database.dart      # Drift database + SyncQueue table
│   ├── errors/
│   │   ├── failure.dart           # Freezed union type for errors
│   │   └── app_exception.dart     # Exception classes + Dio mapper
│   ├── network/
│   │   ├── api_client.dart        # Dio provider with interceptors
│   │   ├── api_interceptors.dart  # Auth + Retry interceptors
│   │   └── api_endpoints.dart     # Centralized endpoint constants
│   ├── router/
│   │   └── app_router.dart        # GoRouter config + route constants
│   ├── storage/
│   │   └── secure_storage.dart    # JWT token storage wrapper
│   └── utils/
│       └── logger.dart            # Debug logging utility
├── features/                      # Feature modules (clean architecture)
│   ├── features.dart              # Barrel export
│   └── [feature_name]/
│       ├── [feature_name].dart    # Feature barrel export
│       ├── data/
│       │   ├── datasources/       # Remote + Local data sources
│       │   ├── models/            # API models (fromJson/toJson)
│       │   └── repositories/      # Repository implementations
│       ├── domain/
│       │   ├── entities/          # Business entities (freezed)
│       │   ├── repositories/      # Repository interfaces
│       │   └── usecases/          # Business logic
│       └── presentation/
│           ├── pages/             # Screen widgets
│           ├── widgets/           # Feature-specific widgets
│           └── providers/         # Riverpod providers
└── shared/                        # Shared components
    ├── shared.dart                # Barrel export
    └── widgets/
        ├── widgets.dart           # Barrel export
        └── main_layout.dart       # Sidebar navigation shell
```

---

## Architecture Rules

### Layer Dependencies
```
Presentation → Domain → Data
     ↓            ↓        ↓
  (providers)  (entities) (models)
  (pages)      (repos)    (datasources)
  (widgets)    (usecases) (repos impl)
```

- **Domain layer has NO dependencies** on other layers
- **Data layer implements** domain interfaces
- **Presentation layer uses** domain interfaces via Riverpod DI

### File Naming
- `snake_case` for all files
- Suffix by type: `_page.dart`, `_widget.dart`, `_provider.dart`, `_model.dart`, `_entity.dart`, `_repository.dart`, `_repository_impl.dart`, `_datasource.dart`

---

## Key Patterns

### 1. Riverpod Providers (use @riverpod annotation)

```dart
// Simple provider (dependency injection)
@riverpod
ProductRepository productRepository(Ref ref) {
  final api = ref.watch(apiClientProvider);
  final db = ref.watch(appDatabaseProvider);
  return ProductRepositoryImpl(api, db);
}

// Async provider (data fetching)
@riverpod
Future<List<Product>> products(Ref ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProducts();
}

// Notifier provider (mutable state)
@riverpod
class Cart extends _$Cart {
  @override
  CartState build() => const CartState(items: []);
  
  void addItem(Product product) {
    state = state.copyWith(items: [...state.items, product]);
  }
}
```

### 2. Freezed Models

```dart
// Entity (domain layer)
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
    @Default(0) int quantity,
  }) = _Product;
}

// Model with JSON (data layer)
@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  
  const factory ProductModel({
    required String id,
    required String name,
    required double price,
    @JsonKey(name: 'stock_qty') @Default(0) int quantity,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  
  Product toEntity() => Product(id: id, name: name, price: price, quantity: quantity);
}
```

### 3. Error Handling (Failure union type)

```dart
// In repository
Future<(Failure?, List<Product>?)> getProducts() async {
  try {
    final data = await _remote.getProducts();
    return (null, data.map((m) => m.toEntity()).toList());
  } on DioException catch (e) {
    return (e.toAppException().toFailure(), null);
  }
}

// In UI
final (failure, products) = await repository.getProducts();
if (failure != null) {
  // Handle error
  return;
}
// Use products!
```

### 4. Offline-First with SyncQueue

```dart
// Save locally first, queue for sync
Future<Product> createProduct(Product product) async {
  await _db.insertProduct(product.toDbModel());
  
  try {
    return await _remote.createProduct(product.toApiModel());
  } on DioException {
    // Queue for later sync
    await _db.addToSyncQueue(
      targetTable: 'products',
      operation: 'create',
      recordId: product.id,
      payload: jsonEncode(product.toJson()),
    );
    return product;
  }
}
```

### 5. GoRouter Routes

```dart
// In app_router.dart - add routes inside ShellRoute
GoRoute(
  path: '/products',
  name: 'products',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: ProductListPage(),
  ),
),

// Navigation
context.go(AppRoutes.products);      // Replace
context.push(AppRoutes.products);    // Push
context.pop();                       // Back
```

### 6. API Calls with Dio

```dart
class ProductRemoteDataSource {
  final Dio _dio;
  ProductRemoteDataSource(this._dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('/products');
    return (response.data['data'] as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }

  Future<ProductModel> createProduct(ProductModel product) async {
    final response = await _dio.post('/products', data: product.toJson());
    return ProductModel.fromJson(response.data['data']);
  }
}
```

---

## Available Core Providers

| Provider | Type | Description |
|----------|------|-------------|
| `apiClientProvider` | `Dio` | Configured HTTP client with auth |
| `appDatabaseProvider` | `AppDatabase` | Drift database instance |
| `secureStorageProvider` | `SecureStorage` | Token storage |
| `appRouterProvider` | `GoRouter` | App router instance |

---

## Environment Configuration

Files: `.env`, `.env.development`, `.env.production`

```env
API_BASE_URL=http://localhost:3000/api
API_TIMEOUT=30000
DEBUG_MODE=true
```

Access via:
```dart
EnvConfig.apiBaseUrl    // String
EnvConfig.apiTimeout    // int (milliseconds)
EnvConfig.debugMode     // bool
```

---

## Secure Storage Keys

```dart
StorageKeys.accessToken   // JWT access token
StorageKeys.refreshToken  // JWT refresh token
StorageKeys.userId        // Current user ID
```

Methods:
```dart
await storage.saveAccessToken(token);
await storage.getAccessToken();
await storage.isLoggedIn();
await storage.clearAll();
```

---

## Database (Drift)

### SyncQueue Table (built-in for offline sync)
| Column | Type | Description |
|--------|------|-------------|
| id | int | Auto-increment PK |
| targetTable | String | Table name |
| operation | String | 'create', 'update', 'delete' |
| recordId | String | Record identifier |
| payload | String | JSON data |
| createdAt | DateTime | Timestamp |
| synced | bool | Sync status |
| syncedAt | DateTime? | When synced |

### Adding Tables
```dart
// In app_database.dart
@DataClassName('Product')
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  
  @override
  Set<Column> get primaryKey => {id};
}

// Add to database annotation
@DriftDatabase(tables: [SyncQueue, Products])
class AppDatabase extends _$AppDatabase { ... }
```

---

## Commands

```bash
# Install dependencies
flutter pub get

# Generate code (REQUIRED after adding/modifying freezed/drift/riverpod)
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate during development)
dart run build_runner watch --delete-conflicting-outputs

# Run app
flutter run -d android
flutter run -d chrome

# Build
flutter build apk --release
flutter build web --release
```

---

## Creating a New Feature Checklist

1. **Create folder structure:**
   ```
   lib/features/[name]/
   ├── [name].dart
   ├── data/datasources/
   ├── data/models/
   ├── data/repositories/
   ├── domain/entities/
   ├── domain/repositories/
   ├── domain/usecases/
   └── presentation/pages/providers/widgets/
   ```

2. **Domain layer first:**
   - Create entity with `@freezed`
   - Define repository interface

3. **Data layer:**
   - Create model with `@freezed` + `fromJson`
   - Implement datasources (remote/local)
   - Implement repository

4. **Presentation layer:**
   - Create providers with `@riverpod`
   - Build pages and widgets

5. **Register route** in `app_router.dart`

6. **Export in barrel** files

7. **Run code generation:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

---

## UI Components

### Main Layout (Sidebar)
All pages are wrapped in `MainLayout` via GoRouter's `ShellRoute`. The sidebar uses `flutter_side_menu`.

### shadcn_ui
Import: `import 'package:shadcn_ui/shadcn_ui.dart';`

Use shadcn_ui components for consistent styling. See: https://flutter-shadcn-ui.mariuti.com

---

## Auth Flow (Template)

```dart
// Login
final response = await _dio.post('/auth/login', data: credentials);
await _storage.saveAccessToken(response.data['accessToken']);
await _storage.saveRefreshToken(response.data['refreshToken']);

// Logout
await _storage.clearAll();
context.go('/login');

// Check auth state
final isLoggedIn = await _storage.isLoggedIn();
```

The `AuthInterceptor` automatically:
- Adds `Authorization: Bearer <token>` header
- Skip with `options.extra['skipAuth'] = true`

---

## Failure Types

```dart
Failure.server(message: '...', statusCode: 500)
Failure.network(message: 'No internet')
Failure.cache(message: '...')
Failure.auth(message: 'Unauthorized')
Failure.validation(message: '...', fieldErrors: {...})
Failure.unknown(message: '...')
```

---

## Best Practices

1. **Always use providers** for dependency injection
2. **Watch in build, read in callbacks** (Riverpod rule)
3. **Handle all error states** with Failure types
4. **Cache API responses** in local database
5. **Queue offline changes** in SyncQueue
6. **Run code generation** after model changes
7. **Use const constructors** where possible
8. **Document public APIs** with /// comments

---

## File Locations Reference

| Need | Location |
|------|----------|
| Add API endpoint | `lib/core/network/api_endpoints.dart` |
| Add route | `lib/core/router/app_router.dart` |
| Add database table | `lib/core/database/app_database.dart` |
| Add env variable | `.env` files + `lib/core/config/env_config.dart` |
| Add storage key | `lib/core/storage/secure_storage.dart` |
| Add sidebar item | `lib/shared/widgets/main_layout.dart` |

---

*Last updated: November 28, 2025*
