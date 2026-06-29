import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/features/owner_profile/presentation/owner_providers.dart';

class BootstrapScreen extends ConsumerWidget {
  const BootstrapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owner = ref.watch(ownerProvider);
    owner.whenData((value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        context.go(value == null ? '/onboarding' : '/home');
      });
    });

    return Scaffold(
      body: Center(
        child: owner.hasError
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 40),
                  const SizedBox(height: 12),
                  const Text('Petly could not open local storage.'),
                  const SizedBox(height: 12),
                  FilledButton.tonal(
                    onPressed: () => ref.invalidate(ownerProvider),
                    child: const Text('Try again'),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
