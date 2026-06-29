import 'package:petly/features/owner_profile/domain/owner_profile.dart';

abstract interface class OwnerRepository {
  Stream<OwnerProfile?> watchOwner();

  Future<void> saveOwner({
    required String displayName,
    String? email,
    String? phone,
  });
}
