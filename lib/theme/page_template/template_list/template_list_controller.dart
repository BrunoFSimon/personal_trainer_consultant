import 'package:flutter/material.dart';

abstract class TemplateListController<T> {
  final ValueNotifier<List<T>> items;

  TemplateListController({
    required this.items,
  });

  void showItemEditor(BuildContext context, T item);

  void showItemOptions(BuildContext context, T item);

  void addNewItem(BuildContext context);

  void openItem(BuildContext context, T item);
}
