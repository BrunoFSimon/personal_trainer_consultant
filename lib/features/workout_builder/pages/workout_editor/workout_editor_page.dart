import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/models/exercise.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workout_editor/workout_editor_controller.dart';
import 'package:personal_trainer_consultant/widgets/app_button.dart';
import 'package:personal_trainer_consultant/widgets/app_card.dart';
import 'package:personal_trainer_consultant/widgets/app_spacer.dart';
import 'package:personal_trainer_consultant/widgets/app_text.dart';

class WorkoutEditorPage extends StatelessWidget {
  final WorkoutEditorController controller;

  const WorkoutEditorPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.workoutName),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          AppButton.outlined(
            text: 'Incluir Novo Exercício',
            onPressed: () => controller.addNewExercise(context),
          ),
        ],
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: controller.exerciseList,
            builder: (_, value, __) {
              if (value.isEmpty) {
                return Center(
                    child: AppText.regular('Nenhum exercício encontrado.'));
              }

              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  var item = value[index];
                  return AppCard.regular(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.regularLargeBold(item.name),
                        AppSpacer.vertical8(),
                        AppText.regular('Séries e Repetições:'),
                        AppText.regularLight(item.setsAndReps),
                        if (showItemObservations(item)) ...[
                          AppSpacer.vertical8(),
                          AppText.regular('Observações:'),
                          AppText.regularLight(item.observations!),
                        ]
                      ],
                    ),
                    onTap: () => controller.openExerciseEditor(context, item),
                    onLongPress: () =>
                        controller.showExerciseOptions(context, item),
                  );
                },
                itemCount: value.length,
              );
            },
          ),
        ),
      ),
    );
  }

  bool showItemObservations(Exercise item) {
    var observations = item.observations;

    if (observations == null) return false;
    if (observations.isEmpty) return false;

    return true;
  }
}
