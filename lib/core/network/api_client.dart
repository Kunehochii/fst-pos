import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/env_config.dart';
import '../storage/secure_storage.dart';
import 'api_interceptors.dart';

part 'api_client.g.dart';

/// Provides the configured Dio HTTP client.
///
/// Features:
/// - Base URL configuration from environment
/// - JWT token authentication via interceptor
/// - Request/Response logging in debug mode
/// - Timeout configuration
///
/// Usage:
/// ```dart
/// final dio = ref.watch(apiClientProvider);
/// final response = await dio.get('/users');
/// ```
@riverpod
Dio apiClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.apiBaseUrl,
      connectTimeout: Duration(milliseconds: EnvConfig.apiTimeout),
      receiveTimeout: Duration(milliseconds: EnvConfig.apiTimeout),
      sendTimeout: Duration(milliseconds: EnvConfig.apiTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  final secureStorage = ref.watch(secureStorageProvider);

  // Add interceptors
  dio.interceptors.addAll([
    AuthInterceptor(secureStorage),
    if (EnvConfig.debugMode)
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
  ]);

  return dio;
}
