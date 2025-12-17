import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../features/auth/auth.dart';

/// Main application layout with sidebar navigation.
///
/// This widget wraps all pages and provides consistent navigation.
/// The sidebar uses flutter_side_menu for collapsible navigation.
/// Features a deep navy blue (primary color) sidebar with white text
/// for a modern, professional look.
///
/// Usage:
/// Used automatically by GoRouter's ShellRoute in app_router.dart.
class MainLayout extends ConsumerStatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  final _controller = SideMenuController();

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            controller: _controller,
            mode: SideMenuMode.auto,
            hasResizer: true,
            hasResizerToggle: true,
            minWidth: 70,
            maxWidth: 250,
            backgroundColor: AppColors.primary,
            builder: (data) {
              return SideMenuData(
                header: _buildHeader(data.isOpen),
                items: _buildMenuItems(context, currentPath),
                footer: _buildFooter(data.isOpen),
              );
            },
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isOpen) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            Icons.point_of_sale,
            size: 32,
            color: AppColors.primaryForeground,
          ),
          if (isOpen) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'FST POS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryForeground,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Helper method to check if cashier has a specific permission.
  bool _hasPermission(Cashier? cashier, String permission) {
    if (cashier == null) return false;
    return cashier.permissions.contains(permission);
  }

  /// Creates a menu item tile with consistent styling.
  SideMenuItemDataTile _buildMenuItem({
    required BuildContext context,
    required String currentPath,
    required String route,
    required IconData icon,
    required String title,
  }) {
    return SideMenuItemDataTile(
      isSelected: currentPath == route,
      onTap: () => context.go(route),
      icon: Icon(icon, color: AppColors.primaryForeground),
      title: title,
      titleStyle: TextStyle(color: AppColors.primaryForeground),
      selectedTitleStyle: TextStyle(
        color: AppColors.primaryForeground,
        fontWeight: FontWeight.w600,
      ),
      highlightSelectedColor: AppColors.sidebarAccent,
      hoverColor: AppColors.sidebarAccent.withOpacity(0.5),
    );
  }

  List<SideMenuItemDataTile> _buildMenuItems(
      BuildContext context, String currentPath) {
    final cashier = ref.watch(currentCashierProvider);
    final items = <SideMenuItemDataTile>[];

    // Sales - based on SALES permission
    if (_hasPermission(cashier, 'SALES')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.sales,
        icon: Icons.point_of_sale,
        title: 'Sales',
      ));
    }

    // Deliveries - based on DELIVERIES permission
    if (_hasPermission(cashier, 'DELIVERIES')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.deliveries,
        icon: Icons.local_shipping,
        title: 'Deliveries',
      ));
    }

    // Stocks - based on STOCKS permission
    if (_hasPermission(cashier, 'STOCKS')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.stocks,
        icon: Icons.inventory_2,
        title: 'Stocks',
      ));
    }

    // Kahon - based on KAHON permission
    if (_hasPermission(cashier, 'KAHON')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.kahon,
        icon: Icons.grid_view,
        title: 'Kahon',
      ));
    }

    // Inventory - based on KAHON permission (same as Kahon)
    if (_hasPermission(cashier, 'KAHON')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.inventory,
        icon: Icons.inventory,
        title: 'Inventory',
      ));
    }

    // Sales Check - based on SALES_HISTORY permission
    if (_hasPermission(cashier, 'SALES_HISTORY')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.salesCheck,
        icon: Icons.fact_check,
        title: 'Sales Check',
      ));
    }

    // Profit - same permission as SALES_HISTORY
    if (_hasPermission(cashier, 'SALES_HISTORY')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.profit,
        icon: Icons.trending_up,
        title: 'Profit',
      ));
    }

    // Bills - based on BILLS permission
    if (_hasPermission(cashier, 'BILLS')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.bills,
        icon: Icons.receipt,
        title: 'Bills',
      ));
    }

    // Expenses - based on BILLS permission as well
    if (_hasPermission(cashier, 'BILLS')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.expenses,
        icon: Icons.money_off,
        title: 'Expenses',
      ));
    }

    // Attachments - based on ATTACHMENTS permission
    if (_hasPermission(cashier, 'ATTACHMENTS')) {
      items.add(_buildMenuItem(
        context: context,
        currentPath: currentPath,
        route: AppRoutes.attachments,
        icon: Icons.attach_file,
        title: 'Attachments',
      ));
    }

    // Shift - open to all cashiers
    items.add(_buildMenuItem(
      context: context,
      currentPath: currentPath,
      route: AppRoutes.shift,
      icon: Icons.schedule,
      title: 'Shift',
    ));

    // Settings - open to all cashiers
    items.add(_buildMenuItem(
      context: context,
      currentPath: currentPath,
      route: AppRoutes.settings,
      icon: Icons.settings,
      title: 'Settings',
    ));

    return items;
  }

  Widget _buildFooter(bool isOpen) {
    final cashier = ref.watch(currentCashierProvider);
    final isOffline = ref.watch(isOfflineModeProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isOffline)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.cloud_off, size: 14, color: AppColors.warning),
                  if (isOpen) ...[
                    const SizedBox(width: 4),
                    Text(
                      'Offline',
                      style: TextStyle(fontSize: 12, color: AppColors.warning),
                    ),
                  ],
                ],
              ),
            ),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.sidebarAccent,
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: AppColors.primaryForeground,
                ),
              ),
              if (isOpen) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        cashier?.username ?? 'Unknown',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryForeground,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        cashier?.branchName ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryForeground.withOpacity(0.7),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                    color: AppColors.primaryForeground,
                  ),
                  tooltip: 'Logout',
                  onPressed: () async {
                    await ref.read(authNotifierProvider.notifier).logout();
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
