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
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'petly'));

  @override
  int get schemaVersion => 2;

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
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
