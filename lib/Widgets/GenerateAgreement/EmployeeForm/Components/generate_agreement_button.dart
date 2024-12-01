import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenerateAgreementButton extends StatelessWidget {
  const GenerateAgreementButton({
    super.key,
    required this.onGeneratePress,
  });
  final VoidCallback onGeneratePress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: FormButtonUI(
        hasHeader: false,
        title: "generateAndSend".tr(),
        headerText: "",
        fontWeight: FontWeight.w600,
        textSize: 18,
        textColor: CustomColors.darkGray,
        onPress: onGeneratePress,
        icon: const Icon(
          Icons.send_and_archive_outlined,
          color: CustomColors.almostBlack,
          size: 32,
        ),
      ),
    );
  }
}
