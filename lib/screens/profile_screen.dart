import 'package:flutter/material.dart';

// Anda dapat menjalankan kode ini di main.dart atau file terpisah yang diimpor
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Profil',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFF3E5C5), // Warna latar belakang krem
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi warna utama dari gambar
    const Color primaryColor = Color(0xFFC0A272); // Warna cokelat/krem yang dominan
    const Color buttonColor = Color(0xFFEFE0C2); // Warna tombol dan latar belakang card

    return Scaffold(
      backgroundColor: primaryColor, // Mengatur warna latar belakang utama
      body: SafeArea(
        child: Column(
          children: [
            // Header dengan tombol kembali
            _buildHeader(context),
            // Konten utama profil (foto, detail, dan menu)
            Expanded(
              child: Container(
                // Container untuk latar belakang konten yang lebih muda
                decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  child: Column(
                    children: [
                      // --- Area Foto Profil dan Detail ---
                      _buildProfileInfo(),

                      const SizedBox(height: 30),

                      // --- Kategori 1: Akun & Pengaturan ---
                      _buildMenuSection(
                        items: [
                          _buildMenuItem(
                              icon: Icons.person_outline, title: 'Edit profile'),
                          _buildMenuItem(
                              icon: Icons.home_outlined, title: 'Alamat'),
                          _buildMenuItem(
                              icon: Icons.lock_outline, title: 'Ubah kata sandi'),
                          _buildMenuItem(
                              icon: Icons.credit_card_outlined,
                              title: 'Metode pembayaran'),
                          _buildMenuItem(
                              icon: Icons.settings_outlined, title: 'Pengaturan'),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // --- Kategori 2: Legal & Komunikasi ---
                      _buildMenuSection(
                        items: [
                          _buildMenuItem(
                              icon: Icons.privacy_tip_outlined,
                              title: 'Kebijakan Privasi'),
                          _buildMenuItem(
                              icon: Icons.notifications_none,
                              title: 'Notifikasi'),
                          _buildMenuItem(
                              icon: Icons.mail_outline, title: 'Ganti email'),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // --- Kategori 3: Bisnis & Bantuan ---
                      _buildMenuSection(
                        items: [
                          _buildMenuItem(
                              icon: Icons.local_activity_outlined,
                              title: 'Voucher'),
                          _buildMenuItem(
                              icon: Icons.inventory_2_outlined,
                              title: 'Cek stok barang'),
                          _buildMenuItem(
                              icon: Icons.help_outline,
                              title: 'Pusat bantuan'),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // --- Tombol Aksi ---
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.red, width: 1.5),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text('Hapus Akun',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: buttonColor,
                            side: const BorderSide(color: primaryColor, width: 1.5),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text('Keluar',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Header (Tombol Kembali)
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Aksi kembali
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10),
          const Text(
            'Profil',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Widget untuk Info Profil (Foto & Teks)
  Widget _buildProfileInfo() {
    return Column(
      children: [
        Stack(
          children: [
            // Circle Avatar (Foto Profil)
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(
                  'assets/profile_placeholder.jpg'), // Ganti dengan AssetImage atau NetworkImage
            ),
            // Icon Edit Kecil
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Color(0xFFC0A272),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Esha Wulandari',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text('esha.wu@gmail.com', style: TextStyle(color: Colors.grey)),
        const Text('Admin',
            style: TextStyle(color: Color(0xFFC0A272), fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget untuk membuat satu baris menu (ListTile)
  Widget _buildMenuItem(
      {required IconData icon, required String title, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFC0A272)),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
    );
  }

  // Widget untuk membuat blok menu yang dibungkus dalam Card
  Widget _buildMenuSection({required List<Widget> items}) {
    return Card(
      color: Colors.white,
      elevation: 0, // Card tanpa bayangan agar terlihat rata
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: items.map((widget) {
          // Tambahkan Divider setelah setiap item kecuali item terakhir
          if (widget == items.last) {
            return widget;
          }
          return Column(
            children: [
              widget,
              const Divider(height: 1, thickness: 0.5, indent: 50, endIndent: 10),
            ],
          );
        }).toList(),
      ),
    );
  }
}
