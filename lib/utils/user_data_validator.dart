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
  static String? validate(String? pesel) {
    if (pesel == null || pesel.isEmpty) {
      return 'Podaj numer PESEL.';
    }
    if (pesel.length != 11 || !RegExp(r'^\d{11}$').hasMatch(pesel)) {
      return 'Numer PESEL musi składać się z 11 cyfr.';
    }

    final weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3];
    int checksum = 0;

    for (int i = 0; i < 10; i++) {
      checksum += int.parse(pesel[i]) * weights[i];
    }

    checksum %= 10;
    checksum = (10 - checksum) % 10;

    if (checksum != int.parse(pesel[10])) {
      return 'Niepoprawny numer PESEL.';
    }

    return null;
  }
}

class IDNUmberValidator {
  static String? validate(String? num) {
    if (num == null || num.isEmpty) {
      return 'Podaj numer dowodu osobistego.';
    }

    if (num.isEmpty || num.length != 9) {
      return 'Numer dowodu osobistego musi mieć dokładnie 9 znaków.';
    }

    final upperNum = num.toUpperCase();
    const letterValues = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];

    int getLetterValue(String letter) {
      for (int j = 0; j < letterValues.length; j++) {
        if (letter == letterValues[j]) {
          return j;
        }
      }
      return -1;
    }

    // Check series.
    for (int i = 0; i < 3; ++i) {
      if (getLetterValue(upperNum[i]) < 10) {
        return 'Numer dowodu osobistego musi składać się z 3 liter i 6 cyfr.';
      }
    }

    // Check number.
    for (int i = 3; i < 9; ++i) {
      if (getLetterValue(upperNum[i]) < 0 || getLetterValue(upperNum[i]) > 9) {
        return 'Numer dowodu osobistego musi składać się z 3 liter i 6 cyfr.';
      }
    }

    // Calculate checksum.
    int sum = 7 * getLetterValue(upperNum[0]) +
        3 * getLetterValue(upperNum[1]) +
        getLetterValue(upperNum[2]) +
        7 * getLetterValue(upperNum[4]) +
        3 * getLetterValue(upperNum[5]) +
        getLetterValue(upperNum[6]) +
        7 * getLetterValue(upperNum[7]) +
        3 * getLetterValue(upperNum[8]);

    sum %= 10;

    if (sum != getLetterValue(upperNum[3])) {
      return 'Niepoprawny numer dowodu osobistego.';
    }

    return null;
  }
}

class PassportValidator {
  static String? validate(String? passport) {
    if (passport == null || passport.isEmpty) {
      return 'Podaj numer paszportu.';
    }

    if (passport.length != 9 && passport.length != 8) {
      return 'Numer paszportu musi mieć 8 lub 9 znaków.';
    }

    if (!RegExp(r'^[A-Z]{2}\d{6}$').hasMatch(passport) &&
        !RegExp(r'^[A-Z]{2}\d{7}$').hasMatch(passport)) {
      return 'Numer paszportu musi składać się z 2 wielkich liter i 6 lub 7 cyfr.';
    }

    return null;
  }
}

class StreetValidator {
  static String? validate(String? street) {
    if (street == null || street.isEmpty) {
      return 'Podaj ulicę i numer domu.';
    }

    if (!street.hasNumbers()) {
      return 'Ulica musi zawierać numer domu.';
    }

    return null;
  }
}
