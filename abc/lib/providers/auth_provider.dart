import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../services/api_service.dart';
import '../services/file_user_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final FileUserService _fileUserService = FileUserService();
  String? _token;
  bool _isLoading = false;
  String? _error;

  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _token != null && _token!.isNotEmpty;

  AuthProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString(AppConstants.authTokenKey);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    }
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Thử đăng nhập với user từ file trước
      final isFileUser = await _fileUserService.validateUser(
        username: username,
        password: password,
      );

      if (isFileUser) {
        _token = 'local-user-$username';
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppConstants.authTokenKey, _token!);
        _isLoading = false;
        notifyListeners();
        return true;
      }

      // Nếu không phải file user, thử API
      final response = await _apiService.login(username, password);
      final token = response.token;

      if (token.isEmpty) {
        _error = 'Token rỗng nhận được từ server';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      _token = token;

      // Save token to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.authTokenKey, _token!);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      // Prefer ApiService last response body (may contain server error details)
      _error = _apiService.lastResponseBody ?? e.toString();

      // Fallback for offline/demo mode: allow known demo credentials to login locally
      if (username == 'mor_2314' && password == '83r5^_') {
        _token = 'demo-token';
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppConstants.authTokenKey, _token!);
        _isLoading = false;
        notifyListeners();
        return true;
      }

      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.authTokenKey);
    notifyListeners();
  }
}
