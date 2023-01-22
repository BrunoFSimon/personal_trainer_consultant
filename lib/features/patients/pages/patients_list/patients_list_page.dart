import 'package:flutter/material.dart';
import 'package:personal_trainer_consultant/features/patients/pages/patients_list/patient_list_controller.dart';
import 'package:personal_trainer_consultant/widgets/app_button.dart';
import 'package:personal_trainer_consultant/widgets/app_card.dart';
import 'package:personal_trainer_consultant/widgets/app_text.dart';

class PatientListPage extends StatelessWidget {
  final PatientListController controller;

  const PatientListPage({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        AppButton.outlined(
          text: 'Incluir Novo Aluno',
          onPressed: () => controller.addNewPatient(context),
        )
      ],
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: controller.patients,
          builder: (_, value, __) {
            if (value.isEmpty) {
              return Center(child: AppText.regular('Nenhum aluno encontrado.'));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var item = value[index];
                return AppCard.regular(
                  child: AppText.regularLargeBold(item.name),
                  onTap: () {
                    controller.openWorkoutBuilder(context, item);
                  },
                  onLongPress: () =>
                      controller.showPatientOptions(context, item),
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
