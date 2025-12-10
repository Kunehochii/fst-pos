/// API endpoint constants.
///
/// Centralized location for all API endpoints.
/// Organize by feature/domain for easy maintenance.
///
/// Usage:
/// ```dart
/// final response = await dio.get(ApiEndpoints.auth.login);
/// ```
class ApiEndpoints {
  ApiEndpoints._();

  static const auth = _AuthEndpoints();
  static const users = _UserEndpoints();
  static const employees = _EmployeeEndpoints();
  static const shifts = _ShiftEndpoints();
  static const products = _ProductEndpoints();
  static const sales = _SalesEndpoints();
  static const salesCheck = _SalesCheckEndpoints();
  static const delivery = _DeliveryEndpoints();
  static const profit = _ProfitEndpoints();
  static const stock = _StockEndpoints();
  static const transfer = _TransferEndpoints();
  static const expenses = _ExpenseEndpoints();
  static const bills = _BillEndpoints();
  static const sheet = _SheetEndpoints();
  // Add more endpoint groups as needed
}

class _AuthEndpoints {
  const _AuthEndpoints();

  // Cashier auth endpoints
  String get cashierLogin => '/auth/cashier/login';
  String get cashierMe => '/auth/cashier/me';

  // Legacy/unused
  String get login => '/auth/login';
  String get register => '/auth/register';
  String get logout => '/auth/logout';
  String get refresh => '/auth/refresh';
  String get me => '/auth/me';
}

class _UserEndpoints {
  const _UserEndpoints();

  String get list => '/users';
  String byId(String id) => '/users/$id';
  String get profile => '/users/profile';
}

class _EmployeeEndpoints {
  const _EmployeeEndpoints();

  String get list => '/employees';
  String byId(String id) => '/employees/$id';
}

class _ShiftEndpoints {
  const _ShiftEndpoints();

  String get list => '/shifts';
  String byId(String id) => '/shifts/$id';
  String end(String id) => '/shifts/$id/end';
}

class _ProductEndpoints {
  const _ProductEndpoints();

  /// Cashier endpoints - uses authenticated cashier's token
  String get myProducts => '/products/cashier/my-products';
  String myProductById(String id) => '/products/cashier/my-products/$id';
}

class _SalesEndpoints {
  const _SalesEndpoints();

  /// Create a sale (POST /sales)
  String get create => '/sales';

  /// Get cashier's sales (GET /sales/cashier)
  String get cashier => '/sales/cashier';

  /// Get sales by date (GET /sales/cashier/by-date)
  String get cashierByDate => '/sales/cashier/by-date';

  /// Get voided sales (GET /sales/cashier/voided)
  String get cashierVoided => '/sales/cashier/voided';

  /// Void a sale (POST /sales/:id/void)
  String void_(String id) => '/sales/$id/void';
}

class _DeliveryEndpoints {
  const _DeliveryEndpoints();

  /// Create a delivery (POST /delivery)
  String get create => '/delivery';

  /// Get cashier's deliveries (GET /delivery/cashier)
  String get cashier => '/delivery/cashier';

  /// Get a specific delivery by ID (GET /delivery/:id)
  String byId(String id) => '/delivery/$id';
}

class _SalesCheckEndpoints {
  const _SalesCheckEndpoints();

  /// Get grouped sales for cashier (GET /sales-check/cashier)
  String get cashier => '/sales-check/cashier';

  /// Get total sales summary for cashier (GET /sales-check/cashier/total)
  String get cashierTotal => '/sales-check/cashier/total';
}

class _ProfitEndpoints {
  const _ProfitEndpoints();

  /// Get grouped profits for cashier (GET /profit/cashier)
  String get cashier => '/profit/cashier';

  /// Get total profit summary for cashier (GET /profit/cashier/total)
  String get cashierTotal => '/profit/cashier/total';
}

class _StockEndpoints {
  const _StockEndpoints();

  /// Get stock statistics for cashier (GET /stock/statistics/cashier)
  String get cashierStatistics => '/stock/statistics/cashier';
}

class _TransferEndpoints {
  const _TransferEndpoints();

  /// Create a transfer (POST /transfer)
  String get create => '/transfer';

  /// Get cashier's transfers (GET /transfer/cashier)
  String get cashier => '/transfer/cashier';

  /// Get transfers by date (GET /transfer/cashier/date)
  String get cashierByDate => '/transfer/cashier/date';

  /// Get a specific transfer by ID (GET /transfer/:id)
  String byId(String id) => '/transfer/$id';
}

class _ExpenseEndpoints {
  const _ExpenseEndpoints();

  /// Create expense for cashier (POST /expenses/cashier/create)
  String get cashierCreate => '/expenses/cashier/create';

  /// Update cashier expense (PUT /expenses/cashier/update/:id)
  String cashierUpdate(String id) => '/expenses/cashier/update/$id';

  /// Get cashier expense by date (GET /expenses/cashier/by-date)
  String get cashierByDate => '/expenses/cashier/by-date';

  /// Delete cashier expense (DELETE /expenses/cashier/:id)
  String cashierDelete(String id) => '/expenses/cashier/$id';
}

class _BillEndpoints {
  const _BillEndpoints();

  /// Create or update bill count for cashier (POST /bills)
  String get cashierCreate => '/bills';

  /// Get cashier bill count by date (GET /bills)
  String get cashierByDate => '/bills';

  /// Get bill count by ID (GET /bills/:id)
  String byId(String id) => '/bills/$id';
}

class _SheetEndpoints {
  const _SheetEndpoints();

  // Sheet retrieval
  /// Get Kahon sheet (GET /sheet/kahon)
  String get kahon => '/sheet/kahon';

  /// Get Kahon sheet by date (GET /sheet/kahon/date)
  String get kahonByDate => '/sheet/kahon/date';

  /// Get Inventory sheet (GET /sheet/inventory)
  String get inventory => '/sheet/inventory';

  /// Get Inventory sheet by date (GET /sheet/inventory/date)
  String get inventoryByDate => '/sheet/inventory/date';

  // Row operations
  /// Add single row (POST /sheet/row)
  String get row => '/sheet/row';

  /// Add multiple rows (POST /sheet/rows)
  String get rows => '/sheet/rows';

  /// Delete row (DELETE /sheet/row/:id)
  String rowById(String id) => '/sheet/row/$id';

  /// Reorder row (PATCH /sheet/row/reorder)
  String get rowReorder => '/sheet/row/reorder';

  /// Batch update row positions (PATCH /sheet/rows/positions)
  String get rowsPositions => '/sheet/rows/positions';

  // Cell operations
  /// Add single cell (POST /sheet/cell)
  String get cell => '/sheet/cell';

  /// Add multiple cells (POST /sheet/cells)
  String get cells => '/sheet/cells';

  /// Update/Delete cell (PATCH/DELETE /sheet/cell/:id)
  String cellById(String id) => '/sheet/cell/$id';
}
