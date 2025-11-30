import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/settings_local_datasource.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../../printer/domain/entities/printer_device.dart';
import '../../../printer/domain/entities/receipt_line.dart';

part 'settings_provider.g.dart';

/// Provides the settings local data source.
@riverpod
SettingsLocalDataSource settingsLocalDataSource(Ref ref) {
  return SettingsLocalDataSource();
}

/// Provides the settings repository.
@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final localDataSource = ref.watch(settingsLocalDataSourceProvider);
  return SettingsRepositoryImpl(localDataSource);
}

/// Notifier for managing app settings.
@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<AppSettings> build() async {
    final repository = ref.watch(settingsRepositoryProvider);
    return await repository.loadSettings();
  }

  /// Update paper size.
  Future<void> setPaperSize(PaperSize paperSize) async {
    final repository = ref.read(settingsRepositoryProvider);
    await repository.updatePaperSize(paperSize.name);

    state = AsyncValue.data(
      state.value!.copyWith(paperSize: paperSize),
    );
  }

  /// Update selected printer.
  Future<void> setSelectedPrinter(PrinterDevice printer) async {
    final repository = ref.read(settingsRepositoryProvider);
    await repository.updateSelectedPrinter(
      printerId: printer.id,
      printerName: printer.name,
      connectionType: printer.connectionType.name,
    );

    state = AsyncValue.data(
      state.value!.copyWith(
        selectedPrinterId: printer.id,
        selectedPrinterName: printer.name,
        selectedPrinterConnectionType: printer.connectionType,
      ),
    );
  }

  /// Clear selected printer.
  Future<void> clearSelectedPrinter() async {
    final repository = ref.read(settingsRepositoryProvider);
    await repository.clearSelectedPrinter();

    state = AsyncValue.data(
      state.value!.copyWith(
        selectedPrinterId: null,
        selectedPrinterName: null,
        selectedPrinterConnectionType: null,
      ),
    );
  }

  /// Update kiosk mode.
  Future<void> setKioskMode(bool enabled) async {
    final repository = ref.read(settingsRepositoryProvider);
    await repository.updateKioskMode(enabled);

    state = AsyncValue.data(
      state.value!.copyWith(kioskModeEnabled: enabled),
    );
  }

  /// Update network printer.
  Future<void> setNetworkPrinter({
    required String ip,
    required int port,
  }) async {
    final repository = ref.read(settingsRepositoryProvider);
    await repository.updateNetworkPrinter(ip: ip, port: port);

    state = AsyncValue.data(
      state.value!.copyWith(
        networkPrinterIp: ip,
        networkPrinterPort: port,
      ),
    );
  }

  /// Reload settings from storage.
  Future<void> reload() async {
    state = const AsyncValue.loading();
    final repository = ref.read(settingsRepositoryProvider);
    final settings = await repository.loadSettings();
    state = AsyncValue.data(settings);
  }
}

/// Convenience provider for current paper size.
@riverpod
PaperSize currentPaperSize(Ref ref) {
  final settings = ref.watch(settingsNotifierProvider);
  return settings.valueOrNull?.paperSize ?? PaperSize.mm80;
}

/// Convenience provider for selected printer info.
@riverpod
({String? id, String? name, PrinterConnectionType? connectionType})
    selectedPrinterInfo(Ref ref) {
  final settings = ref.watch(settingsNotifierProvider);
  return (
    id: settings.valueOrNull?.selectedPrinterId,
    name: settings.valueOrNull?.selectedPrinterName,
    connectionType: settings.valueOrNull?.selectedPrinterConnectionType,
  );
}

/// Convenience provider for kiosk mode state.
@riverpod
bool isKioskModeEnabled(Ref ref) {
  final settings = ref.watch(settingsNotifierProvider);
  return settings.valueOrNull?.kioskModeEnabled ?? false;
}
