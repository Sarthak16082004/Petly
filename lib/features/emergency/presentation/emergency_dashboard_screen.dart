import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/emergency/data/vet_contact_repository.dart';
import 'package:petly/features/emergency/presentation/vet_contact_form_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyDashboardScreen extends ConsumerWidget {
  const EmergencyDashboardScreen({required this.petId, super.key});
  final String petId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final contactsAsync = ref.watch(vetContactRepositoryProvider).watchContacts(petId);
    
    // For Vitals Cheat Sheet, we pull the Pet details and Active Meds
    final petAsync = ref.watch(databaseProvider).select(ref.watch(databaseProvider).pets)..where((t) => t.id.equals(petId));
    final petFuture = petAsync.getSingleOrNull();

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text('Emergency & Vets', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.redAccent)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VetContactFormScreen(petId: petId),
          ));
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Contact'),
        backgroundColor: colorScheme.primaryContainer,
      ),
      body: CustomScrollView(
        slivers: [
          // Vitals Cheat Sheet
          SliverToBoxAdapter(
            child: FutureBuilder<Pet?>(
              future: petFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();
                final pet = snapshot.data!;
                
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: Colors.redAccent.withOpacity(0.1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.medical_information, color: Colors.redAccent),
                              const SizedBox(width: 8),
                              Text('Vitals Cheat Sheet', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                            ],
                          ),
                          const Divider(height: 24),
                          _VitalRow(label: 'Species/Breed', value: '${pet.species} - ${pet.breed ?? "Unknown"}'),
                          if (pet.weight != null) ...[
                            const SizedBox(height: 8),
                            _VitalRow(label: 'Weight', value: '${pet.weight} kg'),
                          ],
                          if (pet.bloodType != null && pet.bloodType!.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            _VitalRow(label: 'Blood Type', value: pet.bloodType!),
                          ],
                          if (pet.microchipNumber != null && pet.microchipNumber!.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            _VitalRow(label: 'Microchip ID', value: pet.microchipNumber!),
                          ],
                          // Note: In a full app, we would also stream MedicalRecords here for allergies
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text('Veterinarians & Hotlines', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          
          StreamBuilder<List<VetContact>>(
            stream: contactsAsync,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              }
              final contacts = snapshot.data ?? [];
              if (contacts.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.contact_phone, size: 48, color: colorScheme.onSurface.withOpacity(0.2)),
                          const SizedBox(height: 16),
                          Text('No contacts added yet.', style: theme.textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface.withOpacity(0.5))),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final contact = contacts[index];
                    final isEmergency = contact.isEmergency;
                    
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 0,
                      color: isEmergency ? Colors.redAccent.withOpacity(0.1) : colorScheme.surfaceContainerHighest.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: isEmergency ? BorderSide(color: Colors.redAccent.withOpacity(0.5)) : BorderSide.none,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VetContactFormScreen(petId: petId, contactToEdit: contact),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(contact.name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                                        if (contact.clinicName != null) ...[
                                          Text(contact.clinicName!, style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.7))),
                                        ],
                                        const SizedBox(height: 8),
                                        Text(contact.phoneNumber, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    icon: const Icon(Icons.more_vert),
                                    onSelected: (value) async {
                                      if (value == 'edit') {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => VetContactFormScreen(petId: petId, contactToEdit: contact),
                                        ));
                                      } else if (value == 'delete') {
                                        await ref.read(vetContactRepositoryProvider).deleteContact(contact.id);
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(value: 'edit', child: Text('Edit')),
                                      const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
                                    ],
                                  ),
                                ],
                              ),
                              if (contact.address != null || contact.notes != null) const SizedBox(height: 8),
                              if (contact.address != null) ...[
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16),
                                    const SizedBox(width: 4),
                                    Expanded(child: Text(contact.address!, style: theme.textTheme.bodySmall)),
                                  ],
                                ),
                              ],
                              if (contact.notes != null) ...[
                                const SizedBox(height: 4),
                                Text(contact.notes!, style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic)),
                              ],
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: FilledButton.icon(
                                      onPressed: () async {
                                        final url = Uri.parse('tel:${contact.phoneNumber}');
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        }
                                      },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: isEmergency ? Colors.redAccent : colorScheme.primary,
                                        foregroundColor: Colors.white,
                                      ),
                                      icon: const Icon(Icons.phone),
                                      label: const Text('Call'),
                                    ),
                                  ),
                                  if (contact.address != null) ...[
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () async {
                                          final query = Uri.encodeComponent(contact.address!);
                                          final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          }
                                        },
                                        icon: const Icon(Icons.map),
                                        label: const Text('Map'),
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: contacts.length,
                ),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

class _VitalRow extends StatelessWidget {
  const _VitalRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
