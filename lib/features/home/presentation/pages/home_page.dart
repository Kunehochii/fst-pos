import 'package:flutter/material.dart';

/// Home page - Dashboard view.
///
/// This is the main landing page of the application.
/// Replace this with your actual dashboard implementation.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Welcome to FST POS',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: _buildDashboardGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardGrid() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(
          title: 'Total Sales',
          value: '\$0.00',
          icon: Icons.attach_money,
          color: Colors.green,
        ),
        _buildStatCard(
          title: 'Orders Today',
          value: '0',
          icon: Icons.shopping_cart,
          color: Colors.blue,
        ),
        _buildStatCard(
          title: 'Products',
          value: '0',
          icon: Icons.inventory_2,
          color: Colors.orange,
        ),
        _buildStatCard(
          title: 'Customers',
          value: '0',
          icon: Icons.people,
          color: Colors.purple,
        ),
        _buildStatCard(
          title: 'Pending Sync',
          value: '0',
          icon: Icons.sync,
          color: Colors.teal,
        ),
        _buildStatCard(
          title: 'Low Stock',
          value: '0',
          icon: Icons.warning,
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 32, color: color),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
