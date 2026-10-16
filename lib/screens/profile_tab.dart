import 'package:flutter/material.dart';

/// Tab 3: a simple user profile with a few settings.
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _notifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 44,
              backgroundColor: colors.primaryContainer,
              child: Text(
                'AB',
                style: TextStyle(
                  fontSize: 28,
                  color: colors.onPrimaryContainer,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Abror',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(child: Text('Student · Narxoz University')),
          const SizedBox(height: 24),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            secondary: const Icon(Icons.notifications_outlined),
            value: _notifications,
            onChanged: (value) => setState(() => _notifications = value),
          ),
          SwitchListTile(
            title: const Text('Dark mode'),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: _darkMode,
            onChanged: (value) => setState(() => _darkMode = value),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            trailing: Text('English'),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App version'),
            trailing: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
