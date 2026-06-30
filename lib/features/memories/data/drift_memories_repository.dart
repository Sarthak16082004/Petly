import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart' as db;
import 'package:petly/features/memories/domain/memories_repository.dart';
import 'package:petly/features/memories/domain/memory.dart';
import 'package:uuid/uuid.dart';

class DriftMemoriesRepository implements MemoriesRepository {
  DriftMemoriesRepository(this._db, this._uuid);

  final db.AppDatabase _db;
  final Uuid _uuid;

  Memory _mapMemory(db.Memory m) {
    return Memory(
      id: m.id,
      petId: m.petId,
      title: m.title,
      description: m.description,
      imageFileId: m.imageFileId,
      date: m.date,
    );
  }

  @override
  Stream<List<Memory>> watchMemoriesByPet(String petId) {
    return (_db.select(_db.memories)..where((tbl) => tbl.petId.equals(petId)))
        .watch()
        .map((rows) => rows.map(_mapMemory).toList());
  }

  @override
  Future<void> addMemory(Memory memory) async {
    final companion = db.MemoriesCompanion.insert(
      id: memory.id.isEmpty ? _uuid.v4() : memory.id,
      petId: memory.petId,
      title: Value(memory.title),
      description: Value(memory.description),
      imageFileId: Value(memory.imageFileId),
      date: Value(memory.date),
    );
    await _db.into(_db.memories).insert(companion);
  }

  @override
  Future<void> updateMemory(Memory memory) async {
    final companion = db.MemoriesCompanion(
      title: Value(memory.title),
      description: Value(memory.description),
      imageFileId: Value(memory.imageFileId),
      date: Value(memory.date),
    );
    await (_db.update(_db.memories)..where((tbl) => tbl.id.equals(memory.id)))
        .write(companion);
  }

  @override
  Future<void> deleteMemory(String id) async {
    await (_db.delete(_db.memories)..where((tbl) => tbl.id.equals(id))).go();
  }
}
