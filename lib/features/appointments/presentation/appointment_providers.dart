import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/appointments/data/drift_appointment_repository.dart';
import 'package:petly/features/appointments/domain/appointment.dart';
import 'package:petly/features/appointments/domain/appointment_repository.dart';

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return DriftAppointmentRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final appointmentsByPetProvider =
    StreamProvider.family<List<Appointment>, String>((ref, petId) {
  return ref.watch(appointmentRepositoryProvider).watchByPet(petId);
});

final upcomingAppointmentsProvider =
    StreamProvider<List<Appointment>>((ref) {
  return ref.watch(appointmentRepositoryProvider).watchUpcoming();
});

final appointmentProvider =
    FutureProvider.family<Appointment?, String>((ref, id) {
  return ref.watch(appointmentRepositoryProvider).getById(id);
});
