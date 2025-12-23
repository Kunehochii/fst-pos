import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/attachment.dart';
import '../providers/attachment_provider.dart';
import '../widgets/attachment_date_selector.dart';
import '../widgets/attachment_grid.dart';
import '../widgets/attachment_type_filter.dart';
import '../widgets/upload_attachment_sheet.dart';

/// Main attachment page for viewing and uploading attachments.
class AttachmentPage extends ConsumerWidget {
  const AttachmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachmentState = ref.watch(attachmentNotifierProvider);
    final isUploading = ref.watch(uploadStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attachments'),
        actions: [
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(attachmentNotifierProvider.notifier).refresh();
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Date selector
          const AttachmentDateSelector(),

          // Type filter
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: AttachmentTypeFilter(),
          ),

          // Content
          Expanded(
            child: attachmentState.when(
              data: (state) => _buildContent(context, ref, state),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => _buildError(context, ref, error),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isUploading ? null : () => _showUploadSheet(context, ref),
        icon: isUploading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.add_a_photo),
        label: Text(isUploading ? 'Uploading...' : 'Upload'),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, WidgetRef ref, AttachmentState state) {
    if (state is AttachmentLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is AttachmentError) {
      return _buildErrorState(context, ref, state.failure.message);
    }

    if (state is AttachmentLoaded) {
      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(attachmentNotifierProvider.notifier).refresh();
        },
        child: AttachmentGrid(
          attachments: state.attachments,
          onAttachmentTap: (attachment) =>
              _showAttachmentPreview(context, attachment),
          onAttachmentDelete: (attachment) =>
              _confirmDelete(context, ref, attachment),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Object error) {
    return _buildErrorState(context, ref, error.toString());
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load attachments',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                ref.read(attachmentNotifierProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showUploadSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => UploadAttachmentSheet(
        onUpload: ({
          required String filePath,
          required String fileName,
          required AttachmentType type,
        }) async {
          ref.read(uploadStateNotifierProvider.notifier).setUploading(true);

          try {
            final success = await ref
                .read(attachmentNotifierProvider.notifier)
                .uploadAttachment(
                  filePath: filePath,
                  fileName: fileName,
                  type: type,
                );

            if (context.mounted) {
              if (success) {
                AppToast.success(
                  context,
                  title: 'Success',
                  message: 'Attachment uploaded successfully',
                );
              } else {
                AppToast.error(
                  context,
                  title: 'Error',
                  message: 'Failed to upload attachment',
                );
              }
            }
          } finally {
            ref.read(uploadStateNotifierProvider.notifier).setUploading(false);
          }
        },
      ),
    );
  }

  void _showAttachmentPreview(BuildContext context, Attachment attachment) {
    showDialog(
      context: context,
      builder: (context) => _AttachmentPreviewDialog(attachment: attachment),
    );
  }

  void _confirmDelete(
      BuildContext context, WidgetRef ref, Attachment attachment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Attachment'),
        content: Text(
          'Are you sure you want to delete "${attachment.name}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final success = await ref
                  .read(attachmentNotifierProvider.notifier)
                  .deleteAttachment(attachment.id);

              if (context.mounted) {
                if (success) {
                  AppToast.success(
                    context,
                    title: 'Deleted',
                    message: 'Attachment deleted',
                  );
                } else {
                  AppToast.error(
                    context,
                    title: 'Error',
                    message: 'Failed to delete attachment',
                  );
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _AttachmentPreviewDialog extends StatelessWidget {
  final Attachment attachment;

  const _AttachmentPreviewDialog({required this.attachment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: theme.colorScheme.primaryContainer,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attachment.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        attachment.type.displayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          // Preview
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: attachment.isImage
                ? InteractiveViewer(
                    child: Image.network(
                      attachment.url,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stack) {
                        return _buildErrorPreview(context);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  )
                : _buildNonImagePreview(context),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorPreview(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(48),
      color: theme.colorScheme.errorContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.broken_image,
            size: 64,
            color: theme.colorScheme.onErrorContainer,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load image',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNonImagePreview(BuildContext context) {
    final theme = Theme.of(context);

    IconData icon;
    Color iconColor;

    if (attachment.isPdf) {
      icon = Icons.picture_as_pdf;
      iconColor = Colors.red;
    } else {
      icon = Icons.insert_drive_file;
      iconColor = theme.colorScheme.primary;
    }

    return Container(
      padding: const EdgeInsets.all(48),
      color: theme.colorScheme.surfaceContainerHighest,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: iconColor),
          const SizedBox(height: 16),
          Text(
            'Preview not available',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'File type: ${attachment.fileExtension.toUpperCase()}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
