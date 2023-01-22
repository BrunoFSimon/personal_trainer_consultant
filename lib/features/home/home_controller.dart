import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patients_list/patient_list_controller.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patients_list/patients_list_page.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';

class HomeController {
  void openPatientList(BuildContext context) {
    AppNavigator.pushPage(
      context,
      PatientListPage(
        controller: PatientListController(),
      ),
    );
  }
}
