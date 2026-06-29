import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/vaccinations/presentation/vaccination_providers.dart';

class VaccinationsScreen extends ConsumerWidget {
  const VaccinationsScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vaccinations = ref.watch(vaccinationsByPetProvider(petId));

    return Scaffold(
      appBar: AppBar(title: const Text('Vaccinations')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/$petId/vaccinations/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add'),
        backgroundColor: AppTheme.vaccinationColor,
        foregroundColor: Colors.white,
      ),
      body: vaccinations.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AsyncErrorWidget(
          message: 'Could not load vaccinations.',
          onRetry: () => ref.invalidate(vaccinationsByPetProvider(petId)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.vaccines_outlined,
              title: 'No vaccinations yet',
              body: 'Track vaccination records and get reminders for upcoming doses.',
              color: AppTheme.vaccinationColor,
              action: FilledButton.icon(
                onPressed: () => context.push('/pets/$petId/vaccinations/new'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add vaccination'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.vaccinationColor,
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final v = items[i];
              final isOverdue = v.isOverdue;
              final statusColor = isOverdue
                  ? AppTheme.medicalColor
                  : v.status == 'completed'
                      ? AppTheme.vaccinationColor
                      : AppTheme.appointmentColor;
              return Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () =>
                      context.push('/pets/$petId/vaccinations/${v.id}'),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(Icons.vaccines_rounded,
                              color: statusColor, size: 24),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                v.vaccineName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              if (v.disease != null)
                                Text(
                                  v.disease!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.55),
                                  ),
                                ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  InfoChip(
                                    label: v.administeredOn.toDisplayDate(),
                                    icon: Icons.event_available_rounded,
                                    color: AppTheme.vaccinationColor,
                                  ),
                                  if (v.nextDueOn != null) ...[
                                    const SizedBox(width: 6),
                                    InfoChip(
                                      label: isOverdue
                                          ? 'Overdue'
                                          : 'Due ${v.nextDueOn!.toDisplayShortDate()}',
                                      icon: isOverdue
                                          ? Icons.warning_rounded
                                          : Icons.schedule_rounded,
                                      color: statusColor,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right_rounded,
                            color: Colors.grey),
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
}
