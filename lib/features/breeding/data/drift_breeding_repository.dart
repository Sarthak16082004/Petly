import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/breeding/domain/breeding_record.dart';
import 'package:petly/features/breeding/domain/breeding_repository.dart';
import 'package:uuid/uuid.dart';

class DriftBreedingRepository implements BreedingRepository {
  const DriftBreedingRepository(this._db);
  final AppDatabase _db;

  BreedingRecord _mapToDomain(BreedingRecordData dbRecord, List<LitterTrackingData> dbLitter) {
    return BreedingRecord(
      id: dbRecord.id,
      petId: dbRecord.petId,
      partnerName: dbRecord.partnerName,
      partnerPetId: dbRecord.partnerPetId,
      heatStartDate: dbRecord.heatStartDate,
      heatEndDate: dbRecord.heatEndDate,
      matingDate: dbRecord.matingDate,
      matingNotes: dbRecord.matingNotes,
      pregnancyStatus: dbRecord.pregnancyStatus,
      expectedDueDate: dbRecord.expectedDueDate,
      whelpingDate: dbRecord.whelpingDate,
      totalBorn: dbRecord.totalBorn,
      males: dbRecord.males,
      females: dbRecord.females,
      notes: dbRecord.notes,
      litter: dbLitter
          .map((l) => LitterMember(
                id: l.id,
                breedingRecordId: l.breedingRecordId,
                identifier: l.identifier,
                sex: l.sex,
                birthWeight: l.birthWeight,
                color: l.color,
              ))
          .toList(),
    );
  }

  @override
  Stream<List<BreedingRecord>> watchBreedingRecordsByPet(String petId) {
    return _db.customSelect(
      'SELECT * FROM breeding_records WHERE pet_id = ? ORDER BY COALESCE(whelping_date, mating_date, heat_start_date, created_at) DESC',
      variables: [Variable.withString(petId)],
      readsFrom: {_db.breedingRecords, _db.litterTracking},
    ).watch().asyncMap((rows) async {
      final records = rows.map((row) => _db.breedingRecords.mapFromRow(row)).toList();
      
      if (records.isEmpty) return [];

      final recordIds = records.map((r) => r.id).toList();
      final litterQuery = _db.select(_db.litterTracking)..where((tbl) => tbl.breedingRecordId.isIn(recordIds));
      final litterMembers = await litterQuery.get();

      return records.map((record) {
        final matchingLitter = litterMembers.where((l) => l.breedingRecordId == record.id).toList();
        return _mapToDomain(record, matchingLitter);
      }).toList();
    });
  }

  @override
  Future<BreedingRecord?> getBreedingRecord(String id) async {
    final recordQuery = _db.select(_db.breedingRecords)..where((tbl) => tbl.id.equals(id));
    final record = await recordQuery.getSingleOrNull();
    if (record == null) return null;

    final litterQuery = _db.select(_db.litterTracking)..where((tbl) => tbl.breedingRecordId.equals(id));
    final litter = await litterQuery.get();

    return _mapToDomain(record, litter);
  }

  @override
  Future<String> saveBreedingRecord(BreedingRecord record) async {
    final isNew = record.id.isEmpty;
    final id = isNew ? const Uuid().v4() : record.id;

    final companion = BreedingRecordsCompanion(
      id: Value(id),
      petId: Value(record.petId),
      partnerName: Value(record.partnerName),
      partnerPetId: Value(record.partnerPetId),
      heatStartDate: Value(record.heatStartDate),
      heatEndDate: Value(record.heatEndDate),
      matingDate: Value(record.matingDate),
      matingNotes: Value(record.matingNotes),
      pregnancyStatus: Value(record.pregnancyStatus),
      expectedDueDate: Value(record.expectedDueDate),
      whelpingDate: Value(record.whelpingDate),
      totalBorn: Value(record.totalBorn),
      males: Value(record.males),
      females: Value(record.females),
      notes: Value(record.notes),
      createdAt: isNew ? Value(DateTime.now()) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );

    await _db.into(_db.breedingRecords).insertOnConflictUpdate(companion);
    return id;
  }

  @override
  Future<void> deleteBreedingRecord(String id) async {
    await (_db.delete(_db.breedingRecords)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> addLitterMember(LitterMember member) async {
    final isNew = member.id.isEmpty;
    final id = isNew ? const Uuid().v4() : member.id;

    final companion = LitterTrackingCompanion(
      id: Value(id),
      breedingRecordId: Value(member.breedingRecordId),
      identifier: Value(member.identifier),
      sex: Value(member.sex),
      birthWeight: Value(member.birthWeight),
      color: Value(member.color),
      createdAt: isNew ? Value(DateTime.now()) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );

    await _db.into(_db.litterTracking).insertOnConflictUpdate(companion);
  }

  @override
  Future<void> updateLitterMember(LitterMember member) => addLitterMember(member);

  @override
  Future<void> deleteLitterMember(String id) async {
    await (_db.delete(_db.litterTracking)..where((tbl) => tbl.id.equals(id))).go();
  }
}
