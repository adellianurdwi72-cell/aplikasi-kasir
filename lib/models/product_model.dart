// lib/models/product_model.dart

class Product {
  final String name;
  final int price;      // harga produk dalam bentuk integer
  final String image;   // path asset gambar
  final String category; // kategori produk (opsional)

  Product({
    required this.name,
    required this.price,
    required this.image,
    this.category = "Semua", // default kategori
  });
}
