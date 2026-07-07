import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';

final vetContactRepositoryProvider = Provider<VetContactRepository>((ref) {
  return DriftVetContactRepository(ref.watch(databaseProvider));
});

abstract class VetContactRepository {
  Stream<List<VetContact>> watchContacts(String petId);
  Future<void> addContact(VetContact contact);
  Future<void> updateContact(VetContact contact);
  Future<void> deleteContact(String id);
}

class DriftVetContactRepository implements VetContactRepository {
  const DriftVetContactRepository(this._db);
  final AppDatabase _db;

  @override
  Stream<List<VetContact>> watchContacts(String petId) {
    return (_db.select(_db.vetContacts)
          ..where((t) => t.petId.equals(petId))
          ..orderBy([(t) => OrderingTerm.desc(t.isEmergency)]))
        .watch();
  }

  @override
  Future<void> addContact(VetContact contact) async {
    await _db.into(_db.vetContacts).insert(contact, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> updateContact(VetContact contact) async {
    await _db.update(_db.vetContacts).replace(contact);
  }

  @override
  Future<void> deleteContact(String id) async {
    await (_db.delete(_db.vetContacts)..where((t) => t.id.equals(id))).go();
  }
}
