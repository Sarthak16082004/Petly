import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/breeding/domain/breeding_record.dart';
import 'package:petly/features/breeding/presentation/breeding_providers.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';

class BreedingRecordFormScreen extends ConsumerStatefulWidget {
  const BreedingRecordFormScreen({required this.petId, this.recordId, super.key});
  final String petId;
  final String? recordId;

  @override
  ConsumerState<BreedingRecordFormScreen> createState() => _BreedingRecordFormScreenState();
}

class _BreedingRecordFormScreenState extends ConsumerState<BreedingRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  bool _saving = false;
  
  String? _partnerName;
  
  // Heat Cycle
  DateTime? _heatStartDate;
  DateTime? _heatEndDate;
  
  // Mating
  DateTime? _matingDate;
  final _matingNotes = TextEditingController();
  
  // Pregnancy
  String _pregnancyStatus = 'Unknown';
  DateTime? _expectedDueDate;
  
  // Whelping
  DateTime? _whelpingDate;
  int? _totalBorn;
  int? _males;
  int? _females;
  
  final _notes = TextEditingController();

  List<LitterMember> _litter = [];

  void _load(BreedingRecord r) {
    if (_partnerName != null) return; // already loaded
    
    _partnerName = r.partnerName;
    _heatStartDate = r.heatStartDate;
    _heatEndDate = r.heatEndDate;
    
    _matingDate = r.matingDate;
    _matingNotes.text = r.matingNotes ?? '';
    
    _pregnancyStatus = r.pregnancyStatus;
    _expectedDueDate = r.expectedDueDate;
    
    _whelpingDate = r.whelpingDate;
    _totalBorn = r.totalBorn;
    _males = r.males;
    _females = r.females;
    
    _notes.text = r.notes ?? '';
    _litter = r.litter.toList();
    
    setState(() {});
  }

  Future<void> _pickDate(DateTime? current, ValueChanged<DateTime?> onPicked) async {
    final d = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (d != null) onPicked(d);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final r = BreedingRecord(
        id: widget.recordId ?? '',
        petId: widget.petId,
        partnerName: _partnerName,
        heatStartDate: _heatStartDate,
        heatEndDate: _heatEndDate,
        matingDate: _matingDate,
        matingNotes: _matingNotes.text.trim().isEmpty ? null : _matingNotes.text.trim(),
        pregnancyStatus: _pregnancyStatus,
        expectedDueDate: _expectedDueDate,
        whelpingDate: _whelpingDate,
        totalBorn: _totalBorn,
        males: _males,
        females: _females,
        notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
      );

      final repo = ref.read(breedingRepositoryProvider);
      final id = await repo.saveBreedingRecord(r);

      for (final l in _litter) {
        await repo.updateLitterMember(LitterMember(
          id: l.id,
          breedingRecordId: id,
          identifier: l.identifier,
          sex: l.sex,
          birthWeight: l.birthWeight,
          color: l.color,
        ));
      }

      if (mounted) context.pop();
    } catch (_) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not save.')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
  
  Future<void> _delete() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: const Text('Delete record?'),
        content: const Text('This breeding record and litter tracking will be permanently deleted.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(d, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(d, true),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    await ref.read(breedingRepositoryProvider).deleteBreedingRecord(widget.recordId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.recordId != null;
    if (isEdit) {
      ref.watch(breedingRecordProvider(widget.recordId!)).whenData((v) {
        if (v != null) _load(v);
      });
    }

    final pet = ref.watch(petProvider(widget.petId)).valueOrNull;
    final isMale = pet?.gender?.toLowerCase() == 'male';

    return LoadingOverlay(
      isLoading: _saving,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit record' : 'Add record'),
          actions: [
            if (isEdit)
              IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                initialValue: _partnerName,
                decoration: InputDecoration(
                  labelText: isMale ? 'Dam (Female Partner)' : 'Sire (Male Partner)',
                  prefixIcon: const Icon(Icons.pets),
                ),
                onChanged: (v) => _partnerName = v,
              ),
              const SizedBox(height: 24),

              if (!isMale) ...[
                _Divider('Heat Cycle'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _DateCard(
                        label: 'Start Date',
                        date: _heatStartDate,
                        onTap: () => _pickDate(_heatStartDate, (d) => setState(() => _heatStartDate = d)),
                        onClear: _heatStartDate != null ? () => setState(() => _heatStartDate = null) : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _DateCard(
                        label: 'End Date',
                        date: _heatEndDate,
                        onTap: () => _pickDate(_heatEndDate, (d) => setState(() => _heatEndDate = d)),
                        onClear: _heatEndDate != null ? () => setState(() => _heatEndDate = null) : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],

              _Divider('Mating & Pregnancy'),
              const SizedBox(height: 12),
              _DateCard(
                label: 'Mating Date',
                date: _matingDate,
                onTap: () => _pickDate(_matingDate, (d) {
                  setState(() {
                    _matingDate = d;
                    if (!isMale && _expectedDueDate == null) {
                      _expectedDueDate = d?.add(const Duration(days: 63)); // Auto calc
                    }
                  });
                }),
                onClear: _matingDate != null ? () => setState(() => _matingDate = null) : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _matingNotes,
                minLines: 1,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Mating Notes', prefixIcon: Icon(Icons.notes)),
              ),
              const SizedBox(height: 16),
              
              if (!isMale || _pregnancyStatus != 'Unknown' || _expectedDueDate != null) ...[
                DropdownButtonFormField<String>(
                  value: _pregnancyStatus,
                  decoration: const InputDecoration(labelText: 'Pregnancy Status', prefixIcon: Icon(Icons.monitor_heart_outlined)),
                  items: const [
                    DropdownMenuItem(value: 'Unknown', child: Text('Unknown / Pending')),
                    DropdownMenuItem(value: 'Confirmed', child: Text('Confirmed Pregnant')),
                    DropdownMenuItem(value: 'Failed', child: Text('Failed / False Pregnancy')),
                  ],
                  onChanged: (v) => setState(() => _pregnancyStatus = v ?? 'Unknown'),
                ),
                const SizedBox(height: 12),
                _DateCard(
                  label: 'Expected Due Date',
                  date: _expectedDueDate,
                  onTap: () => _pickDate(_expectedDueDate, (d) => setState(() => _expectedDueDate = d)),
                  onClear: _expectedDueDate != null ? () => setState(() => _expectedDueDate = null) : null,
                ),
                const SizedBox(height: 24),
              ],

              _Divider('Whelping / Birth'),
              const SizedBox(height: 12),
              _DateCard(
                label: 'Actual Whelping Date',
                date: _whelpingDate,
                onTap: () => _pickDate(_whelpingDate, (d) => setState(() => _whelpingDate = d)),
                onClear: _whelpingDate != null ? () => setState(() => _whelpingDate = null) : null,
              ),
              const SizedBox(height: 12),
              if (_whelpingDate != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: _totalBorn?.toString(),
                        decoration: const InputDecoration(labelText: 'Total Born'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => _totalBorn = int.tryParse(v),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        initialValue: _males?.toString(),
                        decoration: const InputDecoration(labelText: 'Males'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => _males = int.tryParse(v),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        initialValue: _females?.toString(),
                        decoration: const InputDecoration(labelText: 'Females'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => _females = int.tryParse(v),
                      ),
                    ),
                  ],
                ),
              ],
              
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _save,
                child: Text(isEdit ? 'Save Changes' : 'Add Record'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
        const SizedBox(width: 8),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class _DateCard extends StatelessWidget {
  const _DateCard({required this.label, required this.date, required this.onTap, this.onClear});
  final String label;
  final DateTime? date;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.calendar_today, size: 18),
          suffixIcon: onClear != null ? IconButton(icon: const Icon(Icons.clear, size: 18), onPressed: onClear) : null,
        ),
        child: Text(date != null ? DateFormat('MMM d, yyyy').format(date!) : 'Not set'),
      ),
    );
  }
}
