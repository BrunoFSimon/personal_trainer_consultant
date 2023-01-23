import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/models/patient.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patient_creator/patient_creator_controller.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patient_creator/patient_creator_page.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_page.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';
import 'package:personal_trainer_consultant/theme/page_template/template_list/template_list_controller.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_options_list_widget.dart';

class PatientListController implements TemplateListController<Patient> {
  final ValueNotifier<List<Patient>> patients = ValueNotifier([]);

  // public methods
  @override
  void showItemEditor(BuildContext context, Patient item) async {
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

  @override
  void showItemOptions(BuildContext context, Patient item) {
    AppNavigator.pushDialog(
      context,
      AppOptionsListWidget(
        options: [
          AppOptionsListWidgetOption(
            icon: Icons.edit,
            title: 'Editar',
            onTap: () => showItemEditor(context, item),
          ),
          AppOptionsListWidgetOption(
            icon: Icons.delete,
            title: 'Excluir',
            onTap: () => _deletePatient(item),
          ),
        ],
      ),
    );
  }

  @override
  void addNewItem(BuildContext context) async {
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

  @override
  void openItem(BuildContext context, Patient item) {
    AppNavigator.pushPage(
      context,
      WorkoutsListPage(
        controller: WorkoutsListController(),
        patient: item,
      ),
    );
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

  @override
  ValueNotifier<List<Patient>> get items => patients;
  // private methods
}
