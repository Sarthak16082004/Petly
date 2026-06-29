import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/appointments/domain/appointment.dart';
import 'package:petly/features/appointments/presentation/appointment_providers.dart';

class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointments = ref.watch(appointmentsByPetProvider(petId));
    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/$petId/appointments/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add'),
        backgroundColor: AppTheme.appointmentColor,
        foregroundColor: Colors.white,
      ),
      body: appointments.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AsyncErrorWidget(
          message: 'Could not load appointments.',
          onRetry: () => ref.invalidate(appointmentsByPetProvider(petId)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.calendar_month_outlined,
              title: 'No appointments',
              body: 'Schedule vet visits, grooming sessions and more.',
              color: AppTheme.appointmentColor,
              action: FilledButton.icon(
                onPressed: () => context.push('/pets/$petId/appointments/new'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add appointment'),
                style: FilledButton.styleFrom(backgroundColor: AppTheme.appointmentColor),
              ),
            );
          }
          final upcoming = items.where((a) => a.isUpcoming).toList();
          final past = items.where((a) => a.isPast).toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            children: [
              if (upcoming.isNotEmpty) ...[
                SectionHeader(title: 'Upcoming'),
                const SizedBox(height: 8),
                ...upcoming.map((a) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _AppointmentCard(a: a, petId: petId))),
                const SizedBox(height: 16),
              ],
              if (past.isNotEmpty) ...[
                SectionHeader(title: 'Past'),
                const SizedBox(height: 8),
                ...past.map((a) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _AppointmentCard(a: a, petId: petId, dimmed: true))),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({required this.a, required this.petId, this.dimmed = false});
  final Appointment a;
  final String petId;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (a.status) {
      'completed' => AppTheme.vaccinationColor,
      'cancelled' => Theme.of(context).colorScheme.error,
      'missed' => AppTheme.medicalColor,
      _ => AppTheme.appointmentColor,
    };

    return Opacity(
      opacity: dimmed ? 0.65 : 1,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => context.push('/pets/$petId/appointments/${a.id}'),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppTheme.appointmentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        a.startsAt.day.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      Text(
                        _shortMonth(a.startsAt.month),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.55),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(a.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                      const SizedBox(height: 4),
                      Row(children: [
                        InfoChip(label: a.appointmentType, color: AppTheme.appointmentColor),
                        const SizedBox(width: 6),
                        InfoChip(
                          label: a.startsAt.toDisplayTime(),
                          icon: Icons.access_time_rounded,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ]),
                      if (a.providerName != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(a.providerName!,
                              style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                        ),
                    ],
                  ),
                ),
                StatusBadge(
                  label: a.status.capitalize(),
                  color: statusColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _shortMonth(int m) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[m - 1];
  }
}
