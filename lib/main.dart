import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/config/env_config.dart';
import 'core/router/app_router.dart';

/// Application entry point.
///
/// Initializes:
/// - Environment configuration from .env files
/// - Riverpod for state management
/// - GoRouter for navigation
/// - ShadcnFlutter theming
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
/// - ShadcnApp for Material 3 theming
/// - GoRouter integration
/// - Theme configuration
class FstPosApp extends ConsumerWidget {
  const FstPosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return ShadApp.router(
      title: 'FST POS',
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
