import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';

import 'package:petly/features/medical_history/presentation/medical_record_providers.dart';

class MedicalHistoryScreen extends ConsumerWidget {
  const MedicalHistoryScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(medicalRecordsByPetProvider(petId));
    return Scaffold(
      appBar: AppBar(title: const Text('Medical history')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/$petId/medical/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add record'),
        backgroundColor: AppTheme.medicalColor,
        foregroundColor: Colors.white,
      ),
      body: records.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AsyncErrorWidget(
          message: 'Could not load records.',
          onRetry: () => ref.invalidate(medicalRecordsByPetProvider(petId)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.medical_information_outlined,
              title: 'No records yet',
              body: 'Keep track of vet visits, conditions, diagnoses and treatments.',
              color: AppTheme.medicalColor,
              action: FilledButton.icon(
                onPressed: () => context.push('/pets/$petId/medical/new'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add record'),
                style: FilledButton.styleFrom(backgroundColor: AppTheme.medicalColor),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (ctx, i) {
              final r = items[i];
              final typeColor = _typeColor(r.recordType);
              return Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => context.push('/pets/$petId/medical/${r.id}'),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: typeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(_typeIcon(r.recordType), color: typeColor, size: 24),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(r.title,
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  InfoChip(
                                    label: r.recordType.capitalize(),
                                    color: typeColor,
                                  ),
                                  const SizedBox(width: 6),
                                  InfoChip(
                                    label: r.occurredOn.toDisplayDate(),
                                    icon: Icons.calendar_today_rounded,
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              if (r.diagnosis != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(r.diagnosis!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                                      )),
                                ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _typeColor(String type) {
    return switch (type) {
      'visit' => AppTheme.medicalColor,
      'condition' => AppTheme.appointmentColor,
      'surgery' => const Color(0xFF7C3AED),
      'emergency' => const Color(0xFFEF4444),
      _ => AppTheme.documentColor,
    };
  }

  IconData _typeIcon(String type) {
    return switch (type) {
      'visit' => Icons.local_hospital_rounded,
      'condition' => Icons.monitor_heart_outlined,
      'surgery' => Icons.medical_services_outlined,
      'emergency' => Icons.emergency_rounded,
      _ => Icons.description_outlined,
    };
  }
}
