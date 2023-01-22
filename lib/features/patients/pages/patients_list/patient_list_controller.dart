import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/models/patient.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patient_creator/patient_creator_controller.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patient_creator/patient_creator_page.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patients_list/widgets/patient_list_options_dialog.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_page.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';

class PatientListController {
  final ValueNotifier<List<Patient>> patients = ValueNotifier([]);

  // public methods
  void openPatientEditor(BuildContext context, Patient item) async {
    var result = await AppNavigator.pushPage<Patient>(
        context,
        PatientCreatorPage(
          controller: PatientCreatorController(
            name: item.name,
            phone: item.phone,
          ),
        ));

    if (result == null) return;

    _replacePatient(newValue: result, oldValue: item);
  }

  void showPatientOptions(BuildContext context, Patient item) {
    AppNavigator.pushDialog(
      context,
      PatientListOptionsDialog(
        delete: () => _deletePatient(item),
        edit: () => openPatientEditor(context, item),
      ),
    );
  }

  void addNewPatient(BuildContext context) async {
    var result = await AppNavigator.pushPage<Patient>(
        context,
        PatientCreatorPage(
          controller: PatientCreatorController(
            name: null,
            phone: null,
          ),
        ));

    if (result == null) return;

    _includePatient(result);
  }

  void openWorkoutBuilder(BuildContext context, Patient item) {
    AppNavigator.pushPage(context,
        WorkoutsListPage(controller: WorkoutsListController(patient: item)));
  }
  // public methods

  // private methods
  void _includePatient(Patient result) {
    patients.value = [...patients.value, result];
  }

  void _replacePatient({required Patient newValue, required Patient oldValue}) {
    patients.value = [
      ...patients.value.where((element) => element != oldValue),
      newValue
    ];
  }

  void _deletePatient(Patient item) {
    patients.value = [...patients.value.where((element) => element != item)];
  }
  // private methods
}
