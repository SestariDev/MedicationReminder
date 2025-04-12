import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medication_remminder/widgets/custom_bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import '../controllers/doctor_controller.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorController = GetIt.I<DoctorController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Lista de Médicos'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body:
          doctorController.doctors.isEmpty
              ? const Center(
                child: Text(
                  'Nenhum médico registrado',
                  style: TextStyle(color: Colors.white),
                ),
              )
              : ListView.builder(
                itemCount: doctorController.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctorController.doctors[index];
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: ListTile(
                      title: Text(
                        doctor.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Specialty: ${doctor.specialty}\nPhone: ${doctor.phone}',
                        style: const TextStyle(color: Colors.white54),
                      ),
                    ),
                  );
                },
              ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/Perfil');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/Calendario');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/Medicamento');
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register-doctor');
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
