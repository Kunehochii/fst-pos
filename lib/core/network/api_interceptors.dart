import 'package:dio/dio.dart';

import '../storage/secure_storage.dart';

/// Authentication interceptor for adding JWT tokens to requests.
///
/// Automatically adds Authorization header with Bearer token
/// if a token exists in secure storage.
class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;

  AuthInterceptor(this._secureStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth header for public endpoints
    if (options.extra['skipAuth'] == true) {
      return handler.next(options);
    }

    final token = await _secureStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - could trigger token refresh here
    if (err.response?.statusCode == 401) {
      // TODO: Implement token refresh logic
      // For now, just pass the error through
    }
    return handler.next(err);
  }
}

/// Retry interceptor for handling transient failures.
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;

    // Only retry on network errors or 5xx server errors
    final shouldRetry = _shouldRetry(err) && retryCount < maxRetries;

    if (shouldRetry) {
      await Future.delayed(retryDelay * (retryCount + 1));

      final options = err.requestOptions;
      options.extra['retryCount'] = retryCount + 1;

      try {
        final dio = Dio();
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode ?? 0) >= 500;
  }
}
