import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/medication_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class RegisterMedicationScreen extends StatelessWidget {
  const RegisterMedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicationController = GetIt.I<MedicationController>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Registrar Medicamento'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Preencha as informações do medicamento:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: medicationController.updateName,
                decoration: const InputDecoration(
                  hintText: 'Nome do medicamento',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: medicationController.updateDosage,
                decoration: const InputDecoration(
                  hintText: 'Dosagem (ex: 500mg)',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    medicationController.updateTime(time);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Escolher horário',
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        medicationController.time?.format(context) ??
                            'Não definido',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dias da semana:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Wrap(
                spacing: 10,
                children: List.generate(7, (index) {
                  final day = medicationController.weekDays[index];
                  return FilterChip(
                    label: Text(
                      day,
                      style: const TextStyle(color: Colors.white),
                    ),
                    selected: medicationController.selectedDays.contains(day),
                    onSelected: (selected) {
                      medicationController.toggleDay(day);
                    },
                    backgroundColor: Colors.grey[800],
                    selectedColor: Colors.teal,
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ativar lembrete',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Switch(
                    value: medicationController.isActive,
                    onChanged: (value) {
                      medicationController.toggleActive(value);
                    },
                    activeColor: Colors.teal,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  medicationController.saveMedication();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Sucesso'),
                        content: const Text(
                          'O medicamento foi salvo com sucesso!',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/medication',
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: medicationController.weekDays.length,
                  itemBuilder: (context, index) {
                    final day = medicationController.weekDays[index];
                    final medicationsForDay =
                        medicationController.medications
                            .where((med) => med.days.contains(day))
                            .toList();

                    return medicationsForDay.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              day,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...medicationsForDay.map(
                              (medication) => Card(
                                color: Colors.grey[900],
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    medication.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register-medication');
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
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
              Navigator.pushReplacementNamed(context, '/register-doctor');
              break;
          }
        },
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    switch (currentRoute) {
      case '/profile':
        return 0;
      case '/calendar':
        return 1;
      case '/medication':
        return 2;
      case '/alarms':
        return 3;
      default:
        return 0;
    }
  }
}
