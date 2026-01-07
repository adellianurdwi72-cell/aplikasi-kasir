import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/auth_gate.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/product_management_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "YOUR_SUPABASE_URL",
    anonKey: "YOUR_SUPABASE_ANON_KEY",
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Kasir",
      theme: ThemeData(primarySwatch: Colors.blue),

      // 🔥 SATU-SATUNYA ENTRY POINT
      home: const AuthGate(),

      routes: {
        "/login": (_) => const LoginScreen(),
        "/register": (_) => const RegisterScreen(),
        "/product": (_) => const ProductManagementScreen(),
      },
    );
  }
}
