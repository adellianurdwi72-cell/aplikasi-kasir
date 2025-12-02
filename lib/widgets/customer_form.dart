import 'package:flutter/material.dart';

class CustomerForm extends StatefulWidget {
  final String? name;
  final String? phone;
  final String? alamat;
  final Function(String, String, String) onSubmit;

  const CustomerForm({
    super.key,
    this.name,
    this.phone,
    this.alamat,
    required this.onSubmit,
  });

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameC;
  late TextEditingController phoneC;
  late TextEditingController alamatC;

  @override
  void initState() {
    nameC = TextEditingController(text: widget.name);
    phoneC = TextEditingController(text: widget.phone);
    alamatC = TextEditingController(text: widget.alamat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameC,
            decoration: const InputDecoration(labelText: 'Nama'),
            validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
          ),
          TextFormField(
            controller: phoneC,
            decoration: const InputDecoration(labelText: 'Nomor Telepon'),
            validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
          ),
          TextFormField(
            controller: alamatC,
            decoration: const InputDecoration(labelText: 'Alamat'),
            validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(
                  nameC.text,
                  phoneC.text,
                  alamatC.text,
                );
              }
            },
            child: const Text("Simpan"),
          )
        ],
      ),
    );
  }
}
