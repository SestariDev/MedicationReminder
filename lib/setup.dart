import 'package:get_it/get_it.dart';
import 'controllers/auth_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/calendar_controller.dart';
import 'controllers/medication_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/doctor_controller.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<AuthController>(AuthController());
  getIt.registerSingleton<ProfileController>(ProfileController());
  getIt.registerSingleton<CalendarController>(CalendarController());
  getIt.registerSingleton<MedicationController>(MedicationController());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<DoctorController>(DoctorController());
}
