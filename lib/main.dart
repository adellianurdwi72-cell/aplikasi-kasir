import 'package:flutter/material.dart';
import 'package:aplikasi_kasir/screens/login_screen.dart'; 
import 'package:aplikasi_kasir/screens/register_screen.dart';
import 'package:aplikasi_kasir/screens/customer_list_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Kasir',
      home: const CustomerListScreen(), 
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

