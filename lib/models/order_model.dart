class Order {
final int? id;
final int customerId;
final DateTime createdAt;
final int total;


Order({this.id, required this.customerId, required this.createdAt, required this.total});


factory Order.fromMap(Map<String, dynamic> m) => Order(
id: m['id'] as int?,
customerId: (m['customer_id'] as num).toInt(),
createdAt: DateTime.parse(m['created_at'] as String),
total: (m['total'] as num).toInt(),
);


Map<String, dynamic> toMap() => {
'customer_id': customerId,
'created_at': createdAt.toIso8601String(),
'total': total,
};
}