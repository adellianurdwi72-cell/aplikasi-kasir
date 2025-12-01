import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6BD8A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const Text(
                    "Keranjang",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.brown[800],
                    child: const Icon(Icons.person, color: Colors.white),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Item Keranjang
              _itemCard(
                image: 'https://via.placeholder.com/80',
                title: 'Cappucino',
                price: 'Rp. 27.000',
              ),
              const SizedBox(height: 10),

              _itemCard(
                image: 'https://via.placeholder.com/80',
                title: 'Bubblin Blue',
                price: 'Rp. 25.500',
              ),
              const SizedBox(height: 10),

              _itemCard(
                image: 'https://via.placeholder.com/80',
                title: 'Cheesecake',
                price: 'Rp. 30.000',
              ),

              const SizedBox(height: 20),

              // Promo
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Kode Promo",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      "Terapkan",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Rincian Pembayaran
              _detailRow('Keranjang', 'Rp. 82.500'),
              _detailRow('Potongan Harga', '5%'),
              _detailRow('Total', 'Rp. 78.500'),
              _detailRow('Nama', 'Anessa Tawisha'),
              _detailRow('No. Transaksi', '3948753'),
              _detailRow('Bayar', 'Rp. 78.500'),
              _detailRow('No. Meja', '13'),

              const SizedBox(height: 20),

              // Payment Methods
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _paymentButton(Icons.qr_code, "Qris"),
                  _paymentButton(Icons.account_balance_wallet, "GoPay"),
                  _paymentButton(Icons.wallet, "Dana"),
                  _paymentButton(Icons.account_balance, "M-banking"),
                ],
              ),

              const SizedBox(height: 20),

              // Button Pesan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Pesan",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Bottom Nav
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, size: 30),
                  Icon(Icons.book, size: 30),
                  Icon(Icons.shopping_cart, size: 30),
                  Icon(Icons.person, size: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemCard({required String image, required String title, required String price}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7EFD2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(price, style: const TextStyle(fontSize: 14, color: Colors.brown)),
              ],
            ),
          ),
          Row(
            children: const [
              Icon(Icons.remove, size: 22),
              SizedBox(width: 8),
              Text("1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Icon(Icons.add, size: 22),
            ],
          )
        ],
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _paymentButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}