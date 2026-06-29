import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/features/medicines/data/medicine_repository.dart';
import 'package:petly/features/medicines/domain/pet_medication_details.dart';

final medicationsByPetProvider = StreamProvider.family<List<PetMedicationDetails>, String>((ref, petId) {
  final repo = ref.watch(medicineRepositoryProvider);
  return repo.watchPetMedications(petId);
});
