import 'package:petly/features/growth/domain/growth_entry.dart';

abstract interface class GrowthRepository {
  Stream<List<GrowthEntry>> watchByPet(String petId);
  Future<GrowthEntry?> getById(String id);
  Future<void> save({
    String? id,
    required String petId,
    required DateTime measuredAt,
    required int weightGrams,
    double? bodyConditionScore,
    String? notes,
  });
  Future<void> delete(String id);
}
