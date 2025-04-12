import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/medication_controller.dart';

class MedicationDetailsScreen extends StatelessWidget {
  final Medication medication;

  const MedicationDetailsScreen({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    final medicationController = GetIt.I<MedicationController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(medication.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${medication.name}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Horário: ${medication.time.format(context)}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 10),
            Text(
              'Dias: ${medication.days.join(", ")}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                medicationController.toggleAlarm(medication, true);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text('Marcar como tomado'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                medicationController.medications.remove(medication);
                medicationController.notifyListeners();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Remover do calendário'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/edit-medication',
                  arguments: medication,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Editar medicamento'),
            ),
          ],
        ),
      ),
    );
  }
}
