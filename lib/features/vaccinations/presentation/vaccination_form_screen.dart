import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/utils/dialog_utils.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/vaccinations/domain/vaccination.dart';
import 'package:petly/features/vaccinations/presentation/vaccination_providers.dart';

class VaccinationFormScreen extends ConsumerStatefulWidget {
  const VaccinationFormScreen({
    required this.petId,
    this.vaccinationId,
    super.key,
  });
  final String petId;
  final String? vaccinationId;

  @override
  ConsumerState<VaccinationFormScreen> createState() =>
      _VaccinationFormScreenState();
}

class _VaccinationFormScreenState
    extends ConsumerState<VaccinationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _disease = TextEditingController();
  final _manufacturer = TextEditingController();
  final _batch = TextEditingController();
  final _vet = TextEditingController();
  final _clinic = TextEditingController();
  final _notes = TextEditingController();

  DateTime _administeredOn = DateTime.now();
  DateTime? _nextDueOn;
  int? _doseNumber;
  String _status = 'completed';
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _name.dispose();
    _disease.dispose();
    _manufacturer.dispose();
    _batch.dispose();
    _vet.dispose();
    _clinic.dispose();
    _notes.dispose();
    super.dispose();
  }

  void _load(Vaccination v) {
    if (_loaded) return;
    _loaded = true;
    _name.text = v.vaccineName;
    _disease.text = v.disease ?? '';
    _manufacturer.text = v.manufacturer ?? '';
    _batch.text = v.batchNumber ?? '';
    _vet.text = v.veterinarian ?? '';
    _clinic.text = v.clinic ?? '';
    _notes.text = v.notes ?? '';
    _administeredOn = v.administeredOn;
    _nextDueOn = v.nextDueOn;
    _doseNumber = v.doseNumber;
    _status = v.status;
  }

  Future<void> _pickDate({required bool isNextDue}) async {
    final initial = isNextDue
        ? (_nextDueOn ?? DateTime.now().add(const Duration(days: 365)))
        : _administeredOn;
    final result = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (result != null) {
      setState(() {
        if (isNextDue) {
          _nextDueOn = result;
        } else {
          _administeredOn = result;
        }
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      await ref.read(vaccinationRepositoryProvider).save(
            id: widget.vaccinationId,
            petId: widget.petId,
            vaccineName: _name.text,
            administeredOn: _administeredOn,
            disease: _disease.text.nullIfEmpty,
            manufacturer: _manufacturer.text.nullIfEmpty,
            batchNumber: _batch.text.nullIfEmpty,
            doseNumber: _doseNumber,
            nextDueOn: _nextDueOn,
            veterinarian: _vet.text.nullIfEmpty,
            clinic: _clinic.text.nullIfEmpty,
            notes: _notes.text.nullIfEmpty,
            status: _status,
          );
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save vaccination.')),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.vaccinationId != null;
    if (isEdit) {
      final existing = ref.watch(vaccinationProvider(widget.vaccinationId!));
      existing.whenData((v) {
        if (v != null) _load(v);
      });
    }

    return LoadingOverlay(
      isLoading: _saving,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit vaccination' : 'Add vaccination'),
          actions: [
            if (isEdit)
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded),
                tooltip: 'Delete',
                onPressed: () => _confirmDelete(context),
              ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.vaccinationColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.vaccinationColor.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.vaccines_rounded,
                        color: AppTheme.vaccinationColor, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      isEdit
                          ? 'Update vaccination record'
                          : 'Record a new vaccination',
                      style: TextStyle(
                        color: AppTheme.vaccinationColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Vaccine name
              TextFormField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Vaccine name *',
                  prefixIcon: Icon(Icons.vaccines_outlined),
                ),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _disease,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Disease / protection (optional)',
                  prefixIcon: Icon(Icons.shield_outlined),
                ),
              ),
              const SizedBox(height: 14),

              // Administered on
              _DateField(
                label: 'Administered on *',
                icon: Icons.event_available_rounded,
                value: _administeredOn,
                onTap: () => _pickDate(isNextDue: false),
              ),
              const SizedBox(height: 14),
              _DateField(
                label: 'Next due on (optional)',
                icon: Icons.schedule_rounded,
                value: _nextDueOn,
                onTap: () => _pickDate(isNextDue: true),
                onClear: _nextDueOn != null
                    ? () => setState(() => _nextDueOn = null)
                    : null,
              ),
              const SizedBox(height: 14),

              // Dose
              TextFormField(
                initialValue: _doseNumber?.toString(),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Dose number (optional)',
                  prefixIcon: Icon(Icons.numbers_rounded),
                ),
                onChanged: (v) =>
                    setState(() => _doseNumber = int.tryParse(v)),
              ),
              const SizedBox(height: 14),

              // Status
              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  prefixIcon: Icon(Icons.flag_outlined),
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'completed', child: Text('Completed')),
                  DropdownMenuItem(
                      value: 'scheduled', child: Text('Scheduled')),
                  DropdownMenuItem(value: 'skipped', child: Text('Skipped')),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),
              const SizedBox(height: 20),

              const _SectionDivider(title: 'Provider details (optional)'),
              const SizedBox(height: 14),
              TextFormField(
                controller: _vet,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Veterinarian',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _clinic,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Clinic / hospital',
                  prefixIcon: Icon(Icons.local_hospital_outlined),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _manufacturer,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Manufacturer',
                  prefixIcon: Icon(Icons.business_outlined),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _batch,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Batch number',
                  prefixIcon: Icon(Icons.tag_rounded),
                ),
              ),
              const SizedBox(height: 20),

              const _SectionDivider(title: 'Notes'),
              const SizedBox(height: 14),
              TextFormField(
                controller: _notes,
                minLines: 3,
                maxLines: 6,
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
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.vaccinationColor,
                ),
                child: Text(isEdit ? 'Save changes' : 'Add vaccination'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext ctx) async {
    final ok = await showDeleteConfirmationDialog(ctx, itemType: 'vaccination');
    if (ok != true || !mounted) return;
    await ref
        .read(vaccinationRepositoryProvider)
        .delete(widget.vaccinationId!);
    if (mounted) context.pop();
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.icon,
    required this.value,
    required this.onTap,
    this.onClear,
  });
  final String label;
  final IconData icon;
  final DateTime? value;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: onClear != null
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded, size: 18),
                  onPressed: onClear,
                )
              : const Icon(Icons.calendar_today_outlined, size: 18),
        ),
        child: Text(
          value == null ? 'Not set' : DateFormat('MMM d, yyyy').format(value!),
          style: TextStyle(
            color: value == null
                ? Theme.of(context).colorScheme.onSurface.withOpacity(0.45)
                : null,
          ),
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withOpacity(0.45),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
        ),
        const SizedBox(width: 8),
        const Expanded(child: Divider()),
      ],
    );
  }
}
