import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';

final groomingRepositoryProvider = Provider<GroomingRepository>((ref) {
  return DriftGroomingRepository(ref.watch(databaseProvider));
});

abstract class GroomingRepository {
  Stream<List<GroomingLog>> watchGroomingLogs(String petId);
  Future<void> addGroomingLog(GroomingLog log);
  Future<void> updateGroomingLog(GroomingLog log);
  Future<void> deleteGroomingLog(String id);
}

class DriftGroomingRepository implements GroomingRepository {
  const DriftGroomingRepository(this._db);
  final AppDatabase _db;

  @override
  Stream<List<GroomingLog>> watchGroomingLogs(String petId) {
    final query = _db.select(_db.groomingLogs)
      ..where((t) => t.petId.equals(petId))
      ..orderBy([(t) => OrderingTerm.desc(t.date)]);
    return query.watch();
  }

  @override
  Future<void> addGroomingLog(GroomingLog log) async {
    await _db.into(_db.groomingLogs).insert(log, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> updateGroomingLog(GroomingLog log) async {
    await _db.update(_db.groomingLogs).replace(log);
  }

  @override
  Future<void> deleteGroomingLog(String id) async {
    await (_db.delete(_db.groomingLogs)..where((t) => t.id.equals(id))).go();
  }
}
