import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/attachment_remote_datasource.dart';
import '../../data/repositories/attachment_repository_impl.dart';
import '../../domain/entities/attachment.dart';
import '../../domain/repositories/attachment_repository.dart';

part 'attachment_provider.g.dart';

// ============================================================================
// DATA SOURCE PROVIDERS
// ============================================================================

/// Provides the AttachmentRemoteDataSource.
@riverpod
AttachmentRemoteDataSource attachmentRemoteDataSource(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return AttachmentRemoteDataSource(dio);
}

/// Provides the AttachmentRepository.
@riverpod
AttachmentRepository attachmentRepository(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (state) {
      return state.maybeWhen(
        authenticated: (_, __) {
          final remoteDataSource =
              ref.watch(attachmentRemoteDataSourceProvider);
          return AttachmentRepositoryImpl(remoteDataSource: remoteDataSource);
        },
        orElse: () =>
            throw StateError('Must be authenticated to access attachments'),
      );
    },
    loading: () => throw StateError('Auth state is loading'),
    error: (e, _) => throw StateError('Auth state error: $e'),
  );
}

// ============================================================================
// IMAGE PICKER PROVIDER
// ============================================================================

/// Provides ImagePicker instance.
@riverpod
ImagePicker imagePicker(Ref ref) => ImagePicker();

// ============================================================================
// FILTER STATE
// ============================================================================

/// State for the current attachment date filter.
@riverpod
class AttachmentDateNotifier extends _$AttachmentDateNotifier {
  @override
  DateTime build() => DateTime.now();

  /// Set the date.
  void setDate(DateTime date) {
    state = date;
  }

  /// Go to previous day.
  void previousDay() {
    state = state.subtract(const Duration(days: 1));
  }

  /// Go to next day.
  void nextDay() {
    state = state.add(const Duration(days: 1));
  }

  /// Reset to today.
  void resetToToday() {
    state = DateTime.now();
  }
}

/// State for the current attachment type filter.
@riverpod
class AttachmentTypeFilterNotifier extends _$AttachmentTypeFilterNotifier {
  @override
  AttachmentType? build() => null;

  /// Set the type filter.
  void setType(AttachmentType? type) {
    state = type;
  }

  /// Clear the filter.
  void clear() {
    state = null;
  }
}

// ============================================================================
// ATTACHMENT STATE
// ============================================================================

/// State for attachment data.
sealed class AttachmentState {
  const AttachmentState();
}

class AttachmentLoading extends AttachmentState {
  const AttachmentLoading();
}

class AttachmentLoaded extends AttachmentState {
  final List<Attachment> attachments;

  const AttachmentLoaded({required this.attachments});

  /// Whether there are any attachments.
  bool get hasAttachments => attachments.isNotEmpty;

  /// Get count of attachments.
  int get count => attachments.length;
}

class AttachmentError extends AttachmentState {
  final Failure failure;

  const AttachmentError({required this.failure});
}

// ============================================================================
// ATTACHMENT NOTIFIER
// ============================================================================

/// Manages attachment state and operations.
@riverpod
class AttachmentNotifier extends _$AttachmentNotifier {
  @override
  Future<AttachmentState> build() async {
    // Watch filters to trigger refresh when they change
    final date = ref.watch(attachmentDateNotifierProvider);
    final typeFilter = ref.watch(attachmentTypeFilterNotifierProvider);

    return _fetchAttachments(date, typeFilter);
  }

  Future<AttachmentState> _fetchAttachments(
    DateTime date,
    AttachmentType? typeFilter,
  ) async {
    try {
      final repository = ref.read(attachmentRepositoryProvider);

      // Create date range for the selected day (start of day to end of day in UTC)
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1)).subtract(
            const Duration(milliseconds: 1),
          );

      final (failure, attachments) = await repository.getAttachments(
        type: typeFilter,
        startDate: startOfDay,
        endDate: endOfDay,
      );

      if (failure != null) {
        return AttachmentError(failure: failure);
      }

      return AttachmentLoaded(attachments: attachments);
    } catch (e) {
      return AttachmentError(
        failure: Failure.unknown(message: e.toString()),
      );
    }
  }

  /// Refresh attachments.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final date = ref.read(attachmentDateNotifierProvider);
    final typeFilter = ref.read(attachmentTypeFilterNotifierProvider);
    state = AsyncValue.data(await _fetchAttachments(date, typeFilter));
  }

  /// Upload an attachment.
  Future<bool> uploadAttachment({
    required String filePath,
    required String fileName,
    required AttachmentType type,
    String? path,
  }) async {
    try {
      final repository = ref.read(attachmentRepositoryProvider);

      final (failure, attachment) = await repository.uploadAttachment(
        filePath: filePath,
        fileName: fileName,
        type: type,
        path: path,
      );

      if (failure != null) {
        return false;
      }

      // Refresh the list
      await refresh();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Delete an attachment.
  Future<bool> deleteAttachment(String id) async {
    try {
      final repository = ref.read(attachmentRepositoryProvider);

      final (failure, success) = await repository.deleteAttachment(id);

      if (failure != null || !success) {
        return false;
      }

      // Refresh the list
      await refresh();
      return true;
    } catch (e) {
      return false;
    }
  }
}

// ============================================================================
// UPLOAD STATE
// ============================================================================

/// State for upload operations.
@riverpod
class UploadStateNotifier extends _$UploadStateNotifier {
  @override
  bool build() => false;

  /// Set uploading state.
  void setUploading(bool value) {
    state = value;
  }
}
