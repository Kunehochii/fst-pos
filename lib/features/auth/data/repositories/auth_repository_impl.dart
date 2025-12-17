import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/cashier.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

/// Implementation of [AuthRepository].
///
/// Handles both online and offline authentication scenarios.
/// Uses secure storage for JWT tokens and shared preferences for
/// caching cashier data for offline access.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final SecureStorage _secureStorage;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
    required SecureStorage secureStorage,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _secureStorage = secureStorage;

  @override
  Future<(Failure?, Cashier?)> login({
    required String username,
    required String accessKey,
  }) async {
    AppLogger.auth(
        'Repository: Starting login process', {'username': username});

    try {
      // Attempt login
      final loginResponse = await _remoteDataSource.login(
        username: username,
        accessKey: accessKey,
      );

      AppLogger.auth('Repository: Token received, saving to secure storage');

      // Store the token securely
      await _secureStorage.saveAccessToken(loginResponse.accessToken);

      AppLogger.auth('Repository: Fetching cashier profile');

      // Fetch the cashier profile
      final cashierModel = await _remoteDataSource.getCashierProfile();
      final cashier = cashierModel.toEntity();

      AppLogger.auth('Repository: Caching cashier data for offline access');

      // Cache the cashier data for offline access
      await _localDataSource.cacheCashier(cashier);

      AppLogger.auth('Repository: Login complete', {
        'cashierId': cashier.id,
        'username': cashier.username,
      });

      return (null, cashier);
    } on DioException catch (e, stackTrace) {
      AppLogger.error('Repository: DioException during login', e, stackTrace);

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return (const Failure.network(), null);
      }

      final statusCode = e.response?.statusCode;
      final message = e.response?.data?['message'] as String? ?? 'Login failed';

      if (statusCode == 401) {
        return (Failure.auth(message: message), null);
      }

      return (Failure.server(message: message, statusCode: statusCode), null);
    } catch (e, stackTrace) {
      AppLogger.error(
          'Repository: Unexpected error during login', e, stackTrace);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Cashier?)> getCashierProfile() async {
    try {
      // Check if we're online
      final online = await isOnline();

      if (online) {
        // Fetch fresh profile from server
        final cashierModel = await _remoteDataSource.getCashierProfile();
        final cashier = cashierModel.toEntity();

        // Update cache
        await _localDataSource.cacheCashier(cashier);

        return (null, cashier);
      } else {
        // Fall back to cached data
        final cachedCashier = _localDataSource.getCachedCashier();
        if (cachedCashier != null && _localDataSource.isCachedSessionValid()) {
          return (null, cachedCashier);
        }
        return (const Failure.network(), null);
      }
    } on DioException catch (e) {
      // If we get a network error, try cached data
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        final cachedCashier = _localDataSource.getCachedCashier();
        if (cachedCashier != null && _localDataSource.isCachedSessionValid()) {
          return (null, cachedCashier);
        }
        return (const Failure.network(), null);
      }

      final statusCode = e.response?.statusCode;
      final message =
          e.response?.data?['message'] as String? ?? 'Failed to get profile';

      if (statusCode == 401) {
        return (Failure.auth(message: message), null);
      }

      return (Failure.server(message: message, statusCode: statusCode), null);
    } catch (e) {
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<void> logout() async {
    // Clear the secure token
    await _secureStorage.clearAll();

    // Optionally clear cached data (uncomment if you want full logout)
    // await _localDataSource.clearCachedCashier();
  }

  @override
  Future<bool> hasValidSession() async {
    // First check if we have a token
    final token = await _secureStorage.getAccessToken();
    if (token == null || token.isEmpty) {
      return false;
    }

    // Check if we're online
    final online = await isOnline();

    if (online) {
      // Try to validate the token by fetching profile
      try {
        await _remoteDataSource.getCashierProfile();
        return true;
      } on DioException catch (e) {
        // If 401, token is invalid
        if (e.response?.statusCode == 401) {
          return false;
        }
        // For other errors, fall back to cached session check
        return _localDataSource.isCachedSessionValid();
      }
    } else {
      // Offline: check if we have valid cached session
      return _localDataSource.isCachedSessionValid();
    }
  }

  @override
  Future<Cashier?> getCachedCashier() async {
    return _localDataSource.getCachedCashier();
  }

  @override
  Future<bool> isOnline() async {
    return _remoteDataSource.checkConnectivity();
  }
}
