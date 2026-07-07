import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/grooming/data/grooming_repository.dart';
import 'package:petly/features/grooming/presentation/grooming_form_screen.dart';

class GroomingScreen extends ConsumerWidget {
  const GroomingScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final logsAsync = ref.watch(groomingRepositoryProvider).watchGroomingLogs(petId);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text('Grooming & Hygiene', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GroomingFormScreen(petId: petId),
          ));
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Log'),
      ),
      body: StreamBuilder<List<GroomingLog>>(
        stream: logsAsync,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final logs = snapshot.data ?? [];
          if (logs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.content_cut_rounded, size: 64, color: colorScheme.onSurface.withOpacity(0.2)),
                  const SizedBox(height: 16),
                  Text('No grooming logs yet.', style: theme.textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface.withOpacity(0.5))),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: logs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final log = logs[index];
              return Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withOpacity(0.4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GroomingFormScreen(petId: petId, logToEdit: log),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.content_cut_rounded, color: colorScheme.primary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(log.groomingType, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(DateFormat.yMMMd().format(log.date), style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6))),
                              if (log.groomerName != null && log.groomerName!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text('Groomer: ${log.groomerName}', style: theme.textTheme.bodySmall),
                              ],
                              if (log.notes != null && log.notes!.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text(log.notes!, style: theme.textTheme.bodyMedium),
                              ]
                            ],
                          ),
                        ),
                        if (log.cost != null) ...[
                          Text('\$${log.cost!.toStringAsFixed(2)}', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary)),
                        ],
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.more_vert),
                          onSelected: (value) async {
                            if (value == 'edit') {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GroomingFormScreen(petId: petId, logToEdit: log),
                              ));
                            } else if (value == 'delete') {
                              await ref.read(groomingRepositoryProvider).deleteGroomingLog(log.id);
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(value: 'edit', child: Text('Edit')),
                            const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
