import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/models/exercise.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';

class AddNewExerciseController {
  final name = ValueNotifier('');
  final setsAndReps = ValueNotifier('');
  final observations = ValueNotifier<String?>(null);

  AddNewExerciseController({
    Exercise? exercise,
  }) {
    if (exercise != null) {
      name.value = exercise.name;
      setsAndReps.value = exercise.setsAndReps;
      observations.value = exercise.observations;
    }
  }

  String? validateEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe ao menos um caractere';
    }

    return null;
  }

  void addExercise({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) {
    var validate = formKey.currentState?.validate();

    if (validate != true) return;

    var result = Exercise(
      name: name.value,
      setsAndReps: setsAndReps.value,
      observations: observations.value,
    );

    AppNavigator.popPage(context, result);
  }
}
