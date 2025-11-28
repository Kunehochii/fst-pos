import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
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

/// Route paths constants for type-safe navigation.
///
/// Usage:
/// ```dart
/// context.go(AppRoutes.home);
/// context.push(AppRoutes.products);
/// ```
abstract class AppRoutes {
  static const home = '/';
  static const products = '/products';
  static const orders = '/orders';
  static const customers = '/customers';
  static const settings = '/settings';
}
