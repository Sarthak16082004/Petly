class MedicalRecord {
  const MedicalRecord({
    required this.id,
    required this.petId,
    required this.recordType,
    required this.occurredOn,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.veterinarian,
    this.clinic,
    this.followUpOn,
    this.notes,
  });

  final String id;
  final String petId;
  final String recordType; // visit | condition | surgery | emergency | other
  final DateTime occurredOn;
  final String title;
  final String? symptoms;
  final String? diagnosis;
  final String? treatment;
  final String? veterinarian;
  final String? clinic;
  final DateTime? followUpOn;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
}

class MedicalRecordAttachment {
  const MedicalRecordAttachment({
    required this.id,
    required this.medicalRecordId,
    required this.fileAssetId,
    required this.caption,
    required this.absolutePath,
  });

  final String id;
  final String medicalRecordId;
  final String fileAssetId;
  final String? caption; // e.g. "Prescription", "Bill"
  final String absolutePath;
}
