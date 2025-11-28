class Customer {
final int? id;
final String name;
final String? phone;


Customer({this.id, required this.name, this.phone});


factory Customer.fromMap(Map<String, dynamic> m) => Customer(
id: m['id'] as int?,
name: m['name'] as String,
phone: m['phone'] as String?,
);


Map<String, dynamic> toMap() => {
'name': name,
'phone': phone,
};
}