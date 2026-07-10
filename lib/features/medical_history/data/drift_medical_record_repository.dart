import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/medical_history/domain/medical_record.dart' as domain;
import 'package:petly/features/medical_history/domain/medical_record_repository.dart';
import 'package:uuid/uuid.dart';

import 'package:petly/core/services/media_storage_service.dart';

class DriftMedicalRecordRepository implements MedicalRecordRepository {
  DriftMedicalRecordRepository(this._db, this._uuid, this._mediaStorage);
  final AppDatabase _db;
  final Uuid _uuid;
  final MediaStorageService _mediaStorage;

  @override
  Stream<List<domain.MedicalRecord>> watchByPet(String petId) {
    final q = _db.select(_db.medicalRecords)
      ..where((r) => r.petId.equals(petId))
      ..orderBy([(r) => OrderingTerm.desc(r.occurredOn)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Future<domain.MedicalRecord?> getById(String id) async {
    final row = await (_db.select(_db.medicalRecords)
          ..where((r) => r.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  @override
  Future<String> save({
    String? id,
    required String petId,
    required String recordType,
    required DateTime occurredOn,
    required String title,
    String? symptoms,
    String? diagnosis,
    String? treatment,
    String? veterinarian,
    String? clinic,
    DateTime? followUpOn,
    String? notes,
  }) async {
    final existing = id == null
        ? null
        : await (_db.select(_db.medicalRecords)
              ..where((r) => r.id.equals(id)))
            .getSingleOrNull();
    final now = DateTime.now().toUtc();
    final recordId = id ?? _uuid.v4();
    await _db.into(_db.medicalRecords).insertOnConflictUpdate(
          MedicalRecordsCompanion.insert(
            id: recordId,
            petId: petId,
            recordType: recordType,
            occurredOn: occurredOn,
            title: title.trim(),
            symptoms: Value(_c(symptoms)),
            diagnosis: Value(_c(diagnosis)),
            treatment: Value(_c(treatment)),
            veterinarian: Value(_c(veterinarian)),
            clinic: Value(_c(clinic)),
            followUpOn: Value(followUpOn),
            notes: Value(_c(notes)),
            createdAt: Value(existing?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
    return recordId;
  }

  @override
  Future<void> delete(String id) =>
      (_db.delete(_db.medicalRecords)..where((r) => r.id.equals(id))).go();

  domain.MedicalRecord _map(MedicalRecord r) => domain.MedicalRecord(
        id: r.id,
        petId: r.petId,
        recordType: r.recordType,
        occurredOn: r.occurredOn,
        title: r.title,
        symptoms: r.symptoms,
        diagnosis: r.diagnosis,
        treatment: r.treatment,
        veterinarian: r.veterinarian,
        clinic: r.clinic,
        followUpOn: r.followUpOn,
        notes: r.notes,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
      );

  @override
  Stream<List<domain.MedicalRecordAttachment>> watchAttachments(String recordId) {
    final query = _db.select(_db.recordAttachments).join([
      innerJoin(_db.fileAssets, _db.fileAssets.id.equalsExp(_db.recordAttachments.fileId)),
    ])..where(_db.recordAttachments.entityType.equals('MedicalRecord') & _db.recordAttachments.entityId.equals(recordId));
    
    return query.watch().map((rows) {
      return rows.map((row) {
        final attachment = row.readTable(_db.recordAttachments);
        final fileAsset = row.readTable(_db.fileAssets);
        return domain.MedicalRecordAttachment(
          id: attachment.id,
          medicalRecordId: attachment.entityId,
          fileAssetId: attachment.fileId,
          caption: attachment.caption,
          absolutePath: fileAsset.relativePath,
        );
      }).toList();
    });
  }

  @override
  Future<void> addAttachment(String recordId, String sourceFilePath, String documentType) async {
    final fileAssetId = await _mediaStorage.saveMediaFile(sourceFilePath, category: 'medical_documents');
    await _db.into(_db.recordAttachments).insert(
      RecordAttachmentsCompanion.insert(
        id: _uuid.v4(),
        fileId: fileAssetId,
        entityType: 'MedicalRecord',
        entityId: recordId,
        caption: Value(documentType),
      )
    );
  }

  @override
  Future<void> deleteAttachment(String attachmentId) async {
    await (_db.delete(_db.recordAttachments)..where((t) => t.id.equals(attachmentId))).go();
  }

  String? _c(String? v) {
    final s = v?.trim();
    return (s == null || s.isEmpty) ? null : s;
  }
}
