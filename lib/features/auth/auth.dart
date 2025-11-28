/// Auth feature exports.
///
/// This feature handles cashier authentication including:
/// - Login flow
/// - Offline-first auth (cached credentials)
/// - Session management

// Domain
export 'domain/entities/cashier.dart';
export 'domain/repositories/auth_repository.dart';

// Data
export 'data/models/cashier_model.dart';
export 'data/datasources/auth_remote_datasource.dart';
export 'data/datasources/auth_local_datasource.dart';
export 'data/repositories/auth_repository_impl.dart';

// Presentation
export 'presentation/pages/login_page.dart';
export 'presentation/providers/auth_provider.dart';
