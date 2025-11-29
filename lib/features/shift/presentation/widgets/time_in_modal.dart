import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/employee.dart';
import '../providers/shift_provider.dart';

/// Modal dialog for time in (creating a new shift).
///
/// Allows the cashier to select employees for the shift.
/// The first selected employee is designated as the "Cashier" for the shift.
class TimeInModal extends ConsumerStatefulWidget {
  const TimeInModal({super.key});

  /// Shows the time in modal.
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const TimeInModal(),
    );
  }

  @override
  ConsumerState<TimeInModal> createState() => _TimeInModalState();
}

class _TimeInModalState extends ConsumerState<TimeInModal> {
  final List<String> _selectedEmployeeIds = [];
  bool _isLoading = false;

  void _toggleEmployee(Employee employee) {
    setState(() {
      if (_selectedEmployeeIds.contains(employee.id)) {
        _selectedEmployeeIds.remove(employee.id);
      } else {
        _selectedEmployeeIds.add(employee.id);
      }
    });
  }

  void _moveToTop(String employeeId) {
    setState(() {
      _selectedEmployeeIds.remove(employeeId);
      _selectedEmployeeIds.insert(0, employeeId);
    });
  }

  Future<void> _handleTimeIn() async {
    if (_selectedEmployeeIds.isEmpty) {
      AppToast.warning(
        context,
        title: 'No employees selected',
        message: 'Please select at least one employee for the shift.',
      );
      return;
    }

    setState(() => _isLoading = true);

    final failure = await ref
        .read(shiftNotifierProvider.notifier)
        .timeIn(_selectedEmployeeIds);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (failure != null) {
      AppToast.error(
        context,
        title: 'Time In Failed',
        message: _getErrorMessage(failure),
      );
      return;
    }

    AppToast.success(
      context,
      title: 'Time In Successful',
      message: 'Your shift has started!',
    );
    Navigator.of(context).pop(true);
  }

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

  @override
  Widget build(BuildContext context) {
    final employeesAsync = ref.watch(employeesProvider);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppColors.radiusLg),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppColors.radiusLg),
                  topRight: Radius.circular(AppColors.radiusLg),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.login,
                    size: 48,
                    color: AppColors.primaryForeground,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Time In',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryForeground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Select employees for this shift',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryForeground.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            // Hint about first employee
            if (_selectedEmployeeIds.isNotEmpty)
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  border: Border.all(
                    color: AppColors.secondary.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'The first selected employee will be the designated Cashier',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Employee list
            Flexible(
              child: employeesAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: AppLoadingIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: AppColors.destructive,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Failed to load employees',
                          style: TextStyle(color: AppColors.mutedForeground),
                        ),
                        const SizedBox(height: 8),
                        AppButton.secondary(
                          onPressed: () =>
                              ref.invalidate(employeesProvider),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
                data: (employees) {
                  if (employees.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.people_outline,
                              size: 48,
                              color: AppColors.mutedForeground,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No employees found',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Please add employees from the backoffice',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return _buildEmployeeList(employees);
                },
              ),
            ),
            // Actions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.border),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton.secondary(
                      onPressed: _isLoading
                          ? null
                          : () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton.primary(
                      onPressed: _isLoading || _selectedEmployeeIds.isEmpty
                          ? null
                          : _handleTimeIn,
                      isLoading: _isLoading,
                      child: Text(_isLoading ? 'Starting...' : 'Start Shift'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeList(List<Employee> employees) {
    // Sort: selected first, then unselected
    final sortedEmployees = [...employees];
    sortedEmployees.sort((a, b) {
      final aSelected = _selectedEmployeeIds.contains(a.id);
      final bSelected = _selectedEmployeeIds.contains(b.id);
      if (aSelected && !bSelected) return -1;
      if (!aSelected && bSelected) return 1;
      // Maintain selection order for selected employees
      if (aSelected && bSelected) {
        return _selectedEmployeeIds.indexOf(a.id) -
            _selectedEmployeeIds.indexOf(b.id);
      }
      return a.name.compareTo(b.name);
    });

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      shrinkWrap: true,
      itemCount: sortedEmployees.length,
      itemBuilder: (context, index) {
        final employee = sortedEmployees[index];
        final isSelected = _selectedEmployeeIds.contains(employee.id);
        final selectionIndex = _selectedEmployeeIds.indexOf(employee.id);
        final isCashier = selectionIndex == 0;

        return _buildEmployeeTile(
          employee: employee,
          isSelected: isSelected,
          isCashier: isCashier,
          selectionIndex: selectionIndex,
        );
      },
    );
  }

  Widget _buildEmployeeTile({
    required Employee employee,
    required bool isSelected,
    required bool isCashier,
    required int selectionIndex,
  }) {
    return InkWell(
      onTap: () => _toggleEmployee(employee),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? isCashier
                  ? AppColors.secondary.withOpacity(0.15)
                  : AppColors.primary.withOpacity(0.08)
              : AppColors.background,
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(
            color: isSelected
                ? isCashier
                    ? AppColors.secondary
                    : AppColors.primary.withOpacity(0.3)
                : AppColors.border,
            width: isSelected && isCashier ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Selection indicator / avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? isCashier
                        ? AppColors.secondary
                        : AppColors.primary
                    : AppColors.muted,
                borderRadius: BorderRadius.circular(20),
              ),
              child: isSelected
                  ? Center(
                      child: Text(
                        '${selectionIndex + 1}',
                        style: TextStyle(
                          color: AppColors.primaryForeground,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : Icon(
                      Icons.person,
                      color: AppColors.mutedForeground,
                      size: 20,
                    ),
            ),
            const SizedBox(width: 12),
            // Employee name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.name,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
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
            // Make cashier button (for non-first selected)
            if (isSelected && !isCashier)
              IconButton(
                onPressed: () => _moveToTop(employee.id),
                icon: Icon(
                  Icons.arrow_upward,
                  size: 18,
                  color: AppColors.primary,
                ),
                tooltip: 'Make Cashier',
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                ),
              ),
            // Checkbox
            const SizedBox(width: 8),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.primaryForeground,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
