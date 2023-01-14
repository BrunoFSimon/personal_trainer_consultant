import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/workout_builder/pages/workouts_list/workouts_list_controller.dart';
import 'package:personal_trainer_consultant/widgets/app_card.dart';
import 'package:personal_trainer_consultant/widgets/app_button.dart';
import 'package:personal_trainer_consultant/widgets/app_text.dart';

class WorkoutsListPage extends StatelessWidget {
  final WorkoutsListController controller;

  const WorkoutsListPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Treinos'),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        AppButton.outlined(
          text: 'Incluir Novo Treino',
          onPressed: () => controller.addNewWorkout(context),
        )
      ],
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: controller.workoutList,
          builder: (_, value, __) {
            if (value.isEmpty) {
              return Center(
                  child: AppText.regular('Nenhum treino encontrado.'));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var item = value[index];
                return AppCard.regular(
                  child: AppText.regularLargeBold(item.name),
                  onTap: () => controller.openWorkoutEditor(context, item),
                  onLongPress: () =>
                      controller.showWorkoutOptions(context, item),
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
