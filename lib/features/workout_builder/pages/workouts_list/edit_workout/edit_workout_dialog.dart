import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/extensions/string_extensions.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/edit_workout/edit_workout_controller.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_dialog.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_button.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_spacer.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text_field.dart';

class EditWorkoutDialog extends StatelessWidget {
  final void Function(String) onSavePressed;
  final EditWorkoutController controller;
  final String name;

  const EditWorkoutDialog({
    super.key,
    required this.onSavePressed,
    required this.controller,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog.form(
      formKey: controller.formKey,
      children: [
        AppText.title(
          'Editar Treino',
        ),
        AppSpacer.vertical4(),
        AppText.regular('Insira o novo nome do treino'),
        AppSpacer.vertical8(),
        AppTextField.regular(
          initialValue: name,
          label: 'Nome',
          onChanged: (s) => controller.name.value = s.capitalize(),
          hint: 'Ex: Treino de Peito',
        ),
        AppSpacer.vertical8(),
        AppButton.elevated(
          text: 'Salvar',
          onPressed: () {
            AppNavigator.popPage(context);
            controller.save(context, onSavePressed);
          },
        )
      ],
    );
  }
}
