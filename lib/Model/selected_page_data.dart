import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/update_student_id_logic.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/b2b_contract_question_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/default_signature_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/employee_contract_question_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/legal_guardian_questions_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/other_company_details_question_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/update_student_id_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/works_in_other_company_question_widget.dart';
import 'package:bws_agreement_creator/Model/profile_data.dart';
import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum SelectedPage {
  contractType,
  worksInOtherCompany,
  legalGuardian,
  otherCompanyDetails,
  b2bContract,
  signature,
  student,
  fillStudentData,
}

extension SelectedPageExtension on SelectedPage {
  Widget get page {
    switch (this) {
      case SelectedPage.contractType:
        return const ContractTypeQuestionWidget();
      case SelectedPage.worksInOtherCompany:
        return const WorksInOtherCompanyQuestionWidget();
      case SelectedPage.legalGuardian:
        return LegalGuardianQuestionsWidget();
      case SelectedPage.otherCompanyDetails:
        return const OtherCompanyDetailsQuestionWidget();
      case SelectedPage.b2bContract:
        return B2bContractQuestionWidget();
      case SelectedPage.signature:
        return const DefaultSignatureWidget();
      case SelectedPage.student:
        return const DefaultSignatureWidget();
      case SelectedPage.fillStudentData:
        return const UpdateStudentIdLogic();
    }
  }

  SelectedPage? get previousPage {
    switch (this) {
      case SelectedPage.contractType:
        return null;
      case SelectedPage.worksInOtherCompany:
        return SelectedPage.contractType;
      case SelectedPage.legalGuardian:
        return null;
      case SelectedPage.otherCompanyDetails:
        return SelectedPage.worksInOtherCompany;
      case SelectedPage.b2bContract:
        return SelectedPage.contractType;
      case SelectedPage.signature:
        return SelectedPage.worksInOtherCompany;
      case SelectedPage.student:
        return null;
      case SelectedPage.fillStudentData:
        return null;
    }
  }

  bool get isFinalPage {
    switch (this) {
      case SelectedPage.contractType:
        return false;
      case SelectedPage.worksInOtherCompany:
        return false;
      case SelectedPage.legalGuardian:
        return true;
      case SelectedPage.otherCompanyDetails:
        return true;
      case SelectedPage.b2bContract:
        return true;
      case SelectedPage.signature:
        return true;
      case SelectedPage.student:
        return true;
      case SelectedPage.fillStudentData:
        return false;
    }
  }
}

extension TempalteDataForPage on SelectedPage {
  Future<NewFormData?> get templateData async {
    String fileName = 'assets/example_signature.png';
    ByteData data = await rootBundle.load(fileName);
    Uint8List signatureData = data.buffer.asUint8List();

    final loginData = ProfileData(
        name: 'Jan Kowalski',
        email: 'jan@kowalski.pl',
        address: 'Testowa 24, 30-218 Kraków',
        phone: "+48 600 600 600",
        pesel: '99999999999',
        studentId: null,
        birthDate: '2000-09-06',
        passportId: 'CED XDDDD',
        idNumber: 'FED XDDDD',
        hasStudentIdPhoto: false,
        isAdmin: false,
        verified: true,
        markedAsNotAStudent: false);
    final newFormData = NewFormData(
        loginData: loginData,
        bwsSignatureData: signatureData,
        signatureData: signatureData);
    switch (this) {
      case SelectedPage.contractType:
        return null;
      case SelectedPage.worksInOtherCompany:
        return null;
      case SelectedPage.legalGuardian:
        return newFormData.copyWith(
          legalGuardianAddress: 'Opiekuncza 13, 30-218 Kraków',
          legalGuardianName: 'Anna Kowalska',
          legalGuardianIdNumber: 'CEF XDDDD',
          legalGuardianPesel: '99999999999',
          legalGuardianSignatureData: signatureData,
        );
      case SelectedPage.otherCompanyDetails:
        return newFormData.copyWith(
          otherCompanyAddress: 'Inna 13, 30-218 Kraków',
          otherCompanyName: 'Inna Kowalska',
          otherCompanyNip: '9999999999',
          otherCompanyEndDate: DateTime.now(),
        );
      case SelectedPage.b2bContract:
        return newFormData.copyWith(
          b2bCompanyAddress: 'B2B 13, 30-218 Kraków',
          b2bCompanyName: 'B2B Kowalski',
          b2bCompanyNip: '9999999999',
        );
      case SelectedPage.signature:
        return newFormData;
      case SelectedPage.student:
        return newFormData.copyWith(
            loginData: loginData.copyWith(studentId: '001/001'));
      case SelectedPage.fillStudentData:
        return null;
    }
  }
}
