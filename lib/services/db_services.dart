import 'package:supabase_flutter/supabase_flutter.dart';

class DbService {
  final _client = Supabase.instance.client;

  // Generic select
  Future<List<Map<String, dynamic>>> select(String table, {String? columns}) async {
    final resp = await _client.from(table).select(columns ?? '*');

    return resp.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Future<Map<String, dynamic>?> selectOne(String table, int id) async {
    final resp = await _client
        .from(table)
        .select()
        .eq('id', id)
        .maybeSingle();

    if (resp == null) return null;
    return Map<String, dynamic>.from(resp);
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    await _client.from(table).insert(data);
  }

  Future<void> update(String table, int id, Map<String, dynamic> data) async {
    await _client.from(table).update(data).eq('id', id);
  }

  Future<void> delete(String table, int id) async {
    await _client.from(table).delete().eq('id', id);
  }
}
