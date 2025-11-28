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
  const factory Failure.validation({
    required String message,
    Map<String, List<String>>? fieldErrors,
  }) = ValidationFailure;

  /// Unknown/unexpected error.
  const factory Failure.unknown({
    @Default('An unexpected error occurred') String message,
  }) = UnknownFailure;
}

/// Extension to get user-friendly messages from failures.
extension FailureMessage on Failure {
  String get userMessage => when(
        server: (message, _) => message,
        network: (message) => message,
        cache: (message) => message,
        auth: (message) => message,
        validation: (message, _) => message,
        unknown: (message) => message,
      );
}
