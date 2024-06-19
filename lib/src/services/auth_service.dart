import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class AuthService with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    final url = 'https://quad-b-i82h.onrender.com/login';
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

  Future<void> register({
    required String name,
    required String email,
    required String address,
    required String contact,
    required String password,
    required String userType,
    String? partnerType,
    File? bannerImage,
    required String socials,
    required String description,
    required String shortDescription,
    required String tags,
    File? logoImage,
  }) async {
    final url = 'http://yourbackendapi.com/api/auth/register';

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['name'] = name
      ..fields['email'] = email
      ..fields['address'] = address
      ..fields['contact'] = contact
      ..fields['password'] = password
      ..fields['userType'] = userType
      ..fields['socials'] = socials
      ..fields['description'] = description
      ..fields['shortDescription'] = shortDescription
      ..fields['tags'] = tags;

    if (userType == 'partner') {
      request.fields['partnerType'] = partnerType!;
      if (bannerImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'bannerImage',
          bannerImage.path,
          contentType: MediaType('image', lookupMimeType(bannerImage.path)!),
        ));
      }
      if (logoImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'logoImage',
          logoImage.path,
          contentType: MediaType('image', lookupMimeType(logoImage.path)!),
        ));
      }
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Registration successful');
    } else {
      print('Registration failed');
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
