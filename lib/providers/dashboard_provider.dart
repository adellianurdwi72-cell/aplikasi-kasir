import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      final trx = await supabase
          .from('penjualan')
          .select('*', const FetchOptions(count: CountOption.exact));

      totalTransaksi = trx.count ?? 0;

      // ==============================
      // 2. PRODUK TERLARIS
      // ==============================
      final populer = await supabase
          .from('produk')
          .select('jumlah_terjual')
          .order('jumlah_terjual', ascending: false)
          .limit(1);

      if (populer.isNotEmpty) {
        produkTerlaris = populer.first['jumlah_terjual'] ?? 0;
      } else {
        produkTerlaris = 0;
      }

      // ==============================
      // 3. STOK MENIPIS (stok <= 5)
      // ==============================
      final menipis = await supabase
          .from('produk')
          .select('id')
          .lte('stok', 5);

      stokMenipis = menipis.length;

      // ==============================
      // 4. GRAFIK PENDAPATAN BULANAN (RPC)
      // ==============================
      final grafik = await supabase.rpc('get_pendapatan_bulanan');

      grafikPendapatan =
          List<Map<String, dynamic>>.from(grafik ?? []);

      // ==============================
      // 5. PENDAPATAN BULAN INI
      // ==============================
      if (grafikPendapatan.isNotEmpty) {
        pendapatanBulanIni =
            (grafikPendapatan.last['total'] ?? 0).toDouble();
      } else {
        pendapatanBulanIni = 0.0;
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      debugPrint("Dashboard error: $e");
    }
  }

  // ==========================================================
  //  LISTEN REALTIME: UPDATE DASHBOARD KETIKA ADA TRANSAKSI
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
