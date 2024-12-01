import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormNavigationWidget extends HookConsumerWidget {
  const FormNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (ref.watch(selectedPageProvider).previousPage != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.applicationColorMain,
                  foregroundColor: CustomColors.almostBlack),
              onPressed: () {
                final previousPage =
                    ref.read(selectedPageProvider).previousPage!;

                ref.read(selectedPageProvider.notifier).setPage(previousPage);
              },
              child: Text("back".tr()),
            ),
        ],
      ),
    );
  }
}
