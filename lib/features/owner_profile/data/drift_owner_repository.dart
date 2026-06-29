import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/owner_profile/domain/owner_profile.dart'
    as domain;
import 'package:petly/features/owner_profile/domain/owner_repository.dart';
import 'package:uuid/uuid.dart';

class DriftOwnerRepository implements OwnerRepository {
  DriftOwnerRepository(this._database, this._uuid);

  final AppDatabase _database;
  final Uuid _uuid;

  @override
  Stream<domain.OwnerProfile?> watchOwner() {
    return (_database.select(
      _database.ownerProfiles,
    )..limit(1)).watchSingleOrNull().map(
      (row) => row == null
          ? null
          : domain.OwnerProfile(
              id: row.id,
              displayName: row.displayName,
              email: row.email,
              phone: row.phone,
            ),
    );
  }

  @override
  Future<void> saveOwner({
    required String displayName,
    String? email,
    String? phone,
  }) async {
    final current = await (_database.select(
      _database.ownerProfiles,
    )..limit(1)).getSingleOrNull();
    final now = DateTime.now().toUtc();

    await _database
        .into(_database.ownerProfiles)
        .insertOnConflictUpdate(
          OwnerProfilesCompanion.insert(
            id: current?.id ?? _uuid.v4(),
            displayName: displayName.trim(),
            email: Value(_clean(email)),
            phone: Value(_clean(phone)),
            createdAt: Value(current?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
  }

  String? _clean(String? value) {
    final cleaned = value?.trim();
    return cleaned == null || cleaned.isEmpty ? null : cleaned;
  }
}
