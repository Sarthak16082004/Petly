class Pet {
  const Pet({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.species,
    required this.status,
    this.breed,
    this.sex,
    this.birthDate,
    this.notes,
  });

  final String id;
  final String ownerId;
  final String name;
  final String species;
  final String status;
  final String? breed;
  final String? sex;
  final DateTime? birthDate;
  final String? notes;
}
