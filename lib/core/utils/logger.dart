import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import '../config/env_config.dart';

/// Log level enum for filtering logs.
enum LogLevel {
  debug(0),
  info(1),
  warning(2),
  error(3),
  none(4);

  const LogLevel(this.value);
  final int value;
}

/// Application logger for consistent logging across the app.
///
/// Supports log levels for filtering in debug vs production.
/// Uses dart:developer for structured logs visible in DevTools.
///
/// Usage:
/// ```dart
/// AppLogger.debug('User logged in', {'userId': '123'});
/// AppLogger.error('Failed to fetch data', error, stackTrace);
/// ```
class AppLogger {
  AppLogger._();

  /// Minimum log level. Set to LogLevel.error in production.
  static LogLevel minLevel =
      (EnvConfig.debugMode || kDebugMode) ? LogLevel.debug : LogLevel.error;

  static bool _shouldLog(LogLevel level) => level.value >= minLevel.value;

  /// Log debug information.
  static void debug(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog(LogLevel.debug)) return;

    _log('DEBUG', message, data: data);
  }

  /// Log informational messages.
  static void info(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog(LogLevel.info)) return;

    _log('INFO', message, data: data);
  }

  /// Log warnings.
  static void warning(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog(LogLevel.warning)) return;

    _log('WARNING', message, data: data, level: 900);
  }

  /// Log errors with optional stack trace.
  static void error(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!_shouldLog(LogLevel.error)) return;

    developer.log(
      '❌ $message',
      name: 'ERROR',
      time: DateTime.now(),
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );

    // Also print to console for visibility
    if (kDebugMode) {
      debugPrint('❌ ERROR: $message');
      if (error != null) debugPrint('  Error: $error');
      if (stackTrace != null) debugPrint('  Stack: $stackTrace');
    }
  }

  /// Log API requests.
  static void apiRequest(String method, String url,
      [Map<String, dynamic>? data]) {
    if (!_shouldLog(LogLevel.debug)) return;

    _log('API', '→ $method $url', data: data);
  }

  /// Log API responses.
  static void apiResponse(String method, String url, int statusCode,
      [dynamic data]) {
    if (!_shouldLog(LogLevel.debug)) return;

    final emoji = statusCode >= 200 && statusCode < 300 ? '✓' : '✗';
    _log('API', '$emoji ← $method $url [$statusCode]');

    if (data != null && _shouldLog(LogLevel.debug)) {
      _log('API_RESPONSE', data.toString());
    }
  }

  /// Log authentication events.
  static void auth(String message, [Map<String, dynamic>? data]) {
    if (!_shouldLog(LogLevel.info)) return;

    _log('AUTH', '🔐 $message', data: data);
  }

  /// Log JSON parsing events (useful for debugging CheckedFromJsonException).
  static void json(String message, [dynamic data]) {
    if (!_shouldLog(LogLevel.debug)) return;

    _log('JSON', '📄 $message');
    if (data != null) {
      _log('JSON_DATA', data.toString());
    }
  }

  /// Internal log method.
  static void _log(
    String name,
    String message, {
    Map<String, dynamic>? data,
    int level = 0,
  }) {
    developer.log(
      message,
      name: name,
      time: DateTime.now(),
      level: level,
    );

    if (kDebugMode) {
      debugPrint('[$name] $message');
      if (data != null) {
        debugPrint('[$name] Data: $data');
      }
    }
  }
}
