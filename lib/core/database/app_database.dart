import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:petly/core/database/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    FileAssets,
    OwnerProfiles,
    Pets,
    Vaccinations,
    MedicalRecords,
    Medicines,
    PetMedications,
    MedicationSchedules,
    MedicationAdministrations,
    Appointments,
    Documents,
    RecordAttachments,
    GrowthEntries,
    Expenses,
    Reminders,
    ScheduledNotifications,
    GeneratedReports,
    AppSettings,
    BackupRecords,
    Memories,
    Dewormings,
    FoodInventories,
    MealLogs,
    FeedingSchedules,
    GroomingLogs,
    VetContacts,
    BreedingRecords,
    LitterTracking,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'petly'));

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await migrator.createAll();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(pets, pets.size);
        await migrator.addColumn(pets, pets.weight);
        await migrator.addColumn(pets, pets.profilePicturePath);
      }
      if (from < 3) {
        await migrator.createTable(foodInventories);
        await migrator.createTable(mealLogs);
        await migrator.createTable(feedingSchedules);
        await migrator.createTable(groomingLogs);
      }
      if (from < 4) {
        await migrator.createTable(vetContacts);
      }
      if (from < 6) {
        await migrator.createTable(breedingRecords);
        await migrator.createTable(litterTracking);
      }
      if (from < 5) {
        await migrator.addColumn(vetContacts, vetContacts.contactType);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
