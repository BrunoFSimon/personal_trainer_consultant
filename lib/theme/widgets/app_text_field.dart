import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/utils/app_text_formatters.dart';

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

  static Widget phone({
    required void Function(String) onChanged,
    String? initialValue,
  }) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      inputFormatters: [AppTextFormatters.phone],
      validator: (v) {
        if (v == null || v.isEmpty) return null;

        if (v.length < 16) return 'Telefone inválido';

        return null;
      },
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Telefone',
        hintText: 'Telefone com DDD',
      ),
    );
  }
}
