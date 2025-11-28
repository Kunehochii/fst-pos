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

  List<SideMenuItemDataTile> _buildMenuItems(
      BuildContext context, String currentPath) {
    return [
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.home,
        onTap: () => context.go(AppRoutes.home),
        icon: Icon(Icons.dashboard, color: AppColors.primaryForeground),
        title: 'Dashboard',
        titleStyle: TextStyle(color: AppColors.primaryForeground),
        selectedTitleStyle: TextStyle(
          color: AppColors.primaryForeground,
          fontWeight: FontWeight.w600,
        ),
        highlightSelectedColor: AppColors.sidebarAccent,
        hoverColor: AppColors.sidebarAccent.withOpacity(0.5),
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.products,
        onTap: () => context.go(AppRoutes.products),
        icon: Icon(Icons.inventory, color: AppColors.primaryForeground),
        title: 'Products',
        titleStyle: TextStyle(color: AppColors.primaryForeground),
        selectedTitleStyle: TextStyle(
          color: AppColors.primaryForeground,
          fontWeight: FontWeight.w600,
        ),
        highlightSelectedColor: AppColors.sidebarAccent,
        hoverColor: AppColors.sidebarAccent.withOpacity(0.5),
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.orders,
        onTap: () => context.go(AppRoutes.orders),
        icon: Icon(Icons.receipt_long, color: AppColors.primaryForeground),
        title: 'Orders',
        titleStyle: TextStyle(color: AppColors.primaryForeground),
        selectedTitleStyle: TextStyle(
          color: AppColors.primaryForeground,
          fontWeight: FontWeight.w600,
        ),
        highlightSelectedColor: AppColors.sidebarAccent,
        hoverColor: AppColors.sidebarAccent.withOpacity(0.5),
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.customers,
        onTap: () => context.go(AppRoutes.customers),
        icon: Icon(Icons.people, color: AppColors.primaryForeground),
        title: 'Customers',
        titleStyle: TextStyle(color: AppColors.primaryForeground),
        selectedTitleStyle: TextStyle(
          color: AppColors.primaryForeground,
          fontWeight: FontWeight.w600,
        ),
        highlightSelectedColor: AppColors.sidebarAccent,
        hoverColor: AppColors.sidebarAccent.withOpacity(0.5),
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.settings,
        onTap: () => context.go(AppRoutes.settings),
        icon: Icon(Icons.settings, color: AppColors.primaryForeground),
        title: 'Settings',
        titleStyle: TextStyle(color: AppColors.primaryForeground),
        selectedTitleStyle: TextStyle(
          color: AppColors.primaryForeground,
          fontWeight: FontWeight.w600,
        ),
        highlightSelectedColor: AppColors.sidebarAccent,
        hoverColor: AppColors.sidebarAccent.withOpacity(0.5),
      ),
    ];
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
