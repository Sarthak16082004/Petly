import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';

class PetsScreen extends ConsumerWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pets = ref.watch(activePetsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pets')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add pet'),
      ),
      body: pets.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.pets_outlined, size: 64),
                    const SizedBox(height: 16),
                    Text(
                      'No pets yet',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Create a profile to begin tracking health and care.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: () => context.push('/pets/new'),
                      icon: const Icon(Icons.add_rounded),
                      label: const Text('Add your first pet'),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final pet = items[index];
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    radius: 28,
                    child: Text(pet.name.characters.first.toUpperCase()),
                  ),
                  title: Text(
                    pet.name,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    [pet.species, pet.breed]
                        .whereType<String>()
                        .where((value) => value.isNotEmpty)
                        .join(' • '),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push('/pets/${pet.id}'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: FilledButton.tonal(
            onPressed: () => ref.invalidate(activePetsProvider),
            child: const Text('Try again'),
          ),
        ),
      ),
    );
  }
}
