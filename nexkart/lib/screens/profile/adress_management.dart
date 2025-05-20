import 'package:flutter/material.dart';
import 'package:nexkart/providers/adress_provider.dart';
import 'package:nexkart/screens/profile/addaddress.dart';
import 'package:provider/provider.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    final addresses = addressProvider.addresses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Addresses'),
        backgroundColor: Colors.deepPurple,
      ),
      body:
          addresses.isEmpty
              ? const Center(child: Text('No saved addresses.'))
              : ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      title: Text(address.name),
                      subtitle: Text(
                        '${address.street}, ${address.city}, ${address.state}, ${address.pincode}\nPhone: ${address.phone}',
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          addressProvider.removeAddress(address.id);
                        },
                      ),
                      onTap: () {
                        // Optional: Navigate to edit screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    AddAddressScreen(existingAddress: address),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushNamed(context, '/add-address');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
