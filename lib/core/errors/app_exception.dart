import 'package:dio/dio.dart';

import 'failure.dart';

/// Custom exception class for application-specific errors.
///
/// Wrap exceptions from external sources (API, database, etc.)
/// and convert them to Failure types for consistent error handling.
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => 'AppException: $message (code: $code)';

  /// Convert this exception to a Failure type.
  Failure toFailure() {
    return Failure.unknown(message: message);
  }
}

/// Exception thrown when authentication fails or is required.
class AuthException extends AppException {
  const AuthException({
    super.message = 'Authentication required',
    super.code = 'AUTH_ERROR',
    super.originalError,
  });

  @override
  Failure toFailure() {
    return Failure.auth(message: message);
  }
}

/// Exception thrown for network-related errors.
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'Network error occurred',
    super.code = 'NETWORK_ERROR',
    super.originalError,
  });

  @override
  Failure toFailure() {
    return Failure.network(message: message);
  }
}

/// Exception thrown for server-side errors.
class ServerException extends AppException {
  final int? statusCode;

  const ServerException({
    super.message = 'Server error occurred',
    super.code = 'SERVER_ERROR',
    super.originalError,
    this.statusCode,
  });

  @override
  Failure toFailure() {
    return Failure.server(message: message, statusCode: statusCode);
  }
}

/// Exception thrown for cache/local storage errors.
class CacheException extends AppException {
  const CacheException({
    super.message = 'Cache error occurred',
    super.code = 'CACHE_ERROR',
    super.originalError,
  });

  @override
  Failure toFailure() {
    return Failure.cache(message: message);
  }
}

/// Utility to convert Dio exceptions to AppExceptions.
extension DioExceptionMapper on DioException {
  AppException toAppException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timeout. Please try again.',
          code: 'TIMEOUT',
        );
      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'No internet connection.',
          code: 'NO_INTERNET',
        );
      case DioExceptionType.badResponse:
        final statusCode = response?.statusCode;
        final message = _extractErrorMessage(response);

        if (statusCode == 401) {
          return AuthException(
            message: message ?? 'Authentication required',
            originalError: this,
          );
        }

        return ServerException(
          message: message ?? 'Server error occurred',
          statusCode: statusCode,
          originalError: this,
        );
      case DioExceptionType.cancel:
        return const AppException(
          message: 'Request was cancelled',
          code: 'CANCELLED',
        );
      default:
        return AppException(
          message: message ?? 'An unexpected error occurred',
          originalError: this,
        );
    }
  }

  String? _extractErrorMessage(Response? response) {
    if (response?.data is Map) {
      final data = response!.data as Map;
      return data['message']?.toString() ?? data['error']?.toString();
    }
    return null;
  }
}
