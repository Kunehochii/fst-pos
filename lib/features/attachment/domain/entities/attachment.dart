import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';

/// Attachment types matching the server enum.
enum AttachmentType {
  expenseReceipt('EXPENSE_RECEIPT', 'Expense Receipt'),
  checksAndBankTransfer('CHECKS_AND_BANK_TRANSFER', 'Checks & Bank Transfer'),
  inventories('INVENTORIES', 'Inventories'),
  supportingDocuments('SUPPORTING_DOCUMENTS', 'Supporting Documents');

  final String value;
  final String displayName;

  const AttachmentType(this.value, this.displayName);

  static AttachmentType fromValue(String value) {
    return AttachmentType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => AttachmentType.supportingDocuments,
    );
  }
}

/// Represents an attachment/uploaded file.
@freezed
class Attachment with _$Attachment {
  const Attachment._();

  const factory Attachment({
    required String id,
    required String name,
    required String url,
    required AttachmentType type,
    required String businessId,
    String? cashierId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Attachment;

  /// Whether this attachment was uploaded by a cashier.
  bool get isUploadedByCashier => cashierId != null;

  /// Get file extension from name.
  String get fileExtension {
    final parts = name.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  /// Whether this is an image file.
  bool get isImage {
    final ext = fileExtension;
    return ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'].contains(ext);
  }

  /// Whether this is a PDF file.
  bool get isPdf => fileExtension == 'pdf';
}
