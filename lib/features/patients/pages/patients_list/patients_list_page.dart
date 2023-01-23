import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patients_list/patient_list_controller.dart';
import 'package:personal_trainer_consultant/theme/page_template/template_list/template_list_page.dart';

class PatientListPage extends StatelessWidget {
  final PatientListController controller;

  const PatientListPage({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateListPage(
      title: 'Alunos',
      controller: controller,
    );
  }
}
