import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/medical_history/domain/medical_record.dart';
import 'package:petly/features/medical_history/presentation/medical_record_providers.dart';

class MedicalRecordFormScreen extends ConsumerStatefulWidget {
  const MedicalRecordFormScreen({required this.petId, this.recordId, super.key});
  final String petId;
  final String? recordId;

  @override
  ConsumerState<MedicalRecordFormScreen> createState() => _State();
}

class _State extends ConsumerState<MedicalRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _symptoms = TextEditingController();
  final _diagnosis = TextEditingController();
  final _treatment = TextEditingController();
  final _vet = TextEditingController();
  final _clinic = TextEditingController();
  final _notes = TextEditingController();

  final List<({String path, String caption})> _pendingAttachments = [];

  DateTime _occurredOn = DateTime.now();
  DateTime? _followUpOn;
  String _recordType = 'visit';
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _title.dispose();
    _symptoms.dispose();
    _diagnosis.dispose();
    _treatment.dispose();
    _vet.dispose();
    _clinic.dispose();
    _notes.dispose();
    super.dispose();
  }

  void _load(MedicalRecord r) {
    if (_loaded) return;
    _loaded = true;
    _title.text = r.title;
    _symptoms.text = r.symptoms ?? '';
    _diagnosis.text = r.diagnosis ?? '';
    _treatment.text = r.treatment ?? '';
    _vet.text = r.veterinarian ?? '';
    _clinic.text = r.clinic ?? '';
    _notes.text = r.notes ?? '';
    _occurredOn = r.occurredOn;
    _followUpOn = r.followUpOn;
    _recordType = r.recordType;
  }

  Future<void> _pickDate({required bool isFollowUp}) async {
    final init = isFollowUp
        ? (_followUpOn ?? DateTime.now().add(const Duration(days: 7)))
        : _occurredOn;
    final r = await showDatePicker(
      context: context,
      initialDate: init,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (r != null) setState(() => isFollowUp ? _followUpOn = r : _occurredOn = r);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final id = await ref.read(medicalRecordRepositoryProvider).save(
            id: widget.recordId,
            petId: widget.petId,
            recordType: _recordType,
            occurredOn: _occurredOn,
            title: _title.text,
            symptoms: _symptoms.text.nullIfEmpty,
            diagnosis: _diagnosis.text.nullIfEmpty,
            treatment: _treatment.text.nullIfEmpty,
            veterinarian: _vet.text.nullIfEmpty,
            clinic: _clinic.text.nullIfEmpty,
            followUpOn: _followUpOn,
            notes: _notes.text.nullIfEmpty,
          );
      
      for (final a in _pendingAttachments) {
        await ref.read(medicalRecordRepositoryProvider).addAttachment(id, a.path, a.caption);
      }
      
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Could not save record.')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    final isEdit = widget.recordId != null;
    if (isEdit) {
      ref.watch(medicalRecordProvider(widget.recordId!)).whenData((v) {
        if (v != null) _load(v);
      });
    }

    return LoadingOverlay(
      isLoading: _saving,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit record' : 'Add medical record'),
          actions: [
            if (isEdit)
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: () => _delete(context),
              ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
            children: [
              // Type selector
              _TypeSelector(
                value: _recordType,
                onChanged: (v) => setState(() => _recordType = v),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _title,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Title / reason *',
                  prefixIcon: Icon(Icons.medical_information_outlined),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 14),
              _DateRow(
                label: 'Date occurred *',
                icon: Icons.event_rounded,
                value: _occurredOn,
                onTap: () => _pickDate(isFollowUp: false),
              ),
              const SizedBox(height: 14),
              _DateRow(
                label: 'Follow-up date (optional)',
                icon: Icons.event_repeat_rounded,
                value: _followUpOn,
                onTap: () => _pickDate(isFollowUp: true),
                onClear: _followUpOn != null ? () => setState(() => _followUpOn = null) : null,
              ),
              const SizedBox(height: 20),
              _Divider('Clinical details'),
              const SizedBox(height: 14),
              TextFormField(
                controller: _symptoms,
                minLines: 2,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Symptoms (optional)',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.sick_outlined),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _diagnosis,
                minLines: 2,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Diagnosis (optional)',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _treatment,
                minLines: 2,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Treatment (optional)',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.healing_outlined),
                ),
              ),
              const SizedBox(height: 20),
              _Divider('Provider'),
              const SizedBox(height: 14),
              TextFormField(
                controller: _vet,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Veterinarian (optional)',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _clinic,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Clinic (optional)',
                  prefixIcon: Icon(Icons.local_hospital_outlined),
                ),
              ),
              const SizedBox(height: 20),
              _Divider('Notes'),
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
              const SizedBox(height: 20),
              _Divider('Attached Documents'),
              const SizedBox(height: 14),
              _buildAttachmentsSection(isEdit),
              const SizedBox(height: 28),
              FilledButton(
                onPressed: _saving ? null : _save,
                style: FilledButton.styleFrom(backgroundColor: AppTheme.medicalColor),
                child: Text(isEdit ? 'Save changes' : 'Add record'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachmentsSection(bool isEdit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isEdit)
          ref.watch(medicalRecordAttachmentsProvider(widget.recordId!)).when(
            data: (attachments) {
              if (attachments.isEmpty) return const SizedBox.shrink();
              return Column(
                children: attachments.map((a) => ListTile(
                  leading: const Icon(Icons.image_outlined, color: AppTheme.medicalColor),
                  title: Text(a.caption ?? 'Document'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            InteractiveViewer(
                              child: Image.file(File(a.absolutePath)),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon: const Icon(Icons.close, color: Colors.white, shadows: [Shadow(blurRadius: 10, color: Colors.black)]),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
                    onPressed: () async {
                      await ref.read(medicalRecordRepositoryProvider).deleteAttachment(a.id);
                      ref.invalidate(medicalRecordAttachmentsProvider(widget.recordId!));
                    },
                  ),
                )).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => const Text('Failed to load documents'),
          ),
        
        if (_pendingAttachments.isNotEmpty)
          Column(
            children: _pendingAttachments.map((a) => ListTile(
              leading: const Icon(Icons.image_outlined, color: Colors.orange),
              title: Text(a.caption),
              subtitle: const Text('Pending upload'),
              trailing: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => setState(() => _pendingAttachments.remove(a)),
              ),
            )).toList(),
          ),
          
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _pickDocument,
          icon: const Icon(Icons.add_photo_alternate_outlined),
          label: const Text('Add Document Photo'),
        ),
      ],
    );
  }

  Future<void> _pickDocument() async {
    final type = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(title: Text('Select Document Type', style: TextStyle(fontWeight: FontWeight.bold))),
              ListTile(title: const Text('Prescription'), onTap: () => context.pop('Prescription')),
              ListTile(title: const Text('Bill / Invoice'), onTap: () => context.pop('Bill / Invoice')),
              ListTile(title: const Text('Lab Report'), onTap: () => context.pop('Lab Report')),
              ListTile(title: const Text('X-Ray'), onTap: () => context.pop('X-Ray')),
              ListTile(title: const Text('Other'), onTap: () => context.pop('Other')),
            ],
          ),
        );
      },
    );

    if (type == null) return;

    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pendingAttachments.add((path: picked.path, caption: type));
      });
    }
  }

  Future<void> _delete(BuildContext ctx) async {
    final ok = await showDialog<bool>(
      context: ctx,
      builder: (d) => AlertDialog(
        title: const Text('Delete record?'),
        content: const Text('This medical record will be permanently deleted.'),
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
    await ref.read(medicalRecordRepositoryProvider).delete(widget.recordId!);
    if (mounted) context.pop();
  }
}

class _TypeSelector extends StatelessWidget {
  const _TypeSelector({required this.value, required this.onChanged});
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    const types = [
      ('visit', 'Visit', Icons.local_hospital_rounded),
      ('condition', 'Condition', Icons.monitor_heart_outlined),
      ('surgery', 'Surgery', Icons.medical_services_outlined),
      ('emergency', 'Emergency', Icons.emergency_rounded),
      ('other', 'Other', Icons.description_outlined),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: types.map((t) {
          final selected = value == t.$1;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              selected: selected,
              avatar: Icon(t.$3, size: 16),
              label: Text(t.$2),
              onSelected: (_) => onChanged(t.$1),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _DateRow extends StatelessWidget {
  const _DateRow({required this.label, required this.icon, required this.value, required this.onTap, this.onClear});
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
              ? IconButton(icon: const Icon(Icons.clear_rounded, size: 18), onPressed: onClear)
              : const Icon(Icons.calendar_today_outlined, size: 18),
        ),
        child: Text(
          value == null ? 'Not set' : DateFormat('MMM d, yyyy').format(value!),
          style: TextStyle(
            color: value == null ? Theme.of(context).colorScheme.onSurface.withOpacity(0.45) : null,
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
        Text(title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                )),
        const SizedBox(width: 8),
        const Expanded(child: Divider()),
      ],
    );
  }
}
