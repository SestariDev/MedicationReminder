import 'package:flutter/material.dart';

class Medication {
  final String name;
  final TimeOfDay time;

  Medication({required this.name, required this.time, required bool taken});
}

class CalendarController extends ChangeNotifier {
  final Map<DateTime, List<Medication>> _medicationsByDate = {};
  final List<Medication> _medications = [];

  Map<DateTime, List<Medication>> get medicationsByDate => _medicationsByDate;
  List<Medication> get medications => _medications;

  void addMedication(DateTime date, Medication medication) {
    if (_medicationsByDate.containsKey(date)) {
      _medicationsByDate[date]!.add(medication);
    } else {
      _medicationsByDate[date] = [medication];
    }
    notifyListeners();
  }

  List<Medication> getMedicationsForDate(DateTime date) {
    return _medicationsByDate[date] ?? [];
  }
}
