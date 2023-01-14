import 'package:flutter/material.dart';

class EditWorkoutController {
  final name = ValueNotifier('');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void save(BuildContext context, void Function(String name) onSavePressed) {
    var validate = formKey.currentState?.validate();

    if (validate != true) return;

    onSavePressed(name.value);
  }
}
