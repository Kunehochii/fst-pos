# Feature Development Guide

## Creating a New Feature

This guide provides templates and steps for implementing new features following clean architecture.

## Step 1: Domain Layer

### Entity (domain/entities/)

```dart
// lib/features/product/domain/entities/product.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

/// Product entity representing a sellable item in the POS system.
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String sku,
    required double price,
    String? description,
    String? imageUrl,
    @Default(0) int stockQuantity,
    @Default(true) bool isActive,
  }) = _Product;
}
```

### Repository Interface (domain/repositories/)

```dart
// lib/features/product/domain/repositories/product_repository.dart
import '../entities/product.dart';
import '../../../../core/errors/failure.dart';

/// Repository interface for product operations.
abstract class ProductRepository {
  /// Fetches all products.
  /// Returns [Failure] on error.
  Future<(Failure?, List<Product>?)> getProducts();

  /// Fetches a single product by ID.
  Future<(Failure?, Product?)> getProductById(String id);

  /// Creates a new product.
  Future<(Failure?, Product?)> createProduct(Product product);

  /// Updates an existing product.
  Future<(Failure?, Product?)> updateProduct(Product product);

  /// Deletes a product.
  Future<Failure?> deleteProduct(String id);
}
```

### Use Case (domain/usecases/)

```dart
// lib/features/product/domain/usecases/get_products.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../data/repositories/product_repository_impl.dart';

part 'get_products.g.dart';

/// Use case for fetching all products.
@riverpod
Future<List<Product>> getProducts(Ref ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final (failure, products) = await repository.getProducts();
  
  if (failure != null) {
    throw failure;
  }
  
  return products!;
}
```

## Step 2: Data Layer

### Model (data/models/)

```dart
// lib/features/product/data/models/product_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// Product model for API serialization.
@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String name,
    required String sku,
    required double price,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'stock_quantity') @Default(0) int stockQuantity,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Convert to domain entity.
  Product toEntity() => Product(
        id: id,
        name: name,
        sku: sku,
        price: price,
        description: description,
        imageUrl: imageUrl,
        stockQuantity: stockQuantity,
        isActive: isActive,
      );

  /// Create from domain entity.
  factory ProductModel.fromEntity(Product entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        sku: entity.sku,
        price: entity.price,
        description: entity.description,
        imageUrl: entity.imageUrl,
        stockQuantity: entity.stockQuantity,
        isActive: entity.isActive,
      );
}
```

### Remote Data Source (data/datasources/)

```dart
// lib/features/product/data/datasources/product_remote_datasource.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/product_model.dart';

part 'product_remote_datasource.g.dart';

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return ProductRemoteDataSource(dio);
}

/// Remote data source for product API operations.
class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('/products');
    final List<dynamic> data = response.data['data'];
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<ProductModel> getProductById(String id) async {
    final response = await _dio.get('/products/$id');
    return ProductModel.fromJson(response.data['data']);
  }

  Future<ProductModel> createProduct(ProductModel product) async {
    final response = await _dio.post('/products', data: product.toJson());
    return ProductModel.fromJson(response.data['data']);
  }

  Future<ProductModel> updateProduct(ProductModel product) async {
    final response = await _dio.put(
      '/products/${product.id}',
      data: product.toJson(),
    );
    return ProductModel.fromJson(response.data['data']);
  }

  Future<void> deleteProduct(String id) async {
    await _dio.delete('/products/$id');
  }
}
```

### Local Data Source (data/datasources/)

```dart
// lib/features/product/data/datasources/product_local_datasource.dart
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../models/product_model.dart';

part 'product_local_datasource.g.dart';

@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return ProductLocalDataSource(db);
}

/// Local data source for caching products.
class ProductLocalDataSource {
  final AppDatabase _db;

  ProductLocalDataSource(this._db);

  Future<List<ProductModel>> getCachedProducts() async {
    // Implement using Drift queries
    // Return cached products from local database
    return [];
  }

  Future<void> cacheProducts(List<ProductModel> products) async {
    // Implement using Drift
    // Cache products to local database
  }

  Future<void> cacheProduct(ProductModel product) async {
    // Cache single product
  }

  Future<void> deleteProduct(String id) async {
    // Delete from cache
  }
}
```

### Repository Implementation (data/repositories/)

```dart
// lib/features/product/data/repositories/product_repository_impl.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

part 'product_repository_impl.g.dart';

@riverpod
ProductRepository productRepository(Ref ref) {
  final remote = ref.watch(productRemoteDataSourceProvider);
  final local = ref.watch(productLocalDataSourceProvider);
  return ProductRepositoryImpl(remote, local);
}

/// Product repository implementation with offline-first strategy.
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;
  final ProductLocalDataSource _local;

  ProductRepositoryImpl(this._remote, this._local);

  @override
  Future<(Failure?, List<Product>?)> getProducts() async {
    try {
      // Try remote first
      final models = await _remote.getProducts();
      await _local.cacheProducts(models);
      return (null, models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      // Fall back to cache on network error
      if (e.type == DioExceptionType.connectionError) {
        final cached = await _local.getCachedProducts();
        if (cached.isNotEmpty) {
          return (null, cached.map((m) => m.toEntity()).toList());
        }
      }
      return (e.toAppException().toFailure(), null);
    }
  }

  @override
  Future<(Failure?, Product?)> getProductById(String id) async {
    try {
      final model = await _remote.getProductById(id);
      return (null, model.toEntity());
    } on DioException catch (e) {
      return (e.toAppException().toFailure(), null);
    }
  }

  @override
  Future<(Failure?, Product?)> createProduct(Product product) async {
    try {
      final model = ProductModel.fromEntity(product);
      final result = await _remote.createProduct(model);
      await _local.cacheProduct(result);
      return (null, result.toEntity());
    } on DioException catch (e) {
      return (e.toAppException().toFailure(), null);
    }
  }

  @override
  Future<(Failure?, Product?)> updateProduct(Product product) async {
    try {
      final model = ProductModel.fromEntity(product);
      final result = await _remote.updateProduct(model);
      await _local.cacheProduct(result);
      return (null, result.toEntity());
    } on DioException catch (e) {
      return (e.toAppException().toFailure(), null);
    }
  }

  @override
  Future<Failure?> deleteProduct(String id) async {
    try {
      await _remote.deleteProduct(id);
      await _local.deleteProduct(id);
      return null;
    } on DioException catch (e) {
      return e.toAppException().toFailure();
    }
  }
}
```

## Step 3: Presentation Layer

### Provider (presentation/providers/)

```dart
// lib/features/product/presentation/providers/product_list_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

part 'product_list_provider.g.dart';

/// Provider for the product list state.
@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    return ref.watch(getProductsProvider.future);
  }

  /// Refresh the product list.
  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  /// Filter products by search query.
  List<Product> search(String query) {
    final products = state.valueOrNull ?? [];
    if (query.isEmpty) return products;
    return products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
```

### Page (presentation/pages/)

```dart
// lib/features/product/presentation/pages/product_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_list_provider.dart';
import '../widgets/product_card.dart';

/// Page displaying the list of products.
class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(productListProvider.notifier).refresh(),
          ),
        ],
      ),
      body: productsAsync.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ProductCard(product: products[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.read(productListProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Widget (presentation/widgets/)

```dart
// lib/features/product/presentation/widgets/product_card.dart
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

/// Card widget displaying product information.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: product.imageUrl != null
            ? Image.network(product.imageUrl!, width: 50, height: 50)
            : const Icon(Icons.inventory),
        title: Text(product.name),
        subtitle: Text(product.sku),
        trailing: Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        onTap: onTap,
      ),
    );
  }
}
```

## Step 4: Feature Export

```dart
// lib/features/product/product.dart
/// Product feature exports.

// Domain
export 'domain/entities/product.dart';
export 'domain/repositories/product_repository.dart';
export 'domain/usecases/get_products.dart';

// Data
export 'data/models/product_model.dart';
export 'data/repositories/product_repository_impl.dart';

// Presentation
export 'presentation/pages/product_list_page.dart';
export 'presentation/providers/product_list_provider.dart';
export 'presentation/widgets/product_card.dart';
```

## Step 5: Register Route

Add to `lib/core/router/app_router.dart`:

```dart
GoRoute(
  path: '/products',
  name: 'products',
  pageBuilder: (context, state) => const NoTransitionPage(
    child: ProductListPage(),
  ),
),
```

## Step 6: Run Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Checklist

- [ ] Domain entities defined with freezed
- [ ] Repository interface created
- [ ] Use cases implemented
- [ ] Data models with fromJson/toJson
- [ ] Remote data source for API calls
- [ ] Local data source for caching
- [ ] Repository implementation with error handling
- [ ] Providers for state management
- [ ] Pages and widgets for UI
- [ ] Feature barrel export file
- [ ] Route registered in app_router
- [ ] Code generation run successfully
