import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/breeding/data/drift_breeding_repository.dart';
import 'package:petly/features/breeding/domain/breeding_record.dart';
import 'package:petly/features/breeding/domain/breeding_repository.dart';

final breedingRepositoryProvider = Provider<BreedingRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return DriftBreedingRepository(db);
});

final breedingRecordsByPetProvider = StreamProvider.family<List<BreedingRecord>, String>((ref, petId) {
  final repo = ref.watch(breedingRepositoryProvider);
  return repo.watchBreedingRecordsByPet(petId);
});

final breedingRecordProvider = FutureProvider.family<BreedingRecord?, String>((ref, id) async {
  final repo = ref.watch(breedingRepositoryProvider);
  return repo.getBreedingRecord(id);
});
