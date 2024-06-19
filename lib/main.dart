import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:quad_b/src/screens/Feeds/feed_view.dart';
import 'src/screens/Authentication/login_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthService>(
          builder: (context, authService, child) {
            // return authService.isAuthenticated ? HomeScreen() : LoginScreen();
            return HomeView();
          },
        ),
      ),
    );
  }
}
