import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/pets/data/drift_pet_repository.dart';
import 'package:petly/features/pets/domain/pet.dart';
import 'package:petly/features/pets/domain/pet_repository.dart';

final petRepositoryProvider = Provider<PetRepository>((ref) {
  return DriftPetRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final activePetsProvider = StreamProvider<List<Pet>>((ref) {
  return ref.watch(petRepositoryProvider).watchActivePets();
});

final petProvider = FutureProvider.family<Pet?, String>((ref, id) {
  return ref.watch(petRepositoryProvider).getById(id);
});
