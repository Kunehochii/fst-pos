// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/employee.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

/// Employee model for API serialization.
///
/// Maps API response to domain entity.
@freezed
class EmployeeModel with _$EmployeeModel {
  const EmployeeModel._();

  const factory EmployeeModel({
    required String id,
    required String name,
    @JsonKey(name: 'cashierId') String? cashierId,
    @JsonKey(name: 'businessId') required String businessId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  /// Converts the model to a domain entity.
  Employee toEntity() => Employee(
        id: id,
        name: name,
        cashierId: cashierId,
        businessId: businessId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// Creates a model from a domain entity.
  factory EmployeeModel.fromEntity(Employee entity) => EmployeeModel(
        id: entity.id,
        name: entity.name,
        cashierId: entity.cashierId,
        businessId: entity.businessId,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
