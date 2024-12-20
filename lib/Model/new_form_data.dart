import 'dart:typed_data';

import 'package:bws_agreement_creator/Model/profile_data.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:intl/intl.dart';

part 'new_form_data.g.dart';

@CopyWith()
class NewFormData {
  final String dateOfSign = DateFormat('dd.MM.yyyy').format(DateTime.now());
  final ProfileData? loginData;
  final Uint8List? signatureData;
  final Uint8List? legalGuardianSignatureData;
  final String? legalGuardianName;
  final String? legalGuardianPesel;
  final String? legalGuardianIdNumber;
  final String? legalGuardianAddress;

  final String? otherCompanyName;
  final String? otherCompanyAddress;
  final String? otherCompanyNip;
  final DateTime? otherCompanyStartDate;
  final DateTime? otherCompanyEndDate;
  final String? b2bCompanyName;
  final String? b2bCompanyAddress;
  final String? b2bCompanyNip;
  final Uint8List? bwsSignatureData;

  NewFormData(
      {this.loginData,
      this.signatureData,
      this.legalGuardianSignatureData,
      this.otherCompanyName,
      this.otherCompanyAddress,
      this.otherCompanyNip,
      this.otherCompanyStartDate,
      this.otherCompanyEndDate,
      this.b2bCompanyName,
      this.b2bCompanyAddress,
      this.b2bCompanyNip,
      this.legalGuardianName,
      this.legalGuardianPesel,
      this.legalGuardianIdNumber,
      this.legalGuardianAddress,
      this.bwsSignatureData});

  String? validationError(SelectedPage page) {
    if (page == SelectedPage.contractType ||
        page == SelectedPage.worksInOtherCompany) {
      return "Coś poszło nie tak. To nie Twoja wina, skontaktuj się z administratorem lub wypełnij dane w formularzu i spróbuj ponownie";
    }
    if (page == SelectedPage.legalGuardian) {
      if (legalGuardianAddress?.emptyAsNull() == null) {
        return "Adres opiekuna prawnego jest wymagany";
      } else if (legalGuardianIdNumber?.emptyAsNull() == null) {
        return "Numer dowodu opiekuna prawnego jest wymagany";
      } else if (legalGuardianName?.emptyAsNull() == null) {
        return "Imię i nazwisko opiekuna prawnego jest wymagane";
      } else if (legalGuardianPesel?.emptyAsNull() == null) {
        return "PESEL opiekuna prawnego jest wymagany";
      } else if (legalGuardianSignatureData == null || signatureData == null) {
        return "Podpis opiekuna prawnego i podpis ucznia są wymagane";
      }
    }

    if (page == SelectedPage.otherCompanyDetails) {
      if (otherCompanyName?.emptyAsNull() == null) {
        return "Nazwa firmy jest wymagana";
      } else if (otherCompanyAddress?.emptyAsNull() == null) {
        return "Adres firmy jest wymagany";
      } else if (otherCompanyNip?.isValidNip() == false) {
        return "NIP firmy jest wymagany";
      } else if (otherCompanyStartDate == null) {
        return "Data rozpoczęcia umowy jest wymagana";
      }
    }

    if (page == SelectedPage.b2bContract) {
      if (b2bCompanyName?.emptyAsNull() == null) {
        return "Nazwa firmy jest wymagana, pobierz dane firmy podając nip";
      } else if (b2bCompanyAddress?.emptyAsNull() == null) {
        return "Adres firmy jest pobierz dane firmy podając nip";
      } else if (b2bCompanyNip?.isValidNip() == false) {
        return "NIP firmy jest wymagany";
      } else if (signatureData == null) {
        return "Podpis jest wymagany";
      }
    }

    if (page == SelectedPage.signature || page == SelectedPage.student) {
      if (signatureData == null) {
        return "Podpis jest wymagany";
      }
    }

    return null;
  }

  String get pdfFileName {
    if (!loginData!.birthDateParsed!.isAdult()) {
      return 'uz_student_niepelnoletni.pdf';
    } else if (loginData?.studentId != null &&
        loginData?.birthDateParsed?.isBelow26() == true &&
        loginData?.markedAsNotAStudent == false) {
      return 'uz_student.pdf';
    } else if (worksInOtherCompany && otherCompanyEndDate == null) {
      return 'uz_kolejna_nieokreslony.pdf';
    } else if (worksInOtherCompany && otherCompanyEndDate != null) {
      final nameDatePart = DateFormat('dd.MM.yyyy')
          .format(otherCompanyEndDate!)
          .replaceAll('.', '_');
      return 'uz_kolejna_okreslony_$nameDatePart.pdf';
    } else if (b2bCompanyName != null) {
      return 'b2b.pdf';
    } else if (loginData?.birthDateParsed?.isBelow26() == true) {
      return 'uz_bez_pit_bez_studenta.pdf';
    } else {
      return 'uz_normalna.pdf';
    }
  }

  bool get worksInOtherCompany => otherCompanyName != null;
  bool get isStudent =>
      loginData?.studentId != null &&
      loginData?.birthDateParsed?.isBelow26() == true &&
      !loginData!.markedAsNotAStudent;
}
