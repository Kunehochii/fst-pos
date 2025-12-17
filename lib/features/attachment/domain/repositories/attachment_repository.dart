import '../../../../core/errors/failure.dart';
import '../entities/attachment.dart';

/// Repository interface for attachment operations.
abstract class AttachmentRepository {
  /// Get attachments for the current cashier.
  ///
  /// Returns a tuple of (Failure?, List<Attachment>).
  /// Optionally filter by type and date range (UTC).
  Future<(Failure?, List<Attachment>)> getAttachments({
    AttachmentType? type,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get a specific attachment by ID.
  ///
  /// Returns a tuple of (Failure?, Attachment?).
  Future<(Failure?, Attachment?)> getAttachmentById(String id);

  /// Upload an attachment.
  ///
  /// [filePath] - Local file path to upload.
  /// [fileName] - Original file name.
  /// [type] - Attachment type.
  /// [path] - Optional folder path for organization.
  ///
  /// Returns a tuple of (Failure?, Attachment?).
  Future<(Failure?, Attachment?)> uploadAttachment({
    required String filePath,
    required String fileName,
    required AttachmentType type,
    String? path,
  });

  /// Delete an attachment by ID.
  ///
  /// Returns a tuple of (Failure?, bool) indicating success.
  Future<(Failure?, bool)> deleteAttachment(String id);
}
