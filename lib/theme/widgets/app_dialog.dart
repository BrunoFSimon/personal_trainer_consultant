import 'package:flutter/material.dart';

abstract class AppDialog {
  static Widget show({
    required Widget child,
  }) {
    return _BaseLayout(child: child);
  }

  static Widget form({
    GlobalKey<FormState>? formKey,
    required List<Widget> children,
  }) {
    return _BaseLayout(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

class _BaseLayout extends StatelessWidget {
  final Widget child;

  const _BaseLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
