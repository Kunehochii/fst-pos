import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class for error handling.
///
/// Use freezed union types to represent different failure types.
/// This allows for exhaustive pattern matching in the UI.
///
/// Usage:
/// ```dart
/// final result = await repository.getData();
/// result.fold(
///   (failure) => failure.when(
///     server: (message, code) => showError(message),
///     network: (message) => showNetworkError(),
///     cache: (message) => showCacheError(),
///     unknown: (message) => showGenericError(),
///   ),
///   (data) => showData(data),
/// );
/// ```
@freezed
class Failure with _$Failure {
  /// Server-side error with optional status code.
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  /// Network connectivity error.
  const factory Failure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  /// Local cache/database error.
  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  /// Authentication error.
  const factory Failure.auth({
    @Default('Authentication required') String message,
  }) = AuthFailure;

  /// Validation error with field-level details.
  /// Supports NestJS validation error structure with `errors` array.
  const factory Failure.validation({
    required String message,
    Map<String, List<String>>? fieldErrors,
    List<ValidationErrorDetail>? errors,
  }) = ValidationFailure;

  /// Unknown/unexpected error.
  const factory Failure.unknown({
    @Default('An unexpected error occurred') String message,
  }) = UnknownFailure;
}

/// Represents a single validation error detail from NestJS.
///
/// NestJS validation errors follow this structure:
/// ```json
/// {
///   "expected": "object",
///   "code": "invalid_type",
///   "path": ["fieldName"],
///   "message": "Invalid input: expected object, received string"
/// }
/// ```
class ValidationErrorDetail {
  final String? expected;
  final String code;
  final List<dynamic> path;
  final String message;

  const ValidationErrorDetail({
    this.expected,
    required this.code,
    required this.path,
    required this.message,
  });

  /// Create from JSON map (NestJS error response).
  factory ValidationErrorDetail.fromJson(Map<String, dynamic> json) {
    return ValidationErrorDetail(
      expected: json['expected'] as String?,
      code: json['code'] as String? ?? 'unknown',
      path: (json['path'] as List<dynamic>?) ?? [],
      message: json['message'] as String? ?? 'Validation error',
    );
  }

  /// Get the field path as a dot-separated string.
  String get fieldPath => path.isEmpty ? '' : path.join('.');

  @override
  String toString() => message;
}

/// Extension to get user-friendly messages from failures.
extension FailureMessage on Failure {
  String get userMessage => when(
        server: (message, _) => message,
        network: (message) => message,
        cache: (message) => message,
        auth: (message) => message,
        validation: (message, _, __) => message,
        unknown: (message) => message,
      );
}
