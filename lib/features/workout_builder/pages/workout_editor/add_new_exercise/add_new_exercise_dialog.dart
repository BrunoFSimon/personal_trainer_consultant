import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/extensions/string_extensions.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workout_editor/add_new_exercise/add_new_exercise_controller.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_button.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_dialog.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_spacer.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text_field.dart';

class AddNewExerciseDialog extends StatelessWidget {
  final AddNewExerciseController controller;

  AddNewExerciseDialog({
    super.key,
    required this.controller,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppDialog.form(
      formKey: formKey,
      children: [
        AppText.title('Incluir novo exercício'),
        AppSpacer.vertical4(),
        AppText.regular('Insira os dados do novo exercício'),
        AppTextField.regular(
          label: 'Nome',
          hint: 'Ex: crucifixo reto com halteres',
          onChanged: (value) {
            controller.name.value = value.capitalize();
          },
          validator: controller.validateEmptyField,
          initialValue: controller.name.value,
        ),
        AppTextField.regular(
          label: 'Séries e Repetições',
          hint: 'Ex: 1x10, 1x8, 1x6 ',
          onChanged: (value) {
            controller.setsAndReps.value = value.capitalize();
          },
          validator: controller.validateEmptyField,
          initialValue: controller.setsAndReps.value,
        ),
        AppTextField.regular(
          label: 'Observações',
          hint: 'Ex: biset, rest-pause, dropset, etc',
          onChanged: (value) {
            controller.observations.value = value.capitalize();
          },
          initialValue: controller.observations.value,
        ),
        AppSpacer.vertical8(),
        AppButton.elevated(
          text: 'Incluir',
          onPressed: () => controller.addExercise(
            context: context,
            formKey: formKey,
          ),
        ),
      ],
    );
  }
}
