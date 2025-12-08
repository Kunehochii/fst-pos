/// Sales Check feature barrel export.
///
/// Provides sales reporting and verification functionality
/// with offline-first support.
library;

// Domain
export 'domain/entities/sales_check_filter.dart';
export 'domain/entities/grouped_sale.dart';
export 'domain/entities/sales_summary.dart';
export 'domain/repositories/sales_check_repository.dart';

// Data
export 'data/models/sales_check_response_model.dart';
export 'data/datasources/sales_check_remote_datasource.dart';
export 'data/datasources/sales_check_local_datasource.dart';
export 'data/repositories/sales_check_repository_impl.dart';

// Presentation
export 'presentation/pages/sales_check_page.dart';
export 'presentation/providers/sales_check_provider.dart';
export 'presentation/widgets/sales_check_filter_widget.dart';
export 'presentation/widgets/grouped_sales_list.dart';
export 'presentation/widgets/sales_summary_card.dart';
