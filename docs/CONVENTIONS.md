# Code Conventions

## Naming Conventions

### Files
- Use `snake_case` for all file names
- Suffix files by type: `_page.dart`, `_widget.dart`, `_provider.dart`, `_model.dart`, `_entity.dart`
- Use `_impl.dart` suffix for interface implementations

```
✓ product_list_page.dart
✓ cart_provider.dart
✓ order_model.dart
✓ order_repository_impl.dart
✗ ProductListPage.dart
✗ cartProvider.dart
```

### Classes
- Use `PascalCase` for class names
- Suffix by type for clarity

```dart
// Pages
class ProductListPage extends ConsumerWidget {}

// Widgets
class ProductCard extends StatelessWidget {}

// Providers (generated from @riverpod annotation)
@riverpod
ProductRepository productRepository(Ref ref) {}
// Generates: productRepositoryProvider

// Models (data layer)
@freezed
class ProductModel with _$ProductModel {}

// Entities (domain layer)
@freezed
class Product with _$Product {}

// Repositories
abstract class ProductRepository {}
class ProductRepositoryImpl implements ProductRepository {}
```

### Variables and Functions
- Use `camelCase` for variables, functions, and parameters
- Use descriptive names that indicate purpose

```dart
// Good
final productList = ref.watch(productListProvider);
Future<void> fetchProducts() async {}
final isLoading = state.isLoading;

// Avoid
final pl = ref.watch(productListProvider);
Future<void> fp() async {}
final flag = state.isLoading;
```

### Constants
- Use `camelCase` for constants (Dart convention)
- Group related constants in classes

```dart
class ApiEndpoints {
  static const products = '/products';
  static const orders = '/orders';
}

class AppColors {
  static const primary = Color(0xFF2196F3);
  static const error = Color(0xFFE53935);
}
```

## Code Organization

### Import Order
1. Dart SDK imports
2. Flutter imports
3. Third-party packages
4. Local imports (relative)

```dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import 'product_repository.dart';
```

### Class Member Order
1. Static constants
2. Static fields
3. Instance fields (final first, then mutable)
4. Constructors
5. Factory constructors
6. Getters/Setters
7. Public methods
8. Private methods
9. Override methods

```dart
class ProductService {
  // Static constants
  static const maxRetries = 3;
  
  // Instance fields
  final Dio _dio;
  final AppDatabase _db;
  
  // Constructor
  ProductService(this._dio, this._db);
  
  // Public methods
  Future<List<Product>> getProducts() async {}
  
  // Private methods
  Future<void> _cacheProducts(List<Product> products) async {}
}
```

## Documentation

### File Headers
```dart
/// Product repository implementation.
/// 
/// Handles product data from both remote API and local cache.
/// Implements offline-first strategy with sync queue.
```

### Class Documentation
```dart
/// Repository for managing product data.
/// 
/// Features:
/// - Fetches products from remote API
/// - Caches products in local database
/// - Provides offline access to cached data
/// 
/// Usage:
/// ```dart
/// final products = await repository.getProducts();
/// ```
class ProductRepository {}
```

### Method Documentation
```dart
/// Fetches products from the remote API.
/// 
/// Returns a list of [Product] entities.
/// Throws [NetworkException] if the request fails.
/// 
/// If [forceRefresh] is true, bypasses the cache.
Future<List<Product>> getProducts({bool forceRefresh = false}) async {}
```

## Freezed Patterns

### Entity Definition
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Product entity representing a sellable item.
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
    String? description,
    @Default(0) int quantity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
```

### Union Types (for States)
```dart
@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded(List<Product> products) = _Loaded;
  const factory ProductState.error(Failure failure) = _Error;
}
```

## Riverpod Patterns

### Simple Provider
```dart
@riverpod
ProductRepository productRepository(Ref ref) {
  final api = ref.watch(apiClientProvider);
  return ProductRepositoryImpl(api);
}
```

### Async Provider
```dart
@riverpod
Future<List<Product>> products(Ref ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProducts();
}
```

### Notifier Provider (for mutable state)
```dart
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Cart build() {
    return const Cart(items: []);
  }

  void addItem(Product product) {
    state = state.copyWith(
      items: [...state.items, CartItem(product: product, quantity: 1)],
    );
  }
}
```

## Error Handling

### Use Either Pattern Alternative
```dart
// With Failure types
Future<Result<Product>> getProduct(String id) async {
  try {
    final response = await _dio.get('/products/$id');
    return Result.success(ProductModel.fromJson(response.data).toEntity());
  } on DioException catch (e) {
    return Result.failure(e.toAppException().toFailure());
  }
}
```

### In Providers
```dart
@riverpod
Future<List<Product>> products(Ref ref) async {
  try {
    final repository = ref.watch(productRepositoryProvider);
    return await repository.getProducts();
  } catch (e) {
    throw e.toAppException();
  }
}
```

## Agent Instructions

When writing code:

1. **Follow naming conventions** - Use suffixes and case rules consistently
2. **Document public APIs** - Add /// comments for classes and methods
3. **Use freezed for models** - All data classes should be immutable
4. **Handle errors properly** - Convert exceptions to Failure types
5. **Keep methods small** - Extract complex logic into private methods
6. **Use const constructors** - For immutable widgets and classes
