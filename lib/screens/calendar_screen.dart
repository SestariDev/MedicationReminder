import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../controllers/calendar_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../controllers/medication_controller.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarController = GetIt.I<CalendarController>();
    final medicationController = GetIt.I<MedicationController>();

    return ChangeNotifierProvider<CalendarController>.value(
      value: calendarController,
      child: Consumer<CalendarController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                'Calendário',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nesta tela, você pode visualizar todos os seus medicamentos agendados, com data, horário e observações.',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children:
                          medicationController.weekDays.map((day) {
                            final medicationsForDay =
                                medicationController.medications
                                    .where((med) => med.days.contains(day))
                                    .toList();

                            return Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    day,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ...medicationsForDay.map(
                                    (medication) => ListTile(
                                      title: Text(
                                        medication.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Time: ${medication.time.format(context)}',
                                        style: const TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                      trailing: Checkbox(
                                        value: medication.taken,
                                        onChanged: (value) {
                                          medicationController.toggleAlarm(
                                            medication,
                                            value!,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: 1,
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, '/profile');
                    break;
                  case 1:
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(context, '/medication-list');
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
