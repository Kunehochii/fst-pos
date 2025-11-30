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
| **UI Framework**     | Flutter Material + flutter_side_menu       |
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
├── main.dart                      # App entry point (Riverpod + GoRouter + Material)
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
│   │   └── app_theme.dart         # Material theme configuration
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
        ├── app_button.dart        # Primary/secondary/ghost buttons
        ├── app_card.dart          # Styled card container
        ├── app_icon_box.dart      # Icon with background
        ├── app_loading.dart       # Loading indicators
        ├── app_text_field.dart    # Styled text input
        ├── app_toast.dart         # Toast notifications
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

The error handling system is designed to work with NestJS backend responses.

#### NestJS Error Response Formats

Standard error (401, 403, 404, 500, etc.):
```json
{
  "message": "Invalid credentials",
  "error": "Unauthorized",
  "statusCode": 401
}
```

Validation error (400, 422):
```json
{
  "message": "Validation failed",
  "errors": [
    {
      "expected": "object",
      "code": "invalid_type",
      "path": ["fieldName"],
      "message": "Invalid input: expected object, received string"
    }
  ]
}
```

#### Failure Types

```dart
// Available failure types
Failure.server(message: 'Error', statusCode: 500)  // Server errors
Failure.network(message: 'No connection')          // Network issues
Failure.cache(message: 'Cache error')              // Local storage errors
Failure.auth(message: 'Unauthorized')              // 401 auth errors
Failure.validation(                                 // Validation errors
  message: 'Validation failed',
  errors: [ValidationErrorDetail(...)],
)
Failure.unknown(message: 'Error')                  // Fallback
```

#### In Repository

```dart
Future<(Failure?, List<Product>?)> getProducts() async {
  try {
    final data = await _remote.getProducts();
    return (null, data.map((m) => m.toEntity()).toList());
  } on DioException catch (e) {
    return (e.toAppException().toFailure(), null);
  }
}
```

#### In UI - Handling Errors

```dart
final (failure, products) = await repository.getProducts();
if (failure != null) {
  // Pattern match on failure type
  failure.when(
    server: (message, statusCode) => AppToast.error(context, title: 'Server Error', message: message),
    network: (message) => AppToast.error(context, title: 'Network Error', message: message),
    auth: (message) => context.go(AppRoutes.login),
    validation: (message, fieldErrors, errors) {
      // Handle validation errors
      if (errors != null && errors.isNotEmpty) {
        for (final error in errors) {
          print('Field: ${error.fieldPath}, Error: ${error.message}');
        }
      }
      AppToast.error(context, title: 'Validation Error', message: message);
    },
    cache: (message) => AppToast.error(context, title: 'Cache Error', message: message),
    unknown: (message) => AppToast.error(context, title: 'Error', message: message),
  );
  return;
}
// Use products!
```

#### Exception Types

The system provides typed exceptions that convert to failures:

```dart
AuthException       // -> Failure.auth (401 responses)
ServerException     // -> Failure.server (5xx responses)
NetworkException    // -> Failure.network (connection issues)
CacheException      // -> Failure.cache (local storage)
ValidationException // -> Failure.validation (400/422 with errors array)
AppException        // -> Failure.unknown (fallback)
```

#### DioException Mapping

The `DioExceptionMapper` extension automatically:
- Parses NestJS error response structure
- Extracts `message` and `error` fields
- Parses `errors` array for validation details
- Maps HTTP status codes to appropriate exception types
- Converts timeout/connection errors to NetworkException

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

The FST POS app follows a **modern, minimal, and clean design** philosophy:

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
- **Icons**: Use Material icons consistently at 18-20px for inline, 32-36px for featured
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

---

## Reusable Components

The shared widgets in `lib/shared/widgets/` provide consistent UI components across the app.

### AppButton

Multi-variant button component.

```dart
import 'package:fst_pos/shared/widgets/widgets.dart';

// Primary filled button
AppButton.primary(
  onPressed: () => print('Pressed'),
  child: Text('Submit'),
  isLoading: false,
  isExpanded: true,  // Full width
  icon: Icon(Icons.send),
)

// Secondary outlined button
AppButton.secondary(
  onPressed: () {},
  child: Text('Cancel'),
)

// Ghost/text button
AppButton.ghost(
  onPressed: () {},
  child: Text('Skip'),
)

// Destructive/danger button
AppButton.destructive(
  onPressed: () {},
  child: Text('Delete'),
)
```

### AppTextField

Styled text input with label, icons, and password toggle.

```dart
AppTextField(
  controller: _controller,
  label: 'Email',
  hintText: 'Enter your email',
  prefixIcon: Icons.email,
  errorText: _errorMessage,
  onChanged: (value) {},
)

// Password field with toggle
AppTextField(
  controller: _passwordController,
  label: 'Password',
  hintText: 'Enter password',
  prefixIcon: Icons.lock,
  obscureText: true,
  showPasswordToggle: true,
)
```

### AppCard

Styled card container with consistent theming.

```dart
AppCard(
  padding: EdgeInsets.all(16),
  elevation: 1,  // 0 for flat, >0 for shadow
  onTap: () {},  // Optional - makes card tappable
  child: Column(
    children: [
      Text('Card Title'),
      Text('Card content'),
    ],
  ),
)
```

### AppToast

Toast notification utility for feedback messages.

```dart
// Show success toast
AppToast.success(
  context,
  title: 'Success',
  message: 'Your changes have been saved.',
);

// Show error toast
AppToast.error(
  context,
  title: 'Error',
  message: 'Something went wrong.',
);

// Show warning toast
AppToast.warning(
  context,
  title: 'Warning',
  message: 'Please check your input.',
);

// Show info toast
AppToast.info(
  context,
  title: 'Info',
  message: 'New updates available.',
);

// Custom toast with type
AppToast.show(
  context,
  title: 'Custom',
  message: 'Custom message',
  type: ToastType.success,
  duration: Duration(seconds: 5),
);
```

### AppIconBox

Icon container with background color and shadow.

```dart
AppIconBox(
  icon: Icons.store,
  backgroundColor: AppColors.primary,
  iconColor: AppColors.primaryForeground,
  size: 72,
  iconSize: 36,
  borderRadius: 16,
)
```

### AppLoadingIndicator

Loading indicators for async states.

```dart
// Simple loading indicator
AppLoadingIndicator(
  message: 'Loading...',
  size: 32,
  color: AppColors.primary,
)

// Full-screen centered loading overlay
AppLoadingOverlay(message: 'Please wait...')
```

### Adding New Reusable Components

When creating a new reusable component:

1. Create file in `lib/shared/widgets/` with prefix `app_`
2. Add export to `lib/shared/widgets/widgets.dart`
3. Document usage with examples in this section
4. Follow existing patterns for consistency

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

The theme is configured in `main.dart` using Material Design:

```dart
import 'core/theme/app_theme.dart';

MaterialApp.router(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.light,
  // ...
)
```

### Using Colors

#### Via Theme Context (Preferred)

Access theme colors in widgets for automatic theme support:

```dart
final theme = Theme.of(context);
Container(
  color: theme.colorScheme.primary,
  child: Text('Hello', style: TextStyle(color: theme.colorScheme.onPrimary)),
)
```

#### Direct Color Access

Use `AppColors` for custom widgets or when theme context is unavailable:

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

## Product Feature (Offline-First)

The product system provides **offline-first** product management for cashiers. Products are cached per cashier to support multi-login scenarios.

### Architecture Overview

```
lib/features/product/
├── product.dart                         # Barrel export
├── data/
│   ├── datasources/
│   │   ├── product_tables.dart          # Drift tables (CachedProducts, ProductCacheMeta)
│   │   ├── product_remote_datasource.dart  # API calls
│   │   └── product_local_datasource.dart   # SQLite cache operations
│   ├── models/
│   │   └── product_model.dart           # API DTOs with nested pricing models
│   └── repositories/
│       └── product_repository_impl.dart # Offline-first implementation
├── domain/
│   ├── entities/
│   │   └── product.dart                 # Product entity + enums + filter
│   └── repositories/
│       └── product_repository.dart      # Repository interface
└── presentation/
    └── providers/
        └── product_provider.dart        # Riverpod state management
```

### Domain Entities

```dart
/// Product categories
enum ProductCategory { normal, asin, plastic }

/// Sack sizes for bulk pricing
enum SackType { fiftyKg, twentyFiveKg, fiveKg }

/// Main product entity
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String picture,
    required ProductCategory category,
    required String cashierId,
    required List<SackPrice> sackPrices,
    PerKiloPrice? perKiloPrice,
    ProductCashier? cashier,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Product;

  // Computed properties
  double? get lowestPrice;   // Minimum price across all options
  double get totalStock;     // Sum of all stock
  bool get hasStock;         // totalStock > 0
}

/// Filter for product queries
@freezed
class ProductFilter with _$ProductFilter {
  const factory ProductFilter({
    ProductCategory? category,
    String? searchQuery,
  }) = _ProductFilter;
}
```

### Pricing Structure

Products have flexible pricing:

```dart
/// Bulk sack pricing (50kg, 25kg, 5kg)
@freezed
class SackPrice with _$SackPrice {
  const factory SackPrice({
    required String id,
    required double price,
    required double stock,
    required SackType type,
    double? profit,
    SpecialPrice? specialPrice,  // Bulk discount
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SackPrice;
}

/// Per-kilo pricing option
@freezed
class PerKiloPrice with _$PerKiloPrice {
  const factory PerKiloPrice({
    required String id,
    required double price,
    required double stock,
    double? profit,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PerKiloPrice;
}

/// Special bulk discount
@freezed
class SpecialPrice with _$SpecialPrice {
  const factory SpecialPrice({
    required String id,
    required double price,
    required double minimumQty,
    double? profit,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SpecialPrice;
}
```

### Key Providers

| Provider                      | Type                              | Description                          |
| ----------------------------- | --------------------------------- | ------------------------------------ |
| `productListNotifierProvider` | `AsyncNotifier<ProductListState>` | Main product list with filter/search |
| `productByIdProvider`         | `Future<Product?>`                | Get single product by ID             |
| `productsByCategoryProvider`  | `Future<List<Product>>`           | Products filtered by category        |
| `productSearchNotifierProvider` | `AsyncNotifier<List<Product>>`  | Search-as-you-type results           |
| `productRepositoryProvider`   | `ProductRepository`               | Repository (requires auth)           |

### ProductListState

```dart
sealed class ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> products;
  final bool isRefreshing;
}

class ProductListError extends ProductListState {
  final Failure failure;
  final List<Product>? cachedProducts;  // Fallback data
}
```

### Usage Examples

#### 1. Display Product List

```dart
class ProductListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productListNotifierProvider);

    return productState.when(
      data: (state) {
        if (state is ProductListLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ProductListLoaded) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (_, i) {
              final product = state.products[i];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('Stock: ${product.totalStock}'),
                trailing: Text('₱${product.lowestPrice?.toStringAsFixed(2)}'),
              );
            },
          );
        }
        if (state is ProductListError) {
          return Text('Error: ${state.failure}');
        }
        return const SizedBox();
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}
```

#### 2. Filter by Category

```dart
// Set category filter
ref.read(productListNotifierProvider.notifier)
    .setCategory(ProductCategory.asin);

// Clear category filter
ref.read(productListNotifierProvider.notifier)
    .setCategory(null);
```

#### 3. Search Products

```dart
// Set search query
ref.read(productListNotifierProvider.notifier)
    .setSearchQuery('jasmine');

// Clear search
ref.read(productListNotifierProvider.notifier)
    .setSearchQuery(null);

// Clear all filters
ref.read(productListNotifierProvider.notifier)
    .clearFilters();
```

#### 4. Force Refresh from Server

```dart
await ref.read(productListNotifierProvider.notifier).refresh();
```

#### 5. Get Single Product

```dart
final product = await ref.read(productByIdProvider('product-id').future);
if (product != null) {
  print('Product: ${product.name}');
}
```

#### 6. Get Products by Category

```dart
final asinProducts = await ref.read(
  productsByCategoryProvider(ProductCategory.asin).future,
);
```

### Offline-First Strategy

The product repository follows this caching strategy:

1. **Has Cache + Not Stale** → Return cached data immediately
2. **Has Cache + Stale (>15 min)** → Return cache, refresh in background
3. **No Cache / Force Refresh** → Fetch from server, cache results
4. **Network Error** → Fall back to cached data if available

```dart
// Cache staleness threshold (default 15 minutes)
Future<bool> isCacheStale(String cashierId, {
  Duration staleDuration = const Duration(minutes: 15),
});
```

### Multi-Cashier Cache Isolation

Products are cached per cashier ID:

```dart
// Each cashier has isolated cache
await localDataSource.cacheProducts(cashierId, products);
await localDataSource.getCachedProducts(cashierId);
await localDataSource.clearCache(cashierId);
```

When a different cashier logs in:
- Their products are fetched fresh
- Cached in separate storage partition
- Previous cashier's cache remains intact

### Database Tables

```dart
/// Cached products (in app_database.dart)
@DataClassName('CachedProductRow')
class CachedProducts extends Table {
  TextColumn get id => text()();           // Product ID
  TextColumn get cashierId => text()();    // Owner cashier
  TextColumn get name => text()();         // For search
  TextColumn get picture => text()();
  TextColumn get category => text()();     // For filter
  TextColumn get data => text()();         // Full JSON
  DateTimeColumn get cachedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cache metadata
@DataClassName('ProductCacheMetaRow')
class ProductCacheMeta extends Table {
  TextColumn get cashierId => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();
  BoolColumn get isSyncing => boolean()();
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {cashierId};
}
```

### API Endpoints

| Endpoint                          | Method | Description                    |
| --------------------------------- | ------ | ------------------------------ |
| `/products/cashier/my-products`   | GET    | Get cashier's products         |
| `/products/cashier/my-products/:id` | GET  | Get single product by ID       |

**Query Parameters:**
- `category` - Filter by ProductCategory (NORMAL, ASIN, PLASTIC)
- `productSearch` - Search by product name (case-insensitive)

### File Locations Reference (Product)

| Need                     | Location                                                              |
| ------------------------ | --------------------------------------------------------------------- |
| Product entity           | `lib/features/product/domain/entities/product.dart`                   |
| Product providers        | `lib/features/product/presentation/providers/product_provider.dart`   |
| Product repository       | `lib/features/product/data/repositories/product_repository_impl.dart` |
| Product cache tables     | `lib/features/product/data/datasources/product_tables.dart`           |
| API endpoints            | `lib/core/network/api_endpoints.dart` (products section)              |

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

| Need                | Location                                                        |
| ------------------- | --------------------------------------------------------------- |
| Add API endpoint    | `lib/core/network/api_endpoints.dart`                           |
| Add route           | `lib/core/router/app_router.dart`                               |
| Add database table  | `lib/core/database/app_database.dart`                           |
| Add env variable    | `.env` files + `lib/core/config/env_config.dart`                |
| Add storage key     | `lib/core/storage/secure_storage.dart`                          |
| Add sidebar item    | `lib/shared/widgets/main_layout.dart`                           |
| Add/modify colors   | `lib/core/theme/app_colors.dart`                                |
| Add/modify theme    | `lib/core/theme/app_theme.dart`                                 |
| Add reusable widget | `lib/shared/widgets/` + export in `widgets.dart`                |
| Auth providers      | `lib/features/auth/presentation/providers/auth_provider.dart`   |
| Auth repository     | `lib/features/auth/data/repositories/auth_repository_impl.dart` |
| Login page          | `lib/features/auth/presentation/pages/login_page.dart`          |

---

_Last updated: November 30, 2025_
