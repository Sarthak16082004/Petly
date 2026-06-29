class GrowthEntry {
  const GrowthEntry({
    required this.id,
    required this.petId,
    required this.measuredAt,
    required this.weightGrams,
    required this.createdAt,
    required this.updatedAt,
    this.bodyConditionScore,
    this.notes,
  });

  final String id;
  final String petId;
  final DateTime measuredAt;
  final int weightGrams; // always stored in grams
  final double? bodyConditionScore; // 1–9 scale
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  double get weightKg => weightGrams / 1000.0;
  double get weightLb => weightGrams / 453.592;
}
