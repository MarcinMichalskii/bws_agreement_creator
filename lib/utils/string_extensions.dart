extension NipValidator on String {
  bool isValidNip() {
    try {
      if (length != 10) {
        return false;
      }
      if (RegExp(r'^[0-9]*$').hasMatch(this) == false) {
        return false;
      }
      final nip = replaceAll(RegExp(r'[\ \-]'), '');

      List<int> weight = [6, 5, 7, 2, 3, 4, 5, 6, 7];
      int sum = 0;
      int controlNumber = int.parse(nip.substring(9, 10));
      for (int i = 0; i < weight.length; i++) {
        sum += (int.parse(nip.substring(i, i + 1)) * weight[i]);
      }

      return sum % 11 == controlNumber;
    } catch (error) {
      return false;
    }
  }

  DateTime? extractBirthdateFromPesel() {
    final pesel = this;
    if (pesel.length < 6 || int.tryParse(pesel) == null) {
      return null;
    }

    String year = pesel.substring(0, 2);
    String month = pesel.substring(2, 4);
    String day = pesel.substring(4, 6);

    int monthInt = int.parse(month);
    int dayInt = int.parse(day);

    if (monthInt > 80) {
      year = "18$year";
      monthInt -= 80;
    } else if (monthInt > 60) {
      year = "22$year";
      monthInt -= 60;
    } else if (monthInt > 40) {
      year = "21$year";
      monthInt -= 40;
    } else if (monthInt > 20) {
      year = "20$year";
      monthInt -= 20;
    } else {
      year = "19$year";
    }

    DateTime birthdate = DateTime(int.parse(year), monthInt, dayInt);

    return birthdate;
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String capitalize() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalized())
        .join(' ');
  }

  bool isValidEmail() {
    final RegExp emailExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

    return emailExp.hasMatch(this);
  }
}

extension EmptyAsNull on String {
  String? emptyAsNull() {
    if (isEmpty) {
      return null;
    }
    return this;
  }
}

extension HasNumbers on String {
  bool hasNumbers() {
    return RegExp(r'\d').hasMatch(this);
  }
}

extension IsValidSurveyUrl on String {
  bool isValidUrl() {
    try {
      var uri = Uri.parse(this);
      return uri.hasScheme && (uri.isAbsolute || uri.hasAuthority);
    } catch (e) {
      return false;
    }
  }

  bool isValidSurveyUrl() {
    if (isEmpty) {
      return true;
    }
    return isValidUrl();
  }
}
