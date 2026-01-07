import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/customer_model.dart';
import '../providers/customer_provider.dart';
import '../widgets/customer_form.dart';

class CustomerEditScreen extends ConsumerWidget {
  final Customer customer;

  const CustomerEditScreen({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            await ref.read(customerProvider.notifier).updateCustomer(
              customer.id,
              {
                "name": name,
                "phone": phone,
                "alamat": alamat,
              },
            );

            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
