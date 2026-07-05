import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/calendar/domain/calendar_event.dart';

final allAppointmentsProvider = StreamProvider<List<Appointment>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.appointments).watch();
});

final allVaccinationsProvider = StreamProvider<List<Vaccination>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.vaccinations).watch();
});

final allDewormingsProvider = StreamProvider<List<Deworming>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.dewormings).watch();
});

final allMedicationsProvider = StreamProvider<List<PetMedication>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.petMedications).watch();
});

final allMedicationSchedulesProvider = StreamProvider<List<MedicationSchedule>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.medicationSchedules).watch();
});

final allMedicinesProvider = StreamProvider<List<Medicine>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.medicines).watch();
});

final calendarEventsProvider = Provider<List<CalendarEvent>>((ref) {
  final appointments = ref.watch(allAppointmentsProvider).valueOrNull ?? [];
  final vaccinations = ref.watch(allVaccinationsProvider).valueOrNull ?? [];
  final dewormings = ref.watch(allDewormingsProvider).valueOrNull ?? [];
  
  final medications = ref.watch(allMedicationsProvider).valueOrNull ?? [];
  final schedules = ref.watch(allMedicationSchedulesProvider).valueOrNull ?? [];
  final medicines = ref.watch(allMedicinesProvider).valueOrNull ?? [];
  
  final events = <CalendarEvent>[];
  
  for (final a in appointments) {
    events.add(CalendarEvent(
      id: a.id,
      title: a.title,
      subtitle: a.appointmentType,
      date: a.startsAt,
      type: CalendarEventType.appointment,
      petId: a.petId,
      color: Colors.deepPurple,
      icon: Icons.local_hospital_rounded,
    ));
  }
  
  for (final v in vaccinations) {
    events.add(CalendarEvent(
      id: '${v.id}_admin',
      title: v.vaccineName,
      subtitle: 'Vaccinated',
      date: v.administeredOn,
      type: CalendarEventType.vaccination,
      petId: v.petId,
      color: Colors.blue,
      icon: Icons.vaccines_rounded,
    ));
    if (v.nextDueOn != null) {
      events.add(CalendarEvent(
        id: '${v.id}_due',
        title: '${v.vaccineName} Due',
        subtitle: 'Vaccination Reminder',
        date: v.nextDueOn!,
        type: CalendarEventType.vaccination,
        petId: v.petId,
        color: Colors.redAccent,
        icon: Icons.vaccines_rounded,
      ));
    }
  }
  
  for (final d in dewormings) {
    events.add(CalendarEvent(
      id: '${d.id}_admin',
      title: d.medicationName,
      subtitle: 'Dewormed',
      date: d.administeredOn,
      type: CalendarEventType.deworming,
      petId: d.petId,
      color: Colors.teal,
      icon: Icons.bug_report_rounded,
    ));
    if (d.nextDueOn != null) {
      events.add(CalendarEvent(
        id: '${d.id}_due',
        title: '${d.medicationName} Due',
        subtitle: 'Deworming Reminder',
        date: d.nextDueOn!,
        type: CalendarEventType.deworming,
        petId: d.petId,
        color: Colors.redAccent,
        icon: Icons.bug_report_rounded,
      ));
    }
  }
  
  for (final pm in medications) {
    final med = medicines.where((m) => m.id == pm.medicineId).firstOrNull;
    final scheds = schedules.where((s) => s.petMedicationId == pm.id).toList();
    
    if (med == null) continue;
    
    for (final s in scheds) {
       final freq = s.recurrenceRule; 
       
       DateTime curr = pm.startDate;
       final limit = DateTime.now().add(const Duration(days: 90)); // Show max 3 months ahead
       
       while(curr.isBefore(limit)) {
         events.add(CalendarEvent(
           id: '${pm.id}_${curr.toIso8601String()}',
           title: med.name,
           subtitle: 'Medicine (${pm.dosage})',
           date: curr,
           type: CalendarEventType.medication,
           petId: pm.petId,
           color: Colors.orange,
           icon: Icons.medication_rounded,
         ));
         
         if (freq.contains('DAILY')) {
           curr = curr.add(const Duration(days: 1));
         } else if (freq.contains('WEEKLY')) {
           curr = curr.add(const Duration(days: 7));
         } else if (freq.contains('MONTHLY')) {
           curr = DateTime(curr.year, curr.month + 1, curr.day, curr.hour, curr.minute);
         } else {
           break; 
         }
         if (pm.endDate != null && curr.isAfter(pm.endDate!)) break;
       }
    }
  }
  
  // Sort events chronologically
  events.sort((a, b) => a.date.compareTo(b.date));
  
  return events;
});
