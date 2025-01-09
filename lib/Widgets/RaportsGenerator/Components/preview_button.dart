import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: FormButtonUI(
        hasHeader: false,
        title: title,
        headerText: "",
        fontWeight: FontWeight.w600,
        textSize: 18,
        textColor: CustomColors.darkGray,
        onPress: onTap,
        icon: Icon(
          icon,
          color: CustomColors.almostBlack,
          size: 32,
        ),
      ),
    );
  }
}
