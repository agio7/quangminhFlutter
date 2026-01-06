import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      body: storeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : storeProvider.orders.isEmpty
              ? const Center(child: Text('Chưa có đơn hàng'))
              : RefreshIndicator(
                  onRefresh: () => storeProvider.fetchOrders(),
                  child: ListView.builder(
                    itemCount: storeProvider.orders.length,
                    itemBuilder: (context, index) {
                      final order = storeProvider.orders[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.receipt_long, size: 40),
                          title: Text(
                            'Đơn hàng #${order.id}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ngày: ${order.date}'),
                              Text(
                                'Số lượng sản phẩm: ${order.products.length}',
                              ),
                              Text(
                                'Tổng tiền: \$${_calculateOrderTotal(order, storeProvider.products).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // TODO: Show order details
                          },
                        ),
                      );
                    },
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

