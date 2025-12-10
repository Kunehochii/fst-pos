import 'package:flutter/material.dart';

import '../../domain/entities/attachment.dart';

/// Grid view for displaying attachments.
class AttachmentGrid extends StatelessWidget {
  final List<Attachment> attachments;
  final void Function(Attachment)? onAttachmentTap;
  final void Function(Attachment)? onAttachmentDelete;

  const AttachmentGrid({
    super.key,
    required this.attachments,
    this.onAttachmentTap,
    this.onAttachmentDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
      return _buildEmptyState(context);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: attachments.length,
      itemBuilder: (context, index) {
        final attachment = attachments[index];
        return _AttachmentGridCard(
          attachment: attachment,
          onTap: onAttachmentTap != null
              ? () => onAttachmentTap!(attachment)
              : null,
          onDelete: onAttachmentDelete != null
              ? () => onAttachmentDelete!(attachment)
              : null,
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.attach_file_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No attachments found',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Upload attachments using the button below',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _AttachmentGridCard extends StatelessWidget {
  final Attachment attachment;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const _AttachmentGridCard({
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
            // Preview
            Expanded(
              flex: 3,
              child: _buildPreview(context),
            ),

            // Info section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // File name
                    Text(
                      attachment.name,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Type badge
                    _TypeBadge(type: attachment.type),

                    const Spacer(),

                    // Delete button
                    if (onDelete != null)
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: onDelete,
                          icon: Icon(
                            Icons.delete_outline,
                            size: 18,
                            color: theme.colorScheme.error,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          tooltip: 'Delete',
                        ),
                      ),
                  ],
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
              strokeWidth: 2,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    }

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
          size: 32,
          color: iconColor ?? theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final AttachmentType type;

  const _TypeBadge({required this.type});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _getTypeColor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        _getShortName(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontSize: 10,
        ),
      ),
    );
  }

  Color _getTypeColor() {
    return switch (type) {
      AttachmentType.expenseReceipt => Colors.orange,
      AttachmentType.checksAndBankTransfer => Colors.blue,
      AttachmentType.inventories => Colors.green,
      AttachmentType.supportingDocuments => Colors.purple,
    };
  }

  String _getShortName() {
    return switch (type) {
      AttachmentType.expenseReceipt => 'Receipt',
      AttachmentType.checksAndBankTransfer => 'Transfer',
      AttachmentType.inventories => 'Inventory',
      AttachmentType.supportingDocuments => 'Document',
    };
  }
}
