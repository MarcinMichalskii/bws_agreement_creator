import 'package:bws_agreement_creator/utils/string_extensions.dart';

class NipValidator {
  static String? validate(String? value) {
    return value?.isValidNip() == true ? null : "Niepoprawny NIP";
  }
}

class EmailValidator {
  static String? validate(String? value) {
    return value?.isValidEmail() == true ? null : "Niepoprawny email";
  }
}

class PeselValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "PESEL jest wymagany";
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return "PESEL musi składać się tylko z cyfr";
    }
    if (value.length != 11) {
      return "PESEL musi mieć 11 znaków";
    }

    return null;
  }
}
