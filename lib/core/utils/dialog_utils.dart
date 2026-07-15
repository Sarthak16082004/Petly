import 'package:flutter/material.dart';

/// Shows a standardized confirmation dialog for deleting records.
/// Returns `true` if the user confirms the deletion, `false` otherwise.
Future<bool> showDeleteConfirmationDialog(
  BuildContext context, {
  String itemType = 'record',
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text('Delete $itemType?'),
        content: Text(
          'Are you sure you want to delete this $itemType? '
          'This action cannot be undone and the data will be permanently lost.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
              foregroundColor: Theme.of(ctx).colorScheme.onError,
            ),
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
  return result ?? false;
}
