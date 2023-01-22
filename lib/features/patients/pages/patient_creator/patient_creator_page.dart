import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patient_creator/patient_creator_controller.dart';
import 'package:personal_trainer_consultant/widgets/app_button.dart';
import 'package:personal_trainer_consultant/widgets/app_spacer.dart';
import 'package:personal_trainer_consultant/widgets/app_text_field.dart';

class PatientCreatorPage extends StatelessWidget {
  final PatientCreatorController controller;

  const PatientCreatorPage({
    super.key,
    required this.controller,
  });

  String get _title =>
      controller.name.value.isEmpty ? 'Novo Aluno' : controller.name.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        AppButton.outlined(
          text: 'Salvar',
          onPressed: () => controller.save(context),
        )
      ],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AppTextField.regular(
                  label: 'Nome',
                  initialValue: controller.name.value,
                  onChanged: controller.setName,
                  hint: 'Nome e Sobrenome',
                  validator: controller.validateName,
                ),
                AppSpacer.vertical4(),
                AppTextField.phone(
                  onChanged: controller.setPhone,
                  initialValue: controller.phone.value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
