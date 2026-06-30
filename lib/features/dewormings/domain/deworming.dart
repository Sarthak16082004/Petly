class Deworming {
  const Deworming({
    required this.id,
    required this.petId,
    required this.medicationName,
    required this.administeredOn,
    this.nextDueOn,
    this.notes,
    this.status = 'completed',
  });

  final String id;
  final String petId;
  final String medicationName;
  final DateTime administeredOn;
  final DateTime? nextDueOn;
  final String? notes;
  final String status;
  
  bool get isOverdue {
    if (nextDueOn == null) return false;
    return DateTime.now().isAfter(nextDueOn!);
  }
}
