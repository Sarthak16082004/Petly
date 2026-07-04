import 'package:drift/drift.dart';

mixin TimestampColumns on Table {
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class FileAssets extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get relativePath => text().unique()();
  TextColumn get originalName => text()();
  TextColumn get mimeType => text()();
  IntColumn get byteSize => integer().check(byteSize.isBiggerOrEqualValue(0))();
  TextColumn get sha256 => text()();
  TextColumn get category => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class OwnerProfiles extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get emergencyContactName => text().nullable()();
  TextColumn get emergencyContactPhone => text().nullable()();
  TextColumn get photoFileId => text().nullable().references(
    FileAssets,
    #id,
    onDelete: KeyAction.setNull,
  )();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Pets extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get ownerId =>
      text().references(OwnerProfiles, #id, onDelete: KeyAction.restrict)();
  TextColumn get name => text()();
  TextColumn get species => text()();
  TextColumn get breed => text().nullable()();
  TextColumn get sex => text().nullable()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  DateTimeColumn get adoptionDate => dateTime().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get size => text().nullable()();
  RealColumn get weight => real().nullable()();
  TextColumn get microchipNumber => text().nullable()();
  TextColumn get bloodType => text().nullable()();
  BoolColumn get neutered => boolean().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get profilePicturePath => text().nullable()();
  TextColumn get profileFileId => text().nullable().references(
    FileAssets,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Vaccinations extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get vaccineName => text()();
  TextColumn get disease => text().nullable()();
  TextColumn get manufacturer => text().nullable()();
  TextColumn get batchNumber => text().nullable()();
  IntColumn get doseNumber => integer().nullable()();
  DateTimeColumn get administeredOn => dateTime()();
  DateTimeColumn get nextDueOn => dateTime().nullable()();
  TextColumn get veterinarian => text().nullable()();
  TextColumn get clinic => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('completed'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class MedicalRecords extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get recordType => text()();
  DateTimeColumn get occurredOn => dateTime()();
  TextColumn get title => text()();
  TextColumn get symptoms => text().nullable()();
  TextColumn get diagnosis => text().nullable()();
  TextColumn get treatment => text().nullable()();
  TextColumn get veterinarian => text().nullable()();
  TextColumn get clinic => text().nullable()();
  DateTimeColumn get followUpOn => dateTime().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Medicines extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get form => text().nullable()();
  TextColumn get strength => text().nullable()();
  TextColumn get manufacturer => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class PetMedications extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get medicineId =>
      text().references(Medicines, #id, onDelete: KeyAction.restrict)();
  TextColumn get dosage => text()();
  TextColumn get route => text().nullable()();
  TextColumn get instructions => text().nullable()();
  TextColumn get prescribedBy => text().nullable()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get asNeeded => boolean().withDefault(const Constant(false))();
  TextColumn get status => text().withDefault(const Constant('active'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class MedicationSchedules extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petMedicationId =>
      text().references(PetMedications, #id, onDelete: KeyAction.cascade)();
  TextColumn get localTime => text()();
  TextColumn get timezoneId => text()();
  TextColumn get recurrenceRule => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class MedicationAdministrations extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petMedicationId =>
      text().references(PetMedications, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get scheduledFor => dateTime().nullable()();
  DateTimeColumn get administeredAt => dateTime().nullable()();
  TextColumn get state => text()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Appointments extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get appointmentType => text()();
  DateTimeColumn get startsAt => dateTime()();
  TextColumn get timezoneId => text()();
  IntColumn get durationMinutes => integer().nullable()();
  TextColumn get providerName => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('scheduled'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Documents extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().nullable().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get fileId =>
      text().references(FileAssets, #id, onDelete: KeyAction.restrict)();
  TextColumn get title => text()();
  TextColumn get documentType => text()();
  DateTimeColumn get issuedOn => dateTime().nullable()();
  DateTimeColumn get expiresOn => dateTime().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class RecordAttachments extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get fileId =>
      text().references(FileAssets, #id, onDelete: KeyAction.restrict)();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get caption => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class GrowthEntries extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get measuredAt => dateTime()();
  IntColumn get weightGrams =>
      integer().check(weightGrams.isBiggerThanValue(0))();
  RealColumn get bodyConditionScore => real().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Expenses extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().nullable().references(Pets, #id, onDelete: KeyAction.setNull)();
  TextColumn get category => text()();
  IntColumn get amountMinor =>
      integer().check(amountMinor.isBiggerOrEqualValue(0))();
  TextColumn get currencyCode => text()();
  DateTimeColumn get occurredOn => dateTime()();
  TextColumn get merchant => text().nullable()();
  TextColumn get paymentMethod => text().nullable()();
  TextColumn get receiptFileId => text().nullable().references(
    FileAssets,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Reminders extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().nullable().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get kind => text()();
  TextColumn get title => text()();
  TextColumn get body => text().nullable()();
  DateTimeColumn get startsAt => dateTime()();
  TextColumn get timezoneId => text()();
  TextColumn get recurrenceRule => text().nullable()();
  TextColumn get sourceEntityType => text().nullable()();
  TextColumn get sourceEntityId => text().nullable()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get notificationLeadMinutes =>
      integer().withDefault(const Constant(0))();
  DateTimeColumn get endsAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ScheduledNotifications extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get reminderId =>
      text().references(Reminders, #id, onDelete: KeyAction.cascade)();
  IntColumn get platformNotificationId => integer().unique()();
  DateTimeColumn get scheduledFor => dateTime()();
  TextColumn get status => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class GeneratedReports extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().nullable().references(Pets, #id, onDelete: KeyAction.setNull)();
  TextColumn get fileId =>
      text().references(FileAssets, #id, onDelete: KeyAction.restrict)();
  TextColumn get reportType => text()();
  DateTimeColumn get periodStart => dateTime().nullable()();
  DateTimeColumn get periodEnd => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AppSettings extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get settingKey => text().unique()();
  TextColumn get valueJson => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class BackupRecords extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get driveFileId => text().nullable()();
  IntColumn get backupFormatVersion => integer()();
  IntColumn get databaseSchemaVersion => integer()();
  TextColumn get encryptedSha256 => text().nullable()();
  IntColumn get byteSize => integer().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get status => text()();
  TextColumn get failureCode => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Memories extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get imageFileId => text().nullable().references(
    FileAssets,
    #id,
    onDelete: KeyAction.setNull,
  )();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Dewormings extends Table with TimestampColumns {
  TextColumn get id => text()();
  TextColumn get petId =>
      text().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get medicationName => text()();
  DateTimeColumn get administeredOn => dateTime()();
  DateTimeColumn get nextDueOn => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('completed'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
