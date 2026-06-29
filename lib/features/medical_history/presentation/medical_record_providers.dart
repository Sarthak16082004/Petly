import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/medical_history/data/drift_medical_record_repository.dart';
import 'package:petly/features/medical_history/domain/medical_record.dart';
import 'package:petly/features/medical_history/domain/medical_record_repository.dart';

final medicalRecordRepositoryProvider = Provider<MedicalRecordRepository>((ref) {
  return DriftMedicalRecordRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final medicalRecordsByPetProvider =
    StreamProvider.family<List<MedicalRecord>, String>((ref, petId) {
  return ref.watch(medicalRecordRepositoryProvider).watchByPet(petId);
});

final medicalRecordProvider =
    FutureProvider.family<MedicalRecord?, String>((ref, id) {
  return ref.watch(medicalRecordRepositoryProvider).getById(id);
});
