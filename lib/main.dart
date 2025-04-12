import 'package:flutter/material.dart';
import 'package:medication_remminder/controllers/doctor_controller.dart';
import 'package:medication_remminder/screens/doctor_list_screen.dart'
    show DoctorListScreen;
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'screens/about_screen.dart';
import 'screens/login_screen.dart';
import 'screens/medication_details_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/register_medication_screen.dart';
import 'screens/alarms_screen.dart';

import 'setup.dart';
import 'screens/medication_list_screen.dart';
import 'controllers/login_controller.dart';
import 'controllers/medication_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/register_doctor_screen.dart';

void main() {
  setupDependencies();
  final getIt = GetIt.instance;
  getIt.registerSingleton<UserController>(UserController());

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginController())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/medication': (context) => const MedicationListScreen(),
        '/register-medication': (context) => const RegisterMedicationScreen(),
        '/medication-details':
            (context) => MedicationDetailsScreen(
              medication:
                  ModalRoute.of(context)!.settings.arguments as Medication,
            ),
        '/alarms': (context) => const AlarmsScreen(),
        '/about': (context) => const AboutScreen(),
        '/register-doctor': (context) => const RegisterDoctorScreen(),
        '/doctor-list': (context) => const DoctorListScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
