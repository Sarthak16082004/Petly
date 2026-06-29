import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/features/owner_profile/presentation/owner_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owner = ref.watch(ownerProvider).value;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: const CircleAvatar(child: Icon(Icons.person_outline)),
              title: Text(owner?.displayName ?? 'Owner profile'),
              subtitle: Text(owner?.email ?? 'Stored only on this device'),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
          ),
          const SizedBox(height: 20),
          const _SettingsTile(
            icon: Icons.palette_outlined,
            title: 'Appearance',
            subtitle: 'System theme',
          ),
          const _SettingsTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Reminder permissions and timing',
          ),
          const _SettingsTile(
            icon: Icons.lock_outline_rounded,
            title: 'Privacy & security',
            subtitle: 'Local app protection',
          ),
          const _SettingsTile(
            icon: Icons.cloud_upload_outlined,
            title: 'Backup & restore',
            subtitle: 'Google Drive — not configured yet',
          ),
          const _SettingsTile(
            icon: Icons.info_outline_rounded,
            title: 'About Petly',
            subtitle: 'Version 0.1.0',
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}
