import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/home/home_controller.dart';
import 'package:personal_trainer_consultant/widgets/app_button.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton.iconWithText(
                icon: Icons.people_alt_outlined,
                text: 'Lista de Alunos',
                onPressed: () => controller.openPatientList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
