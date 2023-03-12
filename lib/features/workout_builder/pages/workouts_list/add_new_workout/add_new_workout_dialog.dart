import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/extensions/string_extensions.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/add_new_workout/add_new_workout_controller.dart';
import 'package:personal_trainer_consultant/components/app_dialog.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_button.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_spacer.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text_field.dart';

class AddNewWorkoutDialog extends StatelessWidget {
  final AddNewWorkoutController controller;
  final int nextWorkoutId;

  AddNewWorkoutDialog({
    super.key,
    required this.nextWorkoutId,
    required this.controller,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppDialog.form(
      formKey: formKey,
      children: [
        AppText.title('Incluir novo treino'),
        AppSpacer.vertical4(),
        AppText.regular('Insira o nome do novo treino'),
        AppTextField.regular(
          label: 'Nome',
          hint: 'Ex: Treino de Peito',
          onChanged: (value) {
            controller.name.value = value.capitalize();
          },
          validator: controller.validateName,
          onEditingComplete: () => controller.addWorkout(
            nextWorkoutId: nextWorkoutId,
            context: context,
            formKey: formKey,
          ),
        ),
        AppSpacer.vertical8(),
        AppButton.elevated(
          text: 'Incluir',
          onPressed: () => controller.addWorkout(
            nextWorkoutId: nextWorkoutId,
            context: context,
            formKey: formKey,
          ),
        ),
      ],
    );
  }
}
