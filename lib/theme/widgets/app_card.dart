import 'package:flutter/material.dart';

class AppCard {
  static Widget regular({
    required Widget child,
    required void Function() onLongPress,
    required void Function() onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
