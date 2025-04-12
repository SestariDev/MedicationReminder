import 'package:flutter/material.dart';
import 'package:medication_remminder/widgets/custom_bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import 'package:provider/provider.dart';
import '../controllers/login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Nunca mais esqueça seus remédios!',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.person,
                  label: 'Perfil',
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.calendar_today,
                  label: 'Calendario',
                  onTap: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.medication,
                  label: 'Registrar Medicamento',
                  onTap: () {
                    Navigator.pushNamed(context, '/medication');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.alarm,
                  label: 'Alarmes',
                  onTap: () {
                    Navigator.pushNamed(context, '/alarms');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.local_hospital,
                  label: 'Médicos',
                  onTap: () {
                    Navigator.pushNamed(context, '/doctor-list');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Sobre o aplicativo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text(
                'Clique aqui para saber mais sobre o aplicativo.',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.teal,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(label, style: const TextStyle(color: Colors.white)),
        onTap: onTap,
      ),
    );
  }
}
