import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class UpdateStudentIdText extends StatelessWidget {
  const UpdateStudentIdText({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 24, 0, 12),
      child: Text(
        text ?? '',
        style: const TextStyle(color: CustomColors.gray, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
