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

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      alamat: json['alamat'],
      createdAt: json['created_at'],
    );
  }
}
