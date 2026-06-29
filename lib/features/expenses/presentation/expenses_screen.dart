import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/expenses/domain/expense.dart';
import 'package:petly/features/expenses/presentation/expense_providers.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expensesByPetProvider(petId));
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/$petId/expenses/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add expense'),
        backgroundColor: AppTheme.expenseColor,
        foregroundColor: Colors.white,
      ),
      body: expenses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AsyncErrorWidget(
          message: 'Could not load expenses.',
          onRetry: () => ref.invalidate(expensesByPetProvider(petId)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.receipt_long_outlined,
              title: 'No expenses yet',
              body: 'Track vet bills, food, grooming and all pet-related costs.',
              color: AppTheme.expenseColor,
              action: FilledButton.icon(
                onPressed: () => context.push('/pets/$petId/expenses/new'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add expense'),
                style: FilledButton.styleFrom(backgroundColor: AppTheme.expenseColor),
              ),
            );
          }

          // Category totals
          final totals = <String, int>{};
          for (final e in items) {
            totals[e.category] = (totals[e.category] ?? 0) + e.amountMinor;
          }
          final total = items.fold(0, (sum, e) => sum + e.amountMinor);
          final currency = items.first.currencyCode;

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            children: [
              // Total card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppTheme.expenseColor, const Color(0xFFFF4D8F)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.account_balance_wallet_outlined,
                            color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total spent',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.55))),
                          Text(
                            total.toMoneyString(currency),
                            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                          ),
                          Text('${items.length} records',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              if (totals.length >= 2) ...[
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('By category',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 180,
                          child: _CategoryChart(totals: totals, total: total),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 16),
              SectionHeader(title: 'All expenses'),
              const SizedBox(height: 8),
              ...items.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppTheme.expenseColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(_categoryIcon(e.category),
                              color: AppTheme.expenseColor, size: 22),
                        ),
                        title: Text(e.category,
                            style: const TextStyle(fontWeight: FontWeight.w700)),
                        subtitle: Text(e.occurredOn.toDisplayDate()),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              e.amountMinor.toMoneyString(e.currencyCode),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            if (e.merchant != null)
                              Text(e.merchant!,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.5))),
                          ],
                        ),
                        onTap: () => context.push('/pets/$petId/expenses/${e.id}'),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

  IconData _categoryIcon(String cat) {
    return switch (cat) {
      'Veterinary' => Icons.local_hospital_outlined,
      'Medication' => Icons.medication_outlined,
      'Food & Treats' => Icons.restaurant_outlined,
      'Grooming' => Icons.content_cut_outlined,
      'Accessories' => Icons.shopping_bag_outlined,
      'Training' => Icons.school_outlined,
      'Insurance' => Icons.shield_outlined,
      'Boarding' => Icons.hotel_outlined,
      _ => Icons.receipt_long_outlined,
    };
  }
}

class _CategoryChart extends StatelessWidget {
  const _CategoryChart({required this.totals, required this.total});
  final Map<String, int> totals;
  final int total;

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppTheme.expenseColor,
      AppTheme.vaccinationColor,
      AppTheme.appointmentColor,
      AppTheme.documentColor,
      AppTheme.medicalColor,
      AppTheme.growthColor,
      AppTheme.reminderColor,
      AppTheme.medicineColor,
    ];
    final entries = totals.entries.toList();
    return PieChart(
      PieChartData(
        sections: entries.asMap().entries.map((e) {
          final pct = e.value.value / total * 100;
          return PieChartSectionData(
            value: e.value.value.toDouble(),
            color: colors[e.key % colors.length],
            title: '${pct.toStringAsFixed(0)}%',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          );
        }).toList(),
        sectionsSpace: 3,
        centerSpaceRadius: 38,
      ),
    );
  }
}
