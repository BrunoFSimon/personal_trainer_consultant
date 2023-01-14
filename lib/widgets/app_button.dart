import 'package:flutter/material.dart';

abstract class AppButton {
  static Widget outlined({
    required String text,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(onPressed: onPressed, child: Text(text));
  }

  static Widget floatingActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(icon));
  }

  static Widget elevated({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  static Widget text({
    required String text,
    required VoidCallback onPressed,
  }) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }

  static Widget icon({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }

  static Widget iconWithText({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
