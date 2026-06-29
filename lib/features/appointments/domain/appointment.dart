class Appointment {
  const Appointment({
    required this.id,
    required this.petId,
    required this.title,
    required this.appointmentType,
    required this.startsAt,
    required this.timezoneId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.durationMinutes,
    this.providerName,
    this.location,
    this.notes,
  });

  final String id;
  final String petId;
  final String title;
  final String appointmentType; // vet | grooming | dental | surgery | other
  final DateTime startsAt;
  final String timezoneId;
  final int? durationMinutes;
  final String? providerName;
  final String? location;
  final String? notes;
  final String status; // scheduled | completed | cancelled | missed
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isUpcoming => startsAt.isAfter(DateTime.now());
  bool get isPast => startsAt.isBefore(DateTime.now());

  static const types = ['Vet visit', 'Grooming', 'Dental', 'Surgery', 'Check-up', 'Other'];
}
