import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/vaccinations/domain/vaccination.dart' as domain;
import 'package:petly/features/vaccinations/domain/vaccination_repository.dart';
import 'package:uuid/uuid.dart';

class DriftVaccinationRepository implements VaccinationRepository {
  DriftVaccinationRepository(this._db, this._uuid);

  final AppDatabase _db;
  final Uuid _uuid;

  @override
  Stream<List<domain.Vaccination>> watchByPet(String petId) {
    final q = _db.select(_db.vaccinations)
      ..where((r) => r.petId.equals(petId))
      ..orderBy([(r) => OrderingTerm.desc(r.administeredOn)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Future<domain.Vaccination?> getById(String id) async {
    final row = await (_db.select(_db.vaccinations)
          ..where((r) => r.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  @override
  Future<void> save({
    String? id,
    required String petId,
    required String vaccineName,
    required DateTime administeredOn,
    String? disease,
    String? manufacturer,
    String? batchNumber,
    int? doseNumber,
    DateTime? nextDueOn,
    String? veterinarian,
    String? clinic,
    String? notes,
    required String status,
  }) async {
    final existing = id == null
        ? null
        : await (_db.select(_db.vaccinations)
              ..where((r) => r.id.equals(id)))
            .getSingleOrNull();
    final now = DateTime.now().toUtc();

    await _db.into(_db.vaccinations).insertOnConflictUpdate(
          VaccinationsCompanion.insert(
            id: id ?? _uuid.v4(),
            petId: petId,
            vaccineName: vaccineName.trim(),
            administeredOn: administeredOn,
            disease: Value(_clean(disease)),
            manufacturer: Value(_clean(manufacturer)),
            batchNumber: Value(_clean(batchNumber)),
            doseNumber: Value(doseNumber),
            nextDueOn: Value(nextDueOn),
            veterinarian: Value(_clean(veterinarian)),
            clinic: Value(_clean(clinic)),
            notes: Value(_clean(notes)),
            status: Value(status),
            createdAt: Value(existing?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.vaccinations)..where((r) => r.id.equals(id))).go();
  }

  domain.Vaccination _map(Vaccination row) => domain.Vaccination(
        id: row.id,
        petId: row.petId,
        vaccineName: row.vaccineName,
        administeredOn: row.administeredOn,
        status: row.status,
        disease: row.disease,
        manufacturer: row.manufacturer,
        batchNumber: row.batchNumber,
        doseNumber: row.doseNumber,
        nextDueOn: row.nextDueOn,
        veterinarian: row.veterinarian,
        clinic: row.clinic,
        notes: row.notes,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );

  String? _clean(String? v) {
    final s = v?.trim();
    return (s == null || s.isEmpty) ? null : s;
  }
}
