import 'package:bws_agreement_creator/utils/date_extensions.dart';

class LoginData {
  String cookie;
  String name;
  String birthDate;
  Address? address;
  String phone;
  String? passportId;
  String? idNumber;
  String? pesel;
  String? studentId;

  LoginData({
    required this.cookie,
    required this.name,
    required this.birthDate,
    required this.address,
    required this.phone,
    required this.passportId,
    required this.idNumber,
    required this.pesel,
    required this.studentId,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      cookie: json['cookie'],
      name: json['name'],
      birthDate: json['birthDate'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      passportId: json['passportId'],
      idNumber: json['idNumber'],
      pesel: json['pesel'],
      studentId: json['studentId'],
    );
  }

  String? get validationError {
    try {
      DateTime parsedBirthdate = DateTime.parse(birthDate);
      if (!parsedBirthdate.isOver16()) {
        return "Osoby poniżej 16 roku życia nie mogą zawrzeć z nami umowy";
      } else if (!parsedBirthdate.isAdult() && studentId == null) {
        return "Osoby poniżej 18 roku życia muszą podać numer legitymacji szkolnej";
      } else if (passportId == null && idNumber == null) {
        return "Musisz podać numer paszportu lub dowodu osobistego";
      } else if (pesel == null) {
        return "Musisz podać numer PESEL";
      } else if (address == null) {
        return "Musisz podać adres";
      }
    } catch (e) {
      return "Nieprawidłowa data urodzenia";
    }
    return null;
  }
}

class Address {
  String street;
  String city;
  String zip;
  String country;
  String region;

  Address({
    required this.street,
    required this.city,
    required this.zip,
    required this.country,
    required this.region,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      zip: json['zip'],
      country: json['country'],
      region: json['region'],
    );
  }
}
