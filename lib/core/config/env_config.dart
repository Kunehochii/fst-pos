import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment configuration loaded from .env files.
///
/// Usage:
/// ```dart
/// final baseUrl = EnvConfig.apiBaseUrl;
/// final timeout = EnvConfig.apiTimeout;
/// ```
class EnvConfig {
  EnvConfig._();

  /// Initialize environment configuration.
  /// Call this before runApp() in main.dart.
  static Future<void> init({String? fileName}) async {
    await dotenv.load(fileName: fileName ?? '.env');
  }

  /// API base URL for all network requests.
  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000/api';

  /// API timeout in milliseconds.
  static int get apiTimeout =>
      int.tryParse(dotenv.env['API_TIMEOUT'] ?? '30000') ?? 30000;

  /// Debug mode flag.
  static bool get debugMode =>
      dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';
}
