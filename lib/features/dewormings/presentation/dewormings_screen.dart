import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/dewormings/presentation/deworming_providers.dart';

class DewormingsScreen extends ConsumerWidget {
  const DewormingsScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dewormings = ref.watch(dewormingsByPetProvider(petId));

    return Scaffold(
      appBar: AppBar(title: const Text('Deworming Records')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/$petId/dewormings/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Log deworming'),
        backgroundColor: const Color(0xFFa855f7),
        foregroundColor: Colors.white,
      ),
      body: dewormings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AsyncErrorWidget(
          message: 'Could not load deworming records.',
          onRetry: () => ref.invalidate(dewormingsByPetProvider(petId)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.bug_report_outlined,
              title: 'No deworming records',
              body: 'Keep track of parasite control and treatments.',
              color: const Color(0xFFa855f7),
              action: FilledButton.icon(
                onPressed: () => context.push('/pets/$petId/dewormings/new'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add record'),
                style: FilledButton.styleFrom(backgroundColor: const Color(0xFFa855f7)),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final record = items[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFa855f7).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.medication_liquid, color: Color(0xFFa855f7)),
                  ),
                  title: Text(record.medicationName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Administered: ${DateFormat.yMMMd().format(record.administeredOn)}\n'
                      'Next Due: ${record.nextDueOn != null ? DateFormat.yMMMd().format(record.nextDueOn!) : "N/A"}'),
                  isThreeLine: true,
                  trailing: record.isOverdue
                      ? Icon(Icons.warning_rounded, color: Theme.of(context).colorScheme.error)
                      : const Icon(Icons.check_circle, color: Color(0xFF16a34a)),
                  onTap: () {
                    // Could open edit screen
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
