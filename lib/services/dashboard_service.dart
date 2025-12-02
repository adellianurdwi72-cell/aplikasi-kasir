import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardService {
  static final _supabase = Supabase.instance.client;

  // ================================
  // GET TOTAL TRANSAKSI
  // ================================
  static Future<int> getTotalTransaksi() async {
    final res = await _supabase.from('penjualan').select('id');
    return res.length;
  }

  // ================================
  // GET PRODUK TERLARIS
  // ================================
  static Future<int> getProdukTerlaris() async {
    final res = await _supabase
        .from('produk')
        .select('id')
        .order('terjual', ascending: false)
        .limit(1);

    if (res.isEmpty) return 0;
    return res.first['terjual'] ?? 0;
  }

  // ================================
  // GET TOTAL PENDAPATAN BULAN INI
  // ================================
  static Future<double> getPendapatanBulanIni() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);

    final res = await _supabase
        .from('penjualan')
        .select('total')
        .gte('tanggal', start.toIso8601String());

    double total = 0;
    for (var row in res) {
      total += (row['total'] as num).toDouble();
    }
    return total;
  }

  // ================================
  // GET STOK MENIPIS ( < 10 )
  // ================================
  static Future<int> getStokMenipis() async {
    final res =
        await _supabase.from('produk').select('id').lt('stok', 10);
    return res.length;
  }

  // ================================
  // GET DATA PENJUALAN HARIAN (CHART)
  // ================================
  static Future<List<double>> getPenjualanWeekly() async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(days: 6));

    final res = await _supabase
        .from('penjualan')
        .select('total, tanggal')
        .gte('tanggal', start.toIso8601String());

    List<double> weekly = List.filled(7, 0);

    for (var row in res) {
      DateTime t = DateTime.parse(row['tanggal']);
      int index = t.weekday - 1;
      weekly[index] += (row['total'] as num).toDouble();
    }

    return weekly;
  }
}
