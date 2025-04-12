import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Sobre'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sobre o Projeto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'O Medication foi desenvolvido para auxiliar pessoas que precisam seguir tratamentos com medicamentos em horários específicos, promovendo mais organização, bem-estar e segurança na rotina de saúde.\nCom uma interface simples e intuitiva, o aplicativo permite que o usuário registre seus medicamentos, defina horários exatos para cada dose e receba lembretes automáticos no momento certo.\n Assim, evita-se esquecimentos ou atrasos que possam comprometer o tratamento.\nIdeal para pessoas que utilizam múltiplos medicamentos,\n cuidadores de idosos,\n pacientes com doenças crônicas ou qualquer pessoa que queira manter um controle mais eficiente de sua saúde.\nFuncionalidades principais:\nCadastro fácil de medicamentos e dosagens \nAlertas e notificações em tempo real\n Histórico de uso dos medicamentos \nInterface amigável e \n Nosso objetivo é tornar o cuidado com a saúde mais simples e confiável para todos.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 40),
            const Text(
              'Equipe de Desenvolvimento',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '- Guilherme Sestari\n- Luis Guilherme de Jesus Rocha',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
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
}
