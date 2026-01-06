import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class StoreProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  List<String> _categories = [];
  List<Cart> _orders = [];
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;
  String? _selectedCategory;

  // Track if data has been loaded
  bool _productsLoaded = false;
  bool _categoriesLoaded = false;
  bool _ordersLoaded = false;
  bool _usersLoaded = false;

  List<Product> get products {
    if (!_productsLoaded) {
      fetchProducts();
    }
    if (_selectedCategory == null) {
      return _products;
    }
    return _products.where((p) =>
      p.category.toLowerCase().trim() == _selectedCategory!.toLowerCase().trim()
    ).toList();
  }

  List<String> get categories {
    if (!_categoriesLoaded) {
      fetchCategories();
    }
    return _categories;
  }

  List<Cart> get orders {
    if (!_ordersLoaded) {
      fetchOrders();
    }
    return _orders;
  }

  List<User> get users {
    if (!_usersLoaded) {
      fetchUsers();
    }
    return _users;
  }

  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedCategory => _selectedCategory;

  Future<void> fetchAllData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.wait([
        fetchProducts(),
        fetchCategories(),
        fetchOrders(),
        fetchUsers(),
      ]);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProducts() async {
    if (_productsLoaded && _products.isNotEmpty) return; // Skip if already loaded

    _isLoading = true;
    notifyListeners();

    try {
      _products = await _apiService.getProducts();
      _productsLoaded = true;
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategories() async {
    if (_categoriesLoaded && _categories.isNotEmpty) return;

    try {
      _categories = await _apiService.getCategories();
      _categoriesLoaded = true;
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> fetchOrders() async {
    if (_ordersLoaded && _orders.isNotEmpty) return;

    try {
      _orders = await _apiService.getCarts();
      _ordersLoaded = true;
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    if (_usersLoaded && _users.isNotEmpty) return;

    try {
      _users = await _apiService.getUsers();
      _usersLoaded = true;
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  void setSelectedCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    try {
      _products.insert(0, product);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Calculate total revenue from orders
  double get totalRevenue {
    double total = 0;
    for (var order in _orders) {
      for (var item in order.products) {
        final product = _products.firstWhere(
          (p) => p.id == item.productId,
          orElse: () => Product(
            id: 0,
            title: '',
            price: 0,
            description: '',
            category: '',
            image: '',
          ),
        );
        total += product.price * item.quantity;
      }
    }
    return total;
  }

  // Get products count per category
  Map<String, int> get productsPerCategory {
    Map<String, int> counts = {};
    for (var product in _products) {
      counts[product.category] = (counts[product.category] ?? 0) + 1;
    }
    return counts;
  }
}


