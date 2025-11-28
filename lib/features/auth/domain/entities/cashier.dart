import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashier.freezed.dart';

/// Cashier entity representing the authenticated cashier user.
///
/// This entity contains the cashier's profile data after successful login.
/// Sensitive data like accessKey and secureCode are never stored here.
@freezed
class Cashier with _$Cashier {
  const factory Cashier({
    required String id,
    required String username,
    required String branchName,
    required String businessId,
    required List<String> permissions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Cashier;
}

/// Authentication state for offline-first auth handling.
@freezed
class AuthState with _$AuthState {
  /// User is authenticated (token valid or offline with cached credentials).
  const factory AuthState.authenticated({
    required Cashier cashier,
    @Default(false) bool isOffline,
  }) = Authenticated;

  /// User is not authenticated.
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Initial loading state while checking auth status.
  const factory AuthState.loading() = AuthLoading;
}
