import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';
import 'package:personal_trainer_consultant/widgets/app_dialog.dart';
import 'package:personal_trainer_consultant/widgets/app_button.dart';

class WorkoutOptionsDialog extends StatelessWidget {
  final void Function() delete;
  final void Function() edit;

  const WorkoutOptionsDialog({
    super.key,
    required this.delete,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog.form(
      children: [
        AppButton.iconWithText(
          icon: Icons.edit,
          text: 'Editar Nome',
          onPressed: () {
            AppNavigator.popPage(context);
            edit();
          },
        ),
        AppButton.iconWithText(
          icon: Icons.delete,
          text: 'Excluir',
          onPressed: () {
            AppNavigator.popPage(context);
            delete();
          },
        ),
      ],
    );
  }
}
