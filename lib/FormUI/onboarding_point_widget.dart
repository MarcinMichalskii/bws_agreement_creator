import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingPointWidget extends StatelessWidget {
  const OnboardingPointWidget({
    super.key,
    required this.pointNumber,
    required this.pointTextBold,
    required this.poinText,
  });

  final String pointNumber;
  final String pointTextBold;
  final String poinText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: CustomColors.gray,
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: pointNumber,
            ),
            TextSpan(
              text: pointTextBold,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: poinText,
            ),
          ],
        ),
      ),
    );
  }
}
