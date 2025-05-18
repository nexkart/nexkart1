import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(
    text: "John Doe",
  );
  final TextEditingController emailController = TextEditingController(
    text: "john@example.com",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "1234567890",
  );
  String gender = "Male";
  DateTime? dob;

  Future<void> _selectDOB() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dob) {
      setState(() => dob = picked);
    }
  }

  void _saveDetails() {
    if (_formKey.currentState!.validate()) {
      // Save logic here
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Details Saved")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9F5CFF), Color(0xFF4B00A8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),

              SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (value) =>
                        value!.contains('@') ? null : "Enter a valid email",
              ),

              SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        value!.length == 10
                            ? null
                            : "Enter a valid 10-digit phone number",
              ),

              SizedBox(height: 16),

              // Gender
              DropdownButtonFormField<String>(
                value: gender,
                decoration: InputDecoration(labelText: "Gender"),
                items:
                    ['Male', 'Female', 'Other']
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                onChanged: (val) => setState(() => gender = val!),
              ),

              SizedBox(height: 16),

              // DOB
              InkWell(
                onTap: _selectDOB,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    dob != null
                        ? "${dob!.day}/${dob!.month}/${dob!.year}"
                        : "Select your birth date",
                    style: TextStyle(
                      color: dob != null ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveDetails,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
