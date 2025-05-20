import 'package:flutter/material.dart';
import 'package:nexkart/data/orders_data.dart';
import 'package:uuid/uuid.dart';

enum PaymentMethod { cod, upi, card, wallet, netBanking }

String paymentMethodToString(PaymentMethod method) {
  switch (method) {
    case PaymentMethod.cod:
      return 'Cash on Delivery';
    case PaymentMethod.upi:
      return 'UPI';
    case PaymentMethod.card:
      return 'Credit/Debit Card';
    case PaymentMethod.wallet:
      return 'Wallet';
    case PaymentMethod.netBanking:
      return 'Net Banking';
  }
}

class Address {
  final String id, name, phone, street, city, state, pincode;

  Address({
    required this.id,
    required this.name,
    required this.phone,
    required this.street,
    required this.city,
    required this.state,
    required this.pincode,
  });

  @override
  String toString() => '$name, $street, $city, $state - $pincode';
}

class OrderSummaryScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const OrderSummaryScreen({super.key, required this.product});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  Address? selectedAddress;
  PaymentMethod? selectedPaymentMethod;

  final List<Address> savedAddresses = [
    Address(
      id: const Uuid().v4(),
      name: 'John Doe',
      phone: '9876543210',
      street: '123, Elm Street',
      city: 'Metropolis',
      state: 'NY',
      pincode: '10001',
    ),
  ];

  void _selectAddress() async {
    final result = await Navigator.push<Address>(
      context,
      MaterialPageRoute(
        builder:
            (_) => AddressSelectionScreen(
              addresses: savedAddresses,
              selected: selectedAddress,
            ),
      ),
    );

    if (result != null) {
      setState(() {
        final index = savedAddresses.indexWhere((a) => a.id == result.id);
        if (index >= 0) {
          savedAddresses[index] = result;
        } else {
          savedAddresses.add(result);
        }
        selectedAddress = result;
      });
    }
  }

  void _selectPaymentMethod() async {
    final result = await Navigator.push<PaymentMethod>(
      context,
      MaterialPageRoute(builder: (_) => PaymentMethodSelectionScreen()),
    );

    if (result != null) {
      setState(() {
        selectedPaymentMethod = result;
      });
    }
  }

  void _confirmOrder() {
    if (selectedAddress == null || selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select address and payment method'),
        ),
      );
      return;
    }

    final newOrder = {
      'image': widget.product['image'],
      'name': widget.product['name'],
      'price': widget.product['price'],
      'status': 'Processing',
      'date': DateTime.now().toString().substring(0, 10),
    };

    orderList.add(newOrder); // 👈 Add new order to the list

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Order confirmed!')));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => YourOrdersScreen(orders: orderList)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Product Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Image.asset(
                      product['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '₹${product['price']}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Icon(
                                Icons.local_shipping,
                                size: 16,
                                color: Colors.green,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '1 Day Delivery',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Payment Method Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _selectPaymentMethod,
                  child: const Text('Select'),
                ),
              ],
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child:
                    selectedPaymentMethod == null
                        ? const Text(
                          'No payment method selected. Tap "Select" to choose.',
                        )
                        : Text(
                          paymentMethodToString(selectedPaymentMethod!),
                          style: const TextStyle(fontSize: 16),
                        ),
              ),
            ),
            const SizedBox(height: 24),

            // Address Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _selectAddress,
                  child: const Text('Select'),
                ),
              ],
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child:
                    selectedAddress == null
                        ? const Text(
                          'No address selected. Tap "Select" to choose.',
                        )
                        : Text(
                          '${selectedAddress!.name}\n'
                          '${selectedAddress!.phone}\n'
                          '${selectedAddress!.street}, ${selectedAddress!.city}, ${selectedAddress!.state} - ${selectedAddress!.pincode}',
                          style: const TextStyle(fontSize: 16),
                        ),
              ),
            ),
            const SizedBox(height: 36),

            ElevatedButton(
              onPressed: _confirmOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Confirm Your Order',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressSelectionScreen extends StatefulWidget {
  final List<Address> addresses;
  final Address? selected;

  const AddressSelectionScreen({
    super.key,
    required this.addresses,
    this.selected,
  });

  @override
  State<AddressSelectionScreen> createState() => _AddressSelectionScreenState();
}

class _AddressSelectionScreenState extends State<AddressSelectionScreen> {
  late List<Address> _addresses;
  Address? _selected;

  @override
  void initState() {
    super.initState();
    _addresses = List.from(widget.addresses);
    _selected = widget.selected;
  }

  Future<void> _addOrEditAddress({Address? existing}) async {
    final newAddress = await Navigator.push<Address>(
      context,
      MaterialPageRoute(
        builder: (_) => AddAddressScreen(existingAddress: existing),
      ),
    );

    if (newAddress != null) {
      setState(() {
        final index = _addresses.indexWhere((a) => a.id == newAddress.id);
        if (index >= 0) {
          _addresses[index] = newAddress;
        } else {
          _addresses.add(newAddress);
        }
        _selected = newAddress;
      });
    }
  }

  void _deleteAddress(Address address) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Delete Address'),
            content: const Text(
              'Are you sure you want to delete this address?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );

    if (confirm == true) {
      setState(() {
        _addresses.removeWhere((a) => a.id == address.id);
        if (_selected?.id == address.id) {
          _selected = null;
        }
      });
    }
  }

  void _onAddressSelected(Address address) {
    setState(() {
      _selected = address;
    });
    Navigator.pop(context, address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Address')),
      body: ListView(
        children: [
          ..._addresses.map(
            (address) => ListTile(
              title: Text(address.toString()),
              subtitle: Text('${address.name} - ${address.phone}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_selected?.id == address.id)
                    const Icon(Icons.check, color: Colors.deepPurple),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () => _addOrEditAddress(existing: address),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteAddress(address),
                  ),
                ],
              ),
              onTap: () => _onAddressSelected(address),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add New Address'),
            onTap: () => _addOrEditAddress(),
          ),
        ],
      ),
    );
  }
}

// Dummy placeholder for AddAddressScreen (you should implement this)
class AddAddressScreen extends StatelessWidget {
  final Address? existingAddress;
  const AddAddressScreen({super.key, this.existingAddress});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement form for adding/editing address
    return Scaffold(
      appBar: AppBar(
        title: Text(existingAddress == null ? 'Add Address' : 'Edit Address'),
      ),
      body: const Center(child: Text('Address form goes here')),
    );
  }
}

// Dummy placeholder for PaymentMethodSelectionScreen (you should implement this)
class PaymentMethodSelectionScreen extends StatelessWidget {
  const PaymentMethodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement payment method selection UI and return PaymentMethod on pop
    return Scaffold(
      appBar: AppBar(title: const Text('Select Payment Method')),
      body: ListView(
        children:
            PaymentMethod.values.map((method) {
              return ListTile(
                title: Text(paymentMethodToString(method)),
                onTap: () => Navigator.pop(context, method),
              );
            }).toList(),
      ),
    );
  }
}

// Dummy placeholder for YourOrdersScreen (you should implement this)
class YourOrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const YourOrdersScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      body:
          orders.isEmpty
              ? const Center(child: Text('Order history here'))
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return ListTile(
                    leading:
                        order['image'] != null
                            ? Image.asset(
                              order['image'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                            : null,
                    title: Text(order['name'] ?? ''),
                    subtitle: Text(
                      '₹${order['price']} - ${order['status']} (${order['date']})',
                    ),
                  );
                },
              ),
    );
  }
}
