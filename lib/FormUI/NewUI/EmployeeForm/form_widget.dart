import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/b2b_contract_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/employee_contract_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/legal_guardian_questions_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/other_company_details_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/signature_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/works_in_other_company_question_widget.dart';
import 'package:bws_agreement_creator/FormUI/Providers/login_data_provider.dart';
import 'package:bws_agreement_creator/FormUI/Providers/upload_pdf_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SelectedPage {
  contractType,
  worksInOtherCompany,
  legalGuardian,
  otherCompanyDetails,
  b2bContract,
  signature,
  student,
  below18
}

extension SelectedPageExtension on SelectedPage {
  Widget get page {
    switch (this) {
      case SelectedPage.contractType:
        return const EmployeeContractQuestionWidget();
      case SelectedPage.worksInOtherCompany:
        return const WorksInOtherCompanyQuestionWidget();
      case SelectedPage.legalGuardian:
        return LegalGuardianQuestionsWidget();
      case SelectedPage.otherCompanyDetails:
        return const OtherCompanyDetailsQuestionWidget();
      case SelectedPage.b2bContract:
        return B2bContractQuestionWidget();
      case SelectedPage.signature:
        return SignatureWidget();
      case SelectedPage.student:
        return SignatureWidget();
      case SelectedPage.below18:
        return LegalGuardianQuestionsWidget();
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
      case SelectedPage.below18:
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
      case SelectedPage.below18:
        return true;
    }
  }
}

final selectedPageProvider = StateProvider<SelectedPage>((ref) {
  return SelectedPage.below18;
});

class EmployeeFormWidget extends HookConsumerWidget {
  const EmployeeFormWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
            constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 64),
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: BwsLogo()),
                Container(height: 32),
                ref.watch(selectedPageProvider).page,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (ref.watch(selectedPageProvider).previousPage != null)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  CustomColors.applicationColorMain,
                              foregroundColor: CustomColors.almostBlack),
                          onPressed: () {
                            ref.read(selectedPageProvider.notifier).state =
                                ref.watch(selectedPageProvider).previousPage!;
                          },
                          child: const Text("Wstecz"),
                        ),
                    ],
                  ),
                ),
                if (ref.watch(selectedPageProvider).isFinalPage)
                  Container(
                    width: 300,
                    child: FormButtonUI(
                      hasHeader: false,
                      title: "Generuj umowę",
                      headerText: "",
                      fontWeight: FontWeight.w600,
                      textSize: 18,
                      textColor: CustomColors.darkGray,
                      onPress: () {
                        final cookie =
                            ref.read(loginProvider.notifier).state.data!.cookie;
                        ref.read(uploadPdfProvider.notifier).uploadPdf(
                            authString: cookie,
                            bytes: Uint8List(2),
                            filename: 'jebacbiede.pdf');
                      },
                      icon: const Icon(
                        Icons.send_and_archive_outlined,
                        color: CustomColors.almostBlack,
                        size: 32,
                      ),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
