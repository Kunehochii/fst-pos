/// Profit feature barrel export.
///
/// Provides profit reporting functionality
/// with offline-first support.
library;

// Domain
export 'domain/entities/profit_filter.dart';
export 'domain/entities/grouped_profit.dart';
export 'domain/entities/profit_summary.dart';
export 'domain/repositories/profit_repository.dart';

// Data
export 'data/models/profit_response_model.dart';
export 'data/datasources/profit_remote_datasource.dart';
export 'data/datasources/profit_local_datasource.dart';
export 'data/repositories/profit_repository_impl.dart';

// Presentation
export 'presentation/pages/profit_page.dart';
export 'presentation/providers/profit_provider.dart';
export 'presentation/widgets/profit_filter_widget.dart';
export 'presentation/widgets/grouped_profits_list.dart';
export 'presentation/widgets/profit_summary_card.dart';
