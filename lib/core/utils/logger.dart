import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import '../config/env_config.dart';

/// Application logger for consistent logging across the app.
///
/// Only logs in debug mode (DEBUG_MODE=true in .env).
/// Uses dart:developer for structured logs visible in DevTools.
///
/// Usage:
/// ```dart
/// AppLogger.debug('User logged in', {'userId': '123'});
/// AppLogger.error('Failed to fetch data', error, stackTrace);
/// ```
class AppLogger {
  AppLogger._();

  static bool get _shouldLog => EnvConfig.debugMode || kDebugMode;

  /// Log debug information.
  static void debug(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog) return;

    developer.log(
      message,
      name: 'DEBUG',
      time: DateTime.now(),
    );

    if (data != null) {
      developer.log(
        data.toString(),
        name: 'DEBUG_DATA',
        time: DateTime.now(),
      );
    }
  }

  /// Log informational messages.
  static void info(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog) return;

    developer.log(
      message,
      name: 'INFO',
      time: DateTime.now(),
    );

    if (data != null) {
      developer.log(
        data.toString(),
        name: 'INFO_DATA',
        time: DateTime.now(),
      );
    }
  }

  /// Log warnings.
  static void warning(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog) return;

    developer.log(
      message,
      name: 'WARNING',
      time: DateTime.now(),
      level: 900,
    );

    if (data != null) {
      developer.log(
        data.toString(),
        name: 'WARNING_DATA',
        time: DateTime.now(),
      );
    }
  }

  /// Log errors with optional stack trace.
  static void error(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    // Always log errors, even in production
    developer.log(
      message,
      name: 'ERROR',
      time: DateTime.now(),
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log API requests.
  static void apiRequest(String method, String url,
      [Map<String, dynamic>? data]) {
    if (!_shouldLog) return;

    developer.log(
      '→ $method $url',
      name: 'API',
      time: DateTime.now(),
    );

    if (data != null) {
      developer.log(
        'Request: $data',
        name: 'API',
        time: DateTime.now(),
      );
    }
  }

  /// Log API responses.
  static void apiResponse(String method, String url, int statusCode,
      [dynamic data]) {
    if (!_shouldLog) return;

    developer.log(
      '← $method $url [$statusCode]',
      name: 'API',
      time: DateTime.now(),
    );

    if (data != null) {
      developer.log(
        'Response: $data',
        name: 'API',
        time: DateTime.now(),
      );
    }
  }
}
