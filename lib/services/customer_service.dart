import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/customer.dart';

class CustomerService {
  static final _client = Supabase.instance.client;
  static const _table = 'customers';

  // GET all customers
  static Future<List<Customer>> getAll() async {
    final response = await _client
        .from(_table)
        .select()
        .order('created_at', ascending: false);

    return response.map((e) => Customer.fromMap(e)).toList();
  }

  // CREATE customer
  static Future<void> create(Map<String, dynamic> data) async {
    await _client.from(_table).insert(data);
  }

  // UPDATE customer
  static Future<void> update(String id, Map<String, dynamic> data) async {
    await _client.from(_table).update(data).eq('id', id);
  }

  // DELETE customer
  static Future<void> delete(String id) async {
    await _client.from(_table).delete().eq('id', id);
  }
}
