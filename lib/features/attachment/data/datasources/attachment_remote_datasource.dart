import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/attachment.dart';
import '../models/attachment_model.dart';

/// Remote data source for attachment API operations.
class AttachmentRemoteDataSource {
  final Dio _dio;

  AttachmentRemoteDataSource(this._dio);

  /// Get attachments for the current cashier.
  ///
  /// [type] - Optional attachment type filter.
  /// [startDate] - Optional start date filter (ISO 8601 UTC).
  /// [endDate] - Optional end date filter (ISO 8601 UTC).
  Future<List<AttachmentModel>> getCashierAttachments({
    AttachmentType? type,
    String? startDate,
    String? endDate,
  }) async {
    AppLogger.debug('Fetching cashier attachments', {
      'type': type?.value,
      'startDate': startDate,
      'endDate': endDate,
    });

    try {
      final queryParams = <String, dynamic>{};
      if (type != null) {
        queryParams['type'] = type.value;
      }
      if (startDate != null) {
        queryParams['startDate'] = startDate;
      }
      if (endDate != null) {
        queryParams['endDate'] = endDate;
      }

      final response = await _dio.get(
        ApiEndpoints.upload.cashierList,
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );

      final List<dynamic> data = response.data as List<dynamic>;
      final attachments = data
          .map((json) => AttachmentModel.fromJson(json as Map<String, dynamic>))
          .toList();

      AppLogger.debug('Fetched ${attachments.length} attachments');
      return attachments;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch attachments', e);
      throw e.toAppException();
    }
  }

  /// Get a specific attachment by ID.
  Future<AttachmentModel> getAttachmentById(String id) async {
    AppLogger.debug('Fetching attachment by ID', {'id': id});

    try {
      final response = await _dio.get(ApiEndpoints.upload.cashierById(id));

      final attachment =
          AttachmentModel.fromJson(response.data as Map<String, dynamic>);
      AppLogger.debug('Fetched attachment', {'name': attachment.name});
      return attachment;
    } on DioException catch (e) {
      AppLogger.error('Failed to fetch attachment', e);
      throw e.toAppException();
    }
  }

  /// Upload an attachment as cashier.
  ///
  /// [file] - The file to upload.
  /// [fileName] - Original file name.
  /// [type] - Attachment type.
  /// [path] - Optional folder path for organization.
  Future<AttachmentModel> uploadAttachment({
    required File file,
    required String fileName,
    required AttachmentType type,
    String? path,
  }) async {
    AppLogger.debug('Uploading attachment', {
      'fileName': fileName,
      'type': type.value,
      'path': path,
    });

    try {
      // Determine content type based on file extension
      final extension = fileName.split('.').last.toLowerCase();
      final contentType = _getContentType(extension);

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: contentType,
        ),
        'type': type.value,
        if (path != null && path.isNotEmpty) 'path': path,
      });

      final response = await _dio.post(
        ApiEndpoints.upload.cashier,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      final attachment =
          AttachmentModel.fromJson(response.data as Map<String, dynamic>);
      AppLogger.debug('Attachment uploaded successfully', {
        'id': attachment.id,
        'url': attachment.url,
      });
      return attachment;
    } on DioException catch (e) {
      AppLogger.error('Failed to upload attachment', e);
      throw e.toAppException();
    }
  }

  /// Delete an attachment by ID.
  Future<void> deleteAttachment(String id) async {
    AppLogger.debug('Deleting attachment', {'id': id});

    try {
      await _dio.delete(ApiEndpoints.upload.cashierDelete(id));
      AppLogger.debug('Attachment deleted successfully');
    } on DioException catch (e) {
      AppLogger.error('Failed to delete attachment', e);
      throw e.toAppException();
    }
  }

  /// Get MediaType based on file extension.
  MediaType _getContentType(String extension) {
    return switch (extension) {
      'jpg' || 'jpeg' => MediaType('image', 'jpeg'),
      'png' => MediaType('image', 'png'),
      'gif' => MediaType('image', 'gif'),
      'webp' => MediaType('image', 'webp'),
      'pdf' => MediaType('application', 'pdf'),
      'doc' => MediaType('application', 'msword'),
      'docx' => MediaType('application',
          'vnd.openxmlformats-officedocument.wordprocessingml.document'),
      'xls' => MediaType('application', 'vnd.ms-excel'),
      'xlsx' => MediaType('application',
          'vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
      _ => MediaType('application', 'octet-stream'),
    };
  }
}
