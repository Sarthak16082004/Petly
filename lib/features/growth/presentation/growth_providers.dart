import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/growth/data/drift_growth_repository.dart';
import 'package:petly/features/growth/domain/growth_entry.dart';
import 'package:petly/features/growth/domain/growth_repository.dart';

final growthRepositoryProvider = Provider<GrowthRepository>((ref) {
  return DriftGrowthRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final growthByPetProvider =
    StreamProvider.family<List<GrowthEntry>, String>((ref, petId) {
  return ref.watch(growthRepositoryProvider).watchByPet(petId);
});

final growthEntryProvider =
    FutureProvider.family<GrowthEntry?, String>((ref, id) {
  return ref.watch(growthRepositoryProvider).getById(id);
});
