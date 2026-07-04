import 'package:petly/features/pets/domain/pet.dart';

abstract interface class PetRepository {
  Stream<List<Pet>> watchActivePets();

  Future<Pet?> getById(String id);

  Future<void> save({
    String? id,
    required String ownerId,
    required String name,
    required String species,
    String? breed,
    String? sex,
    DateTime? birthDate,
    String? color,
    String? size,
    double? weight,
    String? profilePicturePath,
    String? notes,
  });

  Future<void> archive(String id);
}
