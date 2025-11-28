import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/cashier.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

/// Provides SharedPreferences instance.
@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}

/// Provides the AuthLocalDataSource.
@riverpod
Future<AuthLocalDataSource> authLocalDataSource(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return AuthLocalDataSource(prefs);
}

/// Provides the AuthRemoteDataSource.
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return AuthRemoteDataSource(dio);
}

/// Provides the AuthRepository.
@riverpod
Future<AuthRepository> authRepository(Ref ref) async {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = await ref.watch(authLocalDataSourceProvider.future);
  final secureStorage = ref.watch(secureStorageProvider);

  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    secureStorage: secureStorage,
  );
}

/// Manages the authentication state.
///
/// This notifier handles:
/// - Login flow
/// - Logout flow
/// - Session validation (online and offline)
/// - Auth state persistence
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthState> build() async {
    return _checkAuthStatus();
  }

  /// Checks the current authentication status.
  ///
  /// Handles both online and offline scenarios.
  Future<AuthState> _checkAuthStatus() async {
    final repository = await ref.read(authRepositoryProvider.future);

    final hasSession = await repository.hasValidSession();
    if (!hasSession) {
      return const AuthState.unauthenticated();
    }

    // Try to get the profile (online) or cached data (offline)
    final (failure, cashier) = await repository.getCashierProfile();

    if (cashier != null) {
      final isOnline = await repository.isOnline();
      return AuthState.authenticated(
        cashier: cashier,
        isOffline: !isOnline,
      );
    }

    // If we have a cached cashier but couldn't verify, still allow access
    final cachedCashier = await repository.getCachedCashier();
    if (cachedCashier != null) {
      return AuthState.authenticated(
        cashier: cachedCashier,
        isOffline: true,
      );
    }

    return const AuthState.unauthenticated();
  }

  /// Attempts to login with the provided credentials.
  Future<void> login({
    required String username,
    required String accessKey,
  }) async {
    state = const AsyncValue.loading();

    final repository = await ref.read(authRepositoryProvider.future);
    final (failure, cashier) = await repository.login(
      username: username,
      accessKey: accessKey,
    );

    if (failure != null) {
      state = AsyncValue.error(failure, StackTrace.current);
      return;
    }

    if (cashier != null) {
      state = AsyncValue.data(AuthState.authenticated(cashier: cashier));
    } else {
      state = const AsyncValue.data(AuthState.unauthenticated());
    }
  }

  /// Logs out the current user.
  Future<void> logout() async {
    final repository = await ref.read(authRepositoryProvider.future);
    await repository.logout();
    state = const AsyncValue.data(AuthState.unauthenticated());
  }

  /// Refreshes the auth state.
  ///
  /// Useful when coming back online after being offline.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _checkAuthStatus());
  }
}

/// Provides the current authenticated cashier or null if not authenticated.
@riverpod
Cashier? currentCashier(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.whenOrNull(
    data: (state) => state.whenOrNull(
      authenticated: (cashier, isOffline) => cashier,
    ),
  );
}

/// Provides whether the user is authenticated.
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    data: (state) => state.maybeWhen(
      authenticated: (_, __) => true,
      orElse: () => false,
    ),
    orElse: () => false,
  );
}

/// Provides whether the app is in offline mode.
@riverpod
bool isOfflineMode(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    data: (state) => state.maybeWhen(
      authenticated: (_, isOffline) => isOffline,
      orElse: () => false,
    ),
    orElse: () => false,
  );
}
