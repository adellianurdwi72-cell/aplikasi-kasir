import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/dashboard_provider.dart';
import '../../providers/auth_provider.dart';
import 'dashboard_header.dart';
import 'dashboard_stat_card.dart';
import 'dashboard_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dash, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFD6BD8A),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                onPressed: () async {
                  context.read<AuthProvider>().logout();
                  // Tidak perlu Navigator jika pakai AuthGate
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeader(),

                  const SizedBox(height: 20),

                  // RINGKASAN PENJUALAN
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ringkasan Penjualan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Rp. ${dash.pendapatanBulanIni.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Sabtu, 20 September 2025",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // CARD STATISTIK
                  Row(
                    children: [
                      Expanded(
                        child: DashboardStatCard(
                          title: "Jumlah Transaksi",
                          value: dash.totalTransaksi.toString(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DashboardStatCard(
                          title: "Produk Terlaris",
                          value: dash.produkTerlaris.toString(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: DashboardStatCard(
                          title: "Pendapatan Bulan Ini",
                          value:
                              "Rp ${dash.pendapatanBulanIni.toStringAsFixed(0)}",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DashboardStatCard(
                          title: "Stok Menipis",
                          value: dash.stokMenipis.toString(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // GRAFIK
                  DashboardChart(data: dash.grafikPendapatan),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
