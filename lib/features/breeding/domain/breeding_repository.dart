import 'package:petly/features/breeding/domain/breeding_record.dart';

abstract class BreedingRepository {
  /// Stream all breeding records for a specific pet
  Stream<List<BreedingRecord>> watchBreedingRecordsByPet(String petId);

  /// Get a specific breeding record
  Future<BreedingRecord?> getBreedingRecord(String id);

  /// Create or update a breeding record
  Future<String> saveBreedingRecord(BreedingRecord record);

  /// Delete a breeding record (should also delete associated litter)
  Future<void> deleteBreedingRecord(String id);

  /// Add a litter member to a specific breeding record
  Future<void> addLitterMember(LitterMember member);

  /// Update a litter member
  Future<void> updateLitterMember(LitterMember member);

  /// Delete a litter member
  Future<void> deleteLitterMember(String id);
}
