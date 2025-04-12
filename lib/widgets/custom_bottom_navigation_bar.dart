import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.teal,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Medication',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarms'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
      ],
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
            Navigator.pushReplacementNamed(context, '/about');
            break;
        }
      },
    );
  }
}
