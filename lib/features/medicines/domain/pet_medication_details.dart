import 'package:petly/core/database/app_database.dart';

class PetMedicationDetails {
  const PetMedicationDetails({
    required this.petMedication,
    required this.medicine,
    required this.schedules,
  });

  final PetMedication petMedication;
  final Medicine medicine;
  final List<MedicationSchedule> schedules;
}
