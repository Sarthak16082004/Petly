import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:video_player/video_player.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/core/services/media_storage_service.dart';
import 'package:petly/features/memories/domain/memory.dart';
import 'package:petly/features/memories/presentation/memories_providers.dart';

class MemoriesScreen extends ConsumerWidget {
  const MemoriesScreen({required this.petId, super.key});
  final String petId;

  Future<void> _addMemory(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    
    // 1. Show Bottom Sheet to pick source
    if (!context.mounted) return;
    final sourceAction = await showModalBottomSheet<_MediaSourceAction>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () => Navigator.pop(ctx, _MediaSourceAction.takePhoto),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose Photo'),
              onTap: () => Navigator.pop(ctx, _MediaSourceAction.choosePhoto),
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Record Video'),
              onTap: () => Navigator.pop(ctx, _MediaSourceAction.recordVideo),
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Choose Video'),
              onTap: () => Navigator.pop(ctx, _MediaSourceAction.chooseVideo),
            ),
          ],
        ),
      ),
    );

    if (sourceAction == null) return;

    XFile? xfile;
    switch (sourceAction) {
      case _MediaSourceAction.takePhoto:
        xfile = await picker.pickImage(source: ImageSource.camera);
        break;
      case _MediaSourceAction.choosePhoto:
        xfile = await picker.pickImage(source: ImageSource.gallery);
        break;
      case _MediaSourceAction.recordVideo:
        xfile = await picker.pickVideo(source: ImageSource.camera);
        break;
      case _MediaSourceAction.chooseVideo:
        xfile = await picker.pickVideo(source: ImageSource.gallery);
        break;
    }

    if (xfile == null) return;

    // Show dialog to add title/description
    final titleController = TextEditingController();
    final descController = TextEditingController();

    if (!context.mounted) return;
    final isVideo = xfile.path.toLowerCase().endsWith('.mp4') || xfile.path.toLowerCase().endsWith('.mov');
    
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Memory'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: isVideo
                  ? Container(height: 120, width: double.infinity, color: Colors.black, child: const Icon(Icons.play_circle_fill, color: Colors.white, size: 48))
                  : Image.file(File(xfile!.path), height: 120, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
              const SizedBox(height: 8),
              TextField(controller: descController, decoration: const InputDecoration(labelText: 'Notes')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
        ],
      ),
    );

    if (result == true) {
      try {
        // Move to persistent storage using the MediaStorageService
        final storageService = ref.read(mediaStorageServiceProvider);
        final fileAssetId = await storageService.saveMediaFile(xfile.path, category: 'memories');
        
        final newMemory = Memory(
          id: '',
          petId: petId,
          date: DateTime.now(),
          title: titleController.text,
          description: descController.text,
          imageFileId: fileAssetId,
        );
        await ref.read(memoriesRepositoryProvider).addMemory(newMemory);
      } catch (e, stack) {
        debugPrint('Error saving memory: $e\n$stack');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoriesByPetProvider(petId));

    return Scaffold(
      appBar: AppBar(title: const Text('Memories')),
      body: memories.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No memories yet. Add some photos or videos!'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final memory = items[index];
              return _MemoryCard(memory: memory);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addMemory(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}

enum _MediaSourceAction { takePhoto, choosePhoto, recordVideo, chooseVideo }

class _MemoryCard extends StatelessWidget {
  const _MemoryCard({required this.memory});
  final Memory memory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Fallback: If filePath is null, it might be an older record where imageFileId contains the absolute path.
    final path = memory.filePath ?? memory.imageFileId;
    final isVideo = path != null && (path.toLowerCase().endsWith('.mp4') || path.toLowerCase().endsWith('.mov'));
    
    return GestureDetector(
      onTap: () {
        if (path == null) return;
        
        showDialog(
          context: context,
          builder: (ctx) => Dialog.fullscreen(
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text(memory.title ?? 'Memory'),
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
                titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: isVideo 
                      ? _VideoPlayerView(filePath: path)
                      : Image.file(File(path), fit: BoxFit.contain),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat.yMMMd().format(memory.date), style: const TextStyle(color: Colors.white70)),
                        const SizedBox(height: 8),
                        if (memory.description != null && memory.description!.isNotEmpty)
                          Text(memory.description!, style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.colorScheme.surfaceContainer,
          image: (path != null && !isVideo)
              ? DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover)
              : null,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (isVideo)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black87,
                ),
                child: const Center(child: Icon(Icons.play_circle_outline, color: Colors.white54, size: 48)),
              ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              padding: const EdgeInsets.all(12),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    memory.title ?? '',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateFormat.yMMMd().format(memory.date),
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoPlayerView extends StatefulWidget {
  const _VideoPlayerView({required this.filePath});
  final String filePath;

  @override
  State<_VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<_VideoPlayerView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.filePath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });
      },
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            VideoPlayer(_controller),
            if (!_controller.value.isPlaying)
              const Icon(Icons.play_arrow, size: 80, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
