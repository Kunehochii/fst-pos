import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/attachment.dart';

/// Bottom sheet for uploading attachments.
class UploadAttachmentSheet extends StatefulWidget {
  final Future<void> Function({
    required String filePath,
    required String fileName,
    required AttachmentType type,
  }) onUpload;

  const UploadAttachmentSheet({
    super.key,
    required this.onUpload,
  });

  @override
  State<UploadAttachmentSheet> createState() => _UploadAttachmentSheetState();
}

class _UploadAttachmentSheetState extends State<UploadAttachmentSheet> {
  final ImagePicker _picker = ImagePicker();
  AttachmentType _selectedType = AttachmentType.expenseReceipt;
  bool _isUploading = false;
  String? _selectedFileName;
  String? _selectedFilePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.upload_file,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'Upload Attachment',
                style: theme.textTheme.titleLarge,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Attachment type selector
          Text(
            'Attachment Type',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: AttachmentType.values.map((type) {
              final isSelected = _selectedType == type;
              return ChoiceChip(
                label: Text(type.displayName),
                selected: isSelected,
                onSelected: (_) {
                  setState(() => _selectedType = type);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Source selection buttons
          Text(
            'Select Source',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _SourceButton(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: _isUploading ? null : _pickFromCamera,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SourceButton(
                  icon: Icons.photo_library,
                  label: 'Gallery',
                  onTap: _isUploading ? null : _pickFromGallery,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Selected file info
          if (_selectedFileName != null) ...[
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected File',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer
                                  .withOpacity(0.7),
                            ),
                          ),
                          Text(
                            _selectedFileName!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _selectedFileName = null;
                          _selectedFilePath = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Upload button
          FilledButton.icon(
            onPressed: _canUpload ? _handleUpload : null,
            icon: _isUploading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.onPrimary,
                      ),
                    ),
                  )
                : const Icon(Icons.cloud_upload),
            label: Text(_isUploading ? 'Uploading...' : 'Upload'),
          ),
        ],
      ),
    );
  }

  bool get _canUpload =>
      _selectedFilePath != null && _selectedFileName != null && !_isUploading;

  Future<void> _pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedFileName = image.name;
          _selectedFilePath = image.path;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to access camera: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedFileName = image.name;
          _selectedFilePath = image.path;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to access gallery: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _handleUpload() async {
    if (!_canUpload) return;

    setState(() => _isUploading = true);

    try {
      await widget.onUpload(
        filePath: _selectedFilePath!,
        fileName: _selectedFileName!,
        type: _selectedType,
      );

      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Upload failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }
}

class _SourceButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _SourceButton({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
