import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/memories/domain/memory.dart';
import 'package:petly/features/memories/presentation/memories_providers.dart';

class MemoriesScreen extends ConsumerWidget {
  const MemoriesScreen({required this.petId, super.key});
  final String petId;

  Future<void> _addMemory(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    final xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;

    // Show dialog to add title/description
    final titleController = TextEditingController();
    final descController = TextEditingController();

    if (!context.mounted) return;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Memory'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(File(xfile.path), height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            const SizedBox(height: 8),
            TextField(controller: descController, decoration: const InputDecoration(labelText: 'Notes')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
        ],
      ),
    );

    if (result == true) {
      // In a real app, we'd save the file to local app dir and insert FileAsset.
      // For this simplified version, we'll store the absolute path as imageFileId.
      final newMemory = Memory(
        id: '',
        petId: petId,
        date: DateTime.now(),
        title: titleController.text,
        description: descController.text,
        imageFileId: xfile.path,
      );
      await ref.read(memoriesRepositoryProvider).addMemory(newMemory);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoriesByPetProvider(petId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Memories')),
      body: memories.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No memories yet. Add some photos!'));
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
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

class _MemoryCard extends StatelessWidget {
  const _MemoryCard({required this.memory});
  final Memory memory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Full screen view logic here
        showDialog(
          context: context,
          builder: (ctx) => Dialog.fullscreen(
            child: Scaffold(
              appBar: AppBar(
                title: Text(memory.title ?? 'Memory'),
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: memory.imageFileId != null
                        ? Image.file(File(memory.imageFileId!), fit: BoxFit.contain)
                        : const Icon(Icons.photo, size: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat.yMMMd().format(memory.date), style: theme.textTheme.labelMedium),
                        const SizedBox(height: 8),
                        if (memory.description != null && memory.description!.isNotEmpty)
                          Text(memory.description!, style: theme.textTheme.bodyLarge),
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
          image: memory.imageFileId != null
              ? DecorationImage(image: FileImage(File(memory.imageFileId!)), fit: BoxFit.cover)
              : null,
        ),
        child: Container(
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
      ),
    );
  }
}
