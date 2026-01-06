import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_card.dart';
import '../screens/cart_screen.dart';

class POSScreen extends StatelessWidget {
  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: storeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : storeProvider.products.isEmpty
              ? const Center(child: Text('Không có sản phẩm'))
              : RefreshIndicator(
                  onRefresh: () => storeProvider.fetchProducts(),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: storeProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = storeProvider.products[index];
                      return ProductCard(
                        product: product,
                        onAddToCart: () {
                          cartProvider.addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Đã thêm ${product.title}'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
      floatingActionButton: cartProvider.itemCount > 0
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
              backgroundColor: Colors.indigo,
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.white),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cartProvider.itemCount > 99
                            ? '99+'
                            : cartProvider.itemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              label: Text(
                'Giỏ hàng (${cartProvider.itemCount})',
                style: const TextStyle(color: Colors.white),
              ),
            )
          : null,
    );
  }
}



