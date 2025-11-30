import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_datasource.dart';

/// Implementation of [SettingsRepository] using local storage.
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _localDataSource;

  SettingsRepositoryImpl(this._localDataSource);

  @override
  Future<AppSettings> loadSettings() async {
    return await _localDataSource.loadSettings();
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    await _localDataSource.saveSettings(settings);
  }

  @override
  Future<void> updatePaperSize(String paperSize) async {
    await _localDataSource.updatePaperSize(paperSize);
  }

  @override
  Future<void> updateSelectedPrinter({
    required String printerId,
    required String printerName,
    required String connectionType,
  }) async {
    await _localDataSource.updateSelectedPrinter(
      printerId: printerId,
      printerName: printerName,
      connectionType: connectionType,
    );
  }

  @override
  Future<void> clearSelectedPrinter() async {
    await _localDataSource.clearSelectedPrinter();
  }

  @override
  Future<void> updateKioskMode(bool enabled) async {
    await _localDataSource.updateKioskMode(enabled);
  }

  @override
  Future<void> updateNetworkPrinter({
    required String ip,
    required int port,
  }) async {
    await _localDataSource.updateNetworkPrinter(ip: ip, port: port);
  }
}
