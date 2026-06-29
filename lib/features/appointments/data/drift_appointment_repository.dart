import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/appointments/domain/appointment.dart' as domain;
import 'package:petly/features/appointments/domain/appointment_repository.dart';
import 'package:uuid/uuid.dart';

class DriftAppointmentRepository implements AppointmentRepository {
  DriftAppointmentRepository(this._db, this._uuid);
  final AppDatabase _db;
  final Uuid _uuid;

  @override
  Stream<List<domain.Appointment>> watchByPet(String petId) {
    final q = _db.select(_db.appointments)
      ..where((r) => r.petId.equals(petId))
      ..orderBy([(r) => OrderingTerm.desc(r.startsAt)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Stream<List<domain.Appointment>> watchUpcoming() {
    final now = DateTime.now().toUtc();
    final q = _db.select(_db.appointments)
      ..where(
          (r) => r.startsAt.isBiggerThanValue(now) & r.status.equals('scheduled'))
      ..orderBy([(r) => OrderingTerm.asc(r.startsAt)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Future<domain.Appointment?> getById(String id) async {
    final row = await (_db.select(_db.appointments)
          ..where((r) => r.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  @override
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
  }) async {
    final existing = id == null
        ? null
        : await (_db.select(_db.appointments)
              ..where((r) => r.id.equals(id)))
            .getSingleOrNull();
    final now = DateTime.now().toUtc();
    await _db.into(_db.appointments).insertOnConflictUpdate(
          AppointmentsCompanion.insert(
            id: id ?? _uuid.v4(),
            petId: petId,
            title: title.trim(),
            appointmentType: appointmentType,
            startsAt: startsAt,
            timezoneId: timezoneId,
            durationMinutes: Value(durationMinutes),
            providerName: Value(_c(providerName)),
            location: Value(_c(location)),
            notes: Value(_c(notes)),
            status: Value(status),
            createdAt: Value(existing?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  Future<void> delete(String id) =>
      (_db.delete(_db.appointments)..where((r) => r.id.equals(id))).go();

  domain.Appointment _map(Appointment r) => domain.Appointment(
        id: r.id,
        petId: r.petId,
        title: r.title,
        appointmentType: r.appointmentType,
        startsAt: r.startsAt,
        timezoneId: r.timezoneId,
        durationMinutes: r.durationMinutes,
        providerName: r.providerName,
        location: r.location,
        notes: r.notes,
        status: r.status,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
      );

  String? _c(String? v) {
    final s = v?.trim();
    return (s == null || s.isEmpty) ? null : s;
  }
}
