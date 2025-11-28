import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/cashier.dart';
import '../models/cashier_model.dart';

/// Keys for local auth storage.
abstract class AuthLocalKeys {
  static const cachedCashier = 'cached_cashier';
  static const cachedCredentials = 'cached_credentials';
  static const lastLoginTimestamp = 'last_login_timestamp';
}

/// Local data source for caching auth data.
///
/// Uses SharedPreferences for non-sensitive data caching.
/// This enables offline-first auth where users can start the app
/// without network connectivity if they have previously logged in.
class AuthLocalDataSource {
  final SharedPreferences _prefs;

  AuthLocalDataSource(this._prefs);

  /// Caches the cashier profile for offline access.
  Future<void> cacheCashier(Cashier cashier) async {
    final model = CashierModel.fromEntity(cashier);
    await _prefs.setString(
      AuthLocalKeys.cachedCashier,
      jsonEncode(model.toJson()),
    );
    await _prefs.setInt(
      AuthLocalKeys.lastLoginTimestamp,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Retrieves the cached cashier profile.
  ///
  /// Returns null if no cached data exists.
  Cashier? getCachedCashier() {
    final jsonString = _prefs.getString(AuthLocalKeys.cachedCashier);
    if (jsonString == null) return null;

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return CashierModel.fromJson(json).toEntity();
    } catch (_) {
      return null;
    }
  }

  /// Clears the cached cashier data.
  Future<void> clearCachedCashier() async {
    await _prefs.remove(AuthLocalKeys.cachedCashier);
    await _prefs.remove(AuthLocalKeys.lastLoginTimestamp);
  }

  /// Gets the timestamp of the last successful login.
  DateTime? getLastLoginTimestamp() {
    final timestamp = _prefs.getInt(AuthLocalKeys.lastLoginTimestamp);
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  /// Checks if the cached session is still valid.
  ///
  /// A session is considered valid if it was created within the last 7 days.
  /// This provides a reasonable window for offline access while maintaining security.
  bool isCachedSessionValid() {
    final lastLogin = getLastLoginTimestamp();
    if (lastLogin == null) return false;

    const maxOfflineDuration = Duration(days: 7);
    return DateTime.now().difference(lastLogin) < maxOfflineDuration;
  }
}
