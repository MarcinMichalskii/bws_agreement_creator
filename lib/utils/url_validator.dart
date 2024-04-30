import 'package:validators/validators.dart';

class UrlValidator {
  static String? isValid(String? url) {
    return isURL(url) ? null : 'Niepoprawny adres URL';
  }
}
