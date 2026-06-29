import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/growth/domain/growth_entry.dart' as domain;
import 'package:petly/features/growth/domain/growth_repository.dart';
import 'package:uuid/uuid.dart';

class DriftGrowthRepository implements GrowthRepository {
  DriftGrowthRepository(this._db, this._uuid);
  final AppDatabase _db;
  final Uuid _uuid;

  @override
  Stream<List<domain.GrowthEntry>> watchByPet(String petId) {
    final q = _db.select(_db.growthEntries)
      ..where((r) => r.petId.equals(petId))
      ..orderBy([(r) => OrderingTerm.desc(r.measuredAt)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Future<domain.GrowthEntry?> getById(String id) async {
    final row = await (_db.select(_db.growthEntries)
          ..where((r) => r.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  @override
  Future<void> save({
    String? id,
    required String petId,
    required DateTime measuredAt,
    required int weightGrams,
    double? bodyConditionScore,
    String? notes,
  }) async {
    final existing = id == null
        ? null
        : await (_db.select(_db.growthEntries)
              ..where((r) => r.id.equals(id)))
            .getSingleOrNull();
    final now = DateTime.now().toUtc();
    await _db.into(_db.growthEntries).insertOnConflictUpdate(
          GrowthEntriesCompanion.insert(
            id: id ?? _uuid.v4(),
            petId: petId,
            measuredAt: measuredAt,
            weightGrams: weightGrams,
            bodyConditionScore: Value(bodyConditionScore),
            notes: Value(_c(notes)),
            createdAt: Value(existing?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  Future<void> delete(String id) =>
      (_db.delete(_db.growthEntries)..where((r) => r.id.equals(id))).go();

  domain.GrowthEntry _map(GrowthEntry r) => domain.GrowthEntry(
        id: r.id,
        petId: r.petId,
        measuredAt: r.measuredAt,
        weightGrams: r.weightGrams,
        bodyConditionScore: r.bodyConditionScore,
        notes: r.notes,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
      );

  String? _c(String? v) {
    final s = v?.trim();
    return (s == null || s.isEmpty) ? null : s;
  }
}
