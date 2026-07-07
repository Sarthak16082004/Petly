import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/food/data/food_repository.dart';
import 'package:uuid/uuid.dart';

class FoodInventoryFormScreen extends ConsumerStatefulWidget {
  const FoodInventoryFormScreen({required this.petId, super.key});
  final String petId;

  @override
  ConsumerState<FoodInventoryFormScreen> createState() => _FoodInventoryFormScreenState();
}

class _FoodInventoryFormScreenState extends ConsumerState<FoodInventoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _brandController = TextEditingController();
  final _nameController = TextEditingController();
  final _weightController = TextEditingController(); // in kg

  @override
  void dispose() {
    _brandController.dispose();
    _nameController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    final kg = double.parse(_weightController.text);
    final grams = kg * 1000;

    final repo = ref.read(foodRepositoryProvider);
    final inv = FoodInventory(
      id: const Uuid().v4(),
      petId: widget.petId,
      brand: _brandController.text.trim(),
      name: _nameController.text.trim(),
      totalWeightGrams: grams,
      remainingWeightGrams: grams, // Initially full
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repo.addInventory(inv);
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
        title: Text('Add Food Bag', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _brandController,
                decoration: InputDecoration(
                  labelText: 'Brand (e.g. Royal Canin)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name (e.g. Puppy Maxi)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Bag Weight (kg)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                  suffixText: 'kg',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Required';
                  if (double.tryParse(val) == null) return 'Must be a number';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Add to Inventory', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
