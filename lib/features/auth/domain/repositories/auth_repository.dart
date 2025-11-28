import '../../../../core/errors/failure.dart';
import '../entities/cashier.dart';

/// Repository interface for authentication operations.
///
/// Defines the contract for auth-related operations.
/// Implementation handles both online and offline scenarios.
abstract class AuthRepository {
  /// Attempts to login with username and accessKey.
  ///
  /// On success, stores the JWT token and caches cashier data for offline use.
  /// Returns [Failure] on invalid credentials or network errors.
  Future<(Failure?, Cashier?)> login({
    required String username,
    required String accessKey,
  });

  /// Fetches the current cashier's profile from the server.
  ///
  /// Falls back to cached data if offline.
  Future<(Failure?, Cashier?)> getCashierProfile();

  /// Logs out the current user.
  ///
  /// Clears JWT token but preserves cached data for potential offline re-login.
  Future<void> logout();

  /// Checks if the user has a valid session.
  ///
  /// Returns true if:
  /// - JWT token exists and is valid (online), OR
  /// - JWT token exists and cached cashier data is available (offline)
  Future<bool> hasValidSession();

  /// Gets the cached cashier data for offline access.
  Future<Cashier?> getCachedCashier();

  /// Checks if the device is online.
  Future<bool> isOnline();
}
