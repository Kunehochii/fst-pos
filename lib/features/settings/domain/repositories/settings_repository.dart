import '../entities/app_settings.dart';

/// Repository interface for app settings.
abstract class SettingsRepository {
  /// Load settings from storage.
  Future<AppSettings> loadSettings();

  /// Save settings to storage.
  Future<void> saveSettings(AppSettings settings);

  /// Update paper size setting.
  Future<void> updatePaperSize(String paperSize);

  /// Update selected printer.
  Future<void> updateSelectedPrinter({
    required String printerId,
    required String printerName,
    required String connectionType,
  });

  /// Clear selected printer.
  Future<void> clearSelectedPrinter();

  /// Update kiosk mode setting.
  Future<void> updateKioskMode(bool enabled);

  /// Update network printer settings.
  Future<void> updateNetworkPrinter({
    required String ip,
    required int port,
  });
}
