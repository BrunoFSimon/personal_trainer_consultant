import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/navigator/app_navigator.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_button.dart';
import 'package:personal_trainer_consultant/components/app_dialog.dart';

class AppOptionsListWidgetOption {
  final void Function() onTap;
  final String title;
  final IconData icon;

  AppOptionsListWidgetOption({
    required this.onTap,
    required this.title,
    required this.icon,
  });
}

class AppOptionsListWidget extends StatelessWidget {
  final List<AppOptionsListWidgetOption> options;

  const AppOptionsListWidget({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog.show(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: options.length,
        itemBuilder: (c, i) {
          final item = options[i];

          return AppButton.iconWithText(
            icon: item.icon,
            text: item.title,
            onPressed: () {
              AppNavigator.popPage(context);
              item.onTap.call();
            },
          );
        },
      ),
    );
  }
}
