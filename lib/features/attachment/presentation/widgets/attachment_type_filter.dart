import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/attachment.dart';
import '../providers/attachment_provider.dart';

/// Widget for filtering attachments by type.
class AttachmentTypeFilter extends ConsumerWidget {
  const AttachmentTypeFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(attachmentTypeFilterNotifierProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // All filter
          _FilterChip(
            label: 'All',
            isSelected: selectedType == null,
            onSelected: () {
              ref.read(attachmentTypeFilterNotifierProvider.notifier).clear();
            },
          ),
          const SizedBox(width: 8),

          // Type filters
          ...AttachmentType.values.map((type) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _FilterChip(
                label: type.displayName,
                isSelected: selectedType == type,
                onSelected: () {
                  ref
                      .read(attachmentTypeFilterNotifierProvider.notifier)
                      .setType(type);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      backgroundColor: theme.colorScheme.surface,
      selectedColor: theme.colorScheme.primaryContainer,
      checkmarkColor: theme.colorScheme.primary,
      labelStyle: TextStyle(
        color: isSelected
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
