import 'package:flutter/material.dart';

// IMPORT SEMUA SCREEN
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'screens/customer_list_screen.dart';
import 'screens/profile_screen.dart';

class Routes {
  // === Route Names ===
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
  static const String customerList = '/customers';
  static const String profile = '/profile';

  // === Route Generator ===
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case customerList:
        return MaterialPageRoute(builder: (_) => const CustomerListScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "Page not found",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
    }
  }
}
