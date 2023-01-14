import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_controller.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_page.dart';
import 'package:personal_trainer_consultant/theme/app_theme_data.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppThemeData.getThemeData,
      home: WorkoutsListPage(
        controller: WorkoutsListController(),
      ),
    ),
  );
}
