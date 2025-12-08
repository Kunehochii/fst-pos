/// Stock feature barrel export.
///
/// Provides stock management functionality including:
/// - Stock statistics and printing
/// - Transfers (KAHON, BUTAS, SALES_MAID, MANUAL_ADJUST)
/// - Offline-first support
library stock;

// Domain - Entities
export 'domain/entities/transfer.dart';
export 'domain/entities/stock_statistics.dart';

// Domain - Repository interfaces
export 'domain/repositories/stock_repository.dart';

// Data - Models
export 'data/models/transfer_model.dart';
export 'data/models/stock_statistics_model.dart';

// Presentation - Providers
export 'presentation/providers/stock_provider.dart';

// Presentation - Pages
export 'presentation/pages/stock_page.dart';
