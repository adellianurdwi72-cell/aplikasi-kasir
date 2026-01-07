import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              context.read<AuthProvider>().logout();
              // ❌ JANGAN pakai Navigator
              // AuthGate akan otomatis menampilkan Login
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Selamat datang di CafeNova!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
