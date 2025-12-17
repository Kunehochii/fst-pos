import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
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
    AppLogger.auth('Attempting login', {'username': username});

    final response = await _dio.post(
      ApiEndpoints.auth.cashierLogin,
      data: LoginRequest(username: username, accessKey: accessKey).toJson(),
      options: Options(extra: {'skipAuth': true}),
    );

    AppLogger.json('Parsing LoginResponse', response.data);

    try {
      final loginResponse = LoginResponse.fromJson(response.data);
      AppLogger.auth('Login successful, token received');
      return loginResponse;
    } catch (e, stackTrace) {
      AppLogger.error('Failed to parse LoginResponse', e, stackTrace);
      rethrow;
    }
  }

  /// Fetches the current cashier's profile.
  ///
  /// Requires a valid JWT token in the Authorization header.
  Future<CashierModel> getCashierProfile() async {
    AppLogger.auth('Fetching cashier profile');

    final response = await _dio.get(ApiEndpoints.auth.cashierMe);

    AppLogger.json('Parsing CashierModel', response.data);

    try {
      final cashierModel = CashierModel.fromJson(response.data);
      AppLogger.auth('Cashier profile parsed successfully', {
        'id': cashierModel.id,
        'username': cashierModel.username,
      });
      return cashierModel;
    } catch (e, stackTrace) {
      AppLogger.error('Failed to parse CashierModel', e, stackTrace);
      rethrow;
    }
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
