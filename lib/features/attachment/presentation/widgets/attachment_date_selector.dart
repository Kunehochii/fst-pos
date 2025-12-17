import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/attachment_provider.dart';

/// Widget for selecting attachment date with navigation buttons.
class AttachmentDateSelector extends ConsumerWidget {
  const AttachmentDateSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(attachmentDateNotifierProvider);
    final theme = Theme.of(context);
    final isToday = _isSameDay(selectedDate, DateTime.now());

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            // Previous day button
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                ref.read(attachmentDateNotifierProvider.notifier).previousDay();
              },
              tooltip: 'Previous day',
            ),

            // Date display and picker
            Expanded(
              child: InkWell(
                onTap: () => _selectDate(context, ref, selectedDate),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat('EEEE').format(selectedDate),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('MMMM d, yyyy').format(selectedDate),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isToday)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Today',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // Next day button
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                ref.read(attachmentDateNotifierProvider.notifier).nextDay();
              },
              tooltip: 'Next day',
            ),

            // Today button (only show if not today)
            if (!isToday)
              IconButton(
                icon: const Icon(Icons.today),
                onPressed: () {
                  ref
                      .read(attachmentDateNotifierProvider.notifier)
                      .resetToToday();
                },
                tooltip: 'Go to today',
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    WidgetRef ref,
    DateTime currentDate,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      ref.read(attachmentDateNotifierProvider.notifier).setDate(picked);
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
