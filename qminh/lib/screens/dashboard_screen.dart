import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';
import '../providers/cart_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final productsPerCategory = storeProvider.productsPerCategory;

    return Scaffold(
      body: storeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => storeProvider.fetchAllData(),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Stat Cards
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          title: 'Tổng Doanh Thu',
                          value: '\$${storeProvider.totalRevenue.toStringAsFixed(2)}',
                          icon: Icons.attach_money,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _StatCard(
                          title: 'Tổng Khách Hàng',
                          value: '${storeProvider.users.length}',
                          icon: Icons.people,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _StatCard(
                    title: 'Tổng Sản Phẩm',
                    value: '${storeProvider.products.length}',
                    icon: Icons.inventory,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 24),
                  // Chart Section
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sản phẩm theo danh mục',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 200,
                            child: productsPerCategory.isEmpty
                                ? const Center(
                                    child: Text('Chưa có dữ liệu'),
                                  )
                                : Builder(
                                    builder: (context) {
                                      final maxValue = productsPerCategory.values
                                          .reduce((a, b) => a > b ? a : b);
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: productsPerCategory.entries
                                            .map((entry) => Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 4),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '${entry.value}',
                                                          style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Container(
                                                          height: maxValue > 0
                                                              ? (entry.value /
                                                                      maxValue) *
                                                                  150
                                                              : 0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.indigo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(4),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          entry.key.length > 8
                                                              ? '${entry.key.substring(0, 8)}...'
                                                              : entry.key,
                                                          style: const TextStyle(
                                                            fontSize: 10,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Recent Orders
                  const Text(
                    'Đơn hàng mới nhất',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...storeProvider.orders.take(5).map((order) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title: Text('Đơn #${order.id}'),
                          subtitle: Text(
                            '${order.products.length} sản phẩm - ${order.date}',
                          ),
                          trailing: Text(
                            '\$${_calculateOrderTotal(order, storeProvider.products).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
    );
  }

  double _calculateOrderTotal(order, products) {
    double total = 0;
    for (var item in order.products) {
      try {
        final product = products.firstWhere(
          (p) => p.id == item.productId,
        );
        total += product.price * item.quantity;
      } catch (e) {
        // Product not found, skip
      }
    }
    return total;
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Icon(icon, color: color, size: 24),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

