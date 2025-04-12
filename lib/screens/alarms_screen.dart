import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../controllers/medication_controller.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicationController = GetIt.I<MedicationController>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Alarmes'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: medicationController,
        builder: (context, _) {
          return ListView.builder(
            itemCount: medicationController.medications.length,
            itemBuilder: (context, index) {
              final medication = medicationController.medications[index];
              return ListTile(
                title: Text(
                  medication.name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Horário: ${medication.time.format(context)}',
                  style: const TextStyle(color: Colors.white54),
                ),
                trailing: Switch(
                  value: medicationController.isAlarmEnabled(medication),
                  onChanged: (value) {
                    medicationController.toggleAlarm(medication, value);
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/Perfil');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/Calendario');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/Medicamentos');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/Alarmes');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/Sobre');
              break;
          }
        },
      ),
    );
  }
}
