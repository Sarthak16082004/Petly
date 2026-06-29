class OwnerProfile {
  const OwnerProfile({
    required this.id,
    required this.displayName,
    this.email,
    this.phone,
  });

  final String id;
  final String displayName;
  final String? email;
  final String? phone;
}
