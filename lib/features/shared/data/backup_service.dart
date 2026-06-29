import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService();
});

class BackupService {
  /// Creates a manual backup zip and prompts the user to share/save it.
  Future<void> createManualBackup() async {
    try {
      final docDir = await getApplicationDocumentsDirectory();
      
      // The database file created by drift_flutter is usually named 'petly.sqlite'
      final dbFile = File(p.join(docDir.path, 'petly.sqlite'));
      
      if (!await dbFile.exists()) {
        throw Exception('Database file not found.');
      }

      // Create a temporary zip file
      final tempDir = await getTemporaryDirectory();
      final dateStr = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final zipPath = p.join(tempDir.path, 'petly_backup_$dateStr.petlybackup');
      
      final encoder = ZipFileEncoder();
      encoder.create(zipPath);
      
      // Add database
      encoder.addFile(dbFile);
      
      // Add other assets (like user-uploaded images) if they exist
      final assetsDir = Directory(p.join(docDir.path, 'assets'));
      if (await assetsDir.exists()) {
        encoder.addDirectory(assetsDir);
      }
      
      encoder.close();

      // Trigger standard OS share dialog
      final xFile = XFile(zipPath, mimeType: 'application/zip');
      await Share.shareXFiles([xFile], text: 'Petly Backup - $dateStr');
      
    } catch (e) {
      throw Exception('Failed to create backup: $e');
    }
  }
}
