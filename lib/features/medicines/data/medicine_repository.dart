import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/medicines/domain/pet_medication_details.dart';
import 'package:drift/drift.dart';

final medicineRepositoryProvider = Provider<MedicineRepository>((ref) {
  return DriftMedicineRepository(ref.watch(databaseProvider));
});

abstract class MedicineRepository {
  Stream<List<PetMedicationDetails>> watchPetMedications(String petId);
  Future<void> addPetMedication({
    required PetMedication medication,
    required Medicine medicine,
    required List<MedicationSchedule> schedules,
  });
  Future<void> updateMedicationStatus(String petMedicationId, String status);
}

class DriftMedicineRepository implements MedicineRepository {
  const DriftMedicineRepository(this._db);
  final AppDatabase _db;

  @override
  Stream<List<PetMedicationDetails>> watchPetMedications(String petId) {
    final query = _db.select(_db.petMedications).join([
      innerJoin(
        _db.medicines,
        _db.medicines.id.equalsExp(_db.petMedications.medicineId),
      ),
    ])..where(_db.petMedications.petId.equals(petId));

    return query.watch().asyncMap((rows) async {
      final results = <PetMedicationDetails>[];
      for (final row in rows) {
        final pm = row.readTable(_db.petMedications);
        final med = row.readTable(_db.medicines);
        final schedules = await (_db.select(_db.medicationSchedules)
              ..where((t) => t.petMedicationId.equals(pm.id)))
            .get();
        results.add(PetMedicationDetails(
          petMedication: pm,
          medicine: med,
          schedules: schedules,
        ));
      }
      return results;
    });
  }

  @override
  Future<void> addPetMedication({
    required PetMedication medication,
    required Medicine medicine,
    required List<MedicationSchedule> schedules,
  }) async {
    await _db.transaction(() async {
      await _db.into(_db.medicines).insert(medicine, mode: InsertMode.insertOrReplace);
      await _db.into(_db.petMedications).insert(medication);
      for (final s in schedules) {
        await _db.into(_db.medicationSchedules).insert(s);
      }
    });
  }

  @override
  Future<void> updateMedicationStatus(String petMedicationId, String status) async {
    await (_db.update(_db.petMedications)..where((t) => t.id.equals(petMedicationId)))
        .write(PetMedicationsCompanion(status: Value(status)));
  }
}
