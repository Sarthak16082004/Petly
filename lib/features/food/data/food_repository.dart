import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';

final foodRepositoryProvider = Provider<FoodRepository>((ref) {
  return DriftFoodRepository(ref.watch(databaseProvider));
});

abstract class FoodRepository {
  Stream<List<FoodInventory>> watchInventories(String petId);
  Stream<List<MealLog>> watchMealLogs(String petId);
  Stream<List<FeedingSchedule>> watchSchedules(String petId);
  
  Future<void> addInventory(FoodInventory inv);
  Future<void> updateInventory(FoodInventory inv);
  
  Future<void> logMeal(MealLog log);
  Future<void> addSchedule(FeedingSchedule schedule);
}

class DriftFoodRepository implements FoodRepository {
  const DriftFoodRepository(this._db);
  final AppDatabase _db;

  @override
  Stream<List<FoodInventory>> watchInventories(String petId) {
    return (_db.select(_db.foodInventories)..where((t) => t.petId.equals(petId))).watch();
  }

  @override
  Stream<List<MealLog>> watchMealLogs(String petId) {
    return (_db.select(_db.mealLogs)
          ..where((t) => t.petId.equals(petId))
          ..orderBy([(t) => OrderingTerm.desc(t.fedAt)]))
        .watch();
  }

  @override
  Stream<List<FeedingSchedule>> watchSchedules(String petId) {
    return (_db.select(_db.feedingSchedules)
          ..where((t) => t.petId.equals(petId))
          ..orderBy([(t) => OrderingTerm.asc(t.timeOfDay)]))
        .watch();
  }

  @override
  Future<void> addInventory(FoodInventory inv) async {
    await _db.into(_db.foodInventories).insert(inv, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<void> updateInventory(FoodInventory inv) async {
    await _db.update(_db.foodInventories).replace(inv);
  }

  @override
  Future<void> logMeal(MealLog log) async {
    await _db.transaction(() async {
      await _db.into(_db.mealLogs).insert(log, mode: InsertMode.insertOrReplace);
      
      // Update inventory if applicable
      if (log.foodId != null) {
        final inv = await (_db.select(_db.foodInventories)..where((t) => t.id.equals(log.foodId!))).getSingleOrNull();
        if (inv != null) {
          final remaining = inv.remainingWeightGrams - log.amountGrams;
          await _db.update(_db.foodInventories).replace(
                inv.copyWith(
                  remainingWeightGrams: remaining < 0 ? 0 : remaining,
                  updatedAt: DateTime.now(),
                ),
              );
        }
      }
    });
  }

  @override
  Future<void> addSchedule(FeedingSchedule schedule) async {
    await _db.into(_db.feedingSchedules).insert(schedule, mode: InsertMode.insertOrReplace);
  }
}
