// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsLocalDataSourceHash() =>
    r'33350cf345599d6b95fd01856f9fae5bd9559d3b';

/// Provides the settings local data source.
///
/// Copied from [settingsLocalDataSource].
@ProviderFor(settingsLocalDataSource)
final settingsLocalDataSourceProvider =
    AutoDisposeProvider<SettingsLocalDataSource>.internal(
  settingsLocalDataSource,
  name: r'settingsLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsLocalDataSourceRef
    = AutoDisposeProviderRef<SettingsLocalDataSource>;
String _$settingsRepositoryHash() =>
    r'a4c5fb58879f0ae064be186473d954d08589f36d';

/// Provides the settings repository.
///
/// Copied from [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider =
    AutoDisposeProvider<SettingsRepository>.internal(
  settingsRepository,
  name: r'settingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsRepositoryRef = AutoDisposeProviderRef<SettingsRepository>;
String _$currentPaperSizeHash() => r'49ff7367ac3213ca3b435fe5709f2743661cae7c';

/// Convenience provider for current paper size.
///
/// Copied from [currentPaperSize].
@ProviderFor(currentPaperSize)
final currentPaperSizeProvider = AutoDisposeProvider<PaperSize>.internal(
  currentPaperSize,
  name: r'currentPaperSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPaperSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentPaperSizeRef = AutoDisposeProviderRef<PaperSize>;
String _$selectedPrinterInfoHash() =>
    r'd1f6676b1959599583be51d75520fcdec197f66c';

/// Convenience provider for selected printer info.
///
/// Copied from [selectedPrinterInfo].
@ProviderFor(selectedPrinterInfo)
final selectedPrinterInfoProvider = AutoDisposeProvider<
    ({
      String? id,
      String? name,
      PrinterConnectionType? connectionType
    })>.internal(
  selectedPrinterInfo,
  name: r'selectedPrinterInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedPrinterInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedPrinterInfoRef = AutoDisposeProviderRef<
    ({String? id, String? name, PrinterConnectionType? connectionType})>;
String _$isKioskModeEnabledHash() =>
    r'10b323d95d99e227e59ea1e0a31ff122ed552b45';

/// Convenience provider for kiosk mode state.
///
/// Copied from [isKioskModeEnabled].
@ProviderFor(isKioskModeEnabled)
final isKioskModeEnabledProvider = AutoDisposeProvider<bool>.internal(
  isKioskModeEnabled,
  name: r'isKioskModeEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isKioskModeEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsKioskModeEnabledRef = AutoDisposeProviderRef<bool>;
String _$settingsNotifierHash() => r'd61c7121b58feee2a179710002e4df479d54d3c0';

/// Notifier for managing app settings.
///
/// Copied from [SettingsNotifier].
@ProviderFor(SettingsNotifier)
final settingsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SettingsNotifier, AppSettings>.internal(
  SettingsNotifier.new,
  name: r'settingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsNotifier = AutoDisposeAsyncNotifier<AppSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
