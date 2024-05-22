import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    final url = 'http://yourbackendapi.com/api/auth/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      _isAuthenticated = true;
      notifyListeners();
    } else {
      // Handle errors
      print('Login failed');
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
