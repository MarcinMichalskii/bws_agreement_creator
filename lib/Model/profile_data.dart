import 'package:bws_agreement_creator/Model/address_data.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/Enums/student_status_error_reason.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'login_data.g.dart';

@CopyWith()
class ProfileData {
  String name;
  String birthDate;
  String? address;
  String email;
  String phone;
  String? passportId;
  String? idNumber;
  String? pesel;
  String? studentId;
  bool hasStudentIdPhoto;
  bool isAdmin;
  bool verified;
  bool markedAsNotAStudent;

  DateTime? get birthDateParsed {
    try {
      return DateTime.parse(birthDate);
    } catch (e) {
      return null;
    }
  }

  ProfileData(
      {required this.name,
      required this.birthDate,
      required this.email,
      required this.address,
      required this.phone,
      required this.passportId,
      required this.idNumber,
      required this.pesel,
      required this.studentId,
      required this.hasStudentIdPhoto,
      required this.isAdmin,
      required this.verified,
      required this.markedAsNotAStudent});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
        name: json['name'],
        birthDate: json['birthDate'],
        email: json['email'],
        address: json['address'] != null
            ? Address.fromJson(json['address']).fullAddress
            : null,
        phone: json['phone'],
        passportId: _cleanString(json['passportId']),
        idNumber: _cleanString(json['idNumber']),
        pesel: _cleanString(json['pesel']),
        studentId: _cleanString(json['studentId']),
        hasStudentIdPhoto: json['hasStudentIdPhoto'],
        isAdmin: json['isAdmin'],
        verified: json['verified'],
        markedAsNotAStudent: json['markedAsNotAStudent']);
  }

  static String? _cleanString(String? value) {
    try {
      if (value == null) {
        return null;
      }
      String cleanedValue = value.trim();

      return cleanedValue.isEmpty ? null : cleanedValue;
    } catch (e) {
      return null;
    }
  }

  String? get validationError {
    if (birthDateParsed == null) {
      return "Nieprawidłowa data urodzenia";
    } else if (!birthDateParsed!.isOver17()) {
      return "Osoby poniżej 17 roku życia nie mogą zawrzeć z nami umowy";
    } else if (!birthDateParsed!.isAdult() && studentId == null) {
      return "Osoby poniżej 18 roku życia muszą podać numer legitymacji szkolnej w profilu Sinch";
    } else if (passportId == null &&
        idNumber == null &&
        studentId == null &&
        birthDateParsed!.isAdult()) {
      return "Musisz uzupełnić numer paszportu, dowodu osobistego lub legitymacji studenckiej w profilu Sinch";
    } else if (pesel == null) {
      return "Musisz uzupełnić numer PESEL w profilu Sinch";
    } else if (address == null) {
      return "Musisz uzupełnić adres w profilu Sinch";
    } else if (address?.hasNumbers() == false) {
      return "Musisz podać numer mieszkania w profilu Sinch";
    }
    return null;
  }

  SelectedPage pageBasedOnData() {
    if (studentStatusErrorReason != null && markedAsNotAStudent == false) {
      return SelectedPage.fillStudentData;
    }
    if (!birthDateParsed!.isAdult()) {
      return SelectedPage.legalGuardian;
    } else if (studentId != null &&
        studentStatusErrorReason == null &&
        birthDateParsed!.isBelow26()) {
      return SelectedPage.student;
    } else {
      return SelectedPage.contractType;
    }
  }

  StudentStatusErrorReason? get studentStatusErrorReason {
    if (birthDateParsed?.isBelow26() == true) {
      if (!hasStudentIdPhoto) {
        return StudentStatusErrorReason.noPhoto;
      }

      if (studentId?.emptyAsNull() == null) {
        return StudentStatusErrorReason.photoWithouNumber;
      }

      if (RegExp(r'[^0-9\/\s]').hasMatch(studentId ?? '')) {
        return StudentStatusErrorReason.invalidStudentId;
      }
    }
    return null;
  }
}