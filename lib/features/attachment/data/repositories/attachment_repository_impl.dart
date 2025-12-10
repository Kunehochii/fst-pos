import 'dart:io';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/attachment.dart';
import '../../domain/repositories/attachment_repository.dart';
import '../datasources/attachment_remote_datasource.dart';

/// Implementation of [AttachmentRepository].
class AttachmentRepositoryImpl implements AttachmentRepository {
  final AttachmentRemoteDataSource _remoteDataSource;

  AttachmentRepositoryImpl({
    required AttachmentRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<(Failure?, List<Attachment>)> getAttachments({
    AttachmentType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final startDateString = startDate?.toUtc().toIso8601String();
      final endDateString = endDate?.toUtc().toIso8601String();

      final models = await _remoteDataSource.getCashierAttachments(
        type: type,
        startDate: startDateString,
        endDate: endDateString,
      );

      final attachments = models.map((m) => m.toEntity()).toList();
      AppLogger.info('Fetched attachments', {'count': attachments.length});
      return (null, attachments);
    } on AppException catch (e) {
      AppLogger.error('Failed to get attachments', e);
      return (e.toFailure(), <Attachment>[]);
    } catch (e) {
      AppLogger.error('Unexpected error getting attachments', e);
      return (Failure.unknown(message: e.toString()), <Attachment>[]);
    }
  }

  @override
  Future<(Failure?, Attachment?)> getAttachmentById(String id) async {
    try {
      final model = await _remoteDataSource.getAttachmentById(id);
      final attachment = model.toEntity();
      AppLogger.info('Fetched attachment', {'id': id, 'name': attachment.name});
      return (null, attachment);
    } on AppException catch (e) {
      AppLogger.error('Failed to get attachment by ID', e);
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Unexpected error getting attachment', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, Attachment?)> uploadAttachment({
    required String filePath,
    required String fileName,
    required AttachmentType type,
    String? path,
  }) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return (const Failure.unknown(message: 'File not found'), null);
      }

      final model = await _remoteDataSource.uploadAttachment(
        file: file,
        fileName: fileName,
        type: type,
        path: path,
      );

      final attachment = model.toEntity();
      AppLogger.info('Uploaded attachment', {
        'id': attachment.id,
        'name': attachment.name,
      });
      return (null, attachment);
    } on AppException catch (e) {
      AppLogger.error('Failed to upload attachment', e);
      return (e.toFailure(), null);
    } catch (e) {
      AppLogger.error('Unexpected error uploading attachment', e);
      return (Failure.unknown(message: e.toString()), null);
    }
  }

  @override
  Future<(Failure?, bool)> deleteAttachment(String id) async {
    try {
      await _remoteDataSource.deleteAttachment(id);
      AppLogger.info('Deleted attachment', {'id': id});
      return (null, true);
    } on AppException catch (e) {
      AppLogger.error('Failed to delete attachment', e);
      return (e.toFailure(), false);
    } catch (e) {
      AppLogger.error('Unexpected error deleting attachment', e);
      return (Failure.unknown(message: e.toString()), false);
    }
  }
}
