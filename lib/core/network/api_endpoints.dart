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
  static const delivery = _DeliveryEndpoints();
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
