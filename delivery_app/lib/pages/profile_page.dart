// 📁 profile_page.dart
import 'package:flutter/material.dart';
import 'help_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          _buildSection([
            _profileItem(icon: Icons.person_outline, label: "Edit profile"),
            _profileItem(icon: Icons.security, label: "Security"),
            _profileItem(icon: Icons.notifications_none, label: "Notifications"),
            _profileItem(icon: Icons.lock_outline, label: "Privacy"),
          ]),

          const SizedBox(height: 24),
          const Text("Actions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          _buildSection([
            _profileItem(icon: Icons.logout, label: "Log out", onTap: () {
              // TODO: Ajouter logique de déconnexion
              Navigator.popUntil(context, (route) => route.isFirst);
            }),
            _profileItem(icon: Icons.book_online, label: "Receive Books"),
          ]),

          const SizedBox(height: 24),
          const Text("Support & About", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          _buildSection([
            _profileItem(icon: Icons.help_outline, label: "Help & Support", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()),
              );
            }),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _profileItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.black),
      title: Text(label),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
