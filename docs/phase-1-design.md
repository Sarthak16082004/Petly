# Petly — Phase 1 Product and Technical Design

Status: Proposed  
Scope: Analysis and architecture only; no application code is included in this phase.

## 1. Product definition

Petly is a local-first Android and iOS application for keeping a pet's health,
care, documents, growth, reminders, and expenses in one private place.

The application must remain fully usable without an account or internet
connection. Google Sign-In and network access are optional and are used only
when the user explicitly starts a Google Drive backup or restore.

### Core product principles

1. **Offline is the normal mode.** All reads and writes use the local Drift
   database and device file storage.
2. **Privacy by default.** Pet data is not uploaded automatically and is never
   stored in a cloud database.
3. **One source of truth.** SQLite stores structured data and file metadata;
   managed app storage contains binary files.
4. **Safe ownership of files.** Imported files are copied into Petly-managed
   storage so external file paths cannot silently break.
5. **Recoverability.** A backup is encrypted, versioned, checksummed, and
   verified before it can replace local data.
6. **Feature isolation.** Each module owns its presentation, domain, and data
   behavior and communicates through explicit interfaces.

## 2. Requirements analysis

### Functional scope

| Area | Primary capabilities |
| --- | --- |
| Owner profile | Name, contact details, photo, emergency contact |
| Pets | Identity, species, breed, sex, birth/adoption dates, microchip, status, photo |
| Vaccinations | Dose details, provider, next due date, attachments, status |
| Medical history | Conditions, visits, diagnoses, treatments, notes, attachments |
| Medicines | Prescriptions, dosage, frequency, course dates, administration tracking |
| Appointments | Vet/service appointments, location, notes, completion state |
| Documents | Import, categorize, preview, share/export, delete |
| Growth | Weight history, optional body-condition notes, chart and trend |
| Expenses | Category, amount, currency, merchant, date, pet, receipt |
| Reminders | One-time and recurring schedules with local notifications |
| Settings | Theme, locale-ready preferences, units, currency, security, retention |
| Reports | On-device PDF summaries saved to managed storage |
| Backup/restore | Explicit encrypted Google Drive backup and full local restore |

### Important improvements to the original brief

These additions prevent common production failures while preserving the
requested scope:

- Add optional local app lock using device biometrics/PIN-backed secure storage.
- Use UUIDs for records to make export, restore, and future migrations safe.
- Add soft archival for pets and user-facing records where accidental deletion
  would be costly; permanent deletion remains explicit.
- Treat files as first-class records with hashes, sizes, MIME types, and
  integrity checks.
- Record medicine administrations separately from prescriptions so adherence
  history is accurate.
- Separate reminder definitions from notification instances so recurring
  schedules can be regenerated after reboot, timezone change, or restore.
- Store money in integer minor units, never floating point.
- Add backup format and schema versions independently from the app version.
- Require a restore preview and automatic safety snapshot before destructive
  replacement.
- Define notification permission, timezone, daylight-saving, and device reboot
  behavior as part of the feature rather than as UI-only settings.
- Redact sensitive values from logs and crash diagnostics.

### Explicit non-goals

- No Firebase, Supabase, cloud database, custom backend, or mandatory account.
- No real-time multi-device sync.
- No background upload without explicit user enablement and platform support.
- No veterinary diagnosis or medical decision-making.
- No dependency on Google services for ordinary app use.

## 3. Architecture

Petly will use feature-first Clean Architecture with Riverpod-based dependency
injection and state management.

```text
Presentation
  Screens, widgets, controllers/notifiers, immutable UI state
            |
            v
Domain
  Entities, value objects, repository contracts, use cases
            |
            v
Data
  Repository implementations, Drift DAOs, file/notification/Drive adapters
            |
            v
Infrastructure
  SQLite, device storage, secure storage, OS notifications, Google Drive
```

### Dependency rules

- Presentation depends on domain, never directly on Drift or platform plugins.
- Domain is pure Dart and has no Flutter, database, or plugin dependencies.
- Data implements domain contracts.
- Core contains cross-cutting primitives, not feature-specific business rules.
- Features may reference another feature only through a domain-level contract or
  shared identifier. They must not import another feature's UI or DAO.
- Platform APIs are wrapped behind interfaces to keep use cases testable.

### Feature module shape

Each business feature follows this internal structure:

```text
feature_name/
├── data/
│   ├── datasources/
│   ├── mappers/
│   ├── repositories/
│   └── daos/
├── domain/
│   ├── entities/
│   ├── repositories/
│   ├── use_cases/
│   └── value_objects/
└── presentation/
    ├── controllers/
    ├── screens/
    ├── state/
    └── widgets/
```

Small features should not be padded with empty abstractions. A use case earns
its own class when it contains business policy, coordinates multiple
repositories/services, or benefits from isolated testing.

## 4. Proposed project structure

```text
petly/
├── android/
├── ios/
├── assets/
│   ├── fonts/
│   ├── icons/
│   └── illustrations/
├── docs/
│   └── phase-1-design.md
├── integration_test/
├── lib/
│   ├── app/
│   │   ├── app.dart
│   │   ├── bootstrap.dart
│   │   ├── routing/
│   │   └── theme/
│   ├── core/
│   │   ├── database/
│   │   │   ├── app_database.dart
│   │   │   ├── migrations/
│   │   │   └── tables/
│   │   ├── errors/
│   │   ├── extensions/
│   │   ├── logging/
│   │   ├── result/
│   │   ├── security/
│   │   ├── storage/
│   │   ├── time/
│   │   ├── types/
│   │   └── widgets/
│   ├── features/
│   │   ├── onboarding/
│   │   ├── owner_profile/
│   │   ├── pets/
│   │   ├── dashboard/
│   │   ├── vaccinations/
│   │   ├── medical_history/
│   │   ├── medicines/
│   │   ├── appointments/
│   │   ├── documents/
│   │   ├── growth/
│   │   ├── expenses/
│   │   ├── reminders/
│   │   ├── reports/
│   │   ├── backup_restore/
│   │   └── settings/
│   └── main.dart
├── test/
│   ├── unit/
│   ├── widget/
│   ├── database/
│   └── fixtures/
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

Generated Drift, Riverpod, and serialization files remain beside their source
files and are committed consistently according to the team's chosen policy.

## 5. Domain model

### Shared value objects

- `EntityId`: validated UUID string.
- `UtcInstant`: UTC timestamp persisted as integer epoch milliseconds.
- `LocalDate`: date-only ISO value for birthdays and care dates.
- `Money`: amount in integer minor units plus ISO 4217 currency code.
- `Weight`: normalized decimal value plus stored unit context.
- `FileReference`: file asset ID, not a raw filesystem path.
- `RecurrenceRule`: frequency, interval, selected weekdays/month day, end rule.

### Main entities

- `OwnerProfile`
- `Pet`
- `FileAsset`
- `Vaccination`
- `MedicalRecord`
- `Medicine`
- `PetMedication`
- `MedicationAdministration`
- `Appointment`
- `Document`
- `GrowthEntry`
- `Expense`
- `Reminder`
- `ReminderTarget`
- `GeneratedReport`
- `AppSettings`
- `BackupRecord`

Presentation models are separate from database rows. Data-layer mappers convert
Drift records to domain entities and turn storage/plugin exceptions into typed
application failures.

## 6. Database design

### Conventions

- SQLite foreign keys are enabled on every connection.
- Primary keys are UUID `TEXT` values generated by the application.
- Every business table has `created_at` and `updated_at` as UTC epoch
  milliseconds.
- Optional archival uses `archived_at`; hard deletion is explicit.
- Cascades are used only when child data has no meaning without its parent.
- User files are not stored as BLOBs. Their managed relative paths and metadata
  are stored in `file_assets`.
- Enum values are stable strings with application and database validation.
- Database migrations are additive where possible and are covered by migration
  tests.

### Tables

#### `owner_profiles`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| display_name | TEXT | NOT NULL |
| email | TEXT | nullable |
| phone | TEXT | nullable |
| address | TEXT | nullable |
| emergency_contact_name | TEXT | nullable |
| emergency_contact_phone | TEXT | nullable |
| photo_file_id | TEXT | nullable FK → file_assets.id, SET NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

The first release presents one active owner profile, while the schema does not
hard-code a singleton ID.

#### `pets`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| owner_id | TEXT | NOT NULL FK → owner_profiles.id, RESTRICT |
| name | TEXT | NOT NULL |
| species | TEXT | NOT NULL |
| breed | TEXT | nullable |
| sex | TEXT | nullable, checked enum |
| birth_date | TEXT | nullable ISO local date |
| adoption_date | TEXT | nullable ISO local date |
| color | TEXT | nullable |
| microchip_number | TEXT | nullable, indexed |
| blood_type | TEXT | nullable |
| neutered | INTEGER | nullable boolean |
| notes | TEXT | nullable |
| profile_file_id | TEXT | nullable FK → file_assets.id, SET NULL |
| status | TEXT | NOT NULL: active, lost, deceased, archived |
| archived_at | INTEGER | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `file_assets`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| relative_path | TEXT | NOT NULL UNIQUE |
| original_name | TEXT | NOT NULL |
| mime_type | TEXT | NOT NULL |
| byte_size | INTEGER | NOT NULL CHECK >= 0 |
| sha256 | TEXT | NOT NULL |
| category | TEXT | NOT NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

Only managed relative paths are persisted. The storage service resolves them
against the current app support directory.

#### `vaccinations`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | NOT NULL FK → pets.id, CASCADE |
| vaccine_name | TEXT | NOT NULL |
| disease | TEXT | nullable |
| manufacturer | TEXT | nullable |
| batch_number | TEXT | nullable |
| dose_number | INTEGER | nullable |
| administered_on | TEXT | NOT NULL ISO local date |
| next_due_on | TEXT | nullable ISO local date |
| veterinarian | TEXT | nullable |
| clinic | TEXT | nullable |
| notes | TEXT | nullable |
| status | TEXT | NOT NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `medical_records`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | NOT NULL FK → pets.id, CASCADE |
| record_type | TEXT | NOT NULL |
| occurred_on | TEXT | NOT NULL ISO local date |
| title | TEXT | NOT NULL |
| symptoms | TEXT | nullable |
| diagnosis | TEXT | nullable |
| treatment | TEXT | nullable |
| veterinarian | TEXT | nullable |
| clinic | TEXT | nullable |
| follow_up_on | TEXT | nullable |
| notes | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `medicines`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| name | TEXT | NOT NULL |
| form | TEXT | nullable |
| strength | TEXT | nullable |
| manufacturer | TEXT | nullable |
| notes | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `pet_medications`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | NOT NULL FK → pets.id, CASCADE |
| medicine_id | TEXT | NOT NULL FK → medicines.id, RESTRICT |
| dosage | TEXT | NOT NULL |
| route | TEXT | nullable |
| instructions | TEXT | nullable |
| prescribed_by | TEXT | nullable |
| start_date | TEXT | NOT NULL |
| end_date | TEXT | nullable |
| as_needed | INTEGER | NOT NULL boolean |
| status | TEXT | NOT NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `medication_schedules`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_medication_id | TEXT | NOT NULL FK → pet_medications.id, CASCADE |
| local_time | TEXT | NOT NULL HH:mm |
| timezone_id | TEXT | NOT NULL |
| recurrence_rule | TEXT | NOT NULL serialized validated rule |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `medication_administrations`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_medication_id | TEXT | NOT NULL FK → pet_medications.id, CASCADE |
| scheduled_for | INTEGER | nullable UTC instant |
| administered_at | INTEGER | nullable UTC instant |
| state | TEXT | NOT NULL: taken, skipped, missed |
| notes | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `appointments`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | NOT NULL FK → pets.id, CASCADE |
| title | TEXT | NOT NULL |
| appointment_type | TEXT | NOT NULL |
| starts_at | INTEGER | NOT NULL UTC instant |
| timezone_id | TEXT | NOT NULL |
| duration_minutes | INTEGER | nullable CHECK > 0 |
| provider_name | TEXT | nullable |
| location | TEXT | nullable |
| notes | TEXT | nullable |
| status | TEXT | NOT NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `documents`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | nullable FK → pets.id, CASCADE |
| file_id | TEXT | NOT NULL FK → file_assets.id, RESTRICT |
| title | TEXT | NOT NULL |
| document_type | TEXT | NOT NULL |
| issued_on | TEXT | nullable |
| expires_on | TEXT | nullable |
| notes | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `record_attachments`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| file_id | TEXT | NOT NULL FK → file_assets.id, RESTRICT |
| entity_type | TEXT | NOT NULL, checked supported type |
| entity_id | TEXT | NOT NULL |
| caption | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

This polymorphic join is restricted to attachments. A cleanup/integrity service
validates target existence because SQLite cannot express a foreign key spanning
multiple target tables.

#### `growth_entries`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | NOT NULL FK → pets.id, CASCADE |
| measured_at | INTEGER | NOT NULL UTC instant |
| weight_grams | INTEGER | NOT NULL CHECK > 0 |
| body_condition_score | REAL | nullable with range check |
| notes | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

Weight is normalized to grams; the preferred display unit lives in settings.

#### `expenses`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | nullable FK → pets.id, SET NULL |
| category | TEXT | NOT NULL |
| amount_minor | INTEGER | NOT NULL CHECK >= 0 |
| currency_code | TEXT | NOT NULL |
| occurred_on | TEXT | NOT NULL |
| merchant | TEXT | nullable |
| payment_method | TEXT | nullable |
| receipt_file_id | TEXT | nullable FK → file_assets.id, SET NULL |
| notes | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `reminders`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | nullable FK → pets.id, CASCADE |
| kind | TEXT | NOT NULL |
| title | TEXT | NOT NULL |
| body | TEXT | nullable |
| starts_at | INTEGER | NOT NULL UTC instant |
| timezone_id | TEXT | NOT NULL |
| recurrence_rule | TEXT | nullable |
| source_entity_type | TEXT | nullable |
| source_entity_id | TEXT | nullable |
| enabled | INTEGER | NOT NULL boolean |
| notification_lead_minutes | INTEGER | NOT NULL DEFAULT 0 |
| ends_at | INTEGER | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `scheduled_notifications`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| reminder_id | TEXT | NOT NULL FK → reminders.id, CASCADE |
| platform_notification_id | INTEGER | NOT NULL UNIQUE |
| scheduled_for | INTEGER | NOT NULL UTC instant |
| status | TEXT | NOT NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

This table reconciles app schedules with OS notification limits and allows
future occurrences to be replenished.

#### `generated_reports`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| pet_id | TEXT | nullable FK → pets.id, SET NULL |
| file_id | TEXT | NOT NULL FK → file_assets.id, RESTRICT |
| report_type | TEXT | NOT NULL |
| period_start | TEXT | nullable |
| period_end | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

#### `app_settings`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| setting_key | TEXT | NOT NULL UNIQUE |
| value_json | TEXT | NOT NULL |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

Non-sensitive preferences are in SQLite. Authentication tokens and encryption
key material are stored only through platform secure storage and are never
placed in this table or inside a backup in plaintext.

#### `backup_records`

| Column | Type | Rules |
| --- | --- | --- |
| id | TEXT | PK |
| drive_file_id | TEXT | nullable |
| backup_format_version | INTEGER | NOT NULL |
| database_schema_version | INTEGER | NOT NULL |
| encrypted_sha256 | TEXT | nullable |
| byte_size | INTEGER | nullable |
| started_at | INTEGER | NOT NULL |
| completed_at | INTEGER | nullable |
| status | TEXT | NOT NULL |
| failure_code | TEXT | nullable |
| created_at | INTEGER | NOT NULL |
| updated_at | INTEGER | NOT NULL |

### Indexes

At minimum:

- `pets(owner_id, status)`
- `vaccinations(pet_id, administered_on)` and `(pet_id, next_due_on)`
- `medical_records(pet_id, occurred_on)`
- `pet_medications(pet_id, status)`
- `medication_administrations(pet_medication_id, scheduled_for)`
- `appointments(pet_id, starts_at)`
- `documents(pet_id, document_type)`
- `growth_entries(pet_id, measured_at)`
- `expenses(pet_id, occurred_on)` and `(category, occurred_on)`
- `reminders(enabled, starts_at)`
- `scheduled_notifications(reminder_id, scheduled_for)`

### Relationship summary

```text
OwnerProfile 1 ── * Pet
Pet 1 ── * Vaccination
Pet 1 ── * MedicalRecord
Pet 1 ── * PetMedication * ── 1 Medicine
PetMedication 1 ── * MedicationSchedule
PetMedication 1 ── * MedicationAdministration
Pet 1 ── * Appointment
Pet 1 ── * Document ── 1 FileAsset
Pet 1 ── * GrowthEntry
Pet 1 ── * Expense
Pet 1 ── * Reminder 1 ── * ScheduledNotification
Pet 1 ── * GeneratedReport ── 1 FileAsset
```

## 7. Repository and service boundaries

### Domain repositories

- `OwnerRepository`
- `PetRepository`
- `VaccinationRepository`
- `MedicalRecordRepository`
- `MedicineRepository`
- `AppointmentRepository`
- `DocumentRepository`
- `GrowthRepository`
- `ExpenseRepository`
- `ReminderRepository`
- `SettingsRepository`
- `ReportRepository`
- `BackupRepository`

Repositories expose domain entities, filtered watches, commands, and
transactions. They do not expose Drift rows, DAOs, or plugin-specific types.

### Infrastructure services

- `DatabaseService`: opens Drift, enables foreign keys, runs migrations/checks.
- `ManagedFileStorage`: imports, hashes, copies, resolves, and safely deletes files.
- `SecureKeyStorage`: stores app-lock and backup encryption secrets.
- `NotificationScheduler`: requests permission, schedules/cancels, reconciles IDs.
- `TimezoneService`: detects timezone changes and converts local schedules safely.
- `GoogleAuthService`: signs in only from backup/restore flows.
- `DriveBackupStorage`: lists, uploads, downloads, and deletes app backup files.
- `ArchiveService`: streams ZIP creation/extraction without excessive memory use.
- `BackupCryptoService`: authenticated encryption and key derivation.
- `IntegrityService`: validates database, manifest, hashes, and file references.
- `PdfReportService`: creates reports on-device.
- `PermissionService`: maps platform permissions to user-facing states.
- `Clock` and `IdGenerator`: injectable for deterministic tests.

Riverpod providers are the composition root for these interfaces and
implementations. No global service locator is required.

## 8. State management and data flow

### Riverpod approach

- Long-lived dependencies use plain `Provider`.
- Database-backed screens use `StreamProvider`/generated providers so Drift
  updates propagate reactively.
- User actions and form workflows use `Notifier` or `AsyncNotifier`.
- UI state is immutable and represents idle, loading, content, empty, and
  recoverable failure states.
- Family providers are used for pet-scoped queries and record IDs.
- Providers are invalidated narrowly after writes; the database remains the
  durable source of truth.

### Standard read flow

```text
Screen → Riverpod provider → repository watch → Drift DAO stream
       ← immutable UI state ← domain entities ← row mapper
```

### Standard write flow

```text
User action
  → controller validates input
  → use case applies business rules
  → repository transaction updates SQLite/files
  → Drift stream emits
  → subscribed UI refreshes
  → related notification schedule reconciles when required
```

Files use a compensating transaction:

1. Copy the source to a temporary managed path and calculate its hash.
2. Insert/update database records in a transaction.
3. Atomically move the temporary file into its final location.
4. If a step fails, roll back the database operation and remove the temporary
   file; orphan cleanup runs again at startup.

## 9. Navigation design

A declarative router will provide typed routes, deep-link-safe arguments,
redirects for onboarding/app lock, and nested navigation for bottom tabs.

### Bottom navigation

1. **Home** — overview, upcoming care, quick actions, pet switcher.
2. **Pets** — pet list and selected pet profile.
3. **Calendar** — reminders, medicines, vaccinations, and appointments.
4. **Records** — medical history, documents, growth, and expenses.
5. **Settings** — profile, preferences, backup/restore, privacy, about.

On compact devices this is a Material 3 `NavigationBar`; wider layouts can
adapt to `NavigationRail` without changing route semantics.

### Route map

```text
/splash
/onboarding
/unlock
/home
/pets
/pets/new
/pets/:petId
  /overview
  /vaccinations
  /medical
  /medicines
  /appointments
  /documents
  /growth
  /expenses
/calendar
/records
/reminders/new
/settings
  /owner
  /appearance
  /notifications
  /security
  /backup
  /restore
  /about
```

Create/edit forms are full-screen on phones and may become dialogs or side
sheets on larger screens. A selected pet context can filter Calendar and
Records but must always be visible and easy to clear.

## 10. Notifications design

- Notification permission is requested contextually when the user first enables
  a reminder, not during first launch.
- Store the schedule's IANA timezone ID and its intended local wall-clock time.
- Use exact scheduling only where platform policy permits and explain degraded
  precision when it does not.
- Maintain a rolling scheduling window to respect iOS pending-notification
  limits and replenish it on app launch/resume.
- Reconcile schedules after create/update/delete, restore, reboot support,
  timezone change, and notification permission changes.
- Assign stable platform notification IDs via `scheduled_notifications`.
- Tapping a notification opens the relevant pet and source record.
- Categories include vaccination, medicine, appointment, deworming, and custom.
- Recurrence supports daily, selected weekdays, weekly, monthly, interval-based,
  optional end date/count, and one-time schedules.

## 11. Backup and restore strategy

### Google Drive storage

Use Google Sign-In with the narrowest Drive scope that supports app-created
backup files. Backups should be placed in Drive's application data area when
the platform/API behavior satisfies discovery and restore requirements; the
implementation spike in Phase 2 will validate this. Petly never requests broad
access to unrelated Drive files.

### Backup package

Proposed extension: `.petlybackup`

```text
manifest.json
database/petly.sqlite
files/<managed relative paths>
```

The manifest contains:

- backup format version and database schema version;
- app version, platform, creation time, and backup ID;
- file inventory with relative path, byte size, and SHA-256;
- database checksum and aggregate counts;
- encryption algorithm and key-derivation metadata;
- no access token or plaintext secret.

### Backup pipeline

1. Confirm Google authentication only when backup begins.
2. Check local storage, network availability, and Drive authorization.
3. Ask Drift for a consistent database snapshot/checkpoint.
4. Build a manifest and stream the database plus managed files into a ZIP.
5. Encrypt the entire archive using authenticated encryption.
6. Write to a temporary local file and verify its encrypted checksum.
7. Upload with resumable Drive upload where supported.
8. Verify uploaded metadata, persist `backup_records`, then remove temporary data.
9. Apply a user-configurable retention policy only after successful upload.

Encryption should use a reviewed authenticated primitive such as AES-256-GCM,
with keys derived using a modern KDF and a unique salt/nonce. The exact package
and key-recovery UX must be selected and threat-modeled in Phase 2. A
user-supplied backup passphrase is the portable option; a device-only key is
easier but can make restore impossible after device loss. The recommended UX is
an explicit recovery passphrase with clear warnings and confirmation.

### Restore pipeline

1. Authenticate and list only Petly backups.
2. Download the selected backup to a temporary location.
3. Verify outer checksum, decrypt, and validate the manifest.
4. Reject unsupported future formats or unsafe archive paths.
5. Extract into an isolated staging directory with size limits.
6. Verify every file hash and run SQLite integrity and foreign-key checks.
7. Show a preview: backup date, pet count, records, files, size, and warnings.
8. Create an automatic encrypted/local safety snapshot of current data.
9. Close database and notification connections.
10. Atomically swap staged database/files into place.
11. Reopen Drift, run supported forward migrations, and revalidate.
12. Reconcile all local notifications and clear stale platform IDs.
13. If any post-swap step fails, roll back to the safety snapshot.

Initial scope is **replace restore**, not merge restore. Merge semantics introduce
record conflicts and file deduplication rules equivalent to sync and should not
be implied by a backup feature.

## 12. Error handling and observability

### Typed failures

- `ValidationFailure`
- `DatabaseFailure`
- `FileStorageFailure`
- `PermissionFailure`
- `NotificationFailure`
- `AuthenticationFailure`
- `NetworkFailure`
- `DriveFailure`
- `EncryptionFailure`
- `IntegrityFailure`
- `UnsupportedBackupFailure`
- `UnexpectedFailure`

Infrastructure exceptions are translated at repository/service boundaries.
Screens receive user-safe messages plus retry or settings actions. Debug details
are logged locally with secrets, tokens, file contents, contact details, and
medical notes redacted.

Critical operations—restore, import, delete, and backup—use progress reporting,
cancellation where safe, idempotent cleanup, and durable status records.

## 13. Security and privacy

- Store OAuth tokens and cryptographic secrets in platform secure storage.
- Never log Google tokens, backup keys, pet medical notes, or document contents.
- Use authenticated backup encryption and validate archive paths against ZIP-slip.
- Keep temporary decrypted restore data only for the shortest possible time.
- Apply iOS file protection and Android app-private storage.
- Optionally obscure app-switcher previews on sensitive screens.
- Provide explicit export, permanent deletion, and local data reset flows.
- Explain that uninstalling before backup can permanently erase local data.
- Avoid third-party analytics by default; any future telemetry must be opt-in
  and contain no pet or medical content.

## 14. UI system and accessibility

- Material 3 with a calm blue/white seed palette and semantic dark theme.
- Rounded cards and restrained motion; animations respect reduced-motion settings.
- Responsive breakpoints for phone, foldable, tablet, and text scaling.
- Minimum 48dp interactive targets and sufficient color contrast.
- Every icon-only action has a semantic label and tooltip.
- Information is not communicated by color alone.
- Forms preserve drafts where practical, place errors next to fields, and avoid
  destructive defaults.
- Charts include accessible summaries and tabular alternatives.
- Date, number, weight, and currency formatting are locale-aware.

## 15. Testing and quality strategy

- Domain unit tests for validation, recurrence, money, dates, and use cases.
- Repository tests against an in-memory Drift database.
- Migration tests from every released schema fixture.
- File transaction and orphan-cleanup tests.
- Notification scheduling tests across timezone and daylight-saving changes.
- Backup round-trip, wrong-passphrase, tampering, interrupted upload, and
  rollback tests.
- Widget tests for forms, empty/error/loading states, themes, and large text.
- Golden tests for key responsive screens.
- Integration tests for onboarding, pet CRUD, records, reminders, backup, restore.
- Static analysis with strict lints and CI formatting/test checks.
- Manual Android/iOS verification for permissions, notification delivery,
  background behavior, file import/export, and Google authorization.

## 16. Recommended implementation sequence

Phase 2 should establish the executable foundation rather than all features:

1. Create the Flutter project and pin compatible stable dependency versions.
2. Configure strict analysis, environments, themes, routing, and localization.
3. Implement core result/error types and Riverpod composition.
4. Implement Drift schema v1, migrations, DAOs, and database tests.
5. Implement managed file storage and secure storage abstractions.
6. Build owner onboarding and pet management as the first vertical slice.
7. Add CI-ready formatting, analysis, unit, widget, and migration test commands.

Later phases can add health records, scheduling, charts/expenses/reports, then
backup/restore and final production hardening.

## 17. Decisions requiring confirmation

The architecture recommends these product decisions:

1. Use **Petly** everywhere as the app/display/package-facing product name.
2. Require a user-created recovery passphrase for portable encrypted backups.
3. Make restore replace all local data after preview and safety snapshot; do not
   offer merge restore in the first release.
4. Support one owner profile in the initial UI while retaining a non-singleton
   schema.
5. Include optional biometric/PIN app lock in production scope.
6. Keep reports generated on demand and include saved reports in backup.

No Phase 2 implementation should begin until these decisions and this Phase 1
design are approved or amended.
