import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/emergency/data/vet_contact_repository.dart';
import 'package:uuid/uuid.dart';

class VetContactFormScreen extends ConsumerStatefulWidget {
  const VetContactFormScreen({required this.petId, this.contactToEdit, super.key});
  final String petId;
  final VetContact? contactToEdit;

  @override
  ConsumerState<VetContactFormScreen> createState() => _VetContactFormScreenState();
}

class _VetContactFormScreenState extends ConsumerState<VetContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _clinicController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  late bool _isEmergency;

  @override
  void initState() {
    super.initState();
    final edit = widget.contactToEdit;
    if (edit != null) {
      _nameController.text = edit.name;
      if (edit.clinicName != null) _clinicController.text = edit.clinicName!;
      _phoneController.text = edit.phoneNumber;
      if (edit.address != null) _addressController.text = edit.address!;
      if (edit.notes != null) _notesController.text = edit.notes!;
      _isEmergency = edit.isEmergency;
    } else {
      _isEmergency = false;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _clinicController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    final repo = ref.read(vetContactRepositoryProvider);
    final isEditing = widget.contactToEdit != null;
    
    final contact = VetContact(
      id: isEditing ? widget.contactToEdit!.id : const Uuid().v4(),
      petId: widget.petId,
      name: _nameController.text.trim(),
      clinicName: _clinicController.text.trim().isEmpty ? null : _clinicController.text.trim(),
      phoneNumber: _phoneController.text.trim(),
      address: _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
      isEmergency: _isEmergency,
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      createdAt: isEditing ? widget.contactToEdit!.createdAt : DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (isEditing) {
      await repo.updateContact(contact);
    } else {
      await repo.addContact(contact);
    }
    
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
        title: Text(widget.contactToEdit == null ? 'Add Contact' : 'Edit Contact', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SwitchListTile(
                title: const Text('Is this an Emergency Contact?'),
                subtitle: const Text('Emergency contacts are highlighted in red'),
                value: _isEmergency,
                activeColor: Colors.redAccent,
                onChanged: (val) => setState(() => _isEmergency = val),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name (e.g. Dr. Smith, Poison Control)',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _clinicController,
                decoration: InputDecoration(
                  labelText: 'Clinic / Hospital Name (Optional)',
                  prefixIcon: const Icon(Icons.local_hospital),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Address (Optional)',
                  prefixIcon: const Icon(Icons.location_on),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Notes (Optional)',
                  prefixIcon: const Icon(Icons.notes),
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
                  backgroundColor: _isEmergency ? Colors.redAccent : colorScheme.primary,
                ),
                child: Text('Save Contact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _isEmergency ? Colors.white : colorScheme.onPrimary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
