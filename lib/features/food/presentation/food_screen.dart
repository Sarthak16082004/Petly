import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/utils/dialog_utils.dart';
import 'package:petly/features/food/data/food_repository.dart';
import 'package:petly/features/food/presentation/food_inventory_form_screen.dart';
import 'package:petly/features/food/presentation/meal_log_form_screen.dart';

class FoodScreen extends ConsumerWidget {
  const FoodScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final repo = ref.watch(foodRepositoryProvider);
    final inventoryAsync = repo.watchInventories(petId);
    final mealsAsync = repo.watchMealLogs(petId);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text('Diet & Nutrition', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MealLogFormScreen(petId: petId),
          ));
        },
        icon: const Icon(Icons.restaurant),
        label: const Text('Log Meal'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Food Inventory', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FoodInventoryFormScreen(petId: petId),
                      ));
                    },
                    child: const Text('Add Food'),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<List<FoodInventory>>(
            stream: inventoryAsync,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              }
              final invs = snapshot.data ?? [];
              if (invs.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: colorScheme.surfaceContainerHighest.withOpacity(0.4),
                      elevation: 0,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('No food in inventory. Tap "Add Food" to track a new bag.'),
                      ),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final inv = invs[index];
                    final percent = inv.remainingWeightGrams / inv.totalWeightGrams;
                    
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 0,
                      color: colorScheme.surfaceContainerHighest.withOpacity(0.4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(inv.brand, style: theme.textTheme.labelMedium?.copyWith(color: colorScheme.primary)),
                                      Text(inv.name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: percent < 0.2 ? Colors.redAccent.withOpacity(0.1) : colorScheme.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${(inv.remainingWeightGrams / 1000).toStringAsFixed(2)}kg left',
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: percent < 0.2 ? Colors.redAccent : colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            LinearProgressIndicator(
                              value: percent.clamp(0.0, 1.0),
                              backgroundColor: colorScheme.outline.withOpacity(0.2),
                              color: percent < 0.2 ? Colors.redAccent : colorScheme.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: invs.length,
                ),
              );
            },
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text('Recent Meals', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          
          StreamBuilder<List<MealLog>>(
            stream: mealsAsync,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              }
              final meals = snapshot.data ?? [];
              if (meals.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.restaurant_menu, size: 48, color: colorScheme.onSurface.withOpacity(0.2)),
                          const SizedBox(height: 16),
                          Text('No meals logged yet.', style: theme.textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface.withOpacity(0.5))),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final meal = meals[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.restaurant, color: Colors.orange),
                      ),
                      title: Text('${meal.amountGrams.toStringAsFixed(0)}g'),
                      subtitle: Text(DateFormat.yMMMd().add_jm().format(meal.fedAt)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (meal.notes != null) const Icon(Icons.notes, size: 16),
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (value) async {
                              if (value == 'edit') {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MealLogFormScreen(petId: petId, logToEdit: meal),
                                ));
                              } else if (value == 'delete') {
                                final confirm = await showDeleteConfirmationDialog(context, itemType: 'meal log');
                                if (confirm) {
                                  await ref.read(foodRepositoryProvider).deleteMealLog(meal.id);
                                }
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(value: 'edit', child: Text('Edit')),
                              const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MealLogFormScreen(petId: petId, logToEdit: meal),
                        ));
                      },
                    );
                  },
                  childCount: meals.length,
                ),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)), // FAB padding
        ],
      ),
    );
  }
}
