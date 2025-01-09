import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.isDisabled,
      this.onTap,
      this.text,
      this.icon,
      this.isLoading = false,
      this.borderColor = CustomColors.applicationColorMain});

  final bool isDisabled;
  final VoidCallback? onTap;
  final String? text;
  final IconData? icon;
  final Color borderColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(4),
        child: const CircularProgressIndicator(
          color: CustomColors.applicationColorMain,
        ),
      );
    }
    return TouchableOpacity(
      disabled: isDisabled,
      onTap: isDisabled ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isDisabled
              ? CustomColors.gray
              : CustomColors.applicationColorMain,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: (text != null && icon != null)
              ? TextIconWidget(text: text!, icon: icon!)
              : (text != null ? textWidget : iconWidget),
        ),
      ),
    );
  }

  Widget get textWidget => Text(text ?? "",
      style: const TextStyle(
          fontSize: 20,
          color: CustomColors.darkGray,
          fontWeight: FontWeight.w500));

  Widget get iconWidget => Icon(
        icon,
        color: CustomColors.almostBlack,
        size: 24,
      );

  Widget get textIconWidget =>
      Row(children: [iconWidget, Container(width: 8), textWidget]);
}

class TextIconWidget extends StatelessWidget {
  const TextIconWidget({super.key, required this.text, required this.icon});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        color: CustomColors.almostBlack,
        size: 24,
      ),
      Container(width: 8),
      Text(text,
          style: const TextStyle(
              fontSize: 20,
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w500))
    ]);
  }
}
