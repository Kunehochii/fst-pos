import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../providers/shift_provider.dart';
import 'time_in_modal.dart';

/// A guard widget that blocks the UI with a modal when there's no active shift.
///
/// This widget wraps the main content and displays a fullscreen modal
/// when the cashier hasn't clocked in yet, requiring them to time in
/// before accessing the app.
class ShiftGuard extends ConsumerWidget {
  final Widget child;

  const ShiftGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftAsync = ref.watch(shiftNotifierProvider);

    return Stack(
      children: [
        child,
        shiftAsync.when(
          loading: () => _buildLoadingOverlay(),
          error: (_, __) => _buildErrorOverlay(ref),
          data: (state) {
            if (state is NoActiveShift) {
              return _buildTimeInOverlay(context);
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: AppColors.background.withOpacity(0.9),
      child: const Center(
        child: AppLoadingIndicator(
          message: 'Checking shift status...',
        ),
      ),
    );
  }

  Widget _buildErrorOverlay(WidgetRef ref) {
    return Container(
      color: AppColors.background.withOpacity(0.9),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.destructive,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to check shift status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please check your connection and try again.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 24),
            AppButton.primary(
              onPressed: () =>
                  ref.read(shiftNotifierProvider.notifier).refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInOverlay(BuildContext context) {
    return Container(
      color: AppColors.background.withOpacity(0.95),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: AppCard(
            elevation: 2,
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with gradient
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppColors.radiusLg),
                      topRight: Radius.circular(AppColors.radiusLg),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.85),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primaryForeground.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.access_time,
                          size: 40,
                          color: AppColors.primaryForeground,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Time In Required',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryForeground,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please clock in to start your shift',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryForeground.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.muted,
                          borderRadius:
                              BorderRadius.circular(AppColors.radiusSm),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: AppColors.mutedForeground,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'You need to time in before you can access the POS features.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      AppButton.primary(
                        onPressed: () async {
                          await TimeInModal.show(context);
                        },
                        isExpanded: true,
                        icon: Icon(
                          Icons.login,
                          size: 20,
                          color: AppColors.primaryForeground,
                        ),
                        child: const Text('Time In Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
