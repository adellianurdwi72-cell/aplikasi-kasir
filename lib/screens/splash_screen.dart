import 'package:aplikasi_kasir/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart'; 
import 'dashboard/dashboard_screen.dart'; // Asumsikan ini adalah path yang benar ke DashboardScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // delay animasi
    await Future.delayed(const Duration(seconds: 2));

    final session = supabase.auth.currentSession;

    // Pastikan widget masih ada di tree sebelum melakukan navigasi
    if (!mounted) return; 

    if (session == null) {
      /// belum login → ke login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      /// sudah login → ke dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF202124), // Warna gelap yang konsisten
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store_mall_directory,
              size: 90,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              "Aplikasi Kasir",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 15),
            CircularProgressIndicator(
              strokeWidth: 2.3,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}