# Sheet Feature Design Update Guide

> **Reference document for updating the Sheet feature UI to match the "Aura Daybreak" design system.**
> Use this guide alongside `POS_DESIGN_GUIDE.md` and `AGENT_CONTEXT.md`.

---

## Overview

This guide covers updating the Sheet feature's **dialogs, buttons, popovers, toolbars, and controls** to follow the Aura Daybreak light mode design. The **sheet/table grid cells remain unchanged** as requested.

---

## Design System Quick Reference

### Color Palette (from `AppColors`)

| Token | Hex | Usage |
|-------|-----|-------|
| `primary` | `#F97316` | Vivid Orange - CTAs, active states, focus rings |
| `primaryForeground` | `#FFFFFF` | White text on primary |
| `primaryHover` | `#EA580C` | Pressed/hover state for primary |
| `secondary` | `#1E293B` | Deep Navy - text emphasis |
| `background` | `#F3F4F6` | Cool White/Light Gray - main bg |
| `foreground` | `#0F172A` | Deep Navy/Charcoal - main text |
| `card` | `#FFFFFF` | Pure White - content cards |
| `muted` | `#F1F5F9` | Slate 100 - inputs bg, hover states |
| `mutedForeground` | `#64748B` | Slate 500 - labels, metadata |
| `border` | `#E2E8F0` | Pale Gray - dividers, borders |
| `ring` | `#F97316` | Orange focus ring |
| `destructive` | `#F43F5E` | Rose - errors, delete actions |
| `success` | `#10B981` | Emerald - success states |

### Design Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `radiusLg` | `16.0` | Cards, dialogs |
| `radiusMd` | `14.0` | Medium elements |
| `radiusSm` | `12.0` | Buttons, inputs |
| `radiusXl` | `20.0` | Extra large |

### Shadow Standards

```dart
// Soft diffused shadow for popovers/dialogs
BoxShadow(
  color: Colors.black.withOpacity(0.1),
  blurRadius: 8,
  offset: const Offset(0, 4),
)

// Lighter shadow for elevated cards
BoxShadow(
  color: Colors.black.withOpacity(0.08),
  blurRadius: 6,
  spreadRadius: -1,
  offset: const Offset(0, 4),
)
```

---

## Components to Update

### 1. SheetToolbar (`sheet_toolbar.dart`)

**Current State:**
- Uses `ElevatedButton.styleFrom()` with manual colors
- Container with white background and border

**Target State:**
- Use `AppButton.primary()` for "Add Row" button
- Use `AppButton.secondary()` for "Save" button (when hasChanges)
- Toolbar container remains white with bottom border (already correct)

**Changes Required:**

```dart
// BEFORE: ElevatedButton.icon for Add Row
ElevatedButton.icon(
  onPressed: onAddRow,
  icon: const Icon(Icons.add, size: 18),
  label: const Text('Add Row'),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.primaryForeground,
  ),
)

// AFTER: Use AppButton.primary with icon
AppButton.primary(
  onPressed: onAddRow,
  icon: const Icon(Icons.add, size: 18),
  small: true,
  child: const Text('Add Row'),
)
```

```dart
// BEFORE: ElevatedButton for Save
ElevatedButton.icon(
  onPressed: isSaving ? null : onSave,
  icon: isSaving ? ... : const Icon(Icons.save, size: 18),
  label: Text(isSaving ? 'Saving...' : 'Save'),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.secondaryForeground,
  ),
)

// AFTER: Use AppButton.secondary with loading state
AppButton.secondary(
  onPressed: onSave,
  isLoading: isSaving,
  icon: const Icon(Icons.save, size: 18),
  small: true,
  child: Text(isSaving ? 'Saving...' : 'Save'),
)
```

---

### 2. FormulaBar (`sheet_toolbar.dart`)

**Current State:**
- Manual TextField styling with OutlineInputBorder
- IconButtons without consistent styling

**Target State:**
- Use `AppTextField` for formula input (if applicable) or style consistently
- IconButtons should use primary color for submit, mutedForeground for cancel
- Container styling is correct (white bg, bottom border)

**Changes Required:**

```dart
// TextField styling update - focus state with orange ring
TextField(
  controller: _controller,
  focusNode: _focusNode,
  decoration: InputDecoration(
    hintText: widget.cellAddress != null
        ? 'Enter value or formula for ${widget.cellAddress}'
        : 'Select a cell to edit',
    filled: true,
    fillColor: AppColors.muted,  // Gray bg when unfocused
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppColors.radiusSm),
      borderSide: BorderSide(color: AppColors.ring, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    isDense: true,
  ),
)
```

---

### 3. Delete Confirmation Dialog (`sheet_page.dart`)

**Current State:**
- Uses AlertDialog with ElevatedButton.styleFrom()

**Target State:**
- Use styled AlertDialog with proper border radius
- Use `AppButton.secondary()` for Cancel
- Use `AppButton.destructive()` for Delete

**Changes Required:**

```dart
// BEFORE
showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Delete rows?'),
    content: Text('Are you sure you want to delete ${_selectedRowIds.length} row(s)?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () => Navigator.pop(context, true),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.destructive,
          foregroundColor: AppColors.destructiveForeground,
        ),
        child: const Text('Delete'),
      ),
    ],
  ),
);

// AFTER
showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppColors.radiusLg),
    ),
    title: const Text(
      'Delete rows?',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.foreground,
      ),
    ),
    content: Text(
      'Are you sure you want to delete ${_selectedRowIds.length} row(s)? This action cannot be undone.',
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.mutedForeground,
      ),
    ),
    actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
    actions: [
      AppButton.secondary(
        onPressed: () => Navigator.pop(context, false),
        child: const Text('Cancel'),
      ),
      const SizedBox(width: 12),
      AppButton.destructive(
        onPressed: () => Navigator.pop(context, true),
        icon: const Icon(Icons.delete_outline, size: 18),
        child: const Text('Delete'),
      ),
    ],
  ),
);
```

---

### 4. ColorPickerButton & CellColorPicker (`color_picker.dart`)

**Current State:**
- Container with manual styling
- TextButton for "Clear Color"

**Target State:**
- Popover container with soft shadow, proper border radius
- Use `AppButton.ghost()` for "Clear Color"
- Selected color indicator with orange ring (ring-2)

**Changes Required:**

```dart
// Color picker container styling
Container(
  width: 220,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppColors.card,
    borderRadius: BorderRadius.circular(AppColors.radiusMd),
    border: Border.all(color: AppColors.border),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  // ...
)

// Clear Color button
AppButton.ghost(
  onPressed: () => onColorSelected(null),
  small: true,
  child: const Text('Clear Color'),
)
```

```dart
// Color swatch selection - selected state with orange ring
Container(
  width: 28,
  height: 28,
  decoration: BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.circular(6),
    border: Border.all(
      color: isSelected ? AppColors.primary : AppColors.border,
      width: isSelected ? 2 : 1,
    ),
    boxShadow: isSelected ? [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.3),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ] : null,
  ),
)
```

---

### 5. QuickFormulaMenu (`quick_formula_menu.dart`)

**Current State:**
- Container with manual border styling
- PopupMenuItem with manual text styling

**Target State:**
- Trigger button styled as outlined button (similar to AppButton.secondary)
- Menu items with proper text hierarchy
- Dividers maintained

**Changes Required:**

```dart
// Trigger button styling
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  decoration: BoxDecoration(
    color: enabled ? AppColors.card : AppColors.muted,
    borderRadius: BorderRadius.circular(AppColors.radiusSm),
    border: Border.all(color: AppColors.border),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.functions,
        size: 18,
        color: enabled ? AppColors.foreground : AppColors.mutedForeground,
      ),
      const SizedBox(width: 6),
      Text(
        'Formula',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: enabled ? AppColors.foreground : AppColors.mutedForeground,
        ),
      ),
      const SizedBox(width: 4),
      Icon(
        Icons.keyboard_arrow_down,
        size: 18,
        color: enabled ? AppColors.foreground : AppColors.mutedForeground,
      ),
    ],
  ),
)
```

---

### 6. RowActionsMenu (`row_controls.dart`)

**Current State:**
- PopupMenuButton with Icon trigger
- PopupMenuItem with Row of Icon + Text

**Target State:**
- Keep the popup menu structure
- Ensure destructive items (Delete) use `AppColors.destructive`
- Menu items should have consistent padding and hover states

**Note:** PopupMenuButton styling is largely handled by ThemeData. The current implementation is mostly correct, just ensure the delete item styling is consistent.

---

### 7. BulkActionsBar (`row_controls.dart`)

**Current State:**
- Container with AppColors.accent background
- TextButton for "Clear"
- ElevatedButton.styleFrom for "Delete"

**Target State:**
- Container with muted background or subtle accent
- Use `AppButton.ghost()` for "Clear"
- Use `AppButton.destructive()` for "Delete"

**Changes Required:**

```dart
// BEFORE
Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  decoration: BoxDecoration(
    color: AppColors.accent,
    border: Border(top: BorderSide(color: AppColors.border)),
  ),
  child: Row(
    children: [
      // ...
      TextButton.icon(...),
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.destructive,
          foregroundColor: AppColors.destructiveForeground,
        ),
        ...
      ),
    ],
  ),
)

// AFTER
Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  decoration: BoxDecoration(
    color: AppColors.card,
    border: Border(top: BorderSide(color: AppColors.border)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
        offset: const Offset(0, -2),
      ),
    ],
  ),
  child: Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppColors.radiusSm),
        ),
        child: Text(
          '$selectedCount row${selectedCount > 1 ? 's' : ''} selected',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
      const Spacer(),
      AppButton.ghost(
        onPressed: onClearSelection,
        small: true,
        icon: const Icon(Icons.clear, size: 16),
        child: const Text('Clear'),
      ),
      const SizedBox(width: 8),
      AppButton.destructive(
        onPressed: onDelete,
        small: true,
        icon: const Icon(Icons.delete_outline, size: 16),
        child: const Text('Delete'),
      ),
    ],
  ),
)
```

---

### 8. AddRowFAB (`row_controls.dart`)

**Current State:**
- FloatingActionButton with AppColors.primary

**Target State:**
- Keep the FAB pattern but ensure it matches the design system
- Already correctly using primary color

**No changes required** - current implementation is correct.

---

### 9. EmptySheetPlaceholder (`row_controls.dart`)

**Current State:**
- ElevatedButton.styleFrom for "Add First Row"

**Target State:**
- Use `AppButton.primary()` for consistency

**Changes Required:**

```dart
// BEFORE
ElevatedButton.icon(
  onPressed: onAddRow,
  icon: const Icon(Icons.add),
  label: const Text('Add First Row'),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.primaryForeground,
  ),
)

// AFTER
AppButton.primary(
  onPressed: onAddRow,
  icon: const Icon(Icons.add, size: 18),
  child: const Text('Add First Row'),
)
```

---

### 10. Empty/Error States (`sheet_page.dart`)

**Current State:**
- ElevatedButton.styleFrom for "Create Sheet" and "Retry"

**Target State:**
- Use `AppButton.primary()` for main actions
- Error icon should use `AppColors.destructive`

**Changes Required:**

```dart
// Empty state - Create Sheet button
AppButton.primary(
  onPressed: _createSheet,
  icon: const Icon(Icons.add, size: 18),
  child: const Text('Create Sheet'),
)

// Error state - Retry button
AppButton.primary(
  onPressed: _refresh,
  icon: const Icon(Icons.refresh, size: 18),
  child: const Text('Retry'),
)
```

---

### 11. Date Picker Button (AppBar)

**Current State:**
- TextButton.icon in AppBar

**Target State:**
- Styled as subtle outlined button with icon

**Changes Required:**

```dart
// BEFORE
TextButton.icon(
  onPressed: _selectDate,
  icon: const Icon(Icons.calendar_today, size: 18),
  label: Text(
    DateFormat('MMM d, yyyy').format(_selectedDate),
    style: const TextStyle(fontWeight: FontWeight.w500),
  ),
)

// AFTER
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: AppColors.muted,
    borderRadius: BorderRadius.circular(AppColors.radiusSm),
    border: Border.all(color: AppColors.border),
  ),
  child: InkWell(
    onTap: _selectDate,
    borderRadius: BorderRadius.circular(AppColors.radiusSm),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.calendar_today, size: 16, color: AppColors.foreground),
        const SizedBox(width: 8),
        Text(
          DateFormat('MMM d, yyyy').format(_selectedDate),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.foreground,
          ),
        ),
      ],
    ),
  ),
)
```

---

### 12. AppBar Save Button

**Current State:**
- ElevatedButton.icon in actions

**Target State:**
- Use `AppButton.primary()` for consistency

**Changes Required:**

```dart
// BEFORE
ElevatedButton.icon(
  onPressed: _isSaving ? null : _saveChanges,
  icon: _isSaving
      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
      : const Icon(Icons.save, size: 18),
  label: Text(_isSaving ? 'Saving...' : 'Save'),
)

// AFTER
AppButton.primary(
  onPressed: _saveChanges,
  isLoading: _isSaving,
  icon: const Icon(Icons.save, size: 16),
  small: true,
  child: Text(_isSaving ? 'Saving...' : 'Save'),
)
```

---

## Implementation Order

1. **Add import** for `AppButton` in all affected files:
   ```dart
   import '../../../../shared/widgets/app_button.dart';
   ```

2. **Update in this order** (smallest to largest changes):
   - `row_controls.dart` - EmptySheetPlaceholder, BulkActionsBar, AddRowFAB
   - `color_picker.dart` - Container styling, Clear Color button
   - `quick_formula_menu.dart` - Trigger button styling
   - `sheet_toolbar.dart` - Add Row, Save buttons, FormulaBar styling
   - `sheet_page.dart` - Dialogs, empty/error states, AppBar actions

3. **Test each file** after updating to ensure no regressions

---

## Files Summary

| File | Changes |
|------|---------|
| `sheet_toolbar.dart` | Buttons → AppButton, FormulaBar input styling |
| `sheet_page.dart` | AlertDialog styling, empty/error state buttons, AppBar actions |
| `color_picker.dart` | Container shadow/radius, Clear button → AppButton.ghost |
| `quick_formula_menu.dart` | Trigger button font weight and icon |
| `row_controls.dart` | BulkActionsBar buttons, EmptySheetPlaceholder button |
| `cell_widgets.dart` | **No changes** - cells/grid unchanged |
| `sheet_grid.dart` | **No changes** - grid structure unchanged |

---

## Import Requirements

All files will need this import added:
```dart
import '../../../../shared/widgets/app_button.dart';
```

Or via barrel export:
```dart
import '../../../../shared/shared.dart';
```

---

## Testing Checklist

After implementation, verify:

- [ ] Add Row button has orange background, white text, tactile press state
- [ ] Save button appears with loading spinner when saving
- [ ] Delete confirmation dialog has proper border radius and button styling
- [ ] Color picker popover has soft shadow and proper styling
- [ ] Quick formula menu trigger looks like an outlined button
- [ ] Bulk actions bar has proper button styling
- [ ] Empty state uses primary button
- [ ] Error state uses primary button for retry
- [ ] Date picker button has subtle outlined style
- [ ] All focus states show orange ring (2px)
- [ ] All hover states show light gray wash
