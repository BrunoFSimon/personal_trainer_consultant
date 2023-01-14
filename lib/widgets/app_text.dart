import 'package:flutter/material.dart';

abstract class AppText {
  static Widget title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget regular(String text) {
    return Text(text);
  }

  static Widget regularLight(String text) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.w300));
  }

  static Widget regularLargeBold(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }
}
