import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'calendar_controller.dart';

class Medication {
  final String name;
  final TimeOfDay time;
  final bool taken;
  final List<String> days;

  Medication({
    required this.name,
    required this.time,
    required this.taken,
    required this.days,
  });
}

class MedicationController extends ChangeNotifier {
  String _name = '';
  String _dosage = '';
  TimeOfDay? _time;
  bool _isActive = true;
  final List<String> _weekDays = [
    'Dom',
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sáb',
  ];
  final Set<String> _selectedDays = {};
  final CalendarController _calendarController = GetIt.I<CalendarController>();
  final List<Medication> _medications = [];
  final Map<Medication, bool> _alarms = {};

  String get name => _name;
  String get dosage => _dosage;
  TimeOfDay? get time => _time;
  bool get isActive => _isActive;
  List<String> get weekDays => _weekDays;
  Set<String> get selectedDays => _selectedDays;
  List<Medication> get medications => _medications;

  bool isAlarmEnabled(Medication medication) => _alarms[medication] ?? false;

  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  void updateDosage(String value) {
    _dosage = value;
    notifyListeners();
  }

  void updateTime(TimeOfDay value) {
    _time = value;
    notifyListeners();
  }

  void toggleActive(bool value) {
    _isActive = value;
    notifyListeners();
  }

  void toggleDay(String day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }
    notifyListeners();
  }

  void saveMedication() {
    if (_name.isEmpty || _time == null || _selectedDays.isEmpty) {
      debugPrint('Preencha todos os campos obrigatórios.');
      return;
    }

    final medication = Medication(
      name: _name,
      time: _time!,
      taken: false,
      days: _selectedDays.toList(),
    );

    _medications.add(medication);
    notifyListeners();
  }

  void toggleAlarm(Medication medication, bool value) {
    if (_alarms.containsKey(medication)) {
      _alarms[medication] = !_alarms[medication]!;
      notifyListeners();
    }
  }

  DateTime _getNextDateForDay(int dayIndex) {
    final now = DateTime.now();
    final currentDayIndex = now.weekday % 7;
    final difference = (dayIndex - currentDayIndex + 7) % 7;
    return now.add(Duration(days: difference));
  }
}
