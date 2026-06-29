import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/growth/domain/growth_entry.dart';
import 'package:petly/features/growth/presentation/growth_providers.dart';

class GrowthFormScreen extends ConsumerStatefulWidget {
  const GrowthFormScreen({required this.petId, this.entryId, super.key});
  final String petId;
  final String? entryId;

  @override
  ConsumerState<GrowthFormScreen> createState() => _State();
}

class _State extends ConsumerState<GrowthFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _weightCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  DateTime _measuredAt = DateTime.now();
  double? _bcs;
  String _unit = 'kg';
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _weightCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _load(GrowthEntry e) {
    if (_loaded) return;
    _loaded = true;
    _weightCtrl.text = (e.weightKg).toStringAsFixed(2);
    _notesCtrl.text = e.notes ?? '';
    _measuredAt = e.measuredAt;
    _bcs = e.bodyConditionScore;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final weightVal = double.tryParse(_weightCtrl.text.replaceAll(',', '.')) ?? 0;
      final grams = _unit == 'kg'
          ? (weightVal * 1000).round()
          : (weightVal * 453.592).round();

      await ref.read(growthRepositoryProvider).save(
            id: widget.entryId,
            petId: widget.petId,
            measuredAt: _measuredAt,
            weightGrams: grams,
            bodyConditionScore: _bcs,
            notes: _notesCtrl.text.nullIfEmpty,
          );
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Could not save entry.')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.entryId != null;
    if (isEdit) {
      ref.watch(growthEntryProvider(widget.entryId!)).whenData((v) {
        if (v != null) _load(v);
      });
    }

    return LoadingOverlay(
      isLoading: _saving,
      child: Scaffold(
        appBar: AppBar(title: Text(isEdit ? 'Edit weight entry' : 'Log weight')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
            children: [
              // Date
              InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () async {
                  final r = await showDatePicker(
                    context: context,
                    initialDate: _measuredAt,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (r != null) setState(() => _measuredAt = r);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Measured on',
                    prefixIcon: Icon(Icons.calendar_today_rounded),
                    suffixIcon: Icon(Icons.edit_calendar_outlined, size: 18),
                  ),
                  child: Text(DateFormat('MMM d, yyyy').format(_measuredAt)),
                ),
              ),
              const SizedBox(height: 16),

              // Weight + unit
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _weightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Weight *',
                        prefixIcon: Icon(Icons.monitor_weight_outlined),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Required';
                        if (double.tryParse(v.replaceAll(',', '.')) == null) return 'Invalid number';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 90,
                    child: DropdownButtonFormField<String>(
                      value: _unit,
                      decoration: const InputDecoration(labelText: 'Unit'),
                      items: const [
                        DropdownMenuItem(value: 'kg', child: Text('kg')),
                        DropdownMenuItem(value: 'lb', child: Text('lb')),
                        DropdownMenuItem(value: 'g', child: Text('g')),
                      ],
                      onChanged: (v) => setState(() => _unit = v!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Body condition score
              Text(
                'Body condition score (1–9)',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.55),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Slider(
                value: _bcs ?? 5,
                min: 1,
                max: 9,
                divisions: 16,
                label: _bcs?.toStringAsFixed(1) ?? 'Not set',
                activeColor: AppTheme.growthColor,
                onChanged: (v) => setState(() => _bcs = v),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Underweight',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(_bcs == null ? 'Not set' : _bcs!.toStringAsFixed(1),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.growthColor)),
                  Text('Overweight',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              if (_bcs != null)
                TextButton(
                  onPressed: () => setState(() => _bcs = null),
                  child: const Text('Clear BCS'),
                ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _notesCtrl,
                minLines: 2,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Notes (optional)',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.notes_rounded),
                ),
              ),
              const SizedBox(height: 28),
              FilledButton(
                onPressed: _saving ? null : _save,
                style: FilledButton.styleFrom(backgroundColor: AppTheme.growthColor),
                child: Text(isEdit ? 'Save changes' : 'Log weight'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
