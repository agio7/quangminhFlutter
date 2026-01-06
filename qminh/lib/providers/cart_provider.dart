import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;
  List<CartItem> get itemsList => _items.values.toList();

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void removeItemCompletely(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  bool checkout() {
    if (_items.isEmpty) return false;

    // Print order to console
    print('=== CHECKOUT ORDER ===');
    print('Total Items: $itemCount');
    print('Total Amount: \$${totalAmount.toStringAsFixed(2)}');
    print('Items:');
    for (var item in _items.values) {
      print('  - ${item.product.title} x${item.quantity} = \$${item.totalPrice.toStringAsFixed(2)}');
    }
    print('=====================');

    clearCart();
    return true;
  }
}



