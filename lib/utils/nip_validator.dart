class NipValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "NIP jest wymagany";
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return "NIP musi składać się tylko z cyfr";
    }
    if (value.length != 10) {
      return "NIP musi mieć 10 znaków";
    }

    return null;
  }
}
