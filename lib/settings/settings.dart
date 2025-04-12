import 'package:flutter/material.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection('Account', [
            _buildSettingsItem('Profile', Icons.person),
            _buildSettingsItem('Notifications', Icons.notifications),
            _buildSettingsItem('Security', Icons.security),
          ]),
          const SizedBox(height: 24),
          _buildSettingsSection('Business', [
            _buildSettingsItem('Shop Details', Icons.store),
            _buildSettingsItem('Working Hours', Icons.access_time),
            _buildSettingsItem('Pricing', Icons.attach_money),
          ]),
          const SizedBox(height: 24),
          _buildSettingsSection('App', [
            _buildSettingsItem('Language', Icons.language),
            _buildSettingsItem('Theme', Icons.palette),
            _buildSettingsItem('About', Icons.info),
          ]),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...items,
      ],
    );
  }

  Widget _buildSettingsItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
