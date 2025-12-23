import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/shift.dart';
import '../providers/shift_provider.dart';
import '../widgets/time_in_modal.dart';
import '../widgets/update_employees_modal.dart';

/// Shift page displaying current shift information.
///
/// Features:
/// - Current shift details (if active)
/// - Time in button (if no active shift)
/// - Time out button
/// - Update employees functionality
class ShiftPage extends ConsumerWidget {
  const ShiftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftAsync = ref.watch(shiftNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page header
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Shift Management',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your work shift and employees',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: 32),
            // Content
            Expanded(
              child: shiftAsync.when(
                loading: () => const Center(child: AppLoadingIndicator()),
                error: (error, _) => Center(
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
                        'Failed to load shift information',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppButton.primary(
                        onPressed: () =>
                            ref.read(shiftNotifierProvider.notifier).refresh(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                data: (state) {
                  if (state is ActiveShift) {
                    return _ActiveShiftView(shift: state.shift);
                  }
                  return const _NoShiftView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// View when there is no active shift.
class _NoShiftView extends ConsumerWidget {
  const _NoShiftView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: AppCard(
          elevation: 1,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.muted,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.access_time,
                  size: 40,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'No Active Shift',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You haven\'t clocked in yet. Start your shift to begin tracking your work hours.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 32),
              AppButton.primary(
                onPressed: () async {
                  final result = await TimeInModal.show(context);
                  if (result == true) {
                    // Shift was created, provider will update automatically
                  }
                },
                isExpanded: true,
                icon: Icon(
                  Icons.login,
                  size: 20,
                  color: AppColors.primaryForeground,
                ),
                child: const Text('Time In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// View when there is an active shift.
class _ActiveShiftView extends ConsumerStatefulWidget {
  final Shift shift;

  const _ActiveShiftView({required this.shift});

  @override
  ConsumerState<_ActiveShiftView> createState() => _ActiveShiftViewState();
}

class _ActiveShiftViewState extends ConsumerState<_ActiveShiftView> {
  bool _isEndingShift = false;

  String _getErrorMessage(Failure failure) {
    return failure.when(
      server: (message, _) => message,
      network: (message) => message,
      cache: (message) => message,
      auth: (message) => message,
      validation: (message, _, __) => message,
      unknown: (message) => message,
    );
  }

  Future<void> _handleTimeOut() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppColors.radiusLg),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.destructive.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Icon(
                        Icons.logout,
                        size: 28,
                        color: AppColors.destructive,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'End Shift?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Are you sure you want to end your current shift? This action cannot be undone.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
              // Actions
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton.secondary(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppButton.destructive(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('End Shift'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (confirm != true) return;

    setState(() => _isEndingShift = true);

    final failure =
        await ref.read(shiftNotifierProvider.notifier).timeOut(widget.shift.id);

    if (!mounted) return;
    setState(() => _isEndingShift = false);

    if (failure != null) {
      AppToast.error(
        context,
        title: 'Time Out Failed',
        message: _getErrorMessage(failure),
      );
      return;
    }

    AppToast.success(
      context,
      title: 'Time Out Successful',
      message: 'Your shift has ended!',
    );
  }

  Future<void> _handleUpdateEmployees() async {
    final employees = ref.read(employeesProvider).valueOrNull ?? [];
    final result = await UpdateEmployeesModal.show(
      context,
      currentEmployeeIds:
          widget.shift.employees.map((e) => e.employeeId).toList(),
      allEmployees: employees,
    );

    if (result != null && result.isNotEmpty) {
      final failure = await ref
          .read(shiftNotifierProvider.notifier)
          .updateEmployees(widget.shift.id, result);

      if (!mounted) return;

      if (failure != null) {
        AppToast.error(
          context,
          title: 'Update Failed',
          message: _getErrorMessage(failure),
        );
        return;
      }

      AppToast.success(
        context,
        title: 'Employees Updated',
        message: 'Shift employees have been updated.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');
    final duration = DateTime.now().difference(widget.shift.startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Active shift status card
            AppCard(
              elevation: 1,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Status badge with light background
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.success.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: AppColors.success,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Active Shift',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.timer,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${hours}h ${minutes}m',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    dateFormat.format(widget.shift.startTime.toLocal()),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.login,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Started at ${timeFormat.format(widget.shift.startTime.toLocal())}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Employees section
            Row(
              children: [
                Text(
                  'Shift Employees',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const Spacer(),
                AppButton.secondary(
                  onPressed: _handleUpdateEmployees,
                  icon: Icon(
                    Icons.edit,
                    size: 16,
                    color: AppColors.foreground,
                  ),
                  child: const Text('Update'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppCard(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  for (int i = 0; i < widget.shift.employees.length; i++)
                    _buildEmployeeRow(widget.shift.employees[i], i),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Time out button
            AppCard(
              elevation: 1,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(
                    Icons.logout,
                    size: 40,
                    color: AppColors.destructive,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ready to end your shift?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Click the button below to clock out and end your current shift.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton.destructive(
                    onPressed: _isEndingShift ? null : _handleTimeOut,
                    isLoading: _isEndingShift,
                    isExpanded: true,
                    icon: _isEndingShift
                        ? null
                        : Icon(
                            Icons.logout,
                            size: 20,
                            color: AppColors.destructiveForeground,
                          ),
                    child:
                        Text(_isEndingShift ? 'Ending Shift...' : 'Time Out'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeRow(dynamic employee, int index) {
    final isCashier = index == 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            index > 0 ? Border(top: BorderSide(color: AppColors.border)) : null,
      ),
      child: Row(
        children: [
          // Avatar with number
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isCashier ? AppColors.secondary : AppColors.primary,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryForeground,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Name and role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.employeeName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.foreground,
                  ),
                ),
                if (isCashier)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Designated Cashier',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryForeground,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
