import 'package:petly/features/appointments/domain/appointment.dart';

abstract interface class AppointmentRepository {
  Stream<List<Appointment>> watchByPet(String petId);
  Stream<List<Appointment>> watchUpcoming();
  Future<Appointment?> getById(String id);
  Future<void> save({
    String? id,
    required String petId,
    required String title,
    required String appointmentType,
    required DateTime startsAt,
    required String timezoneId,
    int? durationMinutes,
    String? providerName,
    String? location,
    String? notes,
    required String status,
  });
  Future<void> delete(String id);
}
