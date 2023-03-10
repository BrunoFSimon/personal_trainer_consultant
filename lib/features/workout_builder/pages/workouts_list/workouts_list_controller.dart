import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/models/exercise.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workout_editor/workout_editor_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workout_editor/workout_editor_page.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/add_new_workout/add_new_workout_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/add_new_workout/add_new_workout_dialog.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/edit_workout/edit_workout_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/edit_workout/edit_workout_dialog.dart';
import 'package:personal_trainer_consultant/features/workout_builder/models/workout.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';
import 'package:personal_trainer_consultant/theme/page_template/template_list/template_list_controller.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_options_list_widget.dart';

class WorkoutsListController implements TemplateListController<Workout> {
  final ValueNotifier<List<Workout>> workoutList = ValueNotifier([]);

  @override
  void addNewItem(BuildContext context) async {
    var result = await AppNavigator.pushDialog<Workout>(
      context,
      AddNewWorkoutDialog(
        nextWorkoutId: workoutList.value.length,
        controller: AddNewWorkoutController(),
      ),
    );

    if (result == null) return;

    includeWorkout(result);
  }

  void includeWorkout(Workout result) {
    workoutList.value = [...workoutList.value, result];
  }

  void removeWorkout(Workout workout) {
    workoutList.value = workoutList.value
        .where((element) => element.name != workout.name)
        .toList();
  }

  void replaceWorkout({
    required Workout oldItem,
    required Workout newItem,
  }) {
    workoutList.value = workoutList.value
        .map((element) => element.name == oldItem.name ? newItem : element)
        .toList();
  }

  @override
  void showItemEditor(BuildContext context, Workout workout) async {
    var result = await AppNavigator.pushDialog<Workout>(
      context,
      EditWorkoutDialog(
        name: workout.name,
        controller: EditWorkoutController(),
        onSavePressed: (string) {
          changeWorkoutName(workout, string);
        },
      ),
    );

    if (result == null) return;

    workoutList.value = workoutList.value
        .map((element) => element.name == workout.name ? result : element)
        .toList();
  }

  void changeWorkoutName(Workout workout, String string) {
    var newWorkout = workout.copyWith(name: string);
    removeWorkout(workout);
    includeWorkout(newWorkout);
  }

  @override
  void showItemOptions(BuildContext context, Workout workout) {
    AppNavigator.pushDialog(
      context,
      AppOptionsListWidget(
        options: [
          AppOptionsListWidgetOption(
            title: 'Edit',
            onTap: () => showItemEditor(context, workout),
            icon: Icons.edit,
          ),
          AppOptionsListWidgetOption(
            title: 'Delete',
            onTap: () => removeWorkout(workout),
            icon: Icons.delete,
          ),
        ],
      ),
    );
  }

  @override
  void openItem(BuildContext context, Workout item) async {
    var exercises = await AppNavigator.pushPage<List<Exercise>>(
      context,
      WorkoutEditorPage(
        controller: WorkoutEditorController(
          exercises: item.exercises,
          workoutName: item.name,
        ),
      ),
    );

    if (exercises == null) debugPrint('WorkoutEditorPage returned a null list');

    var newItem = item.copyWith(exercises: exercises);

    replaceWorkout(oldItem: item, newItem: newItem);
  }

  @override
  ValueNotifier<List<Workout>> get items => workoutList;
}
