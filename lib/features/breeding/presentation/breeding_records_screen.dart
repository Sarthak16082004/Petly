import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/breeding/presentation/breeding_providers.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';

class BreedingRecordsScreen extends ConsumerWidget {
  const BreedingRecordsScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(petProvider(petId)).valueOrNull;
    final isMale = pet?.gender?.toLowerCase() == 'male';

    final recordsAsync = ref.watch(breedingRecordsByPetProvider(petId));

    return Scaffold(
      appBar: AppBar(title: const Text('Breeding records')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/pets/$petId/breeding/new'),
        icon: const Icon(Icons.add),
        label: const Text('Add record'),
      ),
      body: recordsAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: EmptyStateWidget(
                title: 'No breeding records',
                message: isMale 
                  ? 'Keep track of stud services and mating history.'
                  : 'Track heat cycles, mating, pregnancy, and litters.',
                icon: Icons.pets_rounded,
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16).copyWith(bottom: 100),
            itemCount: records.length,
            separatorBuilder: (c, i) => const SizedBox(height: 12),
            itemBuilder: (c, i) {
              final r = records[i];
              return _RecordCard(
                petId: petId,
                recordId: r.id,
                isMale: isMale,
                matingDate: r.matingDate,
                dueDate: r.expectedDueDate,
                whelpingDate: r.whelpingDate,
                partnerName: r.partnerName,
                status: r.pregnancyStatus,
                litterCount: r.totalBorn ?? r.litter.length,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  const _RecordCard({
    required this.petId,
    required this.recordId,
    required this.isMale,
    this.matingDate,
    this.dueDate,
    this.whelpingDate,
    this.partnerName,
    required this.status,
    required this.litterCount,
  });
  
  final String petId;
  final String recordId;
  final bool isMale;
  final DateTime? matingDate;
  final DateTime? dueDate;
  final DateTime? whelpingDate;
  final String? partnerName;
  final String status;
  final int litterCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final partnerLabel = isMale ? 'Dam' : 'Sire';

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => context.go('/pets/$petId/breeding/$recordId'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.healthColor.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      whelpingDate != null ? Icons.pets_rounded : Icons.favorite_rounded,
                      color: AppTheme.healthColor,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          whelpingDate != null ? 'Litter Born' : (matingDate != null ? 'Mating Logged' : 'Heat Cycle'),
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (partnerName != null && partnerName!.isNotEmpty)
                          Text('$partnerLabel: $partnerName', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
                      ],
                    ),
                  ),
                  if (status == 'Confirmed')
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('Confirmed', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                    )
                ],
              ),
              const SizedBox(height: 16),
              if (whelpingDate != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoItem(icon: Icons.cake_rounded, label: 'Whelped', value: DateFormat('MMM d, y').format(whelpingDate!)),
                    _InfoItem(icon: Icons.pets_outlined, label: 'Puppies/Kittens', value: litterCount > 0 ? '$litterCount' : 'Unknown'),
                  ],
                )
              else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (matingDate != null)
                      _InfoItem(icon: Icons.favorite_border_rounded, label: 'Mated On', value: DateFormat('MMM d, y').format(matingDate!)),
                    if (!isMale && dueDate != null)
                      _InfoItem(icon: Icons.calendar_today_rounded, label: 'Due Date', value: DateFormat('MMM d, y').format(dueDate!)),
                  ],
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }
}
