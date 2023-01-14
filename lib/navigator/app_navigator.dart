import 'package:flutter/material.dart';

abstract class AppNavigator {
  static Future<T?> pushDialog<T>(BuildContext context, Widget child) {
    return showDialog<T>(
      context: context,
      builder: (context) => child,
    );
  }

  static Future<T?> pushPage<T>(BuildContext context, Widget child) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => child),
    );
  }

  static void popPage(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}
