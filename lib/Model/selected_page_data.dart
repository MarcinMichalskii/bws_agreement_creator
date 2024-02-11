import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/b2b_contract_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/default_signature_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/employee_contract_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/legal_guardian_questions_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/other_company_details_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/works_in_other_company_question_widget.dart';
import 'package:flutter/material.dart';

enum SelectedPage {
  contractType,
  worksInOtherCompany,
  legalGuardian,
  otherCompanyDetails,
  b2bContract,
  signature,
  student,
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
    }
  }
}
