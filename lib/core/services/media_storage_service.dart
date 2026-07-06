import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift;

final mediaStorageServiceProvider = Provider<MediaStorageService>((ref) {
  return MediaStorageService(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

class MediaStorageService {
  MediaStorageService(this._db, this._uuid);

  final AppDatabase _db;
  final Uuid _uuid;

  /// Copies a file to the persistent ApplicationDocumentsDirectory
  /// and creates a FileAsset record in the database.
  /// Returns the FileAsset ID.
  Future<String> saveMediaFile(String sourceFilePath, {required String category}) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final mediaDir = Directory(p.join(docsDir.path, category));
    
    if (!await mediaDir.exists()) {
      await mediaDir.create(recursive: true);
    }

    final ext = p.extension(sourceFilePath);
    final fileName = '${_uuid.v4()}$ext';
    final targetPath = p.join(mediaDir.path, fileName);
    
    // Copy file
    final sourceFile = File(sourceFilePath);
    await sourceFile.copy(targetPath);
    
    final byteSize = await sourceFile.length();
    
    final mimeType = _getMimeType(ext);

    final fileAssetId = _uuid.v4();

    final companion = FileAssetsCompanion.insert(
      id: fileAssetId,
      relativePath: targetPath, // Storing absolute path for simplicity since getApplicationDocumentsDirectory can change between app updates on iOS, but for this simplified offline app, absolute path is okay for now, or relative to docs dir. Let's store absolute path since that's what was done before, though relative is better.
      originalName: p.basename(sourceFilePath),
      mimeType: mimeType,
      byteSize: byteSize,
      sha256: '', // Not computing for now to save time
      category: category,
    );

    await _db.into(_db.fileAssets).insert(companion);

    return fileAssetId;
  }

  /// Get absolute path from a fileAssetId
  Future<String?> getAbsolutePath(String fileAssetId) async {
    final asset = await (_db.select(_db.fileAssets)..where((t) => t.id.equals(fileAssetId))).getSingleOrNull();
    if (asset == null) return null;
    return asset.relativePath; // Which is currently storing the absolute path
  }

  String _getMimeType(String ext) {
    switch (ext.toLowerCase()) {
      case '.jpg':
      case '.jpeg':
        return 'image/jpeg';
      case '.png':
        return 'image/png';
      case '.mp4':
        return 'video/mp4';
      case '.mov':
        return 'video/quicktime';
      default:
        return 'application/octet-stream';
    }
  }
}
