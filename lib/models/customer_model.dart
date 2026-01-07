class Customer {
  final String id;
  final String name;
  final String phone;
  final String alamat;
  final String createdAt;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.alamat,
    required this.createdAt,
  });

  // Ganti nama ke fromMap agar sesuai dengan Service Anda
  factory Customer.fromMap(Map<String, dynamic> json) {
    return Customer(
      // Tambahkan .toString() dan ?? '' (null safety)
      id: json['id']?.toString() ?? '', 
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      alamat: json['alamat']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
    );
  }
}