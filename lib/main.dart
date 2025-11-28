import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/env_config.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

/// Application entry point.
///
/// Initializes:
/// - Environment configuration from .env files
/// - Riverpod for state management
/// - GoRouter for navigation
/// - Material theming
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment configuration
  await EnvConfig.init();

  runApp(
    const ProviderScope(
      child: FstPosApp(),
    ),
  );
}

/// Root application widget.
///
/// Sets up:
/// - MaterialApp for theming
/// - GoRouter integration
/// - Theme configuration
class FstPosApp extends ConsumerWidget {
  const FstPosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'FST POS',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
