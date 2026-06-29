import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/growth/domain/growth_entry.dart';
import 'package:petly/features/growth/presentation/growth_providers.dart';

class GrowthScreen extends ConsumerWidget {
  const GrowthScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(growthByPetProvider(petId));

    return Scaffold(
      appBar: AppBar(title: const Text('Growth tracking')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pets/$petId/growth/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Log weight'),
        backgroundColor: AppTheme.growthColor,
        foregroundColor: Colors.white,
      ),
      body: entries.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => AsyncErrorWidget(
          message: 'Could not load growth data.',
          onRetry: () => ref.invalidate(growthByPetProvider(petId)),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.monitor_weight_outlined,
              title: 'No weight logs yet',
              body: 'Track your pet\'s weight over time and see trends.',
              color: AppTheme.growthColor,
              action: FilledButton.icon(
                onPressed: () => context.push('/pets/$petId/growth/new'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Log weight'),
                style: FilledButton.styleFrom(backgroundColor: AppTheme.growthColor),
              ),
            );
          }

          // Sorted chronologically for chart (ascending)
          final sorted = [...items]..sort((a, b) => a.measuredAt.compareTo(b.measuredAt));
          final latest = items.first; // items sorted desc

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            children: [
              // Latest weight card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.growthColor, Color(0xFF2563EB)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.monitor_weight_outlined,
                            color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current weight',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.55),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              latest.weightGrams.toWeightDisplay('kg'),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'as of ${latest.measuredAt.toDisplayDate()}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (items.length >= 2)
                        _WeightDelta(
                          current: items[0].weightGrams,
                          previous: items[1].weightGrams,
                        ),
                    ],
                  ),
                ),
              ),

              if (sorted.length >= 2) ...[
                const SizedBox(height: 16),
                // Weight chart
                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 16),
                          child: Text(
                            'Weight history',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: LineChart(
                            _buildChart(sorted, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 16),
              Text(
                'All entries',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              ...items.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppTheme.growthColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.monitor_weight_outlined,
                              color: AppTheme.growthColor, size: 22),
                        ),
                        title: Text(
                          e.weightGrams.toWeightDisplay('kg'),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(e.measuredAt.toDisplayDate()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (e.bodyConditionScore != null)
                              InfoChip(
                                label: 'BCS ${e.bodyConditionScore!.toStringAsFixed(1)}',
                                color: AppTheme.growthColor,
                              ),
                            const SizedBox(width: 4),
                            IconButton(
                              icon: const Icon(Icons.edit_outlined, size: 18),
                              onPressed: () =>
                                  context.push('/pets/$petId/growth/${e.id}/edit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

  LineChartData _buildChart(List<GrowthEntry> sorted, BuildContext context) {
    final spots = sorted.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.weightKg);
    }).toList();

    final minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: (maxY - minY) > 0 ? (maxY - minY) / 4 : 1,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.15),
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            getTitlesWidget: (v, _) => Text(
              '${v.toStringAsFixed(1)}kg',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: sorted.length > 6 ? (sorted.length / 4).ceilToDouble() : 1,
            getTitlesWidget: (v, _) {
              final idx = v.toInt();
              if (idx < 0 || idx >= sorted.length) return const SizedBox();
              return Text(
                DateFormat('MMM d').format(sorted[idx].measuredAt),
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
              );
            },
          ),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      minY: (minY - 0.5).clamp(0, double.infinity),
      maxY: maxY + 0.5,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          curveSmoothness: 0.35,
          color: AppTheme.growthColor,
          barWidth: 2.5,
          dotData: FlDotData(
            getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
              radius: 4,
              color: AppTheme.growthColor,
              strokeColor: Colors.white,
              strokeWidth: 2,
            ),
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                AppTheme.growthColor.withOpacity(0.2),
                AppTheme.growthColor.withOpacity(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class _WeightDelta extends StatelessWidget {
  const _WeightDelta({required this.current, required this.previous});
  final int current;
  final int previous;

  @override
  Widget build(BuildContext context) {
    final diff = current - previous;
    final isGain = diff >= 0;
    final color = isGain ? AppTheme.growthColor : AppTheme.medicalColor;
    final sign = isGain ? '+' : '';
    return Column(
      children: [
        Icon(
          isGain ? Icons.trending_up_rounded : Icons.trending_down_rounded,
          color: color,
          size: 22,
        ),
        const SizedBox(height: 2),
        Text(
          '$sign${(diff / 1000).toStringAsFixed(2)}kg',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}
