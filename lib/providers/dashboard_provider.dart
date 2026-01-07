import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:postgrest/postgrest.dart';

class DashboardProvider extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  int totalTransaksi = 0;
  int produkTerlaris = 0;
  int stokMenipis = 0;
  double pendapatanBulanIni = 0.0;

  List<Map<String, dynamic>> grafikPendapatan = [];

  bool isLoading = false;

  DashboardProvider() {
    loadData();
    listenRealtime();
  }

  Future<void> loadData() async {
    try {
      isLoading = true;
      notifyListeners();

      // ==============================
      // 1. TOTAL TRANSAKSI
      // ==============================
      final trxResponse = await supabase
          .from('penjualan')
          .select('id')
          .count(CountOption.exact);

      totalTransaksi = trxResponse.count ?? 0;

      // ==============================
      // 2. PRODUK TERLARIS
      // ==============================
      final populerResponse = await supabase
          .from('produk')
          .select('jumlah_terjual')
          .order('jumlah_terjual', ascending: false)
          .limit(1);

      final populer = populerResponse as List?;
      produkTerlaris =
          (populer != null && populer.isNotEmpty) ? populer.first['jumlah_terjual'] ?? 0 : 0;

      // ==============================
      // 3. STOK MENIPIS (stok <= 5)
      // ==============================
      final stokResponse = await supabase
          .from('produk')
          .select('id')
          .lte('stok', 5);

      final menipis = stokResponse as List?;
      stokMenipis = menipis?.length ?? 0;

      // ==============================
      // 4. GRAFIK PENDAPATAN BULANAN (RPC)
      // ==============================
      final grafikResponse = await supabase.rpc('get_pendapatan_bulanan');

      grafikPendapatan = List<Map<String, dynamic>>.from(grafikResponse ?? []);

      // ==============================
      // 5. PENDAPATAN BULAN INI
      // ==============================
      pendapatanBulanIni = grafikPendapatan.isNotEmpty
          ? (grafikPendapatan.last['total'] ?? 0).toDouble()
          : 0.0;

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      debugPrint("Dashboard error: $e");
    }
  }

  // ==========================================================
  // LISTEN REALTIME: UPDATE DASHBOARD KETIKA ADA TRANSAKSI
  // ==========================================================
  void listenRealtime() {
    supabase.channel('realtime_dashboard')
      ..onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'penjualan',
        callback: (payload) {
          loadData(); // reload otomatis
        },
      )
      ..subscribe();
  }
}
