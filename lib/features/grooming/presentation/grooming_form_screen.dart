import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/grooming/data/grooming_repository.dart';
import 'package:uuid/uuid.dart';

class GroomingFormScreen extends ConsumerStatefulWidget {
  const GroomingFormScreen({required this.petId, super.key});
  final String petId;

  @override
  ConsumerState<GroomingFormScreen> createState() => _GroomingFormScreenState();
}

class _GroomingFormScreenState extends ConsumerState<GroomingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _type = 'Bath';
  final _types = ['Bath', 'Haircut', 'Nail Trim', 'Ear Cleaning', 'Teeth Brushing', 'Full Groom', 'Other'];
  
  DateTime _date = DateTime.now();
  final _groomerController = TextEditingController();
  final _costController = TextEditingController();
  final _notesController = TextEditingController();
  
  bool _setReminder = false;
  DateTime? _nextDueDate;

  @override
  void dispose() {
    _groomerController.dispose();
    _costController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final repo = ref.read(groomingRepositoryProvider);
    final log = GroomingLog(
      id: const Uuid().v4(),
      petId: widget.petId,
      groomingType: _type,
      date: _date,
      groomerName: _groomerController.text.trim().isEmpty ? null : _groomerController.text.trim(),
      cost: double.tryParse(_costController.text),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      nextDueDate: _setReminder ? _nextDueDate : null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repo.addGroomingLog(log);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text('Add Grooming Log', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _type,
                decoration: InputDecoration(
                  labelText: 'Grooming Type',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
                items: _types.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (val) => setState(() => _type = val!),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(DateFormat.yMMMd().format(_date)),
                trailing: const Icon(Icons.calendar_today),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => _date = picked);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _groomerController,
                decoration: InputDecoration(
                  labelText: 'Groomer Name (Optional)',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _costController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Cost (Optional)',
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Set Next Due Date'),
                subtitle: const Text('Get reminded for the next session'),
                value: _setReminder,
                onChanged: (val) {
                  setState(() {
                    _setReminder = val;
                    if (val && _nextDueDate == null) {
                      _nextDueDate = _date.add(const Duration(days: 30));
                    }
                  });
                },
              ),
              if (_setReminder) ...[
                const SizedBox(height: 8),
                ListTile(
                  title: const Text('Next Due Date'),
                  subtitle: Text(DateFormat.yMMMd().format(_nextDueDate!)),
                  trailing: const Icon(Icons.calendar_today, color: Colors.redAccent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                  ),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _nextDueDate!,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() => _nextDueDate = picked);
                    }
                  },
                ),
              ],
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Save Log', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
