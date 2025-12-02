import 'package:flutter/material.dart';

// Model Data untuk merepresentasikan satu item stok
class StockItem {
  final String id;
  final String name;
  final String iconPath; // Menggunakan String placeholder
  int stock;
  final int lowStockThreshold; // Batas minimal stok
  final bool isSoldOut; // Status Habis

  StockItem({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.stock,
    this.lowStockThreshold = 15,
    this.isSoldOut = false,
  });

  // Untuk keperluan update sederhana dalam contoh ini
  StockItem copyWith({int? stock}) {
    return StockItem(
      id: this.id,
      name: this.name,
      iconPath: this.iconPath,
      stock: stock ?? this.stock,
      lowStockThreshold: this.lowStockThreshold,
      isSoldOut: this.isSoldOut,
    );
  }
}

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  // Data Stok awal (meniru data dari gambar yang Anda berikan)
  List<StockItem> _stockItems = [
    StockItem(
      id: '1',
      name: 'Espresso Roast Beans',
      iconPath: '☕',
      stock: 50,
      lowStockThreshold: 20,
    ),
    StockItem(
      id: '2',
      name: 'Croissant',
      iconPath: '🥐',
      stock: 12,
      lowStockThreshold: 15,
    ),
    StockItem(
      id: '3',
      name: 'Cold Brew Concentrate',
      iconPath: '🍾',
      stock: 30,
      lowStockThreshold: 20,
    ),
    StockItem(
      id: '4',
      name: 'Retail Packaged Cookies',
      iconPath: '🍪',
      stock: 25,
      lowStockThreshold: 30, // Stok dianggap rendah jika < 30
    ),
    StockItem(
      id: '5',
      name: 'Bagel (Full Cream)',
      iconPath: '🥯',
      stock: 0,
      lowStockThreshold: 10,
      isSoldOut: true, // Sudah habis
    ),
  ];

  // --- Fungsi Notifikasi dan Cek Stok ---
  String _getStockStatus(StockItem item) {
    if (item.isSoldOut || item.stock == 0) {
      return 'Stok Habis';
    } else if (item.stock <= item.lowStockThreshold) {
      return 'Stok Rendah';
    } else {
      return '';
    }
  }

  // Menampilkan Bottom Sheet untuk simulasi update stok
  void _showUpdateStockSheet(StockItem item) {
    int newStock = item.stock;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perbarui Stok ${item.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah Stok Baru (Saat Ini: ${item.stock})',
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  newStock = int.tryParse(value) ?? item.stock;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _updateStockItem(item.id, newStock);
                  Navigator.pop(context); // Tutup bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Simpan Perubahan'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // Logika untuk memperbarui stok
  void _updateStockItem(String id, int newStock) {
    setState(() {
      int index = _stockItems.indexWhere((item) => item.id == id);
      if (index != -1) {
        _stockItems[index] = _stockItems[index].copyWith(stock: newStock);
        // Jika stok baru membuat status menjadi rendah, tampilkan peringatan
        if (newStock > 0 && newStock <= _stockItems[index].lowStockThreshold) {
          _showLowStockAlert(_stockItems[index].name, newStock);
        }
        // Jika stok = 0
        if (newStock == 0) {
          _showSoldOutAlert(_stockItems[index].name);
        }
      }
    });
  }

  // --- Fungsi Notifikasi (Snackbar) ---
  void _showLowStockAlert(String productName, int stockCount) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(
          '⚠️ PERINGATAN! Stok $productName menipis: $stockCount.',
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showSoldOutAlert(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          '❌ HABIS! Stok $productName sudah 0.',
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }
  // ------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEK STOK BARANG'),
        centerTitle: true,
        backgroundColor: Colors.brown, // Menyesuaikan tema
      ),
      body: Column(
        children: [
          // Bagian Pencarian dan Kategori (simulasi)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Tab Kategori (simulasi)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildCategoryTab('SEMUA', true),
                const SizedBox(width: 10),
                _buildCategoryTab('KATEGORI', false),
              ],
            ),
          ),
          const Divider(),

          // Daftar Stok
          Expanded(
            child: ListView.builder(
              itemCount: _stockItems.length,
              itemBuilder: (context, index) {
                final item = _stockItems[index];
                final status = _getStockStatus(item);
                Color statusColor = Colors.grey;

                if (status == 'Stok Rendah') {
                  statusColor = Colors.red;
                } else if (status == 'Stok Habis') {
                  statusColor = Colors.black; // Warna hitam untuk "Habis"
                }

                return ListTile(
                  leading: Text(
                    item.iconPath,
                    style: const TextStyle(fontSize: 24),
                  ), // Ikon dari data model
                  title: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: status.isNotEmpty
                      ? Text(
                          status,
                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                        )
                      : null,
                  trailing: Text(
                    'Stok: ${item.stock}',
                    style: TextStyle(
                      fontSize: 16,
                      color: status == 'Stok Rendah' || status == 'Stok Habis'
                          ? Colors.red
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Aksi saat item diklik (untuk update)
                  onTap: () => _showUpdateStockSheet(item),
                );
              },
            ),
          ),
        ],
      ),
      // Floating Action Button untuk menambahkan stok baru (placeholder)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi untuk menambah item baru (simulasi)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fungsi Tambah Item Baru')),
          );
        },
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Widget Helper untuk Tab Kategori
  Widget _buildCategoryTab(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.brown : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// Catatan: Anda perlu menjalankan ini di dalam aplikasi Flutter yang lengkap (misalnya, memanggil StockScreen di main.dart).
// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Aplikasi Stok',
//       home: StockScreen(),
//     );
//   }
// }