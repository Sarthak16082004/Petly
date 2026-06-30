import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/dewormings/data/drift_deworming_repository.dart';
import 'package:petly/features/dewormings/domain/deworming.dart';
import 'package:petly/features/dewormings/domain/deworming_repository.dart';

final dewormingRepositoryProvider = Provider<DewormingRepository>((ref) {
  return DriftDewormingRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final dewormingsByPetProvider = StreamProvider.family<List<Deworming>, String>((ref, petId) {
  return ref.watch(dewormingRepositoryProvider).watchByPet(petId);
});
