import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/customer_model.dart';

class CustomerService {
  static final _client = Supabase.instance.client;
  static const _table = 'customers';

  static Future<List<Customer>> getAll() async {
  // 1. Beritahu Dart bahwa hasil select adalah List dari Map
  final List<Map<String, dynamic>> response = await _client
      .from(_table)
      .select()
      .order('created_at', ascending: false);

  // 2. Gunakan List.from untuk memastikan hasil akhirnya benar-benar List<Customer>
  return List<Customer>.from(
    response.map((e) => Customer.fromMap(e))
  );
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
