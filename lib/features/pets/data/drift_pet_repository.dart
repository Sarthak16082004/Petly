import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/pets/domain/pet.dart' as domain;
import 'package:petly/features/pets/domain/pet_repository.dart';
import 'package:uuid/uuid.dart';

class DriftPetRepository implements PetRepository {
  DriftPetRepository(this._database, this._uuid);

  final AppDatabase _database;
  final Uuid _uuid;

  @override
  Stream<List<domain.Pet>> watchActivePets() {
    final query = _database.select(_database.pets)
      ..where((row) => row.status.equals('active'))
      ..orderBy([(row) => OrderingTerm.asc(row.name)]);
    return query.watch().map((rows) => rows.map(_map).toList(growable: false));
  }

  @override
  Future<domain.Pet?> getById(String id) async {
    final row = await (_database.select(
      _database.pets,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
    return row == null ? null : _map(row);
  }

  @override
  Future<void> save({
    String? id,
    required String ownerId,
    required String name,
    required String species,
    String? breed,
    String? sex,
    DateTime? birthDate,
    String? notes,
  }) async {
    final existing = id == null
        ? null
        : await (_database.select(
            _database.pets,
          )..where((row) => row.id.equals(id))).getSingleOrNull();
    final now = DateTime.now().toUtc();

    await _database
        .into(_database.pets)
        .insertOnConflictUpdate(
          PetsCompanion.insert(
            id: id ?? _uuid.v4(),
            ownerId: ownerId,
            name: name.trim(),
            species: species.trim(),
            breed: Value(_clean(breed)),
            sex: Value(_clean(sex)),
            birthDate: Value(birthDate),
            notes: Value(_clean(notes)),
            createdAt: Value(existing?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  Future<void> archive(String id) async {
    final now = DateTime.now().toUtc();
    await (_database.update(
      _database.pets,
    )..where((row) => row.id.equals(id))).write(
      PetsCompanion(
        status: const Value('archived'),
        archivedAt: Value(now),
        updatedAt: Value(now),
      ),
    );
  }

  domain.Pet _map(Pet row) => domain.Pet(
    id: row.id,
    ownerId: row.ownerId,
    name: row.name,
    species: row.species,
    status: row.status,
    breed: row.breed,
    sex: row.sex,
    birthDate: row.birthDate,
    notes: row.notes,
  );

  String? _clean(String? value) {
    final cleaned = value?.trim();
    return cleaned == null || cleaned.isEmpty ? null : cleaned;
  }
}
