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
  // Primary - Vivid Orange
  static const Color primary = Color(0xFFF97316);
  static const Color primaryForeground = Color(0xFFFFFFFF);

  // Backgrounds
  static const Color background = Color(0xFFF3F4F6); // Cool White / Light Gray
  static const Color card = Color(0xFFFFFFFF);       // Pure White
  static const Color muted = Color(0xFFF1F5F9);      // Slate 100 (Inputs/Hover)

  // Text
  static const Color foreground = Color(0xFF0F172A);      // Deep Navy
  static const Color mutedForeground = Color(0xFF64748B); // Slate 500

  // Borders & UI
  static const Color border = Color(0xFFE2E8F0);     // Pale Gray
  static const Color ring = Color(0xFFF97316);       // Orange Focus Ring

  // Sidebar
  static const Color sidebar = Color(0xFFFFFFFF);
  static const Color sidebarForeground = Color(0xFF0F172A);
  static const Color sidebarPrimary = Color(0xFFF97316); // Selected Item
  static const Color sidebarAccent = Color(0xFFF1F5F9);  // Hover State
}
```

### **AppTheme (`lib/core/theme/app_theme.dart`)**

The theme is configured to automatically apply the design system:
- `scaffoldBackgroundColor`: `AppColors.background`
- `cardTheme`: No elevation by default, uses `AppColors.border`.
- `inputDecorationTheme`: Filled with `AppColors.muted`, turns white on focus (handled by widget), Orange focus border.

### **Reusable Widgets**

**AppCard (`lib/shared/widgets/app_card.dart`)**
- Uses soft diffused shadows when `elevation > 0`.
- Default border radius: `AppColors.radiusLg` (12.0).
- Usage: `AppCard(child: ...)`

**AppTextField (`lib/shared/widgets/app_text_field.dart`)**
- Automatically handles focus state: Gray background (`AppColors.muted`) -> White background.
- Usage: `AppTextField(label: 'Search', prefixIcon: Icons.search)`

**MainLayout (`lib/shared/widgets/main_layout.dart`)**
- Sidebar is now White with Deep Navy text and Orange accents.
- Uses `AppColors.sidebar*` colors.
