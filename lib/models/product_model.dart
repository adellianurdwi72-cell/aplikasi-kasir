class Product {
  final int id;
  final String name;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  // Convert dari JSON Supabase
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      stock: json['stock'],
    );
  }

  // Convert ke JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "stock": stock,
    };
  }
}
