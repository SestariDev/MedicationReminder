import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/profile_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = GetIt.I<ProfileController>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: profileController,
        builder: (context, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Preencha para monitoramento melhor da sua saude',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  _buildQuestion(
                    context,
                    question: 'Você possui alguma condição de saúde?',
                    groupValue: profileController.healthCondition,
                    onChanged: (value) {
                      profileController.updateHealthCondition(value);
                    },
                    inputHint: 'Qual?',
                    inputValue: profileController.healthConditionDetails,
                    onInputChanged: (value) {
                      profileController.updateHealthConditionDetails(value);
                    },
                    controller: profileController.healthConditionController,
                  ),
                  const SizedBox(height: 20),
                  _buildQuestion(
                    context,
                    question: 'Faz uso contínuo de algum medicamento?',
                    groupValue: profileController.medication,
                    onChanged: (value) {
                      profileController.updateMedication(value);
                    },
                    inputHint: 'Qual(is)?',
                    inputValue: profileController.medicationDetails,
                    onInputChanged: (value) {
                      profileController.updateMedicationDetails(value);
                    },
                    controller: profileController.medicationController,
                  ),
                  const SizedBox(height: 20),
                  _buildQuestion(
                    context,
                    question:
                        'Tem alguma necessidade especial que gostaria de informar?',
                    groupValue: profileController.specialNeeds,
                    onChanged: (value) {
                      profileController.updateSpecialNeeds(value);
                    },
                    inputHint: 'Descreva',
                    inputValue: profileController.specialNeedsDetails,
                    onInputChanged: (value) {
                      profileController.updateSpecialNeedsDetails(value);
                    },
                    controller: profileController.specialNeedsController,
                  ),
                  const SizedBox(height: 20),
                  _buildQuestion(
                    context,
                    question: 'Já teve alguma reação alérgica a medicamentos?',
                    groupValue: profileController.allergicReaction,
                    onChanged: (value) {
                      profileController.updateAllergicReaction(value);
                    },
                    inputHint: 'Qual?',
                    inputValue: profileController.allergicReactionDetails,
                    onInputChanged: (value) {
                      profileController.updateAllergicReactionDetails(value);
                    },
                    controller: profileController.allergicReactionController,
                  ),
                  const SizedBox(height: 20),
                  _buildQuestion(
                    context,
                    question:
                        'Deseja receber lembretes com algum cuidado especial?',
                    groupValue: profileController.specialReminders,
                    onChanged: (value) {
                      profileController.updateSpecialReminders(value);
                    },
                    inputHint: 'Qual?',
                    inputValue: profileController.specialRemindersDetails,
                    onInputChanged: (value) {
                      profileController.updateSpecialRemindersDetails(value);
                    },
                    controller: profileController.specialRemindersController,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
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
          }
        },
      ),
    );
  }

  Widget _buildQuestion(
    BuildContext context, {
    required String question,
    required bool? groupValue,
    required Function(bool?) onChanged,
    required String inputHint,
    required String inputValue,
    required Function(String) onInputChanged,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<bool>(
                value: false,
                groupValue: groupValue,
                onChanged: onChanged,
                title: const Text('Não', style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                value: true,
                groupValue: groupValue,
                onChanged: onChanged,
                title: const Text('Sim', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
        if (groupValue == true)
          TextField(
            onChanged: onInputChanged,
            decoration: InputDecoration(
              hintText: inputHint,
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.grey[800],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            controller: controller,
          ),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    switch (currentRoute) {
      case '/profile':
        return 0;
      case '/calendar':
        return 1;
      case '/medication':
        return 2;
      case '/alarms':
        return 3;
      default:
        return 0;
    }
  }
}
