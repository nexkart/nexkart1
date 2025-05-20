import 'package:flutter/material.dart';
import 'package:nexkart4/models/adrees.dart';
import 'package:nexkart4/providers/adress_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddAddressScreen extends StatefulWidget {
  final Address? existingAddress;

  const AddAddressScreen({super.key, this.existingAddress});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _streetController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _pincodeController;

  @override
  void initState() {
    super.initState();
    final a = widget.existingAddress;
    _nameController = TextEditingController(text: a?.name ?? '');
    _phoneController = TextEditingController(text: a?.phone ?? '');
    _streetController = TextEditingController(text: a?.street ?? '');
    _cityController = TextEditingController(text: a?.city ?? '');
    _stateController = TextEditingController(text: a?.state ?? '');
    _pincodeController = TextEditingController(text: a?.pincode ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      final newAddress = Address(
        id: widget.existingAddress?.id ?? const Uuid().v4(),
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        pincode: _pincodeController.text.trim(),
      );

      final provider = context.read<AddressProvider>();
      if (widget.existingAddress != null) {
        provider.updateAddress(newAddress);
      } else {
        provider.addAddress(newAddress);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingAddress != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Address' : 'Add Address'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildField(_nameController, 'Name', Icons.person),
              _buildField(
                _phoneController,
                'Phone',
                Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              _buildField(_streetController, 'Street', Icons.home),
              _buildField(_cityController, 'City', Icons.location_city),
              _buildField(_stateController, 'State', Icons.map),
              _buildField(
                _pincodeController,
                'Pincode',
                Icons.pin_drop,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveAddress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(
                  isEditing ? 'Update Address' : 'Save Address',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator:
            (value) =>
                value == null || value.trim().isEmpty ? 'Required' : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
