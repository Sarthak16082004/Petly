import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petly/features/owner_profile/presentation/owner_providers.dart';
import 'package:petly/features/pets/domain/pet.dart';
import 'package:petly/features/pets/presentation/pet_providers.dart';

class PetFormScreen extends ConsumerStatefulWidget {
  const PetFormScreen({this.petId, super.key});

  final String? petId;

  @override
  ConsumerState<PetFormScreen> createState() => _PetFormScreenState();
}

class _PetFormScreenState extends ConsumerState<PetFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _breed = TextEditingController();
  final _notes = TextEditingController();
  final _color = TextEditingController();
  final _weight = TextEditingController();
  String _species = 'Dog';
  String? _sex;
  String? _size;
  DateTime? _birthDate;
  String? _profilePicturePath;
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _name.dispose();
    _breed.dispose();
    _notes.dispose();
    _color.dispose();
    _weight.dispose();
    super.dispose();
  }

  void _load(Pet pet) {
    if (_loaded) return;
    _loaded = true;
    _name.text = pet.name;
    _breed.text = pet.breed ?? '';
    _notes.text = pet.notes ?? '';
    _color.text = pet.color ?? '';
    _weight.text = pet.weight?.toString() ?? '';
    _species = pet.species;
    _sex = pet.sex;
    _size = pet.size;
    _birthDate = pet.birthDate;
    _profilePicturePath = pet.profilePicturePath;
  }

  Future<void> _pickBirthDate() async {
    final result = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (result != null) setState(() => _birthDate = result);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _profilePicturePath = pickedFile.path);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final owner = ref.read(ownerProvider).value;
    if (owner == null) return;

    setState(() => _saving = true);
    try {
      await ref
          .read(petRepositoryProvider)
          .save(
            id: widget.petId,
            ownerId: owner.id,
            name: _name.text,
            species: _species,
            breed: _breed.text,
            sex: _sex,
            birthDate: _birthDate,
            color: _color.text,
            size: _size,
            weight: double.tryParse(_weight.text),
            profilePicturePath: _profilePicturePath,
            notes: _notes.text,
          );
      if (widget.petId != null) ref.invalidate(petProvider(widget.petId!));
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save this pet. Try again.')),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final existing = widget.petId == null
        ? const AsyncValue<Pet?>.data(null)
        : ref.watch(petProvider(widget.petId!));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petId == null ? 'Add pet' : 'Edit pet'),
      ),
      body: existing.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => const Center(child: Text('Could not load this pet.')),
        data: (pet) {
          if (pet != null) _load(pet);
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage: _profilePicturePath != null 
                        ? FileImage(File(_profilePicturePath!)) 
                        : null,
                      child: _profilePicturePath == null ? Icon(
                        _species == 'Cat'
                            ? Icons.cruelty_free_outlined
                            : Icons.pets_outlined,
                        size: 40,
                      ) : null,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  controller: _name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Pet name'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Enter a pet name'
                      : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _species,
                  decoration: const InputDecoration(labelText: 'Species'),
                  items: const ['Dog', 'Cat', 'Bird', 'Rabbit', 'Other']
                      .map(
                        (value) =>
                            DropdownMenuItem(value: value, child: Text(value)),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _species = value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _breed,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Breed (optional)',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _sex,
                  decoration: const InputDecoration(
                    labelText: 'Sex (optional)',
                  ),
                  items: const ['Female', 'Male', 'Unknown']
                      .map(
                        (value) =>
                            DropdownMenuItem(value: value, child: Text(value)),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _sex = value),
                ),
                const SizedBox(height: 16),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: _pickBirthDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Birth date (optional)',
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                    ),
                    child: Text(
                      _birthDate == null
                          ? 'Not set'
                          : DateFormat.yMMMd().format(_birthDate!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _color,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Color (optional)',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _size,
                  decoration: const InputDecoration(
                    labelText: 'Size (optional)',
                  ),
                  items: const ['Small', 'Medium', 'Large']
                      .map(
                        (value) =>
                            DropdownMenuItem(value: value, child: Text(value)),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _size = value),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _weight,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Weight (optional)',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _notes,
                  minLines: 3,
                  maxLines: 6,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Notes (optional)',
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(widget.petId == null ? 'Add pet' : 'Save changes'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
