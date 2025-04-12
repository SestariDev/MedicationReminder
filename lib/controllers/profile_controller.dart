import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  bool? _healthCondition;
  String _healthConditionDetails = '';

  bool? _medication;
  String _medicationDetails = '';

  bool? _specialNeeds;
  String _specialNeedsDetails = '';

  bool? _allergicReaction;
  String _allergicReactionDetails = '';

  bool? _specialReminders;
  String _specialRemindersDetails = '';

  final TextEditingController healthConditionController =
      TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController specialNeedsController = TextEditingController();
  final TextEditingController allergicReactionController =
      TextEditingController();
  final TextEditingController specialRemindersController =
      TextEditingController();

  ProfileController() {
    healthConditionController.text = _healthConditionDetails;
    medicationController.text = _medicationDetails;
    specialNeedsController.text = _specialNeedsDetails;
    allergicReactionController.text = _allergicReactionDetails;
    specialRemindersController.text = _specialRemindersDetails;

    healthConditionController.addListener(() {
      updateHealthConditionDetails(healthConditionController.text);
    });
    medicationController.addListener(() {
      updateMedicationDetails(medicationController.text);
    });
    specialNeedsController.addListener(() {
      updateSpecialNeedsDetails(specialNeedsController.text);
    });
    allergicReactionController.addListener(() {
      updateAllergicReactionDetails(allergicReactionController.text);
    });
    specialRemindersController.addListener(() {
      updateSpecialRemindersDetails(specialRemindersController.text);
    });
  }

  bool? get healthCondition => _healthCondition;
  String get healthConditionDetails => _healthConditionDetails;

  bool? get medication => _medication;
  String get medicationDetails => _medicationDetails;

  bool? get specialNeeds => _specialNeeds;
  String get specialNeedsDetails => _specialNeedsDetails;

  bool? get allergicReaction => _allergicReaction;
  String get allergicReactionDetails => _allergicReactionDetails;

  bool? get specialReminders => _specialReminders;
  String get specialRemindersDetails => _specialRemindersDetails;

  void updateHealthCondition(bool? value) {
    _healthCondition = value;
    if (value == false) {
      _healthConditionDetails = '';
    }
    notifyListeners();
  }

  void updateHealthConditionDetails(String details) {
    _healthConditionDetails = details;
    notifyListeners();
  }

  void updateMedication(bool? value) {
    _medication = value;
    if (value == false) {
      _medicationDetails = '';
    }
    notifyListeners();
  }

  void updateMedicationDetails(String details) {
    _medicationDetails = details;
    notifyListeners();
  }

  void updateSpecialNeeds(bool? value) {
    _specialNeeds = value;
    if (value == false) {
      _specialNeedsDetails = '';
    }
    notifyListeners();
  }

  void updateSpecialNeedsDetails(String details) {
    _specialNeedsDetails = details;
    notifyListeners();
  }

  void updateAllergicReaction(bool? value) {
    _allergicReaction = value;
    if (value == false) {
      _allergicReactionDetails = '';
    }
    notifyListeners();
  }

  void updateAllergicReactionDetails(String details) {
    _allergicReactionDetails = details;
    notifyListeners();
  }

  void updateSpecialReminders(bool? value) {
    _specialReminders = value;
    if (value == false) {
      _specialRemindersDetails = '';
    }
    notifyListeners();
  }

  void updateSpecialRemindersDetails(String details) {
    _specialRemindersDetails = details;
    notifyListeners();
  }
}
