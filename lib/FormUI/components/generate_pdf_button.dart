import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class DefaultBorderedButton extends StatelessWidget {
  const DefaultBorderedButton(
      {Key? key, required this.onTap, required this.text})
      : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
              width: 1.5, color: CustomColors.applicationColorMain),
        ),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Text(text,
              style: const TextStyle(
                  fontSize: 20,
                  color: CustomColors.gray,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
