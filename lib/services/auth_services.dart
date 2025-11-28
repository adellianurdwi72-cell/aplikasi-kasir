import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _client = Supabase.instance.client;

  // Register
  Future<AuthResponse> register(String email, String password) async {
    final res = await _client.auth.signUp(
      email: email,
      password: password,
    );
    return res;
  }

  // Login
  Future<AuthResponse> login(String email, String password) async {
    final res = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return res;
  }

  // Logout
  Future<void> logout() async {
    await _client.auth.signOut();
  }

  // Forgot Password
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  // Update profile
  Future<void> updateProfile(String id, Map<String, dynamic> updates) async {
    await _client.from('users').update(updates).eq('id', id);
  }

  // Current user
  User? get currentUser => _client.auth.currentUser;
}
