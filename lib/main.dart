import 'package:flutter/material.dart' hide ThemeData, ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'core/config/env_config.dart';
import 'core/router/app_router.dart';

/// Application entry point.
///
/// Initializes:
/// - Environment configuration from .env files
/// - Riverpod for state management
/// - GoRouter for navigation
/// - shadcn_flutter theming
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
/// - ShadcnApp for theming
/// - GoRouter integration
/// - ToastLayer for notifications
/// - Theme configuration
class FstPosApp extends ConsumerWidget {
  const FstPosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return ShadcnApp.router(
      title: 'FST POS',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorSchemes.lightBlue,
        radius: 0.5,
      ),
      darkTheme: ThemeData.dark(
        colorScheme: ColorSchemes.darkBlue,
        radius: 0.5,
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
