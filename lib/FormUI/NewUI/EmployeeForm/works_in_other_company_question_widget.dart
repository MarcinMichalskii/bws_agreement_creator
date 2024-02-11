import 'package:bws_agreement_creator/FormUI/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorksInOtherCompanyQuestionWidget extends HookConsumerWidget {
  const WorksInOtherCompanyQuestionWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Czy pracujesz u innego pracodawcy gdzie osiągasz dochód powyżej minimalnej krajowej?",
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
                title: "TAK",
                headerText: "",
                fontWeight: FontWeight.w600,
                textSize: 18,
                textColor: CustomColors.darkGray,
                onPress: () {
                  ref
                      .read(selectedPageProvider.notifier)
                      .setPage(SelectedPage.otherCompanyDetails);
                },
                icon: const Icon(
                  Icons.thumb_up_outlined,
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
                title: "NIE",
                headerText: "",
                fontWeight: FontWeight.w600,
                textSize: 18,
                textColor: CustomColors.darkGray,
                onPress: () {
                  ref
                      .read(selectedPageProvider.notifier)
                      .setPage(SelectedPage.signature);
                },
                icon: const Icon(
                  Icons.thumb_down_outlined,
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
