import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cashier.dart';

part 'cashier_model.freezed.dart';
part 'cashier_model.g.dart';

/// Cashier model for API serialization.
///
/// Maps API response to domain entity.
@freezed
class CashierModel with _$CashierModel {
  const CashierModel._();

  const factory CashierModel({
    required String id,
    required String username,
    required String branchName,
    required String businessId,
    @Default([]) List<String> permissions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CashierModel;

  factory CashierModel.fromJson(Map<String, dynamic> json) =>
      _$CashierModelFromJson(json);

  /// Converts the model to a domain entity.
  Cashier toEntity() => Cashier(
        id: id,
        username: username,
        branchName: branchName,
        businessId: businessId,
        permissions: permissions,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Creates a model from a domain entity.
  factory CashierModel.fromEntity(Cashier entity) => CashierModel(
        id: entity.id,
        username: entity.username,
        branchName: entity.branchName,
        businessId: entity.businessId,
        permissions: entity.permissions,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

/// Login request DTO.
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String username,
    required String accessKey,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

/// Login response DTO.
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
