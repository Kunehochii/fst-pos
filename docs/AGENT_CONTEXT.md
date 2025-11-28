# FST POS - Complete Project Reference

> **Single-file documentation for AI agent prompting. Include this file in your context for full project understanding.**

---

## Quick Facts

| Aspect               | Value                                      |
| -------------------- | ------------------------------------------ |
| **Project**          | FST POS (Point of Sale)                    |
| **Platforms**        | Android, Web only                          |
| **State Management** | Riverpod + riverpod_generator              |
| **Routing**          | GoRouter + go_router_builder               |
| **UI Framework**     | shadcn_flutter + flutter_side_menu         |
| **Theme**            | Custom FST color scheme (Deep Navy + Teal) |
| **HTTP Client**      | Dio with interceptors                      |
| **Local Database**   | Drift (SQLite)                             |
| **Secure Storage**   | flutter_secure_storage (JWT tokens)        |
| **Code Generation**  | freezed, json_serializable, drift_dev      |
| **Environment**      | flutter_dotenv (.env files)                |

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
│   ├── theme/
│   │   ├── app_colors.dart        # Raw color palette for custom widgets
│   │   └── app_color_scheme.dart  # shadcn_flutter theme configuration
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

| Provider                | Type            | Description                      |
| ----------------------- | --------------- | -------------------------------- |
| `apiClientProvider`     | `Dio`           | Configured HTTP client with auth |
| `appDatabaseProvider`   | `AppDatabase`   | Drift database instance          |
| `secureStorageProvider` | `SecureStorage` | Token storage                    |
| `appRouterProvider`     | `GoRouter`      | App router instance              |

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

| Column      | Type      | Description                  |
| ----------- | --------- | ---------------------------- |
| id          | int       | Auto-increment PK            |
| targetTable | String    | Table name                   |
| operation   | String    | 'create', 'update', 'delete' |
| recordId    | String    | Record identifier            |
| payload     | String    | JSON data                    |
| createdAt   | DateTime  | Timestamp                    |
| synced      | bool      | Sync status                  |
| syncedAt    | DateTime? | When synced                  |

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

### Design Philosophy

The FST POS app follows a **modern, minimal, and clean design** philosophy inspired by shadcn/ui principles:

**Core Principles:**

1. **Simplicity over complexity** - Clean interfaces with purposeful whitespace
2. **Subtle depth** - Light shadows and borders instead of heavy gradients
3. **Consistent spacing** - Generous padding (16-28px) for breathing room
4. **Professional color palette** - Deep Navy primary with white foreground
5. **Clear hierarchy** - Typography and color establish visual importance
6. **Smooth interactions** - Gentle transitions and loading states

**Visual Guidelines:**

- **Cards**: White background, subtle border (`AppColors.border`), soft shadow, 16px border radius
- **Buttons**: Primary uses deep navy blue with white text; secondary uses muted backgrounds
- **Forms**: Clear labels above inputs, adequate spacing (20px between fields)
- **Icons**: Use Lucide icons consistently at 18-20px for inline, 32-36px for featured
- **Text**: Dark foreground for content, muted foreground for secondary text
- **Backgrounds**: Subtle gradients (white to muted) for visual interest without distraction

**Component Patterns:**

- Login/auth pages: Centered card with logo icon above, subtle gradient background
- Sidebar: Primary navy background with white text/icons, accent highlight for selection
- Content areas: Clean white background with structured card layouts
- Toasts: Surface cards with icon + title + message pattern

### Main Layout (Sidebar)

All pages are wrapped in `MainLayout` via GoRouter's `ShellRoute`. The sidebar uses `flutter_side_menu` with a **deep navy blue (primary)** background and **white** text/icons for high contrast and professional appearance.

```dart
// Sidebar styling
SideMenu(
  backgroundColor: AppColors.primary,
  // Menu items with white foreground
  icon: Icon(Icons.dashboard, color: AppColors.primaryForeground),
  titleStyle: TextStyle(color: AppColors.primaryForeground),
  highlightSelectedColor: AppColors.sidebarAccent,
)
```

### shadcn_flutter

Import: `import 'package:shadcn_flutter/shadcn_flutter.dart';`

Use shadcn_flutter components for consistent styling.

**Note:** This package exports widgets that conflict with Flutter Material. Hide conflicting names:

```dart
import 'package:flutter/material.dart' hide TextField, Card, Scaffold, ...;
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

Key differences from Material:

- `Scaffold(child: ...)` instead of `Scaffold(body: ...)`
- `TextField(placeholder: Widget(...))` instead of `InputDecoration`
- `InputFeature.leading(icon)` for input icons
- `InputFeature.passwordToggle()` for password visibility
- Text modifiers: `.h2()`, `.muted()`, `.semiBold()`, `.textCenter()`
- `PrimaryButton`, `SecondaryButton`, `GhostButton`, `DestructiveButton`

---

## Design System & Color Scheme

The app uses a unified color scheme derived from the FST admin dashboard for visual consistency across all platforms.

### Color Palette

| Color           | Hex       | OKLCH                       | Usage                                     |
| --------------- | --------- | --------------------------- | ----------------------------------------- |
| **Primary**     | `#1A3A6E` | `oklch(0.35 0.18 250)`      | Deep Navy Blue - buttons, links, emphasis |
| **Secondary**   | `#2BA5A5` | `oklch(0.65 0.15 195)`      | Vibrant Teal - accents, highlights        |
| **Background**  | `#FDFDFD` | `oklch(0.995 0 0)`          | Clean white main background               |
| **Foreground**  | `#171717` | `oklch(0.145 0 0)`          | Near black text                           |
| **Muted**       | `#F5F5F7` | `oklch(0.97 0.005 250)`     | Subtle backgrounds with blue tint         |
| **Destructive** | `#DC2626` | `oklch(0.577 0.245 27.325)` | Red for errors/delete actions             |
| **Border**      | `#E5E5EB` | `oklch(0.92 0.01 250)`      | Subtle border with blue tint              |
| **Sidebar**     | `#0F1E3D` | `oklch(0.25 0.12 250)`      | Deep navy sidebar background              |

### Chart Colors

| Color   | Hex       | Usage  |
| ------- | --------- | ------ |
| Chart 1 | `#2952A3` | Blue   |
| Chart 2 | `#2BA5A5` | Teal   |
| Chart 3 | `#34B870` | Green  |
| Chart 4 | `#D97B2A` | Orange |
| Chart 5 | `#A855B8` | Purple |

### Theme Configuration

The theme is configured in `main.dart` using a custom color scheme:

```dart
import 'core/theme/app_color_scheme.dart';

ShadcnApp.router(
  themeMode: ThemeMode.light,
  theme: ThemeData(
    colorScheme: AppColorScheme.light,
    radius: 0.8,
  ),
  // ...
)
```

### Using Colors

#### For shadcn_flutter Components

Colors are applied automatically via the theme. Access theme colors in widgets:

```dart
final theme = Theme.of(context);
Container(
  color: theme.colorScheme.primary,
  child: Text('Hello', style: TextStyle(color: theme.colorScheme.primaryForeground)),
)
```

#### For Custom/Non-shadcn_flutter Widgets

Use `AppColors` for direct color access:

```dart
import 'package:fst_pos/core/theme/app_colors.dart';

Container(
  decoration: BoxDecoration(
    color: AppColors.sidebar,
    border: Border.all(color: AppColors.sidebarBorder),
  ),
  child: Text(
    'Sidebar Item',
    style: TextStyle(color: AppColors.sidebarForeground),
  ),
)
```

### Semantic Colors

| Name        | Color     | Usage                         |
| ----------- | --------- | ----------------------------- |
| Success     | `#22C55E` | Success states, confirmations |
| Warning     | `#F59E0B` | Warnings, cautions            |
| Info        | `#3B82F6` | Informational messages        |
| Destructive | `#DC2626` | Errors, delete actions        |

### Design Tokens

| Token      | Value | Description                           |
| ---------- | ----- | ------------------------------------- |
| `radiusLg` | 16px  | Large border radius (cards, dialogs)  |
| `radiusMd` | 14px  | Medium border radius                  |
| `radiusSm` | 12px  | Small border radius (buttons, inputs) |
| `radiusXl` | 20px  | Extra large border radius             |

---

## Auth Flow (Cashier Authentication)

The auth system is designed for **offline-first** operation. Cashiers can log in once and continue using the app without network access (for up to 7 days).

### Architecture Overview

```
lib/features/auth/
├── auth.dart                          # Barrel export
├── data/
│   ├── datasources/
│   │   ├── auth_remote_datasource.dart   # API calls (login, me)
│   │   └── auth_local_datasource.dart    # SharedPreferences cache
│   ├── models/
│   │   └── cashier_model.dart            # API DTOs (LoginRequest, LoginResponse, CashierModel)
│   └── repositories/
│       └── auth_repository_impl.dart     # Offline-first implementation
├── domain/
│   ├── entities/
│   │   └── cashier.dart                  # Cashier entity + AuthState union
│   └── repositories/
│       └── auth_repository.dart          # Repository interface
└── presentation/
    ├── pages/
    │   └── login_page.dart               # Login screen
    └── providers/
        └── auth_provider.dart            # Riverpod state management
```

### Key Providers

| Provider                  | Type                       | Description                               |
| ------------------------- | -------------------------- | ----------------------------------------- |
| `authNotifierProvider`    | `AsyncNotifier<AuthState>` | Main auth state with login/logout actions |
| `currentCashierProvider`  | `Cashier?`                 | Currently logged-in cashier               |
| `isAuthenticatedProvider` | `bool`                     | Quick auth check                          |
| `isOfflineModeProvider`   | `bool`                     | True when using cached session            |
| `authRepositoryProvider`  | `AuthRepository`           | Repository for DI                         |

### AuthState Union

```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated({
    required Cashier cashier,
    @Default(false) bool isOffline,
  }) = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.loading() = AuthLoading;
}
```

### Usage Examples

#### 1. Check Authentication in Widgets

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isAuthenticatedProvider);
    final cashier = ref.watch(currentCashierProvider);
    final isOffline = ref.watch(isOfflineModeProvider);

    if (!isLoggedIn) {
      return const Text('Not logged in');
    }

    return Column(
      children: [
        Text('Welcome, ${cashier?.username}'),
        if (isOffline) const Text('(Offline Mode)'),
      ],
    );
  }
}
```

#### 2. Perform Login

```dart
await ref.read(authNotifierProvider.notifier).login(
  username: 'cashier1',
  accessKey: 'secret123',
);

// Check result
final authState = ref.read(authNotifierProvider);
authState.whenOrNull(
  data: (state) => state.whenOrNull(
    authenticated: (cashier, _) => context.go(AppRoutes.home),
  ),
  error: (error, _) => showError(error),
);
```

#### 3. Perform Logout

```dart
await ref.read(authNotifierProvider.notifier).logout();
// Router will automatically redirect to login via auth guard
```

#### 4. Protect API Calls with Auth Check

```dart
Future<void> fetchData() async {
  final isLoggedIn = ref.read(isAuthenticatedProvider);
  if (!isLoggedIn) {
    throw AuthException('Not authenticated');
  }
  // Proceed with API call...
}
```

#### 5. Listen to Auth Changes

```dart
ref.listen(authNotifierProvider, (previous, next) {
  next.whenOrNull(
    data: (state) => state.whenOrNull(
      unauthenticated: () => context.go(AppRoutes.login),
    ),
  );
});
```

### Router Integration

The `GoRouter` automatically protects routes:

```dart
redirect: (context, state) {
  final authState = ref.read(authNotifierProvider);
  final isAuthenticated = authState.valueOrNull?.maybeWhen(
    authenticated: (_, __) => true,
    orElse: () => false,
  ) ?? false;

  final isLoginRoute = state.matchedLocation == AppRoutes.login;

  if (!isAuthenticated && !isLoginRoute) {
    return AppRoutes.login; // Force login
  }
  if (isAuthenticated && isLoginRoute) {
    return AppRoutes.home; // Already logged in
  }
  return null;
}
```

### Offline Session Validity

Sessions cached in SharedPreferences are valid for **7 days**:

```dart
// In AuthRepositoryImpl
bool _isSessionValid(String? loginTimeStr) {
  if (loginTimeStr == null) return false;
  final loginTime = DateTime.parse(loginTimeStr);
  final now = DateTime.now();
  return now.difference(loginTime).inDays < 7;
}
```

### API Endpoints

| Endpoint              | Method | Description                     |
| --------------------- | ------ | ------------------------------- |
| `/auth/cashier/login` | POST   | Login with username + accessKey |
| `/auth/cashier/me`    | GET    | Get current cashier profile     |

### Storage Keys

```dart
// SharedPreferences (cached session)
'cached_cashier'      // JSON-encoded CashierModel
'login_time'          // ISO8601 timestamp

// SecureStorage (tokens)
StorageKeys.accessToken   // JWT token
```

### Adding Auth to New Features

When creating features that require authentication:

1. **Check auth state** before making API calls
2. **Use `isOfflineModeProvider`** to show offline indicators
3. **Handle `Failure.auth`** to trigger re-login
4. **Access cashier info** via `currentCashierProvider`

Example:

```dart
@riverpod
Future<List<Order>> orders(Ref ref) async {
  final isLoggedIn = ref.watch(isAuthenticatedProvider);
  if (!isLoggedIn) {
    throw StateError('Must be authenticated');
  }

  final cashier = ref.watch(currentCashierProvider);
  final repository = ref.watch(orderRepositoryProvider);

  // Filter orders by cashier's branch
  return repository.getOrdersByBranch(cashier!.businessId);
}
```

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

The `AuthInterceptor` automatically:

- Adds `Authorization: Bearer <token>` header
- Skip with `options.extra['skipAuth'] = true`

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

| Need               | Location                                                        |
| ------------------ | --------------------------------------------------------------- |
| Add API endpoint   | `lib/core/network/api_endpoints.dart`                           |
| Add route          | `lib/core/router/app_router.dart`                               |
| Add database table | `lib/core/database/app_database.dart`                           |
| Add env variable   | `.env` files + `lib/core/config/env_config.dart`                |
| Add storage key    | `lib/core/storage/secure_storage.dart`                          |
| Add sidebar item   | `lib/shared/widgets/main_layout.dart`                           |
| Add/modify colors  | `lib/core/theme/app_colors.dart`                                |
| Add/modify theme   | `lib/core/theme/app_color_scheme.dart`                          |
| Auth providers     | `lib/features/auth/presentation/providers/auth_provider.dart`   |
| Auth repository    | `lib/features/auth/data/repositories/auth_repository_impl.dart` |
| Login page         | `lib/features/auth/presentation/pages/login_page.dart`          |

---

_Last updated: November 28, 2025_
