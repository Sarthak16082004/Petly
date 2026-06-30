import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart' as db;
import 'package:petly/features/dewormings/domain/deworming_repository.dart';
import 'package:petly/features/dewormings/domain/deworming.dart';
import 'package:uuid/uuid.dart';

class DriftDewormingRepository implements DewormingRepository {
  DriftDewormingRepository(this._db, this._uuid);

  final db.AppDatabase _db;
  final Uuid _uuid;

  Deworming _mapDeworming(db.Deworming d) {
    return Deworming(
      id: d.id,
      petId: d.petId,
      medicationName: d.medicationName,
      administeredOn: d.administeredOn,
      nextDueOn: d.nextDueOn,
      notes: d.notes,
      status: d.status,
    );
  }

  @override
  Stream<List<Deworming>> watchByPet(String petId) {
    return (_db.select(_db.dewormings)
          ..where((tbl) => tbl.petId.equals(petId))
          ..orderBy([(t) => OrderingTerm(expression: t.administeredOn, mode: OrderingMode.desc)]))
        .watch()
        .map((rows) => rows.map(_mapDeworming).toList());
  }

  @override
  Future<void> addDeworming(Deworming deworming) async {
    final companion = db.DewormingsCompanion.insert(
      id: deworming.id.isEmpty ? _uuid.v4() : deworming.id,
      petId: deworming.petId,
      medicationName: deworming.medicationName,
      administeredOn: deworming.administeredOn,
      nextDueOn: Value(deworming.nextDueOn),
      notes: Value(deworming.notes),
      status: Value(deworming.status),
    );
    await _db.into(_db.dewormings).insert(companion);
  }

  @override
  Future<void> updateDeworming(Deworming deworming) async {
    final companion = db.DewormingsCompanion(
      medicationName: Value(deworming.medicationName),
      administeredOn: Value(deworming.administeredOn),
      nextDueOn: Value(deworming.nextDueOn),
      notes: Value(deworming.notes),
      status: Value(deworming.status),
    );
    await (_db.update(_db.dewormings)..where((tbl) => tbl.id.equals(deworming.id)))
        .write(companion);
  }

  @override
  Future<void> deleteDeworming(String id) async {
    await (_db.delete(_db.dewormings)..where((tbl) => tbl.id.equals(id))).go();
  }
}
