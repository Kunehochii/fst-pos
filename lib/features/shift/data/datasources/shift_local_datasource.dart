import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/employee.dart';
import '../../domain/entities/shift.dart';
import '../models/employee_model.dart';
import '../models/shift_model.dart';

/// Keys for local shift storage.
abstract class ShiftLocalKeys {
  static const cachedActiveShift = 'cached_active_shift';
  static const cachedEmployees = 'cached_employees';
  static const lastShiftSyncTimestamp = 'last_shift_sync_timestamp';
}

/// Local data source for caching shift data.
///
/// Uses SharedPreferences for caching shift and employee data.
/// This enables offline-first shift management where users can
/// view their active shift and employees without network connectivity.
class ShiftLocalDataSource {
  final SharedPreferences _prefs;

  ShiftLocalDataSource(this._prefs);

  // ============================================================
  // Active Shift Caching
  // ============================================================

  /// Caches the active shift for offline access.
  Future<void> cacheActiveShift(Shift shift) async {
    final model = ShiftModel.fromEntity(shift);
    await _prefs.setString(
      ShiftLocalKeys.cachedActiveShift,
      jsonEncode(model.toJson()),
    );
    await _updateSyncTimestamp();
  }

  /// Retrieves the cached active shift.
  ///
  /// Returns null if no cached data exists or shift has ended.
  Shift? getCachedActiveShift() {
    final jsonString = _prefs.getString(ShiftLocalKeys.cachedActiveShift);
    if (jsonString == null) return null;

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final shift = ShiftModel.fromJson(json).toEntity();
      
      // Only return if shift is still active (no end time)
      if (shift.endTime != null) {
        return null;
      }
      
      return shift;
    } catch (_) {
      return null;
    }
  }

  /// Clears the cached active shift.
  ///
  /// Called when a shift ends or user logs out.
  Future<void> clearCachedActiveShift() async {
    await _prefs.remove(ShiftLocalKeys.cachedActiveShift);
  }

  /// Marks the cached shift as ended locally.
  ///
  /// This is used when ending a shift offline. The actual sync
  /// will happen when the device goes back online.
  Future<void> markShiftEnded(String shiftId) async {
    final cachedShift = getCachedActiveShift();
    if (cachedShift != null && cachedShift.id == shiftId) {
      await clearCachedActiveShift();
    }
  }

  // ============================================================
  // Employees Caching
  // ============================================================

  /// Caches the list of employees for offline access.
  Future<void> cacheEmployees(List<Employee> employees) async {
    final models = employees.map((e) => EmployeeModel.fromEntity(e)).toList();
    final jsonList = models.map((m) => m.toJson()).toList();
    await _prefs.setString(
      ShiftLocalKeys.cachedEmployees,
      jsonEncode(jsonList),
    );
  }

  /// Retrieves the cached employees list.
  ///
  /// Returns an empty list if no cached data exists.
  List<Employee> getCachedEmployees() {
    final jsonString = _prefs.getString(ShiftLocalKeys.cachedEmployees);
    if (jsonString == null) return [];

    try {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((json) => EmployeeModel.fromJson(json as Map<String, dynamic>))
          .map((model) => model.toEntity())
          .toList();
    } catch (_) {
      return [];
    }
  }

  /// Clears the cached employees.
  Future<void> clearCachedEmployees() async {
    await _prefs.remove(ShiftLocalKeys.cachedEmployees);
  }

  // ============================================================
  // Sync Timestamp
  // ============================================================

  /// Updates the last sync timestamp.
  Future<void> _updateSyncTimestamp() async {
    await _prefs.setInt(
      ShiftLocalKeys.lastShiftSyncTimestamp,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Gets the timestamp of the last successful sync.
  DateTime? getLastSyncTimestamp() {
    final timestamp = _prefs.getInt(ShiftLocalKeys.lastShiftSyncTimestamp);
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  /// Checks if the cached shift data is still considered valid.
  ///
  /// Shift data is valid if synced within the last 24 hours.
  /// This is shorter than auth because shift data changes more frequently.
  bool isCachedDataValid() {
    final lastSync = getLastSyncTimestamp();
    if (lastSync == null) return false;

    const maxOfflineDuration = Duration(hours: 24);
    return DateTime.now().difference(lastSync) < maxOfflineDuration;
  }

  // ============================================================
  // Clear All
  // ============================================================

  /// Clears all cached shift data.
  ///
  /// Called when user logs out.
  Future<void> clearAll() async {
    await clearCachedActiveShift();
    await clearCachedEmployees();
    await _prefs.remove(ShiftLocalKeys.lastShiftSyncTimestamp);
  }
}
