import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/auth.dart';
import '../../features/delivery/presentation/pages/deliveries_page.dart';
import '../../features/expense/presentation/pages/expense_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profit/presentation/pages/profit_page.dart';
import '../../features/sales/presentation/pages/sales_page.dart';
import '../../features/sales_check/presentation/pages/sales_check_page.dart';
import '../../features/settings/settings.dart';
import '../../features/shift/shift.dart';
import '../../features/stock/presentation/pages/stock_page.dart';
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
  // Use ref.read instead of ref.watch to avoid recreating the router
  // The refreshListenable handles auth state changes
  final authNotifier = _AuthStateNotifier(ref);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == AppRoutes.login;

      // Read current auth state (don't watch - router uses refreshListenable)
      final authState = ref.read(authNotifierProvider);

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
          // Don't apply shift guard on the shift page itself
          // Users need to access it to time in
          final isShiftPage = state.matchedLocation == AppRoutes.shift;

          if (isShiftPage) {
            return MainLayout(child: child);
          }

          // Wrap with ShiftGuard to require time-in before accessing features
          return MainLayout(
            child: ShiftGuard(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/shift',
            name: 'shift',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ShiftPage(),
            ),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsPage(),
            ),
          ),
          GoRoute(
            path: '/sales',
            name: 'sales',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SalesPage(),
            ),
          ),
          GoRoute(
            path: '/deliveries',
            name: 'deliveries',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DeliveriesPage(),
            ),
          ),
          GoRoute(
            path: '/sales-check',
            name: 'salesCheck',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SalesCheckPage(),
            ),
          ),
          GoRoute(
            path: '/profit',
            name: 'profit',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfitPage(),
            ),
          ),
          GoRoute(
            path: '/stocks',
            name: 'stocks',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: StockPage(),
            ),
          ),
          GoRoute(
            path: '/expenses',
            name: 'expenses',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ExpensePage(),
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

  // Permission-based routes
  static const sales = '/sales';
  static const salesCheck = '/sales-check';
  static const deliveries = '/deliveries';
  static const stocks = '/stocks';
  static const kahon = '/kahon';
  static const salesHistory = '/sales-history';
  static const profit = '/profit';
  static const bills = '/bills';
  static const expenses = '/expenses';
  static const attachments = '/attachments';

  // Open to all cashiers
  static const shift = '/shift';
  static const settings = '/settings';
}
