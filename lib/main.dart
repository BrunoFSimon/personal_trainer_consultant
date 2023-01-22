import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/home/home_controller.dart';
import 'package:personal_trainer_consultant/features/home/home_page.dart';
import 'package:personal_trainer_consultant/theme/app_theme_data.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppThemeData.getThemeData,
      home: HomePage(
        controller: HomeController(),
      ),
    ),
  );
}
