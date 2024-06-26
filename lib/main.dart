// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quad_b/src/controllers/login_controller.dart';
import 'package:quad_b/src/screens/Authentication/login_screen.dart';
import 'package:quad_b/src/screens/home_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await _checkLoginState();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> _checkLoginState() async {
  final loginController = LoginController();
  return await loginController.isLoggedIn();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? HomeView() : LoginScreen(),
    );
  }
}
