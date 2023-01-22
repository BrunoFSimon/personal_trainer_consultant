import 'package:personal_trainer_consultant/utils/app_text_formatters.dart';

class Patient {
  final String name;
  final Phone phone;

  Patient({
    required this.name,
    required this.phone,
  });
}

class Phone {
  final String ddd;
  final String ddi;
  final String number;

  Phone({
    required this.ddd,
    required this.ddi,
    required this.number,
  });

  @override
  String toString() {
    var value = AppTextFormatters.phone.maskText(ddd + number);

    return value;
  }
}
