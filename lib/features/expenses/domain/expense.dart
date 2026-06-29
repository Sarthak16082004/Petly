class Expense {
  const Expense({
    required this.id,
    required this.category,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredOn,
    required this.createdAt,
    required this.updatedAt,
    this.petId,
    this.merchant,
    this.paymentMethod,
    this.receiptFileId,
    this.notes,
  });

  final String id;
  final String? petId;
  final String category;
  final int amountMinor; // minor units (e.g. cents)
  final String currencyCode;
  final DateTime occurredOn;
  final String? merchant;
  final String? paymentMethod;
  final String? receiptFileId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  double get amountDecimal => amountMinor / 100.0;

  static const categories = [
    'Veterinary',
    'Medication',
    'Food & Treats',
    'Grooming',
    'Accessories',
    'Training',
    'Insurance',
    'Boarding',
    'Other',
  ];
}
