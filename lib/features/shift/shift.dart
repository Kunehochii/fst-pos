/// Shift feature exports.
///
/// This feature handles shift management including:
/// - Time in/out tracking
/// - Employee management for shifts
/// - Active shift monitoring
/// - Offline-first caching

// Domain
export 'domain/entities/employee.dart';
export 'domain/entities/shift.dart';
export 'domain/entities/shift_employee.dart';
export 'domain/repositories/shift_repository.dart';

// Data
export 'data/models/employee_model.dart';
export 'data/models/shift_model.dart';
export 'data/models/shift_employee_model.dart';
export 'data/datasources/shift_remote_datasource.dart';
export 'data/datasources/shift_local_datasource.dart';
export 'data/repositories/shift_repository_impl.dart';

// Presentation
export 'presentation/pages/shift_page.dart';
export 'presentation/providers/shift_provider.dart';
export 'presentation/widgets/time_in_modal.dart';
export 'presentation/widgets/update_employees_modal.dart';
export 'presentation/widgets/shift_guard.dart';
