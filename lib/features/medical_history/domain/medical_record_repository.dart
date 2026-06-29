import 'package:petly/features/medical_history/domain/medical_record.dart';

abstract interface class MedicalRecordRepository {
  Stream<List<MedicalRecord>> watchByPet(String petId);
  Future<MedicalRecord?> getById(String id);
  Future<void> save({
    String? id,
    required String petId,
    required String recordType,
    required DateTime occurredOn,
    required String title,
    String? symptoms,
    String? diagnosis,
    String? treatment,
    String? veterinarian,
    String? clinic,
    DateTime? followUpOn,
    String? notes,
  });
  Future<void> delete(String id);
}
