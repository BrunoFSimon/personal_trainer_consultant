import 'package:flutter/material.dart';

abstract class AppTextField {
  static Widget regular({
    String? Function(String?)? validator,
    required String label,
    required void Function(String) onChanged,
    required String hint,
    String? initialValue,
  }) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
