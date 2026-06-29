import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:drift/drift.dart';
import 'package:petly/features/appointments/presentation/appointment_providers.dart';
// Note: We need providers for vaccinations and medications to combine them properly.
// Since we don't have global upcoming streams for them yet, let's write custom Drift queries here.

enum EventType {
  appointment,
  vaccination,
  medication,
}

class UpcomingEvent {
  const UpcomingEvent({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.type,
    this.petName,
  });

  final String id;
  final String title;
  final String subtitle;
  final DateTime date;
  final EventType type;
  final String? petName;
}

final upcomingEventsProvider = StreamProvider<List<UpcomingEvent>>((ref) {
  final db = ref.watch(databaseProvider);
  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(days: 1));

  // 1. Appointments Stream
  final appointmentsStream = db.select(db.appointments).watch().map((rows) {
    return rows
        .where((a) => a.startsAt.isAfter(yesterday))
        .map((a) => UpcomingEvent(
              id: a.id,
              title: a.title,
              subtitle: a.appointmentType,
              date: a.startsAt,
              type: EventType.appointment,
            ))
        .toList();
  });

  // 2. Vaccinations Stream
  final vaccinationsStream = db.select(db.vaccinations).watch().map((rows) {
    return rows
        .where((v) => v.nextDueOn != null && v.nextDueOn!.isAfter(yesterday))
        .map((v) => UpcomingEvent(
              id: v.id,
              title: '${v.vaccineName} Due',
              subtitle: v.disease ?? 'Vaccination',
              date: v.nextDueOn!,
              type: EventType.vaccination,
            ))
        .toList();
  });

  // 3. Medications Stream (Active)
  final medicationsStream = db.select(db.petMedications).join([
    innerJoin(db.medicines, db.medicines.id.equalsExp(db.petMedications.medicineId)),
  ]).watch().map((rows) {
    return rows.where((row) {
      final pm = row.readTable(db.petMedications);
      if (pm.status != 'active') return false;
      if (pm.endDate != null && pm.endDate!.isBefore(now)) return false;
      return true;
    }).map((row) {
      final pm = row.readTable(db.petMedications);
      final med = row.readTable(db.medicines);
      return UpcomingEvent(
        id: pm.id,
        title: 'Give ${med.name}',
        subtitle: pm.dosage,
        date: DateTime(now.year, now.month, now.day, 23, 59), // Show as today
        type: EventType.medication,
      );
    }).toList();
  });

  // Combine streams using Dart 3 streams or StreamGroup
  // For simplicity since we just want a reactive stream, we'll use StreamZip if we have async package, 
  // or a simple custom StreamController.
  // Drift provides `Stream.combineLatest3` conceptually, but let's just use StreamController:
  
  return Stream<List<UpcomingEvent>>.multi((controller) {
    List<UpcomingEvent> appts = [];
    List<UpcomingEvent> vacs = [];
    List<UpcomingEvent> meds = [];

    void emit() {
      final all = [...appts, ...vacs, ...meds];
      all.sort((a, b) => a.date.compareTo(b.date));
      controller.add(all);
    }

    final sub1 = appointmentsStream.listen((data) { appts = data; emit(); });
    final sub2 = vaccinationsStream.listen((data) { vacs = data; emit(); });
    final sub3 = medicationsStream.listen((data) { meds = data; emit(); });

    controller.onCancel = () {
      sub1.cancel();
      sub2.cancel();
      sub3.cancel();
    };
  });
});
