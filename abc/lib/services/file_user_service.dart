import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUserService {
  static const String _fileName = 'users.txt';
  static const String _prefsKey = 'registered_users';

  // Đọc users từ SharedPreferences (Web) hoặc File (Mobile/Desktop)
  Future<List<Map<String, dynamic>>> _readUsers() async {
    try {
      if (kIsWeb) {
        // Web: sử dụng SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        final usersJson = prefs.getString(_prefsKey) ?? '[]';
        final List<dynamic> usersList = json.decode(usersJson);
        return usersList.cast<Map<String, dynamic>>();
      } else {
        // Mobile/Desktop: sử dụng File
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$_fileName');

        if (!await file.exists()) {
          return [];
        }

        final contents = await file.readAsString();
        if (contents.trim().isEmpty) {
          return [];
        }

        final lines = contents.split('\n').where((line) => line.trim().isNotEmpty);
        return lines.map((line) {
          final parts = line.split('|');
          if (parts.length >= 3) {
            return {
              'username': parts[0],
              'password': parts[1],
              'createdAt': parts[2],
            };
          }
          return null;
        }).whereType<Map<String, dynamic>>().toList();
      }
    } catch (e) {
      print('Error reading users: $e');
      return [];
    }
  }

  // Ghi users vào SharedPreferences (Web) hoặc File (Mobile/Desktop)
  Future<void> _writeUsers(List<Map<String, dynamic>> users) async {
    try {
      if (kIsWeb) {
        // Web: sử dụng SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_prefsKey, json.encode(users));
      } else {
        // Mobile/Desktop: sử dụng File
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$_fileName');
        final lines = users.map((user) {
          return '${user['username']}|${user['password']}|${user['createdAt']}';
        }).join('\n');
        await file.writeAsString(lines);
      }
    } catch (e) {
      print('Error writing users: $e');
    }
  }

  Future<bool> registerUser({
    required String username,
    required String password,
  }) async {
    try {
      final users = await _readUsers();

      // Kiểm tra username đã tồn tại chưa
      final existingUser = users.firstWhere(
        (user) => user['username'] == username,
        orElse: () => {},
      );

      if (existingUser.isNotEmpty) {
        return false; // Username đã tồn tại
      }

      // Thêm user mới
      users.add({
        'username': username,
        'password': password,
        'createdAt': DateTime.now().toIso8601String(),
      });

      await _writeUsers(users);
      return true;
    } catch (e) {
      print('Error registering user: $e');
      return false;
    }
  }

  Future<bool> validateUser({
    required String username,
    required String password,
  }) async {
    try {
      final users = await _readUsers();

      final user = users.firstWhere(
        (user) => user['username'] == username && user['password'] == password,
        orElse: () => {},
      );

      return user.isNotEmpty;
    } catch (e) {
      print('Error validating user: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    return await _readUsers();
  }

  Future<String> getUsersFilePath() async {
    if (kIsWeb) {
      return 'Web Browser LocalStorage (key: $_prefsKey)';
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}/$_fileName';
    }
  }
}

