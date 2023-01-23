import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/models/exercise.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workout_editor/add_new_exercise/add_new_exercise_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workout_editor/add_new_exercise/add_new_exercise_dialog.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_options_list_widget.dart';

class WorkoutEditorController {
  final ValueNotifier<List<Exercise>> exerciseList = ValueNotifier([]);
  final String workoutName;

  WorkoutEditorController({
    required this.workoutName,
    required List<Exercise> exercises,
  }) {
    exerciseList.value = exercises;
  }

  void addNewExercise(BuildContext context) async {
    var result = await AppNavigator.pushDialog<Exercise>(
      context,
      AddNewExerciseDialog(
        controller: AddNewExerciseController(),
      ),
    );

    if (result == null) return;

    includeExercise(result);
  }

  void includeExercise(Exercise result) {
    exerciseList.value = [...exerciseList.value, result];
  }

  void showExerciseOptions(BuildContext context, Exercise item) {
    AppNavigator.pushDialog(
      context,
      AppOptionsListWidget(
        options: [
          AppOptionsListWidgetOption(
            icon: Icons.edit,
            title: 'Editar',
            onTap: () => editExercise(context, item),
          ),
          AppOptionsListWidgetOption(
            icon: Icons.delete,
            title: 'Excluir',
            onTap: () => removeExercise(item),
          ),
        ],
      ),
    );
  }

  void openExerciseEditor(BuildContext context, Exercise item) {}

  save(BuildContext context) {}

  Future<bool> onWillPop(BuildContext context) {
    AppNavigator.popPage(context, exerciseList.value);
    return Future.value(false);
  }

  void removeExercise(Exercise exercise) {
    exerciseList.value = exerciseList.value
        .where((element) => element.name != exercise.name)
        .toList();
  }

  void editExercise(BuildContext context, Exercise exercise) async {
    var result = await AppNavigator.pushDialog<Exercise>(
      context,
      AddNewExerciseDialog(
        controller: AddNewExerciseController(
          exercise: exercise,
        ),
      ),
    );

    if (result == null) debugPrint('AddNewExerciseDialog returned null');

    replaceExercise(exercise, result!);
  }

  void replaceExercise(Exercise oldItem, Exercise newItem) {
    exerciseList.value =
        exerciseList.value.map((e) => e == oldItem ? newItem : e).toList();
  }
}
