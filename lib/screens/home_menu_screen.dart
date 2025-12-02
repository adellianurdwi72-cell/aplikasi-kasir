import 'package:flutter/material.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6BD8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFIL & ICON SETTINGS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.grey[700]),
                  ),
                  Icon(Icons.settings, size: 28, color: Colors.black87),
                ],
              ),

              const SizedBox(height: 20),

              // TITLE APP
              const Text(
                "CafeNova",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 25),

              // MENU ITEM
              MenuButton(
                icon: Icons.dashboard,
                title: "Dashboard",
                onTap: () => Navigator.pushNamed(context, "/dashboard"),
                isSelected: true,
              ),

              MenuButton(
                icon: Icons.shopping_cart,
                title: "Transaksi Penjualan",
                onTap: () {},
              ),

              MenuButton(
                icon: Icons.list_alt,
                title: "Manajemen Produk",
                onTap: () {},
              ),

              MenuButton(
                icon: Icons.people,
                title: "Data Pelanggan",
                onTap: () => Navigator.pushNamed(context, "/pelanggan"),
              ),

              MenuButton(
                icon: Icons.badge,
                title: "Manajemen Karyawan",
                onTap: () {},
              ),

              MenuButton(
                icon: Icons.bar_chart,
                title: "Laporan & Analisis",
                onTap: () {},
              ),

              MenuButton(
                icon: Icons.settings_applications,
                title: "Pengaturan",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------
// REUSABLE MENU BUTTON
// ------------------------
class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: isSelected
                ? Border.all(color: Colors.blue, width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, size: 24, color: Colors.black87),
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
