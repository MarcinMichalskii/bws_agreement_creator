import 'package:bws_agreement_creator/FormUI/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/FormUI/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContractTypeQuestionWidget extends HookConsumerWidget {
  const ContractTypeQuestionWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final name =
        ref.read(newFormDataProvider.notifier).state.loginData?.name ?? '';
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Wybierz formę współpracy z BWS",
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)),
            ],
          ),
        ],
      ),
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
