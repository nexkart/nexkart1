import 'package:flutter/material.dart';
import 'package:nexkart1/main.dart';

void main() {
  runApp(MyApp());
}

class Addaddress extends StatefulWidget {
  const Addaddress({super.key});

  @override
  State<Addaddress> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<Addaddress> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String address = '';
  String phone = '';

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'name': name,
        'address': address,
        'phone': phone,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) => address = value,
                validator: (value) => value!.isEmpty ? 'Enter address' : null,
                maxLines: 3,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                onChanged: (value) => phone = value,
                validator:
                    (value) => value!.isEmpty ? 'Enter phone number' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAddress,
                child: const Text('Save Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
