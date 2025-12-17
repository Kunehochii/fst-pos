import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/attachment.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

/// API model for attachment data.
@freezed
class AttachmentModel with _$AttachmentModel {
  const AttachmentModel._();

  const factory AttachmentModel({
    required String id,
    required String name,
    required String url,
    required String type,
    @JsonKey(name: 'businessId') required String businessId,
    @JsonKey(name: 'cashierId') String? cashierId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);

  /// Convert to domain entity.
  Attachment toEntity() => Attachment(
        id: id,
        name: name,
        url: url,
        type: AttachmentType.fromValue(type),
        businessId: businessId,
        cashierId: cashierId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
