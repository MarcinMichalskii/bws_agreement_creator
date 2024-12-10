import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class InformationFrameWidget extends StatelessWidget {
  const InformationFrameWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: CustomColors.gray,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(0, 24, 0, 12),
        child: Text(
          text,
          style: const TextStyle(color: CustomColors.gray, fontSize: 14),
          textAlign: TextAlign.left,
        ));
  }
}
