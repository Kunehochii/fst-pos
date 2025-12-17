/// Settings feature exports.
///
/// Provides app settings functionality including:
/// - Paper size configuration
/// - Printer selection persistence
/// - Kiosk mode settings
/// - Network printer configuration

// Domain - Entities
export 'domain/entities/app_settings.dart';

// Domain - Repositories
export 'domain/repositories/settings_repository.dart';

// Data - Datasources
export 'data/datasources/settings_local_datasource.dart';

// Data - Repositories
export 'data/repositories/settings_repository_impl.dart';

// Presentation - Providers
export 'presentation/providers/settings_provider.dart';

// Presentation - Pages
export 'presentation/pages/settings_page.dart';
