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
    // Keep only last 20 logs to save memory
    if (_apiLogs.length > 20) {
      _apiLogs.removeRange(20, _apiLogs.length);
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

      // Accept 200 or 201 as success responses
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Try to decode and validate token presence
        final Map<String, dynamic> decoded = json.decode(response.body) as Map<String, dynamic>;
        if (!decoded.containsKey('token') || decoded['token'] == null || decoded['token'].toString().isEmpty) {
          throw Exception('Login succeeded but token missing in response: ${response.body}');
        }
        return LoginResponse.fromJson(decoded);
      } else {
        // Include response body in the exception to help debugging
        throw Exception('Login failed: ${response.statusCode} - ${response.body}');
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

  Future<User> register(Map<String, dynamic> userData) async {
    final url = '${AppConstants.baseUrl}${AppConstants.usersEndpoint}';
    final requestBody = json.encode(userData);
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
        return User.fromJson(json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Đăng ký thất bại: ${response.statusCode}');
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
      throw Exception('Lỗi khi đăng ký: $e');
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
