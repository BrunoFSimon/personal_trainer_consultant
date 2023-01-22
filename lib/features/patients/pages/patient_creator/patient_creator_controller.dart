import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/extensions/string_extensions.dart';
import 'package:personal_trainer_consultant/features/patients/models/patient.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';

class PatientCreatorController {
  final formKey = GlobalKey<FormState>();

  final ValueNotifier<String> name = ValueNotifier('');
  final ValueNotifier<String> phone = ValueNotifier('');

  PatientCreatorController({
    required String? name,
    required Phone? phone,
  }) {
    this.name.value = name ?? '';
    this.phone.value = phone?.toString() ?? '';
  }

  void setName(String name) {
    this.name.value = name.nameFormatter();
  }

  void setPhone(String phone) {
    this.phone.value = phone;
  }

  void save(BuildContext context) {
    var isValid = formKey.currentState?.validate() ?? false;
    if (isValid == false) return;

    var ddd = phone.value.substring(1, 3);
    var number = phone.value.substring(5).replaceAll('.', '');

    final patient = Patient(
        name: name.value, phone: Phone(ddd: ddd, ddi: '55', number: number));

    AppNavigator.popPage(context, patient);
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }

    return null;
  }
}
