# API Integration Guide

## Overview

This project uses **Dio** as the HTTP client with interceptors for authentication and logging.

## API Client Setup

The API client is configured in `lib/core/network/api_client.dart`:

```dart
@riverpod
Dio apiClient(Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: EnvConfig.apiBaseUrl,
    connectTimeout: Duration(milliseconds: EnvConfig.apiTimeout),
    receiveTimeout: Duration(milliseconds: EnvConfig.apiTimeout),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  dio.interceptors.addAll([
    AuthInterceptor(ref.watch(secureStorageProvider)),
    if (EnvConfig.debugMode) LogInterceptor(requestBody: true, responseBody: true),
  ]);

  return dio;
}
```

## Authentication

### Token Storage

Tokens are stored securely using `flutter_secure_storage`:

```dart
final storage = ref.watch(secureStorageProvider);

// Save tokens after login
await storage.saveAccessToken(response.accessToken);
await storage.saveRefreshToken(response.refreshToken);

// Check if logged in
final isLoggedIn = await storage.isLoggedIn();

// Clear on logout
await storage.clearAll();
```

### Auth Interceptor

The `AuthInterceptor` automatically adds the Bearer token to requests:

```dart
class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['skipAuth'] != true) {
      final token = await _secureStorage.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return handler.next(options);
  }
}
```

### Skip Authentication

For public endpoints, use the `skipAuth` extra:

```dart
await dio.get('/public/endpoint', options: Options(extra: {'skipAuth': true}));
```

## Making API Calls

### In Data Sources

```dart
class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('/products');
    final List<dynamic> data = response.data['data'];
    return data.map((json) => ProductModel.fromJson(json)).toList();
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

### Query Parameters

```dart
final response = await _dio.get(
  '/products',
  queryParameters: {
    'page': 1,
    'limit': 20,
    'category': 'electronics',
  },
);
```

### Request Body

```dart
final response = await _dio.post(
  '/orders',
  data: {
    'items': [
      {'productId': '123', 'quantity': 2},
      {'productId': '456', 'quantity': 1},
    ],
    'customerId': 'customer-123',
  },
);
```

### File Upload

```dart
final formData = FormData.fromMap({
  'file': await MultipartFile.fromFile(
    filePath,
    filename: 'product-image.jpg',
  ),
  'productId': '123',
});

final response = await _dio.post('/upload', data: formData);
```

## Error Handling

### Exception Types

```dart
// DioException types
DioExceptionType.connectionTimeout  // Connection timed out
DioExceptionType.sendTimeout        // Send timed out
DioExceptionType.receiveTimeout     // Receive timed out
DioExceptionType.badResponse        // 4xx or 5xx response
DioExceptionType.connectionError    // No internet
DioExceptionType.cancel             // Request cancelled
```

### Converting Dio Errors

Use the extension in `lib/core/errors/app_exception.dart`:

```dart
try {
  final response = await _dio.get('/products');
  return response.data;
} on DioException catch (e) {
  throw e.toAppException();
}
```

### In Repository

```dart
Future<(Failure?, List<Product>?)> getProducts() async {
  try {
    final models = await _remote.getProducts();
    return (null, models.map((m) => m.toEntity()).toList());
  } on DioException catch (e) {
    return (e.toAppException().toFailure(), null);
  }
}
```

## API Response Patterns

### Standard Response

```json
{
  "data": { ... },
  "message": "Success"
}
```

### List Response with Pagination

```json
{
  "data": [ ... ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "totalPages": 5
  }
}
```

### Error Response

```json
{
  "error": "Validation failed",
  "message": "The name field is required",
  "details": {
    "name": ["The name field is required"],
    "price": ["Price must be a positive number"]
  }
}
```

## Endpoints

Define endpoints in `lib/core/network/api_endpoints.dart`:

```dart
class ApiEndpoints {
  static const auth = _AuthEndpoints();
  static const products = _ProductEndpoints();
  static const orders = _OrderEndpoints();
}

class _AuthEndpoints {
  String get login => '/auth/login';
  String get register => '/auth/register';
  String get logout => '/auth/logout';
  String get refresh => '/auth/refresh';
}

class _ProductEndpoints {
  String get list => '/products';
  String byId(String id) => '/products/$id';
  String get search => '/products/search';
}
```

Usage:

```dart
await _dio.get(ApiEndpoints.products.list);
await _dio.get(ApiEndpoints.products.byId('123'));
```

## Retry Logic

For transient failures, use `RetryInterceptor`:

```dart
dio.interceptors.add(RetryInterceptor(
  maxRetries: 3,
  retryDelay: const Duration(seconds: 1),
));
```

## Agent Instructions

When working with API:

1. **Add endpoints to ApiEndpoints** - Keep them centralized
2. **Create data source classes** - Don't call Dio directly in repositories
3. **Handle all DioException types** - Convert to Failure for UI
4. **Log API calls in debug mode** - Use LogInterceptor
5. **Use skipAuth for public endpoints** - Add to request extras
6. **Cache responses locally** - Use local data source for offline access
