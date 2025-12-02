import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/customer_model.dart';
import '../services/customer_service.dart';

class CustomerNotifier extends StateNotifier<List<Customer>> {
  CustomerNotifier() : super([]) {
    loadCustomers();
  }

  // Load all data
  Future<void> loadCustomers() async {
    try {
      state = await CustomerService.getAll();
    } catch (e) {
      print("Error load pelanggan: $e");
    }
  }

  // Add
  Future<void> addCustomer(Map<String, dynamic> data) async {
    await CustomerService.create(data);
    loadCustomers();
  }

  // Update
  Future<void> updateCustomer(String id, Map<String, dynamic> data) async {
    await CustomerService.update(id, data);
    loadCustomers();
  }

  // Delete
  Future<void> deleteCustomer(String id) async {
    await CustomerService.delete(id);
    loadCustomers();
  }
}

final customerProvider =
    StateNotifierProvider<CustomerNotifier, List<Customer>>(
  (ref) => CustomerNotifier(),
);
