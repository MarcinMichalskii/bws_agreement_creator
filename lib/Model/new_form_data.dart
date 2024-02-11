import 'dart:typed_data';

import 'package:bws_agreement_creator/Model/login_data.dart';
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
}
