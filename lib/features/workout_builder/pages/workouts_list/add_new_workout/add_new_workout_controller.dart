import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/models/workout.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';

class AddNewWorkoutController {
  final name = ValueNotifier('');

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe ao menos um caracter';
    }

    return null;
  }

  void addWorkout(
      {required BuildContext context,
      required GlobalKey<FormState> formKey,
      required int nextWorkoutId}) {
    var validate = formKey.currentState?.validate();

    if (validate != true) return;

    var result = Workout(name: name.value, exercises: []);

    AppNavigator.popPage(context, result);
  }
}
