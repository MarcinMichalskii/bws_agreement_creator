import 'package:easy_localization/easy_localization.dart';

extension CheckIfAdult on DateTime {
  bool isAdult() {
    final birthday = this;
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthday.year;
    if (currentDate.month < birthday.month ||
        (currentDate.month == birthday.month &&
            currentDate.day < birthday.day)) {
      age--;
    }
    return age >= 18;
  }

  bool isOver17() {
    final birthday = this;
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthday.year;
    if (currentDate.month < birthday.month ||
        (currentDate.month == birthday.month &&
            currentDate.day < birthday.day)) {
      age--;
    }
    return age >= 17;
  }

  bool isBelow26() {
    final birthday = this;
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthday.year;
    if (currentDate.month < birthday.month ||
        (currentDate.month == birthday.month &&
            currentDate.day < birthday.day)) {
      age--;
    }
    return age <= 26;
  }
}

extension ReadableDate on DateTime {
  String toReadableDate() {
    return DateFormat('dd MMM yyyy').format(this);
  }
}
