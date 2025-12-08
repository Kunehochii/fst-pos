/// Expense feature barrel export.
///
/// Provides expense management functionality for tracking
/// daily expenses by cashiers.
library;

// Domain
export 'domain/entities/expense.dart';
export 'domain/repositories/expense_repository.dart';

// Data
export 'data/models/expense_model.dart';
export 'data/datasources/expense_remote_datasource.dart';
export 'data/repositories/expense_repository_impl.dart';

// Presentation
export 'presentation/pages/expense_page.dart';
export 'presentation/providers/expense_provider.dart';
export 'presentation/widgets/expense_date_selector.dart';
export 'presentation/widgets/expense_form.dart';
export 'presentation/widgets/expense_summary_card.dart';
