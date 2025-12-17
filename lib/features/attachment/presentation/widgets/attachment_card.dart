import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/attachment.dart';

/// Card widget for displaying an attachment.
class AttachmentCard extends StatelessWidget {
  final Attachment attachment;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const AttachmentCard({
    super.key,
    required this.attachment,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image preview or file icon
            Expanded(
              child: _buildPreview(context),
            ),

            // File info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // File name
                  Text(
                    attachment.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Type badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(theme).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      attachment.type.displayName,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: _getTypeColor(theme),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Timestamp
                  Text(
                    DateFormat('MMM d, h:mm a')
                        .format(attachment.createdAt.toLocal()),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Delete button
            if (onDelete != null)
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: theme.dividerColor,
                    ),
                  ),
                ),
                child: TextButton.icon(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: theme.colorScheme.error,
                  ),
                  label: Text(
                    'Delete',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview(BuildContext context) {
    final theme = Theme.of(context);

    if (attachment.isImage) {
      return Image.network(
        attachment.url,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildIconPreview(context, Icons.broken_image);
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
      );
    }

    // PDF or other document
    IconData icon;
    Color? iconColor;

    if (attachment.isPdf) {
      icon = Icons.picture_as_pdf;
      iconColor = Colors.red;
    } else {
      icon = Icons.insert_drive_file;
      iconColor = theme.colorScheme.primary;
    }

    return _buildIconPreview(context, icon, iconColor: iconColor);
  }

  Widget _buildIconPreview(BuildContext context, IconData icon,
      {Color? iconColor}) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          icon,
          size: 48,
          color: iconColor ?? theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Color _getTypeColor(ThemeData theme) {
    return switch (attachment.type) {
      AttachmentType.expenseReceipt => Colors.orange,
      AttachmentType.checksAndBankTransfer => Colors.blue,
      AttachmentType.inventories => Colors.green,
      AttachmentType.supportingDocuments => Colors.purple,
    };
  }
}
