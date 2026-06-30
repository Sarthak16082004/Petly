import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/dewormings/domain/deworming.dart';
import 'package:petly/features/dewormings/presentation/deworming_providers.dart';

class DewormingFormScreen extends ConsumerStatefulWidget {
  const DewormingFormScreen({required this.petId, super.key});
  final String petId;

  @override
  ConsumerState<DewormingFormScreen> createState() => _DewormingFormScreenState();
}

class _DewormingFormScreenState extends ConsumerState<DewormingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _medName = '';
  DateTime _administeredOn = DateTime.now();
  DateTime? _nextDueOn;

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final deworming = Deworming(
      id: '',
      petId: widget.petId,
      medicationName: _medName,
      administeredOn: _administeredOn,
      nextDueOn: _nextDueOn,
    );

    await ref.read(dewormingRepositoryProvider).addDeworming(deworming);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Deworming')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Medication Name (e.g., Drontal)'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                onSaved: (v) => _medName = v!,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Administered On'),
                subtitle: Text(_administeredOn.toLocal().toString().split(' ')[0]),
                trailing: const Icon(Icons.calendar_month),
                onTap: () async {
                  final d = await showDatePicker(
                    context: context,
                    initialDate: _administeredOn,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (d != null) setState(() => _administeredOn = d);
                },
              ),
              ListTile(
                title: const Text('Next Due (Optional)'),
                subtitle: Text(_nextDueOn?.toLocal().toString().split(' ')[0] ?? 'Select date'),
                trailing: const Icon(Icons.calendar_month),
                onTap: () async {
                  final d = await showDatePicker(
                    context: context,
                    initialDate: _nextDueOn ?? DateTime.now().add(const Duration(days: 90)),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (d != null) setState(() => _nextDueOn = d);
                },
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(backgroundColor: const Color(0xFFa855f7)),
                child: const Text('Save Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
