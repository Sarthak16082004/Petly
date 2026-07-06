import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/app/theme/theme_provider.dart';
import 'package:petly/features/owner_profile/presentation/owner_providers.dart';
import 'package:petly/features/shared/data/backup_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owner = ref.watch(ownerProvider).value;

    void showComingSoon(String feature) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$feature coming soon!')),
      );
    }

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
              onTap: () => showComingSoon('Owner profile'),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('Appearance'),
            subtitle: Text(ref.watch(themeModeProvider).name.capitalize()),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const _ThemeSelectionSheet(),
              );
            },
          ),
          _SettingsTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Reminder permissions and timing',
            onTap: () => showComingSoon('Notifications'),
          ),
          _SettingsTile(
            icon: Icons.lock_outline_rounded,
            title: 'Privacy & security',
            subtitle: 'Local app protection',
            onTap: () => showComingSoon('Privacy & security'),
          ),
          _SettingsTile(
            icon: Icons.cloud_upload_outlined,
            title: 'Backup & restore',
            subtitle: 'Manual export file backup',
            onTap: () async {
              try {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Preparing backup...')),
                );
                await ref.read(backupServiceProvider).createManualBackup();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
          ),
          _SettingsTile(
            icon: Icons.info_outline_rounded,
            title: 'About Petly',
            subtitle: 'Version 0.1.0',
            onTap: () => showComingSoon('About Petly'),
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
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}

class _ThemeSelectionSheet extends ConsumerWidget {
  const _ThemeSelectionSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Select Theme', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System default'),
            value: ThemeMode.system,
            groupValue: currentTheme,
            onChanged: (val) {
              if (val != null) ref.read(themeModeProvider.notifier).setThemeMode(val);
              Navigator.pop(context);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: currentTheme,
            onChanged: (val) {
              if (val != null) ref.read(themeModeProvider.notifier).setThemeMode(val);
              Navigator.pop(context);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: currentTheme,
            onChanged: (val) {
              if (val != null) ref.read(themeModeProvider.notifier).setThemeMode(val);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
