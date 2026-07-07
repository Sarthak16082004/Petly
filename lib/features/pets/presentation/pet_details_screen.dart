import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';

import 'package:petly/features/appointments/presentation/appointment_providers.dart';
import 'package:petly/features/growth/presentation/growth_providers.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';
import 'package:petly/features/vaccinations/presentation/vaccination_providers.dart';

class PetDetailsScreen extends ConsumerWidget {
  const PetDetailsScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(petProvider(petId));
    final vaccinations = ref.watch(vaccinationsByPetProvider(petId));
    final growth = ref.watch(growthByPetProvider(petId));
    final appointments = ref.watch(appointmentsByPetProvider(petId));
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: pet.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Could not load this pet.')),
        data: (value) {
          if (value == null) {
            return const Center(child: Text('This pet no longer exists.'));
          }
          final latestWeight = growth.value?.isNotEmpty == true ? growth.value!.first : null;
          final nextAppt = appointments.value
              ?.where((a) => a.isUpcoming)
              .isNotEmpty == true
              ? appointments.value!.firstWhere((a) => a.isUpcoming)
              : null;
          final overdueVax = vaccinations.value?.where((v) => v.isOverdue).length ?? 0;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 320,
                pinned: true,
                backgroundColor: colorScheme.background,
                leading: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                  onPressed: () => context.pop(),
                ),
                actions: [
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.qr_code_2_rounded),
                    ),
                    onPressed: () => context.push('/pets/$petId/id'),
                  ),
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit_outlined),
                    ),
                    onPressed: () => context.push('/pets/$petId/edit'),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Hero Gradient for Avatar background
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [colorScheme.primaryContainer, colorScheme.primary],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      // Fade out at bottom
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.5, 1.0],
                              colors: [
                                Colors.transparent,
                                colorScheme.background,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 40),
                            Hero(
                              tag: 'pet-avatar-$petId',
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorScheme.surface,
                                  border: Border.all(color: colorScheme.background, width: 4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    )
                                  ],
                                  image: value.profilePicturePath != null 
                                    ? DecorationImage(
                                        image: FileImage(File(value.profilePicturePath!)),
                                        fit: BoxFit.cover,
                                      ) 
                                    : null,
                                ),
                                child: value.profilePicturePath == null 
                                  ? Center(
                                      child: Text(
                                        value.name.initials,
                                        style: TextStyle(
                                          color: colorScheme.onSurfaceVariant,
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : null,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              value.name,
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 4-Stat Row
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.22,
                            child: _StatCard(
                              label: 'Species',
                              value: value.species,
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.22,
                            child: _StatCard(
                              label: 'Age',
                              value: value.birthDate?.toAgeString() ?? '—',
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.22,
                            child: _StatCard(
                              label: 'Sex',
                              value: value.sex ?? '—',
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.22,
                            child: _StatCard(
                              label: 'Weight',
                              value: latestWeight != null 
                                  ? latestWeight.weightGrams.toWeightDisplay('kg') 
                                  : (value.weight?.toString() ?? '—'),
                            ),
                          ),
                          if (value.size != null && value.size!.isNotEmpty)
                            FractionallySizedBox(
                              widthFactor: 0.22,
                              child: _StatCard(
                                label: 'Size',
                                value: value.size!,
                              ),
                            ),
                          if (value.color != null && value.color!.isNotEmpty)
                            FractionallySizedBox(
                              widthFactor: 0.22,
                              child: _StatCard(
                                label: 'Color',
                                value: value.color!,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      Text('Health & Care', style: theme.textTheme.titleLarge),
                      const SizedBox(height: 16),

                      // 6-Tile Bento Grid
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.1,
                        children: [
                          _BentoCard(
                            title: 'Medical',
                            subtitle: 'History & diagnoses',
                            icon: Icons.medical_information,
                            color: const Color(0xFF0d9488), // Teal
                            onTap: () => context.push('/pets/$petId/medical'),
                          ),
                          _BentoCard(
                            title: 'Vaccinations',
                            subtitle: overdueVax > 0 ? '$overdueVax Overdue' : '${vaccinations.value?.length ?? 0} records',
                            icon: Icons.vaccines,
                            color: const Color(0xFF2563eb), // Blue
                            onTap: () => context.push('/pets/$petId/vaccinations'),
                          ),
                          _BentoCard(
                            title: 'Medicines',
                            subtitle: 'Active: 2', // Placeholder until real data
                            icon: Icons.medication,
                            color: const Color(0xFF10b981), // Mint
                            onTap: () => context.push('/pets/$petId/medicines'),
                          ),
                          _BentoCard(
                            title: 'Appointments',
                            subtitle: nextAppt != null ? 'Upcoming: 1' : 'Schedule visits',
                            icon: Icons.calendar_month,
                            color: const Color(0xFF8b5cf6), // Purple
                            onTap: () => context.push('/pets/$petId/appointments'),
                          ),
                          _BentoCard(
                            title: 'Growth',
                            subtitle: 'Track weight',
                            icon: Icons.monitor_weight,
                            color: const Color(0xFF16a34a), // Green
                            onTap: () => context.push('/pets/$petId/growth'),
                          ),
                          _BentoCard(
                            title: 'Diet & Food',
                            subtitle: 'Meals & Inventory',
                            icon: Icons.restaurant,
                            color: const Color(0xFFeab308), // Yellow
                            onTap: () => context.push('/pets/$petId/food'),
                          ),
                          _BentoCard(
                            title: 'Grooming',
                            subtitle: 'Hygiene & Spas',
                            icon: Icons.content_cut,
                            color: const Color(0xFFec4899), // Pink
                            onTap: () => context.push('/pets/$petId/grooming'),
                          ),
                          _BentoCard(
                            title: 'Expenses',
                            subtitle: 'Track costs',
                            icon: Icons.receipt_long,
                            color: const Color(0xFFf97316), // Orange
                            onTap: () => context.push('/pets/$petId/expenses'),
                          ),
                          _BentoCard(
                            title: 'Memories',
                            subtitle: 'Photo gallery',
                            icon: Icons.photo_library,
                            color: const Color(0xFFec4899), // Pink
                            onTap: () => context.push('/pets/$petId/memories'),
                          ),
                          _BentoCard(
                            title: 'Deworming',
                            subtitle: 'Parasite control',
                            icon: Icons.bug_report,
                            color: const Color(0xFFa855f7), // Purple variant
                            onTap: () => context.push('/pets/$petId/dewormings'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100), // Padding for bottom nav
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _BentoCard extends StatelessWidget {
  const _BentoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
