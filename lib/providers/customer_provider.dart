import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerProvider extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  List<Map<String, dynamic>> _customers = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Map<String, dynamic>> get customers => _customers;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ==========================
  // FETCH CUSTOMERS
  // ==========================
  Future<void> fetchCustomers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase.from('pelanggan').select();
      _customers = List<Map<String, dynamic>>.from(response);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Gagal mengambil data pelanggan: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  // ==========================
  // ADD CUSTOMER
  // ==========================
  Future<bool> addCustomer({
    required String nama,
    required String alamat,
    required String telepon,
  }) async {
    try {
      await _supabase.from('pelanggan').insert({
        'nama': nama,
        'alamat': alamat,
        'telepon': telepon,
      });

      await fetchCustomers();
      return true;
    } catch (e) {
      _errorMessage = 'Gagal menambah pelanggan: $e';
      notifyListeners();
      return false;
    }
  }

  // ==========================
  // UPDATE CUSTOMER
  // ==========================
  Future<bool> updateCustomer({
    required String id,
    required String nama,
    required String alamat,
    required String telepon,
  }) async {
    try {
      await _supabase.from('pelanggan').update({
        'nama': nama,
        'alamat': alamat,
        'telepon': telepon,
      }).eq('id', id);

      await fetchCustomers();
      return true;
    } catch (e) {
      _errorMessage = 'Gagal mengupdate pelanggan: $e';
      notifyListeners();
      return false;
    }
  }

  // ==========================
  // DELETE CUSTOMER
  // ==========================
  Future<bool> deleteCustomer(String id) async {
    try {
      await _supabase.from('pelanggan').delete().eq('id', id);

      _customers.removeWhere((item) => item['id'] == id);
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Gagal menghapus pelanggan: $e';
      notifyListeners();
      return false;
    }
  }
}
