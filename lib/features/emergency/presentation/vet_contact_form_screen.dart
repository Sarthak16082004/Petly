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
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  
  final List<TextEditingController> _phoneControllers = [];
  
  String _contactType = 'Veterinarian';
  late bool _isEmergency;

  @override
  void initState() {
    super.initState();
    final edit = widget.contactToEdit;
    if (edit != null) {
      _nameController.text = edit.name;
      if (edit.clinicName != null) _clinicController.text = edit.clinicName!;
      if (edit.address != null) _addressController.text = edit.address!;
      if (edit.notes != null) _notesController.text = edit.notes!;
      _isEmergency = edit.isEmergency;
      _contactType = edit.contactType;
      
      final phones = edit.phoneNumber.split(',');
      for (final p in phones) {
        if (p.trim().isNotEmpty) {
          _phoneControllers.add(TextEditingController(text: p.trim()));
        }
      }
    } else {
      _isEmergency = false;
      _contactType = 'Veterinarian';
    }
    
    // Ensure at least one phone field exists
    if (_phoneControllers.isEmpty) {
      _phoneControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _clinicController.dispose();
    for (final c in _phoneControllers) {
      c.dispose();
    }
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    // Combine phones
    final phones = _phoneControllers.map((c) => c.text.trim()).where((t) => t.isNotEmpty).toList();
    if (phones.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter at least one phone number')));
      return;
    }
    
    final repo = ref.read(vetContactRepositoryProvider);
    final isEditing = widget.contactToEdit != null;
    
    // If Personal, we don't save Clinic Name or Address
    final isPersonal = _contactType == 'Personal';
    
    final contact = VetContact(
      id: isEditing ? widget.contactToEdit!.id : const Uuid().v4(),
      petId: widget.petId,
      name: _nameController.text.trim(),
      contactType: _contactType,
      clinicName: isPersonal || _clinicController.text.trim().isEmpty ? null : _clinicController.text.trim(),
      phoneNumber: phones.join(','),
      address: isPersonal || _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
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
    final isPersonal = _contactType == 'Personal';

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
              // Contact Type Selector
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'Veterinarian', label: Text('Vet'), icon: Icon(Icons.pets)),
                  ButtonSegment(value: 'Clinic', label: Text('Clinic'), icon: Icon(Icons.local_hospital)),
                  ButtonSegment(value: 'Personal', label: Text('Personal'), icon: Icon(Icons.person)),
                ],
                selected: {_contactType},
                onSelectionChanged: (val) {
                  setState(() => _contactType = val.first);
                },
              ),
              const SizedBox(height: 24),
              
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
                  labelText: isPersonal ? 'Name (e.g. Uncle Bob)' : 'Name (e.g. Dr. Smith)',
                  prefixIcon: const Icon(Icons.badge),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                ),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              
              // Phone Numbers List
              Text('Phone Numbers', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ..._phoneControllers.asMap().entries.map((entry) {
                final idx = entry.key;
                final controller = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number ${idx + 1}',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                            filled: true,
                          ),
                          validator: (val) {
                            if (idx == 0 && (val == null || val.isEmpty)) return 'At least one number is required';
                            return null;
                          },
                        ),
                      ),
                      if (idx > 0) ...[
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _phoneControllers[idx].dispose();
                              _phoneControllers.removeAt(idx);
                            });
                          },
                        ),
                      ]
                    ],
                  ),
                );
              }).toList(),
              
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _phoneControllers.add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add another number'),
                ),
              ),
              
              if (!isPersonal) ...[
                const SizedBox(height: 16),
                const Divider(),
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
              ],
              
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
