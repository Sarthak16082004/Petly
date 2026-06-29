import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/memories/data/drift_memories_repository.dart';
import 'package:petly/features/memories/domain/memories_repository.dart';
import 'package:petly/features/memories/domain/memory.dart';

final memoriesRepositoryProvider = Provider<MemoriesRepository>((ref) {
  return DriftMemoriesRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final memoriesByPetProvider = StreamProvider.family<List<Memory>, String>((ref, petId) {
  return ref.watch(memoriesRepositoryProvider).watchMemoriesByPet(petId);
});
