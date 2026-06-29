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
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'petly'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await migrator.createAll();
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
