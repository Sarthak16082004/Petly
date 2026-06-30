import 'package:petly/features/dewormings/domain/deworming.dart';

abstract class DewormingRepository {
  Stream<List<Deworming>> watchByPet(String petId);
  Future<void> addDeworming(Deworming deworming);
  Future<void> updateDeworming(Deworming deworming);
  Future<void> deleteDeworming(String id);
}
