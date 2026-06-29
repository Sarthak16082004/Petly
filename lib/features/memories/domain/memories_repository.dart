import 'package:petly/features/memories/domain/memory.dart';

abstract class MemoriesRepository {
  Stream<List<Memory>> watchMemoriesByPet(String petId);
  Future<void> addMemory(Memory memory);
  Future<void> updateMemory(Memory memory);
  Future<void> deleteMemory(String id);
}
