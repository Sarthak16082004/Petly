import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/medicines/data/medicine_repository.dart';
import 'package:uuid/uuid.dart';

class MedicineFormScreen extends ConsumerStatefulWidget {
  const MedicineFormScreen({required this.petId, super.key});
  final String petId;

  @override
  ConsumerState<MedicineFormScreen> createState() => _MedicineFormScreenState();
}

class _MedicineFormScreenState extends ConsumerState<MedicineFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _medName = '';
  String _dosage = '';
  String _frequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text('Add Medication', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Medication Details', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Medication Name',
                  filled: true,
                  fillColor: colorScheme.surfaceContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                onSaved: (v) => _medName = v ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dosage (e.g., 1 tablet)',
                  filled: true,
                  fillColor: colorScheme.surfaceContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                onSaved: (v) => _dosage = v ?? '',
              ),
              const SizedBox(height: 32),
              
              Text('Frequency', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _frequency = 'Daily'),
                      child: _FreqPill(label: 'Daily', isSelected: _frequency == 'Daily'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _frequency = 'Weekly'),
                      child: _FreqPill(label: 'Weekly', isSelected: _frequency == 'Weekly'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _frequency = 'Monthly'),
                      child: _FreqPill(label: 'Monthly', isSelected: _frequency == 'Monthly'),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      
                      final medId = const Uuid().v4();
                      final petMedId = const Uuid().v4();
                      final now = DateTime.now();

                      final medicine = Medicine(
                        id: medId,
                        name: _medName,
                        createdAt: now,
                        updatedAt: now,
                      );

                      final petMed = PetMedication(
                        id: petMedId,
                        petId: widget.petId,
                        medicineId: medId,
                        dosage: _dosage,
                        startDate: now,
                        asNeeded: false,
                        status: 'active',
                        createdAt: now,
                        updatedAt: now,
                      );

                      String rrule = 'FREQ=DAILY';
                      if (_frequency == 'Weekly') rrule = 'FREQ=WEEKLY';
                      if (_frequency == 'Monthly') rrule = 'FREQ=MONTHLY';

                      final schedule = MedicationSchedule(
                        id: const Uuid().v4(),
                        petMedicationId: petMedId,
                        localTime: '09:00',
                        timezoneId: 'UTC',
                        recurrenceRule: rrule,
                        createdAt: now,
                        updatedAt: now,
                      );

                      await ref.read(medicineRepositoryProvider).addPetMedication(
                        medication: petMed,
                        medicine: medicine,
                        schedules: [schedule],
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Medication saved')));
                        context.pop();
                      }
                    }
                  },
                  child: const Text('Save Medication'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FreqPill extends StatelessWidget {
  const _FreqPill({required this.label, required this.isSelected});
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
