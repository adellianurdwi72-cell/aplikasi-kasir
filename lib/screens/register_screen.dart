import 'package:flutter/material.dart';

// Definisi Warna Kustom (sama seperti di login_screen.dart)
const Color primaryBrown = Color(0xFFC0A272);
const Color lightBrown = Color(0xFFEFE0C2);

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrown,
      body: Stack(
        children: [
          // 1. Gambar Latar Belakang (Menggunakan Placeholder)
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'), // Ganti path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Konten Utama (Register Box)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75, // Dibuat lebih tinggi
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Box Register dengan Opacity
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15,
                        left: 20,
                        right: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7), // Opacity transparan
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tombol Kembali
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: primaryBrown),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text(
                          'Mendaftar',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                            hint: 'Email', icon: Icons.mail_outline),
                        const SizedBox(height: 15),
                        _buildTextField(
                            hint: 'Kata Sandi',
                            icon: Icons.lock_outline,
                            isPassword: true),
                        const SizedBox(height: 15),
                        _buildTextField(
                            hint: 'Konfirmasi Kata Sandi',
                            icon: Icons.lock_outline,
                            isPassword: true),
                      ],
                    ),
                  ),

                  // Padding untuk tombol
                  const SizedBox(height: 30),

                  // Tombol Mendaftar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBrown,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Mendaftar',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Pembantu untuk Input Text
  Widget _buildTextField(
      {required String hint, required IconData icon, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(icon, color: primaryBrown),
        ),
      ),
    );
  }
}