import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/owner_profile/data/drift_owner_repository.dart';
import 'package:petly/features/owner_profile/domain/owner_profile.dart';
import 'package:petly/features/owner_profile/domain/owner_repository.dart';

final ownerRepositoryProvider = Provider<OwnerRepository>((ref) {
  return DriftOwnerRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final ownerProvider = StreamProvider<OwnerProfile?>((ref) {
  return ref.watch(ownerRepositoryProvider).watchOwner();
});
