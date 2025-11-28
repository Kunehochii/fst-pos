# Architecture Guide

## Overview

This project follows **Clean Architecture** principles, separating concerns into distinct layers with clear boundaries and dependencies.

## Directory Structure

```
lib/
├── main.dart                 # App entry point
├── core/                     # Core infrastructure (shared across features)
│   ├── config/              # Environment configuration
│   ├── database/            # Drift database setup
│   ├── errors/              # Error types (Failure, AppException)
│   ├── network/             # Dio client and interceptors
│   ├── router/              # GoRouter configuration
│   ├── storage/             # Secure storage
│   └── utils/               # Utilities (logger, etc.)
├── features/                 # Feature modules
│   └── [feature]/
│       ├── data/            # Data layer
│       │   ├── datasources/ # Remote and local data sources
│       │   ├── models/      # Data models (with fromJson/toJson)
│       │   └── repositories/# Repository implementations
│       ├── domain/          # Domain layer
│       │   ├── entities/    # Business entities (freezed)
│       │   ├── repositories/# Repository interfaces
│       │   └── usecases/    # Business logic use cases
│       └── presentation/    # Presentation layer
│           ├── pages/       # Screen widgets
│           ├── widgets/     # Feature-specific widgets
│           └── providers/   # Riverpod providers
└── shared/                   # Shared components
    ├── widgets/             # Reusable widgets
    ├── constants/           # App-wide constants
    └── extensions/          # Dart extensions
```

## Layer Dependencies

```
┌─────────────────────────────────────────┐
│           Presentation Layer            │
│   (pages, widgets, providers)           │
└──────────────────┬──────────────────────┘
                   │ depends on
                   ▼
┌─────────────────────────────────────────┐
│             Domain Layer                │
│   (entities, repositories, usecases)    │
└──────────────────┬──────────────────────┘
                   │ depends on
                   ▼
┌─────────────────────────────────────────┐
│              Data Layer                 │
│   (models, datasources, repos impl)     │
└─────────────────────────────────────────┘
```

**Key Rules:**
- Domain layer has NO dependencies on other layers
- Data layer implements domain interfaces
- Presentation layer only uses domain interfaces (via dependency injection)

## Feature Module Template

When creating a new feature, create this structure:

```
features/[feature_name]/
├── data/
│   ├── datasources/
│   │   ├── [feature]_local_datasource.dart
│   │   └── [feature]_remote_datasource.dart
│   ├── models/
│   │   └── [feature]_model.dart
│   └── repositories/
│       └── [feature]_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── [feature]_entity.dart
│   ├── repositories/
│   │   └── [feature]_repository.dart
│   └── usecases/
│       ├── get_[feature].dart
│       └── create_[feature].dart
├── presentation/
│   ├── pages/
│   │   └── [feature]_page.dart
│   ├── widgets/
│   │   └── [feature]_widget.dart
│   └── providers/
│       └── [feature]_provider.dart
└── [feature].dart              # Feature barrel export
```

## Core Module Responsibilities

### config/
- `EnvConfig` - Environment variables from .env files

### database/
- `AppDatabase` - Drift database with tables and queries
- Migration strategies for schema updates

### errors/
- `Failure` - Freezed union type for error handling
- `AppException` - Exception classes with conversion to Failure

### network/
- `apiClient` provider - Configured Dio instance
- `AuthInterceptor` - JWT token injection
- `ApiEndpoints` - Centralized endpoint constants

### router/
- `appRouter` provider - GoRouter configuration
- `AppRoutes` - Route path constants

### storage/
- `SecureStorage` - Wrapper for flutter_secure_storage
- Token management (access, refresh tokens)

## Dependency Injection

All dependencies are provided through Riverpod providers:

```dart
// In provider file
@riverpod
SomeRepository someRepository(Ref ref) {
  final api = ref.watch(apiClientProvider);
  final db = ref.watch(appDatabaseProvider);
  return SomeRepositoryImpl(api, db);
}

// In widget
class SomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(someRepositoryProvider);
    // ...
  }
}
```

## Agent Instructions

When implementing a new feature:

1. **Start with domain layer** - Define entities and repository interface
2. **Implement data layer** - Create models, datasources, repository impl
3. **Build presentation** - Create providers, then pages/widgets
4. **Run code generation** - `dart run build_runner build`
5. **Add to router** - Register route in `app_router.dart`
6. **Export in barrel** - Add to `features/features.dart`
