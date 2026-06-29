import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/vaccinations/data/drift_vaccination_repository.dart';
import 'package:petly/features/vaccinations/domain/vaccination.dart';
import 'package:petly/features/vaccinations/domain/vaccination_repository.dart';

final vaccinationRepositoryProvider = Provider<VaccinationRepository>((ref) {
  return DriftVaccinationRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final vaccinationsByPetProvider =
    StreamProvider.family<List<Vaccination>, String>((ref, petId) {
  return ref.watch(vaccinationRepositoryProvider).watchByPet(petId);
});

final vaccinationProvider =
    FutureProvider.family<Vaccination?, String>((ref, id) {
  return ref.watch(vaccinationRepositoryProvider).getById(id);
});
