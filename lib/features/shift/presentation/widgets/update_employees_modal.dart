import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../domain/entities/employee.dart';

/// Modal dialog for updating shift employees.
///
/// Allows the cashier to modify the list of employees for the current shift.
/// The first selected employee remains the designated "Cashier".
class UpdateEmployeesModal extends StatefulWidget {
  final List<String> currentEmployeeIds;
  final List<Employee> allEmployees;

  const UpdateEmployeesModal({
    super.key,
    required this.currentEmployeeIds,
    required this.allEmployees,
  });

  /// Shows the update employees modal.
  /// Returns the new list of employee IDs if confirmed, null if cancelled.
  static Future<List<String>?> show(
    BuildContext context, {
    required List<String> currentEmployeeIds,
    required List<Employee> allEmployees,
  }) {
    return showDialog<List<String>>(
      context: context,
      builder: (context) => UpdateEmployeesModal(
        currentEmployeeIds: currentEmployeeIds,
        allEmployees: allEmployees,
      ),
    );
  }

  @override
  State<UpdateEmployeesModal> createState() => _UpdateEmployeesModalState();
}

class _UpdateEmployeesModalState extends State<UpdateEmployeesModal> {
  late List<String> _selectedEmployeeIds;

  @override
  void initState() {
    super.initState();
    _selectedEmployeeIds = List.from(widget.currentEmployeeIds);
  }

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

  void _handleSave() {
    if (_selectedEmployeeIds.isEmpty) {
      AppToast.warning(
        context,
        title: 'No employees selected',
        message: 'Please select at least one employee for the shift.',
      );
      return;
    }

    Navigator.of(context).pop(_selectedEmployeeIds);
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.border),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    size: 24,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update Employees',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.foreground,
                          ),
                        ),
                        Text(
                          'Modify the employees assigned to this shift',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: AppColors.mutedForeground),
                  ),
                ],
              ),
            ),
            // Hint about first employee
            if (_selectedEmployeeIds.isNotEmpty)
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.info.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(AppColors.radiusSm),
                  border: Border.all(
                    color: AppColors.info.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: AppColors.info,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'The first selected employee will be the designated Cashier',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.info,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Employee list
            Flexible(
              child: widget.allEmployees.isEmpty
                  ? Padding(
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
                              'No employees available',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : _buildEmployeeList(),
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
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton.primary(
                      onPressed:
                          _selectedEmployeeIds.isEmpty ? null : _handleSave,
                      child: const Text('Save Changes'),
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

  Widget _buildEmployeeList() {
    // Sort: selected first, then unselected
    final sortedEmployees = [...widget.allEmployees];
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
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
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
