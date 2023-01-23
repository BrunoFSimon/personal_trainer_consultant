import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/models/patient.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_controller.dart';
import 'package:personal_trainer_consultant/theme/page_template/template_list/template_list_page.dart';

class WorkoutsListPage extends StatelessWidget {
  final Patient patient;
  final WorkoutsListController controller;

  const WorkoutsListPage({
    super.key,
    required this.patient,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateListPage(title: patient.name, controller: controller);
  }
}
