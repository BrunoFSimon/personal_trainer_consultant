import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/theme/page_template/template_list/template_list_controller.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_button.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_card.dart';
import 'package:personal_trainer_consultant/theme/widgets/app_text.dart';

class TemplateListPage extends StatelessWidget {
  final String title;

  final TemplateListController controller;

  const TemplateListPage({
    required this.title,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        AppButton.outlined(
          text: 'Incluir',
          onPressed: () => controller.addNewItem(context),
        )
      ],
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: controller.items,
          builder: (_, value, __) {
            if (value.isEmpty) {
              return Center(
                  child: AppText.regular('Nenhum item foi incluído ainda.'));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var item = value[index];
                return AppCard.regular(
                  child: AppText.regularLargeBold(item.name),
                  onTap: () {
                    controller.openItem(context, item);
                  },
                  onLongPress: () => controller.showItemOptions(context, item),
                );
              },
              itemCount: value.length,
            );
          },
        ),
      ),
    );
  }
}
