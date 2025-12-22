# **AI Agent Context: Falsisters POS (Light Mode Edition)**

This document serves as the foundational context and instruction set for the development of **Falsisters**, a modern, high-performance Point of Sale (POS) system. This iteration ("Aura Daybreak") focuses on high-contrast legibility, cleanliness, and an approachable enterprise aesthetic.

## **1\. Design Vision & Aesthetic (The "Aura Daybreak" Look)**

The design is inspired by modern productivity tools (e.g., Linear, Stripe, AirBnb). It prioritizes openness, breathability, and the use of shadows/borders rather than glowing layers to define depth.

### **Color Palette (Light Mode)**

* **Primary Surface**: Cool White / Light Gray (\#F3F4F6 to \#FFFFFF).  
  * *Usage*: The main app background is slightly off-white (\#F3F4F6) to reduce glare, while content cards are pure white (\#FFFFFF).  
* **Primary Text**: Deep Navy / Charcoal (\#1E293B to \#0F172A).  
  * *Usage*: Replaces the "Soft White" text. Provides high contrast against the light background.  
* **Accent/Action**: Vivid Orange (\#F97316 to \#EA580C).  
  * *Usage*: Primary CTAs, "Pay" buttons, and active navigation states. The orange is slightly darker than the dark mode version to ensure accessibility ratios on white.  
* **Support Colors**:  
  * **Borders/Dividers**: Pale Gray (\#E2E8F0). Essential for defining structure without heavy backgrounds.  
  * **Secondary Text**: Slate (\#64748B). For labels and metadata.  
  * **Status**: Emerald (\#10B981) for success; Rose (\#F43F5E) for alerts/errors.

### **UI Architecture**

* **Elevation & Depth**:  
  * Instead of glassmorphism, use **soft diffused shadows** (box-shadow: 0 4px 6px \-1px rgba(0, 0, 0, 0.1)) and **crisp borders** (1px solid \#E2E8F0) to separate layers.  
* **Layout Structure**:  
  * **Sidebar (Navigation)**: White background, high-contrast icons.  
  * **Main Canvas**: Light gray background with floating white cards for content (Products/Charts).  
  * **Right Sidebar (Cart)**: White background, visually anchored to the right with a stronger border separator.

## **2\. Functional Modules**

### **A. The Transaction Engine (POS Core)**

* **Visuals**: Product cards are white tiles with rounded corners and subtle border/shadow. Images have no overlay unless selected.  
* **Selection State**: When selected, a card gains a thick Orange border ring (ring-2 ring-orange-500) rather than a glowing fill.

### **B. Analytics & BI**

* **Charts**: Use white backgrounds with grid lines in very light gray. Data lines should use the Primary Text color (Navy) and Accent (Orange) for clear visibility.

## **3\. Interaction & UX Principles**

* \*\* tactile Feedback\*\*: Buttons should have a distinct "pressed" state (slightly darker background or inset shadow) to mimic physical buttons.  
* **High-Contrast Hover**: Hover states should use a light gray wash (bg-gray-100) rather than opacity changes.

## **4\. Agent Implementation Instructions**

When generating code:

1. **Tailwind Classes**: Rely heavily on bg-white, bg-gray-50, text-slate-900, and border-slate-200.  
2. **Shadows**: Use shadow-sm for list items and shadow-lg for modals or floating action buttons.  
3. **Inputs**: Input fields should have a gray background (bg-gray-100) that turns white with a colored ring on focus.

## **5. Implementation Reference (Flutter)**

The following implementations are now available in the codebase and should be used for all new features.

### **AppColors (`lib/core/theme/app_colors.dart`)**

```dart
abstract final class AppColors {
  // ==========================================================================
  // PRIMARY COLORS - Vivid Orange (Action/CTA)
  // ==========================================================================
  static const Color primary = Color(0xFFF97316);
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color primaryHover = Color(0xFFEA580C);

  // ==========================================================================
  // SECONDARY COLORS - Deep Navy (Text emphasis)
  // ==========================================================================
  static const Color secondary = Color(0xFF1E293B);
  static const Color secondaryForeground = Color(0xFFFFFFFF);

  // ==========================================================================
  // BACKGROUND & FOREGROUND
  // ==========================================================================
  static const Color background = Color(0xFFF3F4F6); // Cool White / Light Gray
  static const Color foreground = Color(0xFF0F172A); // Deep Navy / Charcoal

  // ==========================================================================
  // CARD COLORS
  // ==========================================================================
  static const Color card = Color(0xFFFFFFFF);       // Pure White
  static const Color cardForeground = Color(0xFF0F172A);

  // ==========================================================================
  // MUTED COLORS
  // ==========================================================================
  static const Color muted = Color(0xFFF1F5F9);      // Slate 100 (Inputs/Hover)
  static const Color mutedForeground = Color(0xFF64748B); // Slate 500

  // ==========================================================================
  // BORDERS & INPUT
  // ==========================================================================
  static const Color border = Color(0xFFE2E8F0);     // Pale Gray
  static const Color input = Color(0xFFF1F5F9);
  static const Color ring = Color(0xFFF97316);       // Orange Focus Ring

  // ==========================================================================
  // SIDEBAR COLORS - White with Orange accents
  // ==========================================================================
  static const Color sidebar = Color(0xFFFFFFFF);
  static const Color sidebarForeground = Color(0xFF0F172A);
  static const Color sidebarPrimary = Color(0xFFF97316);    // Selected Item
  static const Color sidebarAccent = Color(0xFFF1F5F9);     // Hover State
  static const Color sidebarBorder = Color(0xFFE2E8F0);

  // ==========================================================================
  // STATUS/SEMANTIC COLORS
  // ==========================================================================
  static const Color success = Color(0xFF10B981);           // Emerald
  static const Color destructive = Color(0xFFF43F5E);       // Rose
  static const Color warning = Color(0xFFF59E0B);           // Amber
  static const Color info = Color(0xFF3B82F6);              // Blue

  // ==========================================================================
  // CHART COLORS
  // ==========================================================================
  static const Color chart1 = Color(0xFF1E293B);  // Navy
  static const Color chart2 = Color(0xFFF97316);  // Orange
  static const Color chart3 = Color(0xFF10B981);  // Emerald
  static const Color chart4 = Color(0xFF3B82F6);  // Blue
  static const Color chart5 = Color(0xFF8B5CF6);  // Purple

  // ==========================================================================
  // DESIGN TOKENS
  // ==========================================================================
  static const double radiusLg = 16.0;
  static const double radiusMd = 14.0;
  static const double radiusSm = 12.0;
  static const double radiusXl = 20.0;
}
```

### **AppTheme (`lib/core/theme/app_theme.dart`)**

The theme is configured to automatically apply the "Aura Daybreak" design system:

- `scaffoldBackgroundColor`: `AppColors.background` (Cool White)
- `cardTheme`: Pure white, no elevation, uses `AppColors.border`
- `elevatedButtonTheme`: Vivid Orange with distinct pressed/hover states
- `outlinedButtonTheme`: Outlined with light gray wash on hover
- `inputDecorationTheme`: Filled with `AppColors.muted`, no border unfocused, orange ring on focus
- `appBarTheme`: White background with surfaceTintColor transparent

Key features:
- **Tactile button feedback**: Buttons have distinct pressed states (darker background)
- **High-contrast hover**: Uses light gray wash (`AppColors.accent`) rather than opacity

### **Reusable Widgets**

---

#### **AppCard (`lib/shared/widgets/app_card.dart`)**

Styled card with Aura Daybreak theming.

```dart
// Basic card
AppCard(
  child: Text('Card content'),
)

// Card with elevation (soft shadow)
AppCard(
  elevation: 1,
  child: Text('Elevated card'),
)

// Selected state with orange ring
AppCard(
  isSelected: true,
  child: Text('Selected product'),
)

// Tappable card with hover effect
AppCard(
  onTap: () => print('Tapped'),
  child: Text('Tap me'),
)
```

Features:
- Pure white background with 1px pale gray border
- Soft diffused shadow when `elevation > 0`: `BoxShadow(0, 4, 6, -1, rgba(0,0,0,0.1))`
- `isSelected: true` adds thick orange border ring (ring-2)
- `onTap` adds light gray wash hover effect

---

#### **AppTextField (`lib/shared/widgets/app_text_field.dart`)**

Text input with automatic focus state handling.

```dart
// Basic text field
AppTextField(
  label: 'Email',
  hintText: 'Enter your email',
  prefixIcon: Icons.email,
)

// Password field with toggle
AppTextField(
  label: 'Password',
  obscureText: true,
  showPasswordToggle: true,
)

// With external focus node
AppTextField(
  focusNode: myFocusNode,
  label: 'Search',
  prefixIcon: Icons.search,
)
```

Features:
- **Unfocused**: Gray background (`AppColors.muted`), no border
- **Focused**: White background, orange focus ring (2px)
- Automatic focus state management with internal FocusNode

---

#### **AppButton (`lib/shared/widgets/app_button.dart`)**

Multi-variant button with tactile feedback.

```dart
// Primary - Vivid Orange (main CTAs)
AppButton.primary(
  onPressed: () => print('Pay'),
  child: Text('Pay Now'),
)

// Secondary - Outlined with gray border
AppButton.secondary(
  onPressed: () {},
  child: Text('Cancel'),
)

// Ghost - Text only
AppButton.ghost(
  onPressed: () {},
  child: Text('Skip'),
)

// Destructive - Rose red
AppButton.destructive(
  onPressed: () {},
  child: Text('Delete'),
)

// With icon and loading state
AppButton.primary(
  onPressed: () {},
  icon: Icon(Icons.payment),
  isLoading: true,
  child: Text('Processing...'),
)

// Small size variant
AppButton.primary(
  onPressed: () {},
  small: true,
  child: Text('Add'),
)

// Full width
AppButton.primary(
  onPressed: () {},
  isExpanded: true,
  child: Text('Continue'),
)
```

Features:
- **Pressed state**: Darker background for tactile feedback
- **Hover state**: Light gray wash for secondary/ghost variants
- Size variants: `small: true` for compact buttons

---

#### **AppIconBox (`lib/shared/widgets/app_icon_box.dart`)**

Icon container with background and subtle shadow.

```dart
// Default orange icon box
AppIconBox(
  icon: Icons.point_of_sale,
)

// Custom colors and size
AppIconBox(
  icon: Icons.store,
  backgroundColor: AppColors.success,
  iconColor: Colors.white,
  size: 72,
)

// Without shadow
AppIconBox(
  icon: Icons.settings,
  elevation: false,
)
```

---

#### **AppToast (`lib/shared/widgets/app_toast.dart`)**

Toast notifications with slide-in animation.

```dart
// Success toast
AppToast.success(
  context,
  title: 'Success',
  message: 'Payment completed.',
);

// Error toast
AppToast.error(
  context,
  title: 'Error',
  message: 'Payment failed.',
);

// Warning toast
AppToast.warning(
  context,
  title: 'Warning',
  message: 'Low stock.',
);

// Info toast
AppToast.info(
  context,
  title: 'Info',
  message: 'New update available.',
);
```

---

#### **AppLoadingIndicator (`lib/shared/widgets/app_loading.dart`)**

Loading indicators for async states.

```dart
// Simple loading
AppLoadingIndicator(
  message: 'Loading...',
)

// Full-screen centered overlay
AppLoadingOverlay(
  message: 'Please wait...',
)
```

---

#### **MainLayout (`lib/shared/widgets/main_layout.dart`)**

Main application layout with sidebar navigation.

Features:
- **White sidebar** with Deep Navy text
- **Orange brand icon** box in header
- **Selected items**: Orange text/icon with light gray background
- **Hover state**: Light gray wash (`sidebarAccent`)
- **Right border separator** for visual anchoring
- **Footer** with user info, offline indicator, and logout button
