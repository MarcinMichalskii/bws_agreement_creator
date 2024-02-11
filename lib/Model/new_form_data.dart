import 'dart:typed_data';

import 'package:bws_agreement_creator/Model/login_data.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'new_form_data.g.dart';

@CopyWith()
class NewFormData {
  final LoginData? loginData;
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

  NewFormData({
    this.loginData,
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
  });

  String? validationError(SelectedPage page) {
    if (page == SelectedPage.contractType ||
        page == SelectedPage.worksInOtherCompany) {
      return "Coś poszło nie tak. To nie Twoja wina, skontaktuj się z administratorem lub wypełnij dane w formularzu i spróbuj ponownie";
    }
    if (page == SelectedPage.legalGuardian) {
      if (legalGuardianName?.emptyAsNull() == null ||
          legalGuardianPesel?.emptyAsNull() == null ||
          legalGuardianIdNumber?.emptyAsNull() == null ||
          legalGuardianAddress?.emptyAsNull() == null ||
          legalGuardianSignatureData == null ||
          signatureData == null) {
        return "Wszystkie pola muszą być wypełnione";
      }
    }

    if (page == SelectedPage.otherCompanyDetails) {
      if (otherCompanyName?.emptyAsNull() == null ||
          otherCompanyAddress?.emptyAsNull() == null ||
          otherCompanyNip?.isValidNip() == true ||
          otherCompanyStartDate == null ||
          otherCompanyEndDate == null) {
        return "Wszystkie pola muszą być wypełnione";
      }
    }

    if (page == SelectedPage.b2bContract) {
      if (b2bCompanyName?.emptyAsNull() == null ||
          b2bCompanyAddress?.emptyAsNull() == null ||
          b2bCompanyNip?.isValidNip() == true ||
          signatureData == null) {
        return "Wszystkie pola muszą być wypełnione";
      }
    }

    if (page == SelectedPage.signature || page == SelectedPage.student) {
      if (signatureData == null) {
        return "Podpis jest wymagany";
      }
    }
  }
}
