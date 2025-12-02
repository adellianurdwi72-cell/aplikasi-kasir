import 'package:flutter/material.dart';

// Hapus jika nanti memakai provider asli
// import 'package:provider/provider.dart';
// import 'package:providers/customer_provider.dart';
// import 'package:widgets/customer_form.dart';


// ==========================================================
//  MODEL CUSTOMER (Dummy)
//  Nanti tinggal ganti dengan model asli dari Provider / Supabase
// ==========================================================
class Customer {
  final String name;
  final String phone;
  final String status;
  final String avatarUrl;

  Customer({
    required this.name,
    required this.phone,
    required this.status,
    required this.avatarUrl,
  });
}

final List<Customer> dummyCustomers = [
  Customer(name: 'Navarro Mavendra', phone: '0855753074632', status: 'Aktif', avatarUrl: 'assets/avatar1.jpg'),
  Customer(name: 'Garistha Rachana', phone: '087357347820', status: 'Aktif', avatarUrl: 'assets/avatar2.jpg'),
  Customer(name: 'Raeyadewi Rushea', phone: '085357286708', status: 'Tidak Aktif', avatarUrl: 'assets/avatar3.jpg'),
  Customer(name: 'Keandra Arkatama', phone: '088243340073', status: 'Aktif', avatarUrl: 'assets/avatar4.jpg'),
  Customer(name: 'Sagara Adhiyaksa', phone: '081730715434', status: 'Tidak Aktif', avatarUrl: 'assets/avatar5.jpg'),
  Customer(name: 'Kahlevi Wiratama', phone: '082644214875', status: 'Tidak Aktif', avatarUrl: 'assets/avatar6.jpg'),
  Customer(name: 'Hanindya Shevanya', phone: '081455014387', status: 'Aktif', avatarUrl: 'assets/avatar7.jpg'),
  Customer(name: 'Ashara Deeana', phone: '082848134548', status: 'Aktif', avatarUrl: 'assets/avatar8.jpg'),
  Customer(name: 'Deandra Rajevan', phone: '088471124973', status: 'Tidak Aktif', avatarUrl: 'assets/avatar9.jpg'),
  Customer(name: 'Azaleana Nadira', phone: '083216217467', status: 'Aktif', avatarUrl: 'assets/avatar10.jpg'),
  Customer(name: 'Savero Archandra', phone: '082414254667', status: 'Aktif', avatarUrl: 'assets/avatar11.jpg'),
  Customer(name: 'Anvaya Raespati', phone: '084656264577', status: 'Aktif', avatarUrl: 'assets/avatar12.jpg'),
  Customer(name: 'Rajash Bimantara', phone: '085213476481', status: 'Aktif', avatarUrl: 'assets/avatar13.jpg'),
];


// ==========================================================
//  MAIN SCREEN
// ==========================================================
class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFC8A77E);
    const Color darkBrown = Color(0xFF8B6B4F);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: primaryColor,
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
          child: Column(
            children: [
              // --- HEADER ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const Text(
                    'Data Pelanggan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: darkBrown,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.lock_open, color: Colors.white, size: 20),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // --- SEARCH BAR ---
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari pelanggan',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ==========================================================
      //  BODY
      // ==========================================================
      body: Column(
        children: [
          // --- ACTION MENU ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.check_box_outline_blank, color: Colors.grey),
                const SizedBox(width: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Semua pelanggan',
                    style: TextStyle(fontSize: 12, color: darkBrown),
                  ),
                ),

                const Spacer(),
                const Icon(Icons.edit, color: Colors.grey, size: 20),
                const SizedBox(width: 15),
                const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                const SizedBox(width: 15),
                const Icon(Icons.add, color: Colors.black, size: 20),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1, color: Colors.grey),

          // --- LIST CUSTOMER ---
          Expanded(
            child: ListView.builder(
              itemCount: dummyCustomers.length,
              itemBuilder: (context, index) {
                return CustomerListItem(customer: dummyCustomers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
//  ITEM LIST PELANGGAN
// ==========================================================
class CustomerListItem extends StatelessWidget {
  final Customer customer;

  const CustomerListItem({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, right: 10),
            child: Icon(Icons.check_box_outline_blank, color: Colors.grey),
          ),

          // --- AVATAR ---
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: AssetImage(customer.avatarUrl),
          ),

          const SizedBox(width: 15),

          // --- TEXT DETAIL ---
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customer.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                customer.phone,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Text(
                customer.status,
                style: TextStyle(
                  color: customer.status == 'Aktif'
                      ? Colors.black
                      : Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
