import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../features/auth/auth.dart';

/// Main application layout with sidebar navigation.
///
/// This widget wraps all pages and provides consistent navigation.
/// The sidebar uses flutter_side_menu for collapsible navigation.
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
          const Icon(Icons.point_of_sale, size: 32),
          if (isOpen) ...[
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'FST POS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
        icon: const Icon(Icons.dashboard),
        title: 'Dashboard',
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.products,
        onTap: () => context.go(AppRoutes.products),
        icon: const Icon(Icons.inventory),
        title: 'Products',
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.orders,
        onTap: () => context.go(AppRoutes.orders),
        icon: const Icon(Icons.receipt_long),
        title: 'Orders',
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.customers,
        onTap: () => context.go(AppRoutes.customers),
        icon: const Icon(Icons.people),
        title: 'Customers',
      ),
      SideMenuItemDataTile(
        isSelected: currentPath == AppRoutes.settings,
        onTap: () => context.go(AppRoutes.settings),
        icon: const Icon(Icons.settings),
        title: 'Settings',
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
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.cloud_off, size: 14, color: Colors.orange),
                  if (isOpen) ...[
                    const SizedBox(width: 4),
                    const Text(
                      'Offline',
                      style: TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ],
                ],
              ),
            ),
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                child: Icon(Icons.person, size: 20),
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
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        cashier?.branchName ?? '',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.logout, size: 20),
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
