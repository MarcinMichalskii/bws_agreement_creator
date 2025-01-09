import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Providers/agreement_generator_data_provider.dart';
import 'package:bws_agreement_creator/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContractTypeQuestionWidget extends HookConsumerWidget {
  const ContractTypeQuestionWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    useBuildEffect(() {
      ref.read(agreementGeneratorDataProvider.notifier).cleanUp();
      return null;
    }, []);
    return Column(children: [
      const Text("Wybierz formę współpracy z BWS",
          style: TextStyle(color: CustomColors.gray, fontSize: 20)),
      Container(height: 20),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FormButtonUI(
                hasHeader: false,
                title: "B2B",
                headerText: "",
                fontWeight: FontWeight.w600,
                textSize: 18,
                textColor: CustomColors.darkGray,
                onPress: () {
                  final address = ref
                      .read(agreementGeneratorDataProvider.notifier)
                      .state
                      .loginData
                      ?.address;
                  ref
                      .read(agreementGeneratorDataProvider.notifier)
                      .setB2bAddress(address ?? '');

                  ref
                      .read(selectedPageProvider.notifier)
                      .setPage(SelectedPage.b2bContract);
                },
                icon: const Icon(
                  Icons.factory,
                  color: CustomColors.almostBlack,
                  size: 32,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FormButtonUI(
                hasHeader: false,
                title: "Umowę zlecenie",
                headerText: "",
                fontWeight: FontWeight.w600,
                textSize: 18,
                textColor: CustomColors.darkGray,
                onPress: () {
                  ref
                      .read(selectedPageProvider.notifier)
                      .setPage(SelectedPage.worksInOtherCompany);
                },
                icon: const Icon(
                  Icons.badge,
                  color: CustomColors.almostBlack,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
