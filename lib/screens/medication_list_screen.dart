import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/medication_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class MedicationListScreen extends StatelessWidget {
  const MedicationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicationController = GetIt.I<MedicationController>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Lista de Medicamentos'),
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
                  medication.time.format(context),
                  style: const TextStyle(color: Colors.white54),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.teal),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/register-medication',
                      arguments: medication,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.pushNamed(context, '/register-medication');
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/calendar');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/medication');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/alarms');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/about');
              break;
          }
        },
      ),
    );
  }
}
