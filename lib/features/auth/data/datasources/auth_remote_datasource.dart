import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/cashier_model.dart';

/// Remote data source for authentication API calls.
class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  /// Authenticates cashier with username and access key.
  ///
  /// Returns the access token on success.
  /// Throws [DioException] on failure.
  Future<LoginResponse> login({
    required String username,
    required String accessKey,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.auth.cashierLogin,
      data: LoginRequest(username: username, accessKey: accessKey).toJson(),
      options: Options(extra: {'skipAuth': true}),
    );
    return LoginResponse.fromJson(response.data);
  }

  /// Fetches the current cashier's profile.
  ///
  /// Requires a valid JWT token in the Authorization header.
  Future<CashierModel> getCashierProfile() async {
    final response = await _dio.get(ApiEndpoints.auth.cashierMe);
    return CashierModel.fromJson(response.data);
  }

  /// Checks if the server is reachable.
  ///
  /// Used to determine online/offline status.
  Future<bool> checkConnectivity() async {
    try {
      await _dio.get(
        '/', // Just hit the base URL to check connectivity
        options: Options(
          extra: {'skipAuth': true},
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      return true;
    } catch (_) {
      return false;
    }
  }
}
