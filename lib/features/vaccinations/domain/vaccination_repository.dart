import 'package:petly/features/vaccinations/domain/vaccination.dart';

abstract interface class VaccinationRepository {
  Stream<List<Vaccination>> watchByPet(String petId);

  Future<Vaccination?> getById(String id);

  Future<void> save({
    String? id,
    required String petId,
    required String vaccineName,
    required DateTime administeredOn,
    String? disease,
    String? manufacturer,
    String? batchNumber,
    int? doseNumber,
    DateTime? nextDueOn,
    String? veterinarian,
    String? clinic,
    String? notes,
    required String status,
  });

  Future<void> delete(String id);
}
