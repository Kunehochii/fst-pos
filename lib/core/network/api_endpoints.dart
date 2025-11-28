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
  // Add more endpoint groups as needed
}

class _AuthEndpoints {
  const _AuthEndpoints();

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
