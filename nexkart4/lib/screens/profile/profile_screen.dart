import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:nexkart4/widgets/_settingstile.dart';
import '../../providers/user_provider.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
        });
      } else {
        // User canceled the picker
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('No image selected')));
      }
    } catch (e) {
      // Handle errors, e.g., permission denied
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _pickedImage != null
                          ? FileImage(_pickedImage!) as ImageProvider
                          : const AssetImage('assets/images/user_avatar.png'),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.deepPurple),
                  onPressed: _pickImage,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SettingsTile(
            icon: Icons.edit,
            title: 'Edit Profile',
            onTap: () => Navigator.pushNamed(context, '/edit-profile'),
          ),
          SettingsTile(
            icon: Icons.location_on,
            title: 'Saved Addresses',
            onTap: () => Navigator.pushNamed(context, '/addresses'),
          ),
          SettingsTile(
            icon: Icons.history,
            title: 'Order History',
            onTap: () => Navigator.pushNamed(context, '/order-history'),
          ),
          const SizedBox(height: 32),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            trailing: Switch(
              value: true,
              onChanged: (val) {},
              activeColor: Colors.deepPurple,
            ),
          ),
          SettingsTile(
            icon: Icons.lock,
            title: 'Privacy',
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text('Privacy Policy'),
                      content: const Text('Your data is safe with us.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              );
            },
          ),
          SettingsTile(icon: Icons.palette, title: 'Theme', onTap: () {}),
          SettingsTile(icon: Icons.language, title: 'Language', onTap: () {}),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Logged out')));
            },
            icon: const Icon(Icons.logout, color: Colors.black),
            label: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
