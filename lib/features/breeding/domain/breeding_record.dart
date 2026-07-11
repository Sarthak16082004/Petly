class LitterMember {
  const LitterMember({
    required this.id,
    required this.breedingRecordId,
    required this.identifier, // Collar, name, etc.
    this.sex,
    this.birthWeight,
    this.color,
  });

  final String id;
  final String breedingRecordId;
  final String identifier;
  final String? sex;
  final double? birthWeight;
  final String? color;
}

class BreedingRecord {
  const BreedingRecord({
    required this.id,
    required this.petId,
    this.partnerName,
    this.partnerPetId,
    this.heatStartDate,
    this.heatEndDate,
    this.matingDate,
    this.matingNotes,
    this.pregnancyStatus = 'Unknown',
    this.expectedDueDate,
    this.whelpingDate,
    this.totalBorn,
    this.males,
    this.females,
    this.notes,
    this.litter = const [],
  });

  final String id;
  final String petId;
  final String? partnerName;
  final String? partnerPetId;

  // Heat Cycle (Female only)
  final DateTime? heatStartDate;
  final DateTime? heatEndDate;

  // Mating
  final DateTime? matingDate;
  final String? matingNotes;

  // Pregnancy
  final String pregnancyStatus; // Unknown, Confirmed, Failed
  final DateTime? expectedDueDate;

  // Whelping
  final DateTime? whelpingDate;
  final int? totalBorn;
  final int? males;
  final int? females;

  final String? notes;
  
  // Virtual field for litter
  final List<LitterMember> litter;
}
