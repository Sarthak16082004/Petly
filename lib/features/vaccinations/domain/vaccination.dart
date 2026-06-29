/// Vaccination domain entity.
class Vaccination {
  const Vaccination({
    required this.id,
    required this.petId,
    required this.vaccineName,
    required this.administeredOn,
    required this.status,
    this.disease,
    this.manufacturer,
    this.batchNumber,
    this.doseNumber,
    this.nextDueOn,
    this.veterinarian,
    this.clinic,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String petId;
  final String vaccineName;
  final DateTime administeredOn;
  final String status; // completed | scheduled | overdue
  final String? disease;
  final String? manufacturer;
  final String? batchNumber;
  final int? doseNumber;
  final DateTime? nextDueOn;
  final String? veterinarian;
  final String? clinic;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isOverdue =>
      nextDueOn != null && nextDueOn!.isBefore(DateTime.now());
}
