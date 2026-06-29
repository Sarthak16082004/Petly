import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/appointments/domain/appointment.dart';
import 'package:petly/features/appointments/presentation/appointment_providers.dart';

class AppointmentFormScreen extends ConsumerStatefulWidget {
  const AppointmentFormScreen({required this.petId, this.appointmentId, super.key});
  final String petId;
  final String? appointmentId;

  @override
  ConsumerState<AppointmentFormScreen> createState() => _State();
}

class _State extends ConsumerState<AppointmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _provider = TextEditingController();
  final _location = TextEditingController();
  final _notes = TextEditingController();

  DateTime _startsAt = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _time = TimeOfDay.now();
  String _type = 'Vet visit';
  String _status = 'scheduled';
  int? _durationMinutes;
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _title.dispose();
    _provider.dispose();
    _location.dispose();
    _notes.dispose();
    super.dispose();
  }

  void _load(Appointment a) {
    if (_loaded) return;
    _loaded = true;
    _title.text = a.title;
    _provider.text = a.providerName ?? '';
    _location.text = a.location ?? '';
    _notes.text = a.notes ?? '';
    _startsAt = a.startsAt;
    _time = TimeOfDay.fromDateTime(a.startsAt);
    _type = a.appointmentType;
    _status = a.status;
    _durationMinutes = a.durationMinutes;
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startsAt,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime(2040),
    );
    if (!mounted || date == null) return;
    final time = await showTimePicker(context: context, initialTime: _time);
    if (!mounted || time == null) return;
    setState(() {
      _time = time;
      _startsAt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      await ref.read(appointmentRepositoryProvider).save(
            id: widget.appointmentId,
            petId: widget.petId,
            title: _title.text,
            appointmentType: _type,
            startsAt: _startsAt,
            timezoneId: 'UTC',
            durationMinutes: _durationMinutes,
            providerName: _provider.text.nullIfEmpty,
            location: _location.text.nullIfEmpty,
            notes: _notes.text.nullIfEmpty,
            status: _status,
          );
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Could not save appointment.')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.appointmentId != null;
    if (isEdit) {
      ref.watch(appointmentProvider(widget.appointmentId!)).whenData((v) {
        if (v != null) _load(v);
      });
    }

    return LoadingOverlay(
      isLoading: _saving,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit appointment' : 'Add appointment'),
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
              TextFormField(
                controller: _title,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Title *',
                  prefixIcon: Icon(Icons.event_outlined),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 14),

              // Type chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Appointment.types.map((t) {
                    final sel = t == _type;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(t),
                        selected: sel,
                        onSelected: (_) => setState(() => _type = t),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 14),

              // Date & time picker
              InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: _pickDateTime,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date & time *',
                    prefixIcon: Icon(Icons.event_rounded),
                    suffixIcon: Icon(Icons.edit_calendar_outlined, size: 18),
                  ),
                  child: Text(_startsAt.toDisplayDateTime()),
                ),
              ),
              const SizedBox(height: 14),

              // Duration
              DropdownButtonFormField<int?>(
                value: _durationMinutes,
                decoration: const InputDecoration(
                  labelText: 'Duration (optional)',
                  prefixIcon: Icon(Icons.timelapse_rounded),
                ),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Not set')),
                  DropdownMenuItem(value: 15, child: Text('15 min')),
                  DropdownMenuItem(value: 30, child: Text('30 min')),
                  DropdownMenuItem(value: 60, child: Text('1 hour')),
                  DropdownMenuItem(value: 90, child: Text('1.5 hours')),
                  DropdownMenuItem(value: 120, child: Text('2 hours')),
                ],
                onChanged: (v) => setState(() => _durationMinutes = v),
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
                  DropdownMenuItem(value: 'scheduled', child: Text('Scheduled')),
                  DropdownMenuItem(value: 'completed', child: Text('Completed')),
                  DropdownMenuItem(value: 'cancelled', child: Text('Cancelled')),
                  DropdownMenuItem(value: 'missed', child: Text('Missed')),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _provider,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Provider / vet (optional)',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _location,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Location (optional)',
                  prefixIcon: Icon(Icons.place_outlined),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _notes,
                minLines: 3,
                maxLines: 5,
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
                style: FilledButton.styleFrom(backgroundColor: AppTheme.appointmentColor),
                child: Text(isEdit ? 'Save changes' : 'Add appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _delete(BuildContext ctx) async {
    final ok = await showDialog<bool>(
      context: ctx,
      builder: (d) => AlertDialog(
        title: const Text('Delete appointment?'),
        content: const Text('This appointment will be permanently deleted.'),
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
    await ref.read(appointmentRepositoryProvider).delete(widget.appointmentId!);
    if (mounted) context.pop();
  }
}
