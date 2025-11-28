import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/auth.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../shared/widgets/main_layout.dart';

part 'app_router.g.dart';

/// Provides the application router.
///
/// Usage:
/// ```dart
/// final router = ref.watch(appRouterProvider);
/// ```
@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: _AuthStateNotifier(ref),
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == AppRoutes.login;

      // Handle loading state - don't redirect while loading
      final isLoading = authState.isLoading;
      if (isLoading) {
        return null;
      }

      // Check if authenticated
      final isAuthenticated = authState.maybeWhen(
        data: (authStateData) => authStateData.maybeWhen(
          authenticated: (_, __) => true,
          orElse: () => false,
        ),
        orElse: () => false,
      );

      // Redirect to login if not authenticated and not already on login page
      if (!isAuthenticated && !isLoggingIn) {
        return AppRoutes.login;
      }

      // Redirect to home if authenticated and on login page
      if (isAuthenticated && isLoggingIn) {
        return AppRoutes.home;
      }

      return null;
    },
    routes: [
      // Login route (outside shell - no sidebar)
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      // Shell route for the main layout with sidebar
      ShellRoute(
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          // Add more routes here following this pattern:
          // GoRoute(
          //   path: '/products',
          //   name: 'products',
          //   pageBuilder: (context, state) => const NoTransitionPage(
          //     child: ProductsPage(),
          //   ),
          // ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}

/// Notifier that triggers router refresh when auth state changes.
class _AuthStateNotifier extends ChangeNotifier {
  _AuthStateNotifier(this._ref) {
    _ref.listen(authNotifierProvider, (_, __) {
      notifyListeners();
    });
  }

  final Ref _ref;
}

/// Route paths constants for type-safe navigation.
///
/// Usage:
/// ```dart
/// context.go(AppRoutes.home);
/// context.push(AppRoutes.products);
/// ```
abstract class AppRoutes {
  static const login = '/login';
  static const home = '/';
  static const products = '/products';
  static const orders = '/orders';
  static const customers = '/customers';
  static const settings = '/settings';
}
