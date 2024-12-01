import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/select_date_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExampleAgreementButton extends StatelessWidget {
  const ExampleAgreementButton({super.key, required this.onPreviewSelected});
  final VoidCallback onPreviewSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: FormButtonUI(
        hasHeader: false,
        title: "openPreview".tr(),
        headerText: "",
        fontWeight: FontWeight.w600,
        textSize: 18,
        textColor: CustomColors.darkGray,
        onPress: onPreviewSelected,
        icon: const Icon(
          Icons.pageview_outlined,
          color: CustomColors.almostBlack,
          size: 32,
        ),
      ),
    );
  }
}
