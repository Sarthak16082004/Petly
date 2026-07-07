import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/food/data/food_repository.dart';
import 'package:uuid/uuid.dart';

class MealLogFormScreen extends ConsumerStatefulWidget {
  const MealLogFormScreen({required this.petId, this.logToEdit, super.key});
  final String petId;
  final MealLog? logToEdit;

  @override
  ConsumerState<MealLogFormScreen> createState() => _MealLogFormScreenState();
}

class _MealLogFormScreenState extends ConsumerState<MealLogFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late DateTime _time;
  String? _selectedFoodId;
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final edit = widget.logToEdit;
    _time = edit?.fedAt ?? DateTime.now();
    _selectedFoodId = edit?.foodId;
    if (edit?.amountGrams != null) _amountController.text = edit!.amountGrams.toString();
    if (edit?.notes != null) _notesController.text = edit!.notes!;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    final repo = ref.read(foodRepositoryProvider);
    final isEditing = widget.logToEdit != null;
    
    final log = MealLog(
      id: isEditing ? widget.logToEdit!.id : const Uuid().v4(),
      petId: widget.petId,
      foodId: _selectedFoodId,
      fedAt: _time,
      amountGrams: double.parse(_amountController.text),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      createdAt: isEditing ? widget.logToEdit!.createdAt : DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Note: logMeal already uses insertOrReplace, but for editing we might not want to deduct inventory again 
    // if the amount hasn't changed. For simplicity, we just use the existing logMeal method, but we should 
    // ideally use updateMealLog if we add one to the repository. For now, logMeal will overwrite and re-deduct.
    // Wait, logMeal will deduct inventory again if we edit it. That's a bug!
    // I need to add updateMealLog to food_repository.
    if (isEditing) {
      await repo.updateMealLog(log);
    } else {
      await repo.logMeal(log);
    }
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final inventoryAsync = ref.watch(foodRepositoryProvider).watchInventories(widget.petId);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text('Log Meal', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: const Text('Time Fed'),
                subtitle: Text(DateFormat.jm().format(_time)),
                trailing: const Icon(Icons.access_time),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_time),
                  );
                  if (picked != null) {
                    final now = DateTime.now();
                    setState(() {
                      _time = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              StreamBuilder<List<FoodInventory>>(
                stream: inventoryAsync,
                builder: (context, snapshot) {
                  final invs = snapshot.data ?? [];
                  return DropdownButtonFormField<String>(
                    value: _selectedFoodId,
                    decoration: InputDecoration(
                      labelText: 'Food from Inventory (Optional)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                      filled: true,
                    ),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('None / Other')),
                      ...invs.map((inv) => DropdownMenuItem(value: inv.id, child: Text('${inv.brand} ${inv.name}')))
                    ],
                    onChanged: (val) => setState(() => _selectedFoodId = val),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount (grams)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                  suffixText: 'g',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Required';
                  if (double.tryParse(val) == null) return 'Must be a number';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Notes (e.g. refused to eat, mixed with water)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Save Meal Log', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
