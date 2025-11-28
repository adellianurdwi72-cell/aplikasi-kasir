class AppUser {
final String id;
final String email;
final String? fullName;


AppUser({required this.id, required this.email, this.fullName});


factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
id: map['id'] as String,
email: map['email'] as String,
fullName: map['full_name'] as String?,
);


Map<String, dynamic> toMap() => {
'id': id,
'email': email,
'full_name': fullName,
};
}