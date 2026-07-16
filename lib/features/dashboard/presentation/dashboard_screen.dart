import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/features/appointments/domain/appointment.dart';
import 'package:petly/features/dashboard/presentation/upcoming_events_provider.dart';
import 'package:petly/features/expenses/presentation/expense_providers.dart';
import 'package:petly/features/expenses/presentation/expense_form_screen.dart';
import 'package:petly/features/growth/presentation/growth_form_screen.dart';
import 'package:petly/features/medical_history/presentation/medical_record_form_screen.dart';
import 'package:petly/features/owner_profile/presentation/owner_providers.dart';
import 'package:petly/features/pets/domain/pet.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';
import 'package:petly/app/theme/theme_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owner = ref.watch(ownerProvider).value;
    final pets = ref.watch(activePetsProvider);
    final upcomingEvents = ref.watch(upcomingEventsProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // TopAppBar
          SliverAppBar(
            pinned: true,
            backgroundColor: colorScheme.background.withOpacity(0.8),
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.outlineVariant, width: 1),
                    color: colorScheme.surfaceContainerHigh,
                  ),
                  child: const Center(child: Icon(Icons.person)),
                ),
                const SizedBox(width: 12),
                Text(
                  'Petly',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(themeMode == ThemeMode.dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
                onPressed: () {
                  final newMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
                  ref.read(themeModeProvider.notifier).setThemeMode(newMode);
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Hero Section
                _HeroSection(ownerName: owner?.displayName.split(' ').first),
                const SizedBox(height: 32),

                // Horizontal Pets List
                _PetsSection(pets: pets),
                const SizedBox(height: 32),

                // Quick Actions
                _QuickActionsSection(pets: pets.value),
                const SizedBox(height: 32),

                // Upcoming Section
                _UpcomingSection(upcomingEvents: upcomingEvents),
                
                if (pets.value != null && pets.value!.isNotEmpty) ...[
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Petly Insights',
                          style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _InsightsSection(),
                ],
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({this.ownerName});
  final String? ownerName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF005ac2), Color(0xFF00285d)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00285d).withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ownerName == null ? 'Welcome back!' : 'Welcome back, $ownerName!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your pets are looking healthy and active today.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _Badge(label: 'All caught up'),
                    _Badge(label: 'Healthy'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const Icon(Icons.pets, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _PetsSection extends StatelessWidget {
  const _PetsSection({required this.pets});
  final AsyncValue pets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Your Family', style: theme.textTheme.titleLarge),
            TextButton(
              onPressed: () => context.go('/pets'),
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        pets.when(
          data: (items) {
            return SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...items.map((pet) => _PetAvatar(pet: pet)),
                  _AddPetAvatar(onTap: () => context.push('/pets/new')),
                ],
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const Text('Error loading pets'),
        ),
      ],
    );
  }
}

class _PetAvatar extends StatelessWidget {
  const _PetAvatar({required this.pet});
  final pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () => context.push('/pets/${pet.id}'),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.colorScheme.outlineVariant, width: 1),
                color: theme.colorScheme.surfaceContainer,
              ),
              child: Center(
                child: Text(
                  pet.name.substring(0, 1).toUpperCase(),
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(pet.name, style: theme.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

class _AddPetAvatar extends StatelessWidget {
  const _AddPetAvatar({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: theme.colorScheme.outline, width: 2, style: BorderStyle.none), // Dashed normally, using solid for now
            ),
            child: Icon(Icons.add, color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 8),
          Text('Add', style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection({required this.pets});
  final List<Pet>? pets;

  void _selectPetForAction(BuildContext context, void Function(String petId) onSelected) {
    if (pets == null || pets!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please add a pet first!')));
      return;
    }
    if (pets!.length == 1) {
      onSelected(pets!.first.id);
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Select Pet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ...pets!.map((p) => ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text(p.name),
                    onTap: () {
                      Navigator.pop(ctx);
                      onSelected(p.id);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: theme.textTheme.titleLarge),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _QuickActionTile(
                icon: Icons.description_outlined,
                label: 'Add\nRecord',
                color: theme.colorScheme.primaryContainer,
                onTap: () => _selectPetForAction(context, (petId) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => MedicalRecordFormScreen(petId: petId)));
                }),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _QuickActionTile(
                icon: Icons.scale_outlined,
                label: 'Log\nWeight',
                color: theme.colorScheme.secondary,
                onTap: () => _selectPetForAction(context, (petId) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => GrowthFormScreen(petId: petId)));
                }),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _QuickActionTile(
                icon: Icons.payments_outlined,
                label: 'Add\nExpense',
                color: theme.colorScheme.tertiary,
                onTap: () => _selectPetForAction(context, (petId) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ExpenseFormScreen(petId: petId)));
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({required this.icon, required this.label, required this.color, required this.onTap});
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpcomingSection extends StatelessWidget {
  const _UpcomingSection({required this.upcomingEvents});
  final AsyncValue upcomingEvents;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Upcoming', style: theme.textTheme.titleLarge),
            TextButton(
              onPressed: () => context.go('/calendar'),
              child: const Text('See Calendar'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        upcomingEvents.when(
          data: (items) {
            if (items.isEmpty) {
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.event_available),
                    SizedBox(width: 16),
                    Text('All caught up!'),
                  ],
                ),
              );
            }
            final UpcomingEvent appt = items.first as UpcomingEvent;
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _getEventColor(theme, appt.type).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(_getEventIcon(appt.type), color: _getEventColor(theme, appt.type)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(appt.title, style: theme.textTheme.titleMedium),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                appt.date.toRelativeDate(),
                                style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Scheduled for ${appt.date.toDisplayDateTime()}',
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                minimumSize: Size.zero,
                              ),
                              child: const Text('View'),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                minimumSize: Size.zero,
                              ),
                              child: const Text('Snooze'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const SizedBox(),
        ),
      ],
    );
  }

  Color _getEventColor(ThemeData theme, EventType type) {
    switch (type) {
      case EventType.appointment:
        return theme.colorScheme.primary;
      case EventType.vaccination:
        return theme.colorScheme.secondary;
      case EventType.medication:
        return AppTheme.medicineColor;
    }
  }

  IconData _getEventIcon(EventType type) {
    switch (type) {
      case EventType.appointment:
        return Icons.event;
      case EventType.vaccination:
        return Icons.vaccines;
      case EventType.medication:
        return Icons.medication;
    }
  }
}

class _InsightsSection extends ConsumerWidget {
  const _InsightsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final expensesAsync = ref.watch(allExpensesProvider);

    return expensesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
      data: (expenses) {
        final total = expenses.fold(0.0, (sum, e) => sum + e.amountDecimal);
        
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primaryContainer,
                theme.colorScheme.tertiaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text('Quick Insight', style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Total Lifetime Expenses',
                style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 4),
              Text(
                expenses.isEmpty ? 'No expenses logged yet' : '\$${total.toStringAsFixed(2)}',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
