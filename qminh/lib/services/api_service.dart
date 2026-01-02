import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../models/user.dart';
import '../models/login_response.dart';

import '../models/api_log.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // Last API response for debugging
  String? lastResponseBody;
  int? lastStatusCode;
  String? lastMethod;
  String? lastUrl;
  String? lastRequestBody;

  // API call history
  final List<ApiLog> _apiLogs = [];
  List<ApiLog> get apiLogs => List.unmodifiable(_apiLogs);

  void _addLog(ApiLog log) {
    _apiLogs.insert(0, log); // Add to beginning
    // Keep only last 50 logs
    if (_apiLogs.length > 50) {
      _apiLogs.removeRange(50, _apiLogs.length);
    }
  }

  void clearLogs() {
    _apiLogs.clear();
  }

  Future<List<Product>> getProducts() async {
    final url = '${AppConstants.baseUrl}${AppConstants.productsEndpoint}';
    lastMethod = 'GET';
    lastUrl = url;
    lastRequestBody = null;

    try {
      final response = await http.get(Uri.parse(url));
      lastStatusCode = response.statusCode;
      lastResponseBody = response.body;

      _addLog(ApiLog(
        method: 'GET',
        url: url,
        statusCode: response.statusCode,
        responseBody: response.body,
        timestamp: DateTime.now(),
      ));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      _addLog(ApiLog(
        method: 'GET',
        url: url,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
      throw Exception('Error fetching products: $e');
    }
  }

  Future<List<String>> getCategories() async {
    final url = '${AppConstants.baseUrl}${AppConstants.categoriesEndpoint}';
    lastMethod = 'GET';
    lastUrl = url;
    lastRequestBody = null;

    try {
      final response = await http.get(Uri.parse(url));
      lastStatusCode = response.statusCode;
      lastResponseBody = response.body;

      _addLog(ApiLog(
        method: 'GET',
        url: url,
        statusCode: response.statusCode,
        responseBody: response.body,
        timestamp: DateTime.now(),
      ));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => item.toString()).toList();
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      _addLog(ApiLog(
        method: 'GET',
        url: url,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
      throw Exception('Error fetching categories: $e');
    }
  }

  Future<List<Cart>> getCarts() async {
    final url = '${AppConstants.baseUrl}${AppConstants.cartsEndpoint}';
    lastMethod = 'GET';
    lastUrl = url;
    lastRequestBody = null;

    try {
      final response = await http.get(Uri.parse(url));
      lastStatusCode = response.statusCode;
      lastResponseBody = response.body;

      _addLog(ApiLog(
        method: 'GET',
        url: url,
        statusCode: response.statusCode,
        responseBody: response.body,
        timestamp: DateTime.now(),
      ));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Cart.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load carts: ${response.statusCode}');
      }
    } catch (e) {
      _addLog(ApiLog(
        method: 'GET',
        url: url,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
      throw Exception('Error fetching carts: $e');
    }
  }

  Future<List<User>> getUsers() async {
    final url = '${AppConstants.baseUrl}${AppConstants.usersEndpoint}';
    lastMethod = 'GET';
    lastUrl = url;
    lastRequestBody = null;

    try {
      final response = await http.get(Uri.parse(url));
      lastStatusCode = response.statusCode;
      lastResponseBody = response.body;

      _addLog(ApiLog(
        method: 'GET',
        url: url,
        statusCode: response.statusCode,
        responseBody: response.body,
        timestamp: DateTime.now(),
      ));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      _addLog(ApiLog(
        method: 'GET',
        url: url,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
      throw Exception('Error fetching users: $e');
    }
  }

  Future<LoginResponse> login(String username, String password) async {
    final url = '${AppConstants.baseUrl}${AppConstants.loginEndpoint}';
    final requestBody = json.encode({
      'username': username,
      'password': password,
    });
    lastMethod = 'POST';
    lastUrl = url;
    lastRequestBody = requestBody;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      lastStatusCode = response.statusCode;
      lastResponseBody = response.body;

      _addLog(ApiLog(
        method: 'POST',
        url: url,
        headers: {'Content-Type': 'application/json'},
        requestBody: requestBody,
        statusCode: response.statusCode,
        responseBody: response.body,
        timestamp: DateTime.now(),
      ));

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      _addLog(ApiLog(
        method: 'POST',
        url: url,
        headers: {'Content-Type': 'application/json'},
        requestBody: requestBody,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
      throw Exception('Error during login: $e');
    }
  }

  Future<Product> addProduct(Map<String, dynamic> productData) async {
    final url = '${AppConstants.baseUrl}${AppConstants.productsEndpoint}';
    final requestBody = json.encode(productData);
    lastMethod = 'POST';
    lastUrl = url;
    lastRequestBody = requestBody;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      lastStatusCode = response.statusCode;
      lastResponseBody = response.body;

      _addLog(ApiLog(
        method: 'POST',
        url: url,
        headers: {'Content-Type': 'application/json'},
        requestBody: requestBody,
        statusCode: response.statusCode,
        responseBody: response.body,
        timestamp: DateTime.now(),
      ));

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to add product: ${response.statusCode}');
      }
    } catch (e) {
      _addLog(ApiLog(
        method: 'POST',
        url: url,
        headers: {'Content-Type': 'application/json'},
        requestBody: requestBody,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
      throw Exception('Error adding product: $e');
    }
  }
}

