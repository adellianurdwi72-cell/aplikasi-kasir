import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  bool isLoading = false;

  Future<bool> login(String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      isLoading = false;
      notifyListeners();

      if (response.user != null) {
        return true; // login sukses
      }
      return false;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
      return false;
    }
  }

  Future<bool> register(
      String email, String password, String nama, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': nama},
      );

      isLoading = false;
      notifyListeners();

      if (response.user != null) {
        return true; // register sukses
      }
      return false;
    } catch (e) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
      return false;
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
