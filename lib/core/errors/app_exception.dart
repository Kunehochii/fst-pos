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

/// Exception thrown for validation errors from NestJS.
///
/// NestJS validation errors follow this structure:
/// ```json
/// {
///   "message": "Validation failed",
///   "errors": [
///     {
///       "expected": "object",
///       "code": "invalid_type",
///       "path": ["fieldName"],
///       "message": "Invalid input: expected object, received string"
///     }
///   ]
/// }
/// ```
class ValidationException extends AppException {
  final List<ValidationErrorDetail> errors;

  const ValidationException({
    super.message = 'Validation failed',
    super.code = 'VALIDATION_ERROR',
    super.originalError,
    this.errors = const [],
  });

  @override
  Failure toFailure() {
    return Failure.validation(
      message: message,
      errors: errors,
    );
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
        final data = response?.data;

        // Parse NestJS error response structure
        final errorInfo = _parseNestJsError(data);
        final message = errorInfo.message;
        final validationErrors = errorInfo.errors;

        // Handle 401 Unauthorized
        if (statusCode == 401) {
          return AuthException(
            message: message ?? 'Authentication required',
            originalError: this,
          );
        }

        // Handle 400 Bad Request with validation errors
        if (statusCode == 400 && validationErrors.isNotEmpty) {
          return ValidationException(
            message: message ?? 'Validation failed',
            errors: validationErrors,
            originalError: this,
          );
        }

        // Handle 422 Unprocessable Entity (validation)
        if (statusCode == 422) {
          return ValidationException(
            message: message ?? 'Validation failed',
            errors: validationErrors,
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

  /// Parse NestJS error response structure.
  ///
  /// Handles the standard NestJS error format:
  /// ```json
  /// {
  ///   "message": "Error message or Validation failed",
  ///   "error": "Unauthorized",
  ///   "statusCode": 401,
  ///   "errors": [...]  // Optional validation errors array
  /// }
  /// ```
  ({String? message, List<ValidationErrorDetail> errors}) _parseNestJsError(
      dynamic data) {
    if (data is! Map) {
      return (message: data?.toString(), errors: <ValidationErrorDetail>[]);
    }

    final map = data as Map<String, dynamic>;

    // Extract message - prioritize 'message', fallback to 'error'
    String? message = map['message']?.toString() ?? map['error']?.toString();

    // Parse validation errors array if present
    final List<ValidationErrorDetail> errors = [];
    if (map['errors'] is List) {
      for (final error in (map['errors'] as List)) {
        if (error is Map<String, dynamic>) {
          errors.add(ValidationErrorDetail.fromJson(error));
        }
      }
    }

    // If we have validation errors, build a combined message
    if (errors.isNotEmpty && message == 'Validation failed') {
      // Create a user-friendly message from validation errors
      final errorMessages = errors.map((e) => e.message).join('; ');
      message = 'Validation failed: $errorMessages';
    }

    return (message: message, errors: errors);
  }
}
