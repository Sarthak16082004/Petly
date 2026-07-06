import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';

class RecordsScreen extends ConsumerWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petsAsync = ref.watch(activePetsProvider);

    void handleNavigation(String pathSuffix) {
      if (petsAsync.isLoading) return;

      final pets = petsAsync.valueOrNull ?? [];
      if (pets.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please add a pet first to view records.')),
        );
        return;
      }

      if (pets.length == 1) {
        context.push('/pets/${pets.first.id}/$pathSuffix');
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Select Pet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...pets.map((pet) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(pet.name.substring(0, 1).toUpperCase()),
                      ),
                      title: Text(pet.name),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/pets/${pet.id}/$pathSuffix');
                      },
                    );
                  }),
                ],
              ),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Records')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _RecordTile(
            icon: Icons.medical_information_outlined,
            title: 'Medical history',
            subtitle: 'View medical records and history',
            onTap: () => handleNavigation('medical'),
          ),
          const SizedBox(height: 12),
          _RecordTile(
            icon: Icons.description_outlined,
            title: 'Documents',
            subtitle: 'Ready for the next feature phase',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Documents feature coming soon!')),
              );
            },
          ),
          const SizedBox(height: 12),
          _RecordTile(
            icon: Icons.monitor_weight_outlined,
            title: 'Growth',
            subtitle: 'Track your pet\'s weight and growth',
            onTap: () => handleNavigation('growth'),
          ),
          const SizedBox(height: 12),
          _RecordTile(
            icon: Icons.receipt_long_outlined,
            title: 'Expenses',
            subtitle: 'Manage and track pet expenses',
            onTap: () => handleNavigation('expenses'),
          ),
        ],
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  const _RecordTile({
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
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}
