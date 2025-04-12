import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Doctor {
  final String name;
  final String phone;
  final String specialty;

  Doctor({required this.name, required this.phone, required this.specialty});
}

class DoctorController extends ChangeNotifier {
  String _name = '';
  String _phone = '';
  String _specialty = '';
  final List<Doctor> _doctors = [];

  String get name => _name;
  String get phone => _phone;
  String get specialty => _specialty;
  List<Doctor> get doctors => _doctors;

  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  void updatePhone(String value) {
    _phone = value;
    notifyListeners();
  }

  void updateSpecialty(String value) {
    _specialty = value;
    notifyListeners();
  }

  void saveDoctor() {
    if (_name.isEmpty || _phone.isEmpty || _specialty.isEmpty) {
      debugPrint('Please fill in all required fields.');
      return;
    }

    final doctor = Doctor(name: _name, phone: _phone, specialty: _specialty);

    _doctors.add(doctor);
    notifyListeners();
  }
}

final getIt = GetIt.instance;

void setupDoctorController() {
  getIt.registerLazySingleton<DoctorController>(() => DoctorController());
}
