import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/customer_model.dart';
import '../providers/customer_provider.dart';
import '../widgets/customer_form.dart';

class CustomerEditScreen extends StatelessWidget {
  final Customer customer;

  const CustomerEditScreen({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Pelanggan"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomerForm(
          name: customer.name,
          phone: customer.phone,
          alamat: customer.alamat,
          onSubmit: (name, phone, alamat) async {
            // Panggil provider untuk update data
            await Provider.of<CustomerProvider>(context, listen: false)
                .updateCustomer(customer.id, name, phone, alamat);

            // Tutup halaman setelah berhasil update
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
